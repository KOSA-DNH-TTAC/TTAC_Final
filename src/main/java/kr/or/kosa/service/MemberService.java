package kr.or.kosa.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.aws.AwsS3;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dao.PaymentHistoryDao;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.PaymentHistory;
import kr.or.kosa.dto.Post;
import kr.or.kosa.security.User;

@Service
public class MemberService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	// 암호화
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 전체회원조회
	public List<Member> getAllMember(String universitycode) {
		List<Member> list = new ArrayList<Member>();
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		list = dao.getAllMember(universitycode);
		return list;
	}

	// 특정회원 조회에선 auth를 따로 넣지 않았음 필요시 resultmap으로 매퍼에서 구현해야함
	// 특정회원조회 (학번으로)
	public Member getMemberById(String memberid) {
		Member member = new Member();
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		member = dao.getMember(memberid);
		return member;
	}

	// 특정회원조회 (이름으로)
	public List<Member> getMemberByName(String name, String universitycode) {
		List<Member> list = new ArrayList<Member>();
		// 이름으로 검색을 했을 때, 해당 유저가 속한 학교의 동명이인만 나와야 함
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		list = dao.getMemberByName(name, universitycode);
		return list;
	}

	// 특정회원이 작성한 글 가져오기
	public List<Post> getPostings(String memberid) {
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		List<Post> list = new ArrayList<Post>();
		list = dao.getPosts(memberid);
		return list;
	}

	// 정보수정(파일 있는거)
	public int editMember(Member member, MultipartFile multipartfile) throws IOException {

		String rawpwd = member.getPassword();
		if (!rawpwd.equals("")) {
			String encodedpwd = bCryptPasswordEncoder.encode(rawpwd);
			member.setPassword(encodedpwd);
		}

		// 파일이 있으면 실행
		if (multipartfile.getSize() != 0) {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			AwsS3 awsS3 = AwsS3.getInstance();
			String key = user.getUniversityCode() + "/user/" + user.getMemberId() + "/"
					+ multipartfile.getOriginalFilename();

			awsS3.upload(multipartfile, key);
		}

		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		int result = 0;
		result = dao.updateMember(member);
		return result;
	}

	// memberDAO 포인트 사용 DTO
	public int updatePoint(Member member, int price) throws IOException {
		int result = member.getMemberPoint() - price;

		member.setMemberPoint(result);
		MemberDao dao = sqlsession.getMapper(MemberDao.class);
		return dao.updatePoint(member);
	}

	// 결제 히스토리 남기기
	public int paymentHistory(Member member, int price) throws IOException {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		PaymentHistory payment = new PaymentHistory();
		payment.setMemberId(user.getMemberId());
		payment.setUniversitycode(user.getUniversityCode());
		payment.setPayAmount(price);
		payment.setDomitoryname(user.getDomitoryName());
		payment.setPayKinds("사용");

		PaymentHistoryDao dao = sqlsession.getMapper(PaymentHistoryDao.class);
		return dao.insertPayment(payment);
	}

	// 포인트 사용할때 (트렌잭션)
	@Transactional(rollbackFor = Exception.class)
	public int usePoint(Member member, int price) throws IOException {
		int result = 0;
		result = this.updatePoint(member, price);
		result = this.paymentHistory(member, price);
		return result;
	}

}

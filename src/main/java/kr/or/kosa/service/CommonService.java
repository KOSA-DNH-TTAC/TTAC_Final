package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;
import kr.or.kosa.utils.ExcelUtils;

@Service
public class CommonService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	//엑셀
	@Autowired
	ExcelUtils excelUtil;

	//암호화
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;


//  비밀번호 찾기 (초기화) 인증번호 대조
	public Member compareNum(Map<String, String>persnalNum, int checkNum, String email) {
		System.out.println("회원인증번호 대조 서비스 옴?");
		System.out.println("보낸 인증번호 checknum : "+checkNum);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		Member member = memberDao.getEmail(email); //회원이 입력한 이메일이 유효한지 체크
		String memberemail = member.getEmail();
		
		//Map에 회원의 이메일 정보가 Key로 있는지 True / False
		boolean result = persnalNum.containsKey(memberemail); //true or false
		System.out.println("result : "+result);
		String alert="";
		
		//Map에 회원정보가 있는지 없는 지 1차 검증
		if(result == false) {
			System.out.println("에러 : Map에 회원 정보 없음");
			alert = "에러 : Map에 회원 정보가 없습니다.";
			
		//Map에 회원정보가 있으면 로직 수행
		} else if(result == true) {
			System.out.println("성공 : Map에 회원 정보 있음");
			String memberNum  = persnalNum.get(email);
			System.out.println("memberNum : "+memberNum);
			int Num = Integer.parseInt(memberNum);
			
			//인증번호와 회원이 입력한 번호가 같은지?
			if(Num == checkNum) {
				alert = "번호가 일치합니다.";
				System.out.println("결과 : "+alert);
			} else {
				alert = "번호가 불일치합니다.";
				System.out.println("결과 : "+alert);
			}
		}
		//이메일로 찾은 회원정보 row의 비밀번호 초기화
		String password = "1004";
		String encodepassword = bCryptPasswordEncoder.encode(password);
		System.out.println("encodepassword : "+encodepassword);
		member.setPassword(encodepassword);
		memberDao.insertPassword(member);
		
		Member member1 = memberDao.getEmail(email);
		System.out.println("member1 : "+member1);
		return member;
	}
	
	public int insertPassword(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.insertPassword(member);
		System.out.println("password 초기화된 member : "+result);
		
		return result;
	}
		
	

	
	//엑셀 파일 읽어와서 memberDto로 만드는...
	public List<Member> addExcel(MultipartFile file) {
		
		List<Member> memberList = new ArrayList<Member>();
		
		// 엑셀의 셀데이터를 가져와서 VO에 담기
		List<Map<String, Object>> listMap = excelUtil.getListData(file, 1, 4); //파일, 시작행, 컬럼 개수
		for (Map<String, Object> map : listMap) {
			Member member = new Member();
			// 각 셀의 데이터를 VO에 set한다.
			member.setEmail((map.get("0").toString()));
			member.setMemberId(map.get("1").toString());
			member.setPassword(map.get("2").toString());
			member.setName(map.get("3").toString());
			memberList.add(member);
		}
		// 리스트에 담은 VO를 DB에 저장
		for (Member m : memberList){
			System.out.println("엑셀에서 읽은 유저 : " + m);
			
			//여기서 dao 호출... 기존 회원인지 확인 (Count 구해서 0보다 크면 기존 회원)
			//해당 멤버가 이미 회원에 있으면 update (휴면 해제)
			//해당 멤버가 없으면 insert (신규가입)
		}
		return memberList;
	}
	
}

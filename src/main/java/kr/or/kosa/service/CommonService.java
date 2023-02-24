package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dao.DomitoryDao;
import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.Member;
import kr.or.kosa.dto.RollCall;
import kr.or.kosa.security.User;
import kr.or.kosa.utils.ExcelUtils;

@Service
public class CommonService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 암호화
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

//  비밀번호 찾기 (초기화) 인증번호 대조
	public Member compareNum(Map<String, String> persnalNum, int checkNum, String email) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

		Member member = memberDao.getEmail(email); // 회원이 입력한 이메일이 유효한지 체크
		String memberemail = member.getEmail();

		// Map에 회원의 이메일 정보가 Key로 있는지 True / False
		boolean result = persnalNum.containsKey(memberemail); // true or false
		String alert = "";

		// Map에 회원정보가 있는지 없는 지 1차 검증
		if (result == false) {
			alert = "에러 : Map에 회원 정보가 없습니다.";

			// Map에 회원정보가 있으면 로직 수행
		} else if (result == true) {
			String memberNum = persnalNum.get(email);
			int Num = Integer.parseInt(memberNum);

			// 인증번호와 회원이 입력한 번호가 같은지?
			if (Num == checkNum) {
				alert = "번호가 일치합니다.";
			} else {
				alert = "번호가 불일치합니다.";
			}
		}
		// 이메일로 찾은 회원정보 row의 비밀번호 초기화
		String password = "1004";
		String encodepassword = bCryptPasswordEncoder.encode(password);
		member.setPassword(encodepassword);
		memberDao.insertPassword(member);

		Member member1 = memberDao.getEmail(email);
		return member;
	}

	public int insertPassword(Member member) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		int result = memberDao.insertPassword(member);

		return result;
	}

	// 점호
	// 점호 위치값 비교하기
	public String eveningCall(double lat, double lon) {
		DomitoryDao domitorydao = sqlSession.getMapper(DomitoryDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String domitoryname = user.getDomitoryName();
		Domitory domitory = domitorydao.eveningCall(domitoryname);
		double domitoryLat = domitory.getDomitoryLatitude();
		double domitoryLon = domitory.getDomitoryLogitude();

		double dist = getDistance(domitoryLat, domitoryLon, lat, lon);

		String alert = "SUCCESS";
		if (!(dist < 0.0021) || (dist > -0.0021)) {
			alert = "FAIL";

		}
		if (!((domitoryLon - lon) < 0.003) || ((domitoryLon - lon) > -0.003)) {
			alert = "FAIL";

		}

		return alert;
	}

	// km 기준
	private Double getDistance(Double lat, Double lnt, Double lat2, Double lnt2) {
		double theta = lnt - lnt2;
		double dist = Math.sin(deg2rad(lat)) * Math.sin(deg2rad(lat2))
				+ Math.cos(deg2rad(lat)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515 * 1609.344;

		return dist / 1000;
	}

	// 10진수를 radian(라디안)으로 변환
	private static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	// radian(라디안)을 10진수로 변환
	private static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}

	// 점호완료시 DB에 회원 점호데이터 인서트
	public String eveningCallInsert(String memberid, String universitycode, String domitoryName) {
		DomitoryDao domitorydao = sqlSession.getMapper(DomitoryDao.class);

		int rollcall = domitorydao.eveningCallInsert(memberid, universitycode, domitoryName);

		return null;
	}

	// 점호완료시 DB에 회원 점호데이터 인서트
	public String eveningCallCompare(String memberid, String universitycode, String rollcalldate) {
		DomitoryDao domitorydao = sqlSession.getMapper(DomitoryDao.class);
		RollCall rollcall = domitorydao.eveningCallCompare(memberid, universitycode, rollcalldate);
		String unicode = rollcall.getUniversityCode();
		String date = rollcall.getRollCallDate();
		String dbmemberid = rollcall.getMemberId();
		int count = rollcall.getCounting();

		String result = "SUCCESS";

		// 조회된데이터 없으면
		if (count >= 1) {
			result = "FAIL";
		}

		return result;
	}

}

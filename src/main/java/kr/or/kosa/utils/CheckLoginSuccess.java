package kr.or.kosa.utils;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.kosa.dao.MemberDao;
import kr.or.kosa.dto.Member;

@RestController
public class CheckLoginSuccess {

	@Autowired
	MemberDao dao;
	
	private VisitorInfo visitor;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	public void setVisitor(VisitorInfo visitor) {
		this.visitor = visitor;
	}
	@Autowired
	public void setbCryptPasswordEncoder(BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	@RequestMapping("/getinfo")
	public ResponseEntity<String> loginTry(@RequestBody Map<String, String> data){
//		System.out.println(data);
		String memberid = data.get("id");
		String pwd = data.get("pwd");
		
		
		
		boolean pass = false;
		try {
			Member member = dao.getMember(memberid);
			boolean pwdpass = bCryptPasswordEncoder.matches(pwd, member.getPassword());
//			System.out.println(pwdpass);
			if(pwdpass) {
				pass = true;
			}
		} catch (Exception e) {
			pass = false;
		}
//		System.out.println("통과여부 : " + pass);
		visitor.information(memberid, pwd, pass);
		
		return new ResponseEntity<String>("전달완료", HttpStatus.OK);
	}
}

package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.PaymentHistoryDao;
import kr.or.kosa.dto.PaymentHistory;
import kr.or.kosa.security.User;

@Service
public class PaymentService {
	private SqlSession sqlsession;
	 
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
	   this.sqlsession = sqlsession;
	}
	
	//결제 생성 (충전)
	public int insertPayment(String memberid, String amount, String kind) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universitycode = user.getUniversityCode();
		
		//금액 받고...
		//아이디 받고...
		//종류 받고...
		//결제 new ...
		PaymentHistory payment = new PaymentHistory();
		payment.setMemberId(memberid);
		payment.setPayAmount(Integer.parseInt(amount));
		payment.setPayKinds(kind);
		payment.setUniversitycode(universitycode);
		payment.setDomitoryname(user.getDomitoryName());
		
		int result = 0;
		PaymentHistoryDao dao = sqlsession.getMapper(PaymentHistoryDao.class);
		result = dao.insertPayment(payment);
		
		return result;
	}

	//결제 전체 조회
	public List<PaymentHistory> getAllPaymentHistory(){
		List<PaymentHistory> list = new ArrayList<PaymentHistory>();
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universitycode = user.getUniversityCode();
		//dao에서 리스트 가져옴
		PaymentHistoryDao dao = sqlsession.getMapper(PaymentHistoryDao.class);
		list = dao.getAllPaymentHistory(universitycode);
		
		return list;
	}
		
		
	//특정 회원 결제 조회
	public List<PaymentHistory> getPaymentHistoryById(String memberid){
		List<PaymentHistory> list = new ArrayList<PaymentHistory>();
		
		//dao에서 리스트 가져옴
		PaymentHistoryDao dao = sqlsession.getMapper(PaymentHistoryDao.class);
		list = dao.getPaymentHistoryById(memberid);
		return list;
	}
}

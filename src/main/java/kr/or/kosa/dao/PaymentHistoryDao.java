package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.PaymentHistory;

public interface PaymentHistoryDao {
	
	//결제 생성
	int insertPayment(PaymentHistory payment);
	
	//결제 전체 조회
	List<PaymentHistory> getAllPaymentHistory();
	
	//특정 회원 결제 조회
	List<PaymentHistory> getPaymentHistoryById(String memberid);
	
}

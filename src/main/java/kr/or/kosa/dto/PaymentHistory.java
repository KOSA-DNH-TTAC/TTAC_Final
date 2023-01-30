package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentHistory {

	private int payIdx;
	private String universityCode;
	private String memberId;
	private Date payDate;
	private int payAmount;
	private String payKinds;
}

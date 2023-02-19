package kr.or.kosa.dto;


import lombok.Data;

@Data
public class Chart {

	private String month;
	private String memberid;
	private int demeritTotal;
	private int postCount;
	private int replyCount;
	private int sleepoverCount;
	private int paymentCount;
	private int paymentTotal;
}

package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class DemeritHistory {
	
	private int demeritIdx;
	private String memberId;
	private int demerit;
	private Date demeritDate;
	private String demeritReason;

}

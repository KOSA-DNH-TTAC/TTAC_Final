package kr.or.kosa.dto;

import lombok.Data;

@Data
public class DemeritHistory {
	
	private int demeritIdx;
	private String memberId;
	private int demerit;
	private String demeritDate;
	private String demeritReason;

}

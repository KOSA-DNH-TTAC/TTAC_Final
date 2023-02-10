package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SleepOverHistory {

	private int sleepOverIdx;
	private String universityCode;
	private String memberId;
	private String username;
	private Date startDate;
	private Date endDate;
	private int status;
	private String sleepOverReason;
	private String sleepOverConfirm;
}

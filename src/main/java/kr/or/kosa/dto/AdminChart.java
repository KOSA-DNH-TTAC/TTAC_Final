package kr.or.kosa.dto;


import lombok.Data;

@Data
public class AdminChart {
	
	private String memberid;
	private String domitoryName;
	private String universityCode;
	private String month;
	private int year;
	private int status;
	private int sleepoverCount;
	private int longsleepoverCount;
}

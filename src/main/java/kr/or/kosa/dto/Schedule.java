package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Schedule {

	private int scheduleIdx;
	private String universityCode;
	private Date scheduleDate;
	private String scheduleTitle;
	private String scheduleContent;
	private int status;
}

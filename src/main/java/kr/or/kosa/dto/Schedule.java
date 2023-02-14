package kr.or.kosa.dto;

import lombok.Data;

@Data
public class Schedule {

	private int scheduleIdx;
	private String universityCode;
	private String scheduleDate;
	private String scheduleTitle;
	private String scheduleContent;
	private String domitoryName;
	private int status;
}

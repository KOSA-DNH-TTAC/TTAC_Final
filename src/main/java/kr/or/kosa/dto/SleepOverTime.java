package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SleepOverTime {

	private String universityCode;
	private Date startTime;
	private Date endTime;
}

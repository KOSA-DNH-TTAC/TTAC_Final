package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Report {

	private int reportIdx;
	private int facilityIdx;
	private String domitoryName;
	private String domitoryFloor;
	private String facilityName;
	private String name;
	private String facilityReport;
	private String facilityDate;
	private int status;
}

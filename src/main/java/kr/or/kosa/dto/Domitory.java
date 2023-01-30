package kr.or.kosa.dto;

import lombok.Data;

@Data
public class Domitory {
	
	private int domitoryIdx;
	private String universityCode;
	private String domitoryName;
	private String domitoryFloor;
	private double domitoryLatitude;
	private double domitoryLogitude;

}

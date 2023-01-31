package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PointRemittance {

	private int pointIdx;
	private String sMemberId;
	private String rMemberId;
	private Date pointDate;
	private int pointAmount;
	private int status;
}

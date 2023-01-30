package kr.or.kosa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RollCall {

	private int rollCallIdx;
	private String universityCode;
	private String memberId;
	private Date rollCallDate;
}

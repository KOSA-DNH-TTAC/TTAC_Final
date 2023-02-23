package kr.or.kosa.dto;

import lombok.Data;

@Data
public class RollCall {

	private int rollCallIdx;
	private String universityCode;
	private String memberId;
	private String rollCallDate;
	private int counting;
	private String domitoryName;
}

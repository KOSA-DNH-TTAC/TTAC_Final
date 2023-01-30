package kr.or.kosa.dto;

import lombok.Data;

@Data
public class Product {

	private int idx;
	private int productIdx;
	private String productName;
	private int productPrice;
	private String productSold;
}

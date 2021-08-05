package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedProductExtend extends UsedProduct{
	private String used_img;
	private int favorites_member;
	private int favorites_id;
	private String storename;
}
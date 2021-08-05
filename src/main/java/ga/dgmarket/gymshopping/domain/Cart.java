package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class Cart {
	private int cart_id;
	private int product_id;
	private int member_id;
	private int ea;
	
	//조인을 염두해 둔 부모의 VO 보유
	private Product product;
	private Member member;
}
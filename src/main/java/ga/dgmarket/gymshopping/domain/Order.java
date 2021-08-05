package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class Order {
	private String name;
	private String product_name;
	private int ea;
	private int totalprice;
	private String addr;

}

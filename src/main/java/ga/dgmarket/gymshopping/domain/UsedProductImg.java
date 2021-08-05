package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedProductImg {
	private int used_product_img_id;
	private int used_product_id;
	private String used_img;
	private int used_img_index;
}
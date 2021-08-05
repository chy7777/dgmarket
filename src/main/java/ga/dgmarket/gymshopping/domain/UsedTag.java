package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedTag {
	private int used_tag_id;
	private int used_product_id;
	private String tag_name;
}
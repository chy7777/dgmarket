package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedFavorites {
	private int used_favorites_id;
	private int member_id;
	private int used_product_id;
	private int count;
}
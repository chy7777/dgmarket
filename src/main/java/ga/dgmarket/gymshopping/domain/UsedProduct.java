  
package ga.dgmarket.gymshopping.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UsedProduct {
	private int used_product_id;
	private int member_id;
	private String used_product_name;
	private String used_product_detail;
	private int used_product_price;
	private String soldout;
	private String tag;
	private MultipartFile mainImg;
	private MultipartFile subImg;
	private UsedFavorites usedFavorites;
}
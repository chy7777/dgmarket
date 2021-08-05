package ga.dgmarket.gymshopping.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int product_id;
	private int top_category_id;
	private String product_name;
	private String product_detail;
	private int price;
	private int product_inven;
	private String brand;
	private String product_img;
	MultipartFile photo;
	private TopCategory topCategory;
	private int cnt;
}

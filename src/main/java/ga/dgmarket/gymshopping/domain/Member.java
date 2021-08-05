package ga.dgmarket.gymshopping.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private int member_id;
	private String user_id;
	private String password;
	private String name;
	private String storename;
	private String store_id;
	private String profile_img;
	private String phone;
	private String addr;
	private String email;
	private String regdate;
	private String emailchk;
	MultipartFile photo;
	private int user_grade;
}

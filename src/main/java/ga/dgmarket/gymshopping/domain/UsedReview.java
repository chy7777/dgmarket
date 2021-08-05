package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class UsedReview {
	private int used_review_id;
	private int member_id;
	private int writer_id;
	private String content;
	private String regdate;
	
	private String writer;
}
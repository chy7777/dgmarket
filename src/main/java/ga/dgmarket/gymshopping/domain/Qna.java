package ga.dgmarket.gymshopping.domain;

import lombok.Data;

@Data
public class Qna {
	private int qna_id;
	private int member_id;
	private String title;
	private String content;
	private String regdate;
	private int team;
	private int step;
	private int depth;
	private String writer;
	private int cnt;
	private int user_grade;
}

package ga.dgmarket.gymshopping.domain;

import lombok.Data;

//클라이언트에게 전송할 메시지를 담게될 객체
@Data
public class Message {
	private String msg;
	private int resultCode; //DML작업 결과
	private String viewName; //보여줄 뷰

}

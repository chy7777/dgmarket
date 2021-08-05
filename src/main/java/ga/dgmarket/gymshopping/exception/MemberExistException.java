package ga.dgmarket.gymshopping.exception;

public class MemberExistException extends RuntimeException{

	public MemberExistException(String msg) {
		super(msg);
	}
	
	public MemberExistException(Throwable e) {
		super(e);
	}
	
	public MemberExistException(String msg, Throwable e) {
		super(msg, e);
	}
}

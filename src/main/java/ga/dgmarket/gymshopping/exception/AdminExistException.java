package ga.dgmarket.gymshopping.exception;

public class AdminExistException extends RuntimeException{

	public AdminExistException(String msg) {
		super(msg);
	}
	
	public AdminExistException(Throwable e) {
		super(e);
	}
	
	public AdminExistException(String msg, Throwable e) {
		super(msg, e);
	}
}

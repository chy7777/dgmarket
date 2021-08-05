package ga.dgmarket.gymshopping.exception;

public class LoginExistException extends RuntimeException{

	public LoginExistException(String msg) {
		super(msg);
	}
	
	public LoginExistException(Throwable e) {
		super(e);
	}
	
	public LoginExistException(String msg, Throwable e) {
		super(msg, e);
	}
}

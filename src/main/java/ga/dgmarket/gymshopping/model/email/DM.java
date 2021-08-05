package ga.dgmarket.gymshopping.model.email;

public class DM {
	//회원가입시 인증번호 발송
	public static String dmCertification(String authCode) {
		String sb="";
		
		sb="<!DOCTYPE html>";
		sb+="<html>";
		sb+="<head>";
		sb+="<meta charset=\"utf-8\" />";
		sb+="<title>DmCertification</title>";
		sb+="</head>";
		sb+="<body>";
		sb+="<div>";
		sb+="<span><h1>인증번호 발송 안내</h1></span>";
		sb+="<p>안녕하세요 둑근마켓 입니다. 인증번호를 다음과 같이 알려드립니다.</p>";
		sb+="<p>인증번호:<strong>"+authCode+"</strong></p><br>";
		sb+="</div>";
		sb+="</body>";
		sb+="</html>";
		
		return sb;
		
	}

}

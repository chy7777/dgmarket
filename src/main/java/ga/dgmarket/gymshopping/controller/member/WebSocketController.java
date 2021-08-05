package ga.dgmarket.gymshopping.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Decoder;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ga.dgmarket.gymshopping.chat.ServletAwareConfig;
import ga.dgmarket.gymshopping.domain.Member;


@Controller
@ServerEndpoint(value = "/used/chat") //인코딩 디코더 처리??
public class WebSocketController {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
    public WebSocketController() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    //웹소켓 열기
    @OnOpen
    public void onOpen(Session session) {
    	System.out.println("실행 순서 0");
        logger.info("[onOpen]Open session id:"+session.getId());
        try {
	        for(Session obj : sessionList) {
	        	if(obj.getId().equals(session.getId())) {
	        		System.out.println("이미 접속 중인 세션입니다.");
	        		return;
	        	}
	        }
	        sessionList.add(session);
            sendAllSessionToMessage(session, "[익명"+session.getId()+"] 님이 채팅방과 연결 됐습니다.\n 현재 채팅방 접속 인원  수 : "+sessionList.size()+"명");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */ //메시지를 전송할 때 디비에 넣야할 것 같음 //얘는 send 역할
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	System.out.println("sendAllSessionToMessage 호출");
    	//HttpSession memberSession = (HttpSession) request.getHttpSession();
    	//Member member = (Member)memberSession.getAttribute("member");
    	//int member_id = member.getMember_id();
        try {
            for(Session session : WebSocketController.sessionList) { //모든 사용자에게 전송하기
                if(!self.getId().equals(session.getId())) {
            		session.getBasicRemote().sendText(1+",익명"+sender+","+message);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    /*사용자의 접속 정보나 퇴장 정보를 전체적으로 뿌려주는 역할을 한다.*/
    private void sendAllSessionToMessage(Session self, String message) {
    	System.out.println("정보 뿌리기 호출");
        try {
            for(Session session : WebSocketController.sessionList) { //모든 사용자에게 전송하기
            	session.getBasicRemote().sendText(message);
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    /*
     * 메세지를 받는 곳 즉, listener 역할을 함
     */ //메시지를 전송할 때 message에 담기는 값은 "메시지,보내는사람이름, 받는사람_id" 순으로 담긴다.
    //http 세션을 구해와야함
    @OnMessage
    public void onMessage(String message, Session session) {
    	System.out.println("onMessage 호출"); //얘가 가장 먼저임
    	System.out.println("message는??"+message);
    	
    	message = message.split(",")[0];
    	System.out.println("걸러진 메시지 : "+message);
    	String sender = session.getId();
    	
    	logger.info("[onMessage] Message From "+sender + ": "+message);
    	
		try {
			final Basic basic=session.getBasicRemote();
			basic.sendText(0+",나,"+message);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    	sendAllSessionToMessage(session, sender, message); 
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    //페이지 닫을 시 세션 삭제
    @OnClose
    public void onClose(Session session) {
    	System.out.println("onClose() 호출");
        logger.info("[onClose] Session "+session.getId()+" has ended");
        sendAllSessionToMessage(session, "[익명"+session.getId()+"] 님이 채팅방에서 나가셨습니다.\n 현재 채팅방 접속 인원  수 : "+(sessionList.size()-1)+"명");
        sessionList.remove(session);
    }
}
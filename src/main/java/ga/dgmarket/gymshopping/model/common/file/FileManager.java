package ga.dgmarket.gymshopping.model.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.exception.FileHandleException;
import ga.dgmarket.gymshopping.exception.UploadException;


//비즈니스 파트에서 파일과 관련된 업무를 전담하는 객체
@Component
public class FileManager {
	String savePath = "/resources/data/";
	
	//확장자 구하기
	public String getExt(String path) {
		int lastIndex = path.lastIndexOf(".");
		return path.substring(lastIndex+1, path.length());
	}
	
	//매개변수로 context와 multipart를 넘겨 받으면 새로운 파일이름을 생성하고 반환한다.  from.성일
	public String createFileName(ServletContext context, MultipartFile multi) {
		long time = System.currentTimeMillis();
		String ext = this.getExt(multi.getOriginalFilename());
		String filename = time+"."+ext;
		
		return filename;
	}
	
	//파일 삭제
	public void deleteFile(ServletContext context, String filename) throws FileHandleException{
		System.out.println("파일삭제메서드 "+context.getRealPath(savePath+filename));
		File file = new File(context.getRealPath(savePath+filename));
		if(!file.delete()) {
			throw new FileHandleException(filename+" 을 삭제하지 못했습니다.");
		}else {
			System.out.println("파일삭제됨");
		}
	}

	//파일 삭제 (추가경로 지정 시)//석민
	public void deleteFile(ServletContext context, String filename, String additionalPath) throws FileHandleException{
		String folderPath = context.getRealPath(savePath)+additionalPath;
		System.out.println("파일삭제메서드 "+folderPath+filename);
		File file = new File(folderPath+"/"+filename);
		if(!file.delete()) {
			throw new FileHandleException(filename+" 을 삭제하지 못했습니다.");
		}else {
			System.out.println("파일삭제됨");
		}
	}
	
	//지정된 경로로 파일 저장
	public void saveFile(ServletContext context, String filename, MultipartFile multi) throws UploadException{
		System.out.println(context.getRealPath(savePath)+filename);
		try {
			//절대 경로 얻고 파일 저장하기		
			multi.transferTo(new File(context.getRealPath(savePath)+filename)); //저장
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		}
	}
	
	//새로운 경로에 파일을 저장하고 싶을 때 사용 원하는 디렉터리를 매개변수로 넣으면
	//경로가 있는지 확인을 하고 없다면 새로 폴더를 생성한 후 파일을 저장
	//기본적인 폴더의 경로는 ~~/resources/data/이다. 만약 폴더를 product에 img 폴더를 생성하고 싶다면
	// 매개변수인 folder로 "product/img" 가 넘어와야 한다. 
	//새로만든 파일의 이름을 반환한다.                  from.성일
	public String saveFile(ServletContext context, MultipartFile multi, String folderName) throws UploadException{
		String filename = this.createFileName(context, multi);
		
		String folderPath = context.getRealPath(savePath)+folderName; //새로 만들거나 저장할 폴더의 경로
		File file = new File(folderPath); //원하는 저장 위치의 파일을 생성
		if(!file.exists()) { //exists()는 유효한 경로인지를 판단하고 맞다면 true 유효하지 않다면 false를 반환한다.
			file.mkdirs(); //mkdirs()는 파일의 경로가 없다면 새로 생성을 해준다.
		}
		System.out.println("새로 저장될 경로"+context.getRealPath(savePath+folderName));
		try {
			//절대 경로 얻고 파일 저장하기		
			multi.transferTo(new File(folderPath+"/"+filename)); //저장
			return filename;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		}
	}
}
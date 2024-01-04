package ex02;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	// 싱글톤
	private static FileUtil instance = new FileUtil();
	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {}
	
	// 파일처리에 관련된 필드
	private String saveDirectory = null; // 얘를 절대경로로 써야한다.
	private int maxPostSize = 1024 * 1024 * 20;
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	// request를 전달받아서, 파일 및 다른 데이터를 DTO에 담아서 반환하는 함수
	public Ex02DTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		Ex02DTO dto = null;
		
		// 1) 저장할 디렉토리가 없으면 새로 생성해야 한다.
		if(saveDirectory == null) {
			ServletContext application = request.getServletContext();
			saveDirectory = application.getRealPath("/upload");
			File dir = new File(saveDirectory);
			dir.mkdir();
			
//			System.out.println(saveDirectory);	// 확인용
		}
		
		// 2) request를 이용하여 MultipartRequest 객체를 생성한다.
		// 이 때, 첨부파일은 saveDirectory 위치에 자동으로 생성된다. (업로드된다), 객체를 생성한 것만으로도 업로드가 된다.
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		// 파랑색은 멤버필드, 갈색은 파라미터
		// saveDirectory는 반고정, 나머지 멤버필드는 완전 고정이다.
		// request는 어떤 사용자가 제출을 할 때마다 request 객체가 매번 바귀니까 멤버필드에 올려둘 필요가 ㄴㄴ
		
		
		// 3) 일반 문자열 파라미터는 getParameter(String name)으로 받는다
		String title = mpRequest.getParameter("title");
		
		// 4) 첨부파일은 getFile(String name)으로 받는다.
		File image = mpRequest.getFile("image");		// <input type="file" name="image">
		
		// 5) java.sql.Date는 new java.sql.Date(new java.util.Date().getTime())로 받는다.
		// String -> java.util.Date -> long -> java.sql.Date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 맨처음엔 문자열로 받는다.
		String inputDate = mpRequest.getParameter("eventDate");
		java.util.Date d1 = sdf.parse(inputDate);		// util.date 참조해서
		long time = d1.getTime();
		java.sql.Date d2 = new java.sql.Date(time); // 나중에 DB에 저장하는 거까지 써먹을 수 있다.
		
		// 6) 준비된 값을 dto에 모두 세팅한다.
		dto = new Ex02DTO();
		dto.setTitle(title);
		dto.setImage(image.getName());		// 파일의 이름만 문자열 형식으로 저장한다.
		dto.setEventDate(d2);
		
		return dto;
	}
	
	
	// saveDirectory 내부의 파일이름을 문자열의 배열형태로 반환하는 함수
	public String[] getFileNames() {
		String[] arr = null;
		if(saveDirectory != null) {
			File dir = new File(saveDirectory);
			arr = dir.list();
		}
		return arr;
	}
}

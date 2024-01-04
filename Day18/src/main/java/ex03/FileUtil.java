package ex03;

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
	private static FileUtil instance = new  FileUtil();
	public static FileUtil getInstance() {
		return instance;
	}
	private FileUtil() {
		File dir = new File(saveDirectory);
		dir.mkdirs();
	}
	
	private String saveDirectory = "C:\\upload"; // 이러면 바로 밑에 if도 필요없다.
	private final int maxPostSize = 1024 * 1024 * 50;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public ReviewDTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		ReviewDTO dto = null;
//		if(saveDirectory == null) {
//			ServletContext application = request.getServletContext();	// 이 방식으로 쓰면 서버가 초기화됐을 경우에 업로드된 그림이 날아간다.
//			saveDirectory = application.getRealPath("/reviewImage");
			
			
//		}
		
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy);
		
		dto = new ReviewDTO();
		dto.setContent(mpRequest.getParameter("content"));
		dto.setImage(mpRequest.getFile("image").getName());
		dto.setStoreName(mpRequest.getParameter("storeName"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long time = sdf.parse(mpRequest.getParameter("visitDate")).getTime();
		dto.setVisitDate(new java.sql.Date(time)); // 그냥 풀어서 써서 import에 Date 필요없다.
		
		return dto;
	}
}

package board2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	private static FileUtil instance = new FileUtil();
	
	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {}
	
	private final String saveDirectory = "C:\\upload";
	private final int maxPostSize = 1024 * 1024 * 50;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public BoardDTO getDTO(HttpServletRequest request) throws IOException {
		BoardDTO dto = new BoardDTO();
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		// 먼저 파일을 꺼내기
		File uploadFile = mpRequest.getFile("uploadFile");		// write에 파일이름과 일치해야함.
		if(uploadFile != null) {
			dto.setImage(uploadFile.getName());
		}
		
		dto.setTitle(mpRequest.getParameter("title"));
		dto.setWriter(mpRequest.getParameter("writer"));
		dto.setContent(mpRequest.getParameter("content"));
		dto.setIpaddr(mpRequest.getParameter("ipaddr"));
		
		return dto;
	}
}

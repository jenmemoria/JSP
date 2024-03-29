package menu;

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
	
	public MenuDTO getDTO(HttpServletRequest request) throws IOException {
		MenuDTO dto = new MenuDTO();
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		File uploadFile = mpRequest.getFile("uploadFile");
		if(uploadFile != null) {
			dto.setMenuImage(uploadFile.getName());
		}
		dto.setMenuName(mpRequest.getParameter("menuName"));
		dto.setCategory(mpRequest.getParameter("category"));		
		return dto;
	}
}








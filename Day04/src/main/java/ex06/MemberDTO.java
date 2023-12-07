package ex06;

public class MemberDTO {
	
	private String name;
	private String imgPath;
	
//	public MemberDTO() {} // 이게 있어야 usebin을 쓸 수 있다. (여기에서는 안 쓸 거지만). 일단 무조건 기본 생성자를 만들어놔라.
	



	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		this.imgPath = "image/" + name + ".png";
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
}

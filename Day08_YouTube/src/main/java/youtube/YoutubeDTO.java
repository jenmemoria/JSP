package youtube;

//	IDX       NOT NULL NUMBER         
//	CATEGORY           VARCHAR2(50)   
//	TITLE     NOT NULL VARCHAR2(1000) 
//	CHNAME    NOT NULL VARCHAR2(50)   
//	THUMBNAIL NOT NULL VARCHAR2(2000) 
//	TAG       NOT NULL VARCHAR2(2000)

public class YoutubeDTO {
	
	private int idx;
	private String category;
	private String title;
	private String chname;
	private String thumbnail;
	private String tag;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChname() {
		return chname;
	}
	public void setChname(String chname) {
		this.chname = chname;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
	
}

package board2;

public class Paging {
	private int page;			// 요청받은 페이지
	private int perPage;		// 페이지 당 출력할 게시글 수
	private int boardCount;		// 총 게시글 개수 (삭제 및 검색 반영)
	private int offset;			// sql에서 사용할 offset 값 (건너뛸 개수)
	private int fetch;			// offset 이후 불러올 게시글 수 (==perPage)
	
	private int pageCount;		// 전체 페이지 개수
	private int section;		// 페이지를 10개씩 묶어서 하나의 구역으로 설정하고 0부터 시작
	private boolean prev;		// 이전 구역이 있으면 true
	private boolean next;		// 다음 구역이 있으면 true
	private int begin;			// 구역의 시작 페이지
	private int end;			// 구역의 끝 페이지
	
	// 생성자를 대신할 static method
	public static Paging newInstance(int page, int boardCount) {
		return new Paging(page, boardCount);
	}
	
	private Paging(int page, int boardCount) {	// 전체 몇 페이지에서 몇 개만 보고 싶다, boardCount에서 page 내용만 불러오기.
		this.page = page;						// 사용자가 요청한 페이지 번호는 3
		this.boardCount = boardCount;			// DAO를 이용하여 파악한 총 게시글의 개수 : 930
		
		perPage = 15;							// 여기 값을 바꾸면 화면에 출력되는 게시글의 개수가 바뀐다 !!
		offset = (page - 1) * perPage;			// (3 - 1) * 10, 20개의 게시글은 건너뛰고
		fetch = perPage;						// 그 다음 10개를 화면에 출력한다.
		
		// 하단에 페이지 번호들을 링크로 출력할 때 필요한 요소들
		pageCount = boardCount / perPage;		// 페이지가 총 몇개인지 파악해야 한다. 게시글 수 / 페이지당 개수 930 / 10
		pageCount += (boardCount % perPage != 0) ? 1 : 0;	// 나머지가 있으면 1페이지 추가
		section = (page - 1) / 10;				// (3 - 1) / 10, 0번대 구역(01, 02, 03...)
		begin = (section) * 10 + 1;				// 0 * 10 + 1, 1페이지부터 ...
		end = begin + 9;						// 1 + 9, 10페이지까지 하단에 반복문으로 출력한다.
		prev = section != 0;					// 0번 구역이라면 이전 구역이 없다. 그 외에는 이전구역이 있다.
		next = pageCount > end;					// 총 페이지 개수가 마지막 페이지번호보다 크면 다음이 있다.
												// ex) 50(총 페이지 개수) > 50(마지막 페이지 번호)
		if(end > pageCount) {	// 마지막 페이지 번호가 10단위로 계산된 값보다 작으면
			end = pageCount;	// 총 페이지 수를 마지막 페이지 번호로 재설정한다.
			next = false;		// 끝에 도달했기 때문에 다음값이 있을 수가 없다.
		}

	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getFetch() {
		return fetch;
	}
	public void setFetch(int fetch) {
		this.fetch = fetch;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	
}
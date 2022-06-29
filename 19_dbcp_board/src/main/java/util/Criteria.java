package util;

public class Criteria {
	private int page; // 요청이 들어온 페이지
	private int perPageNum; // 한 페이지에 보여줄 게시물 개수
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int page, int perPageNum) {
		setPage(page);
		setPerPageNum(perPageNum);
	}
	
	public int getStartRow() {
		return (this.page -1) * perPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 1) page = 1;
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum < 1 || perPageNum > 100) perPageNum = 10;
		this.perPageNum = perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}

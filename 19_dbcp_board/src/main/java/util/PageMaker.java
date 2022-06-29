package util;

public class PageMaker {
	private Criteria cri;
	private int totalCount;
	private int startPage;
	private int endPage;
	private int maxPage;
	private int displayPageNum;
	private boolean prev;
	private boolean next;
	
	public PageMaker() {
		this.cri = new Criteria();
		this.displayPageNum = 5;
	}
	
	public void calcPaging() {
		endPage = (int) Math.ceil((double) cri.getPage() / displayPageNum) * displayPageNum;
		startPage = endPage - displayPageNum+ 1;
		maxPage = (int) Math.ceil((double) totalCount / cri.getPerPageNum());
		if (endPage > maxPage) endPage = maxPage;
		prev = (startPage > 1) ? true : false;
		next = (endPage != maxPage) ? true : false;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
		calcPaging();
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calcPaging();
	}

	public Criteria getCri() {
		return cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage="
				+ endPage + ", maxPage=" + maxPage + ", displayPageNum=" + displayPageNum + ", prev=" + prev + ", next="
				+ next + "]";
	}
}

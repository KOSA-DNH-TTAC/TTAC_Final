package kr.or.kosa.utils;

public class Pager {
	private int displayPageCnt = 10; //화면에 보여질 페이지 번호 수
	private int startPage; //현재 페이지 기준 시작 페이지 번호
	private int endPage; //현재 페이지 기준 끝 페이지 번호
	private boolean prev, next; //이전, 다음 버튼 활성화 여부
	private int totalCount; //실제 게시물 수
	private Criteria cri; //page(현재 페이지), perPageNum(페이지 당 보여질 게시물의 수)
	private int finalPage; // 맨끝
	private int firstPage; // 맨처음
	
	public Pager(Criteria cri) {
		this.cri = cri;
	}
	
	public int getDisplayPageCnt() {
		return displayPageCnt;
	}
	
	public void setDisplayPageCnt(int displayPageCnt) {
		this.displayPageCnt = displayPageCnt;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalDataCount) {
		this.totalCount = totalDataCount;
		calcData();
	}
	
	//startPagem endPage, prev, next, firstPagem finalPage 계산
	public void calcData() {
		int page = this.cri.getPage();
		int perPageNum = this.cri.getPerPageNum();
		
		// 현재 페이지가 2면 2/10 = 0.2 Math.ceil객체를 이용하여 무조건 올림 하면 1 * displayPageCnt = 10
		this.endPage = (int)(Math.ceil(page / (double)displayPageCnt) * displayPageCnt);
		
		// endPage - 화면에 보여줄 페이지수를 한뒤 + 1을 하면 된다. 
		this.startPage = (this.endPage - displayPageCnt) + 1;
		
		// 전체 게시물 수를 통한 endPage 
		// 데이터가 89 개면 9페이지까지 출력
		int tempEndPage = (int)(Math.ceil(totalCount / (double)perPageNum));
		
		if(this.endPage > tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = startPage == 1? false : true;
		this.next = (endPage * perPageNum) <= totalCount ? true : false;
		
		// 맨끝
		// +1하는 이유는 저렇게 계산하면 맨끝에서 2번째 페이지가 출력되기때문.
		this.finalPage = (int)(Math.ceil(totalCount / (double)perPageNum)+1);
						
		// 맨처음
		this.firstPage = 1;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
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
	
	public Criteria getCri() {
		return cri;
	}
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public int getFinalPage() {
		return finalPage;
	}
	
	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}
	
	public int getFirstPage() {
		return firstPage;
	}
	
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	@Override
	public String toString() {
		return "Pager [displayPageCnt=" + displayPageCnt + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", totalCount=" + totalCount + ", cri=" + cri + ", finalPage="
				+ finalPage + ", firstPage=" + firstPage + "]";
	}
	
	
	
}

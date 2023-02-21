package kr.or.kosa.utils;

import lombok.Data;

@Data
public class Criteria {
	//페이징을 위한 클래스
    private int page;
    private int perPageNum;
 
    /* 사용자가 따로 전달한 값이 없을 경우
     * 기본 생성자를 통한 기본값 정의 */
    //기본 페이지를 1로 하며, 10개씩 보여준다(한 페이지)
    public Criteria() {
        this.page=1;
        this.perPageNum=10;
    }
 
    public void setPage(int page) {
        if(page<=0) {
            this.page=1;
            return;
        }
        this.page = page;
    }
 
    public void setPerPageNum(int perPageNum) {
        if(perPageNum <=0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }
   
    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }
}
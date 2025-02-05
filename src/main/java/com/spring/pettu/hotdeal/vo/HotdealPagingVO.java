package com.spring.pettu.hotdeal.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString
public class HotdealPagingVO {
    private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
    private int cntPage = 5;

    // 생성자: 객체 생성 시 페이징 정보 자동 계산
    public HotdealPagingVO(int total, int nowPage, int cntPerPage) {
        this.total = total;
        this.nowPage = nowPage;
        this.cntPerPage = cntPerPage;

        this.lastPage = calcLastPage();
        calcStartEndPage();
        calcStartEnd();
    }

    // 제일 마지막 페이지 계산
    public int calcLastPage() {
        return (int) Math.ceil((double) total / cntPerPage);
    }

    // 시작, 끝 페이지 계산
    public void calcStartEndPage() {
        this.endPage = ((int) Math.ceil((double) nowPage / cntPage)) * cntPage;
        if (lastPage < endPage) this.endPage = lastPage;
        this.startPage = endPage - cntPage + 1;
        if (startPage < 1) this.startPage = 1;
    }

    // DB 쿼리에서 사용할 start, end값 계산 (MyBatis `LIMIT`과 맞춤)
    public void calcStartEnd() {
        this.end = nowPage * cntPerPage;
        this.start = end - cntPerPage;
    }
}

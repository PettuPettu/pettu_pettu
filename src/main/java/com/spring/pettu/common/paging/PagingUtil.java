package com.spring.pettu.common.paging;

public class PagingUtil {

	private int startSeq;				// 현재 페이지 처음 글번호
	private int endSeq;					// 현재 페이지 끝 글번호
	private int maxPage;				// 최대 페이지 수
	private int startPage;  			// 페이지 시작번호
	private int endPage;				// 페이지 끝번호
	private StringBuffer pagingHtml; 	// 페이징 관련 HTML

	/**
	 * @param url 			: 페이징 적용 대상 주소  (서블릿주소) /myboard
	 * @param currentPage 	: 현재 페이지
	 * @param totRecord 	: 젠체 게시물수
	 * @param blockCount 	: 한 블럭의 게시물 수
	 * @param blockPage  	: 한화면에 보여질 블럭 수
	 **/

	/**
	 * 		int blockCount = 9;
	 *		int blockPage = 3;
	 *      totRecord = 27 일때
	 *		blockPage = 4로 설정하면(maxPage = 3인 상태에서), 3페이지까지만 있어야 하는데, 4페이지, 5페이지, 6페이지까지 표시되는 경우가 발생
	 *   	추후 로직 수정 필요
	*/

	public PagingUtil(String url, int currentPage, int totRecord, int blockCount, int blockPage) {
		// (1) 최대 페이지 수 구하기 (Math.ceil 올림)
		maxPage = (int) Math.ceil((double) totRecord / blockCount);
		if (maxPage == 0) {
			maxPage = 1;
		}

		// 예외처리 : 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage > maxPage) {
			currentPage = maxPage;
		}

		// (2) 현재 페이지의 처음과  끝 글번호 가져오기
		startSeq = (currentPage - 1) * blockCount + 1;
		endSeq = currentPage * blockCount;

		// (3) 시작페이지와 끝페이지 값 구하기  
		if ( currentPage % blockPage == 0 ) {
			startPage = currentPage - ( blockPage - 1 );
		} else {
			startPage = (int)(currentPage / blockPage) * blockPage +1;
		}
		endPage = startPage + blockPage - 1;

		// 예외처리 : 마지막페이지가 전체페이지수보다 크면 전체페이지 수로 설정하기
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		//################## HTML 만들기 ###################
		// [이전] HTML
		pagingHtml = new StringBuffer();

// [이전] 버튼
		if (currentPage > blockPage) {
			pagingHtml.append("<a href='" + url + "?&currentPage=" + (startPage - 1) + "' class='prev'>");
			pagingHtml.append("<<");
			pagingHtml.append("</a>");
		}


// |1|2|3|4|5|  HTML (현재 페이지는 active 클래스를 사용해 버튼 스타일 적용)
		for (int i = startPage; i <= endPage; i++) {
			if (i > maxPage) {
				break;
			}
			if (i == currentPage) {
				// 현재 페이지에는 active 클래스를 추가하여 버튼처럼 스타일을 적용
				pagingHtml.append("<a href='#' class='active'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			} else {
				pagingHtml.append("<a href='" + url + "?&currentPage=" + i + "'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
			pagingHtml.append(" ");
		}


// [다음] 버튼
		if (maxPage - startPage >= blockPage) {
			pagingHtml.append("<a href='" + url + "?&currentPage=" + (endPage + 1) + "' class='next'>");
			pagingHtml.append(">>");
			pagingHtml.append("</a>");
		}

	}

	
	
	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public int getStartSeq() {
		return this.startSeq;
	}

	public int getEndSeq() {
		return this.endSeq;
	}



}

package utility;

public class PagingPlus {
	//페이징 관련 변수	
	private int totalCount = 0 ; //총 레코드 건수
	private int totalPage = 0 ; //전체 페이지 수
	private int pageNumber = 0 ; //보여줄 페이지 번호
	private int pageSize = 0 ; //한 페이지에 보여줄 건수
	private int beginRow = 0 ; //현재 페이지의 시작 행
	private int endRow = 0 ; //현재 페이지의 끝 행
	private int pageCount = 3 ; // 한 화면에 보여줄 페이지 링크 수 (페이지 갯수)
	private int beginPage = 0 ; //페이징 처리 시작 페이지 번호
	private int endPage = 0 ; //페이징 처리 끝 페이지 번호
	private int offset = 0 ;
	private int limit = 0 ;
	private String url = "" ;
	private String pagingHtml = "";//하단의 숫자 페이지 링크
	
	//검색을 위한 변수 추가
	private String whatColumn = "" ; //문서 종류(dcategory) 검색
	private String inputDnum = "" ; //문서 번호(dnum) 검색
	private String inputTitle = ""; //문서 제목(title) 검색
	private String inputDay1 = ""; //작성일자(writeday) 검색
	private String inputDay2 = ""; //작성일자(writeday) 검색

	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) { 
		this.totalCount = totalCount;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getBeginRow() {
		return beginRow;
	}


	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getOffset() {
		return offset;
	}


	public void setOffset(int offset) {
		this.offset = offset;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getPagingHtml() {
		System.out.println("pagingHtml:"+pagingHtml);
		
		return pagingHtml;
//		pagingHtml:
//			&nbsp;<font color='red'>1</font>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=2&pageSize=2&whatColumn=null&keyword=null'>2</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=3&pageSize=2&whatColumn=null&keyword=null'>3</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=4&pageSize=2&whatColumn=null&keyword=null'>4</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=5&pageSize=2&whatColumn=null&keyword=null'>5</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=6&pageSize=2&whatColumn=null&keyword=null'>6</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=7&pageSize=2&whatColumn=null&keyword=null'>7</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=8&pageSize=2&whatColumn=null&keyword=null'>8</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=9&pageSize=2&whatColumn=null&keyword=null'>9</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=10&pageSize=2&whatColumn=null&keyword=null'>10</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=11&pageSize=2&whatColumn=null&keyword=null'>다음</a>&nbsp;&nbsp;<a href='/ex/list.ab?pageNumber=22&pageSize=2&whatColumn=null&keyword=null'>맨 끝</a>&nbsp;

	}


	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}


	public String getWhatColumn() {
		return whatColumn;
	}


	public void setWhatColumn(String whatColumn) {
		this.whatColumn = whatColumn;
	}


	public String getInputDnum() {
		return inputDnum;
	}


	public void setInputDnum(String inputDnum) {
		this.inputDnum = inputDnum;
	}


	public String getInputTitle() {
		return inputTitle;
	}


	public void setInputTitle(String inputTitle) {
		this.inputTitle = inputTitle;
	}


	public String getInputDay1() {
		return inputDay1;
	}


	public void setInputDay1(String inputDay1) {
		this.inputDay1 = inputDay1;
	}


	public String getInputDay2() {
		return inputDay2;
	}


	public void setInputDay2(String inputDay2) {
		this.inputDay2 = inputDay2;
	}


	public PagingPlus(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url, 
			String whatColumn, 
			String inputDnum,
			String inputTitle,
			String inputDay1,
			String inputDay2) {		

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			//System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ;
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "5" ; // 한 페이지에 보여줄 레코드 갯수
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; // 한 페이지에 보여줄 레코드 갯수
		System.out.println("limit: " + limit);

		this.totalCount = totalCount ; 

		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ; // 8.5 => 9
		
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		// pageNumber가 1이면 beginRow=1, endRow=2
		// pageNumber가 2이면 beginRow=3, endRow=4
		
		// pageNumber가 2이면 beginRow=6, endRow=10
		
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		
		this.offset = ( pageNumber - 1 ) * pageSize ; 
		System.out.println("offfset: " + offset);
		/*offset : 
			한 페이지에 2개씩 출력할 때,
			3페이지 클릭하면 앞에 4개 건너뛰고 5번째 부터 나와야 한다. 
			위의 offset = (3-1)*2 => 4(건너뛸 갯수가 된다.)
			(4페이지에 띄울려면 앞에 6개를 건너뛰어야 함)
		*/	
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		/*pageCount=10 : 한 화면에 보일 페이지 수,
		pageNumber(현재 클릭한 페이지 수)가 12이면 beginPage = 11이 되고, endPage=20이 된다. */
		
		//System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		 
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		//System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; //  /ex/list.ab
		this.whatColumn = whatColumn ;
		this.inputDnum = inputDnum ;
		this.inputTitle = inputTitle;
		this.inputDay1 = inputDay1;
		this.inputDay2 = inputDay2;
		//System.out.println("whatColumn:"+whatColumn+"/keyword:"+keyword);
		
		this.pagingHtml = getPagingHtml(url) ;
	
	
	}
	
	private String getPagingHtml(String url) { // 페이징 문자열을 만든다.
	    System.out.println("getPagingHtml url:" + url); // ex/list.ab (몇 페이지를 눌러도 list.ab가 요청되도록)
	    
	    StringBuilder result = new StringBuilder();
	    // added_param 변수 : 검색 관련하여 추가되는 파라미터 리스트
	    String added_param = "&whatColumn=" + (whatColumn == null ? "" : whatColumn) 
	                        + "&inputDnum=" + (inputDnum == null ? "" : inputDnum) 
	                        + "&inputTitle=" + (inputTitle == null ? "" : inputTitle) 
	                        + "&inputDay1=" + (inputDay1 == null ? "" : inputDay1) 
	                        + "&inputDay2=" + (inputDay2 == null ? "" : inputDay2);
	    
	    if (this.beginPage > 1) { // 앞쪽, pageSize: 한 화면에 보이는 레코드 수
	        result.append("&nbsp;<a href='").append(url)
	              .append("?pageNumber=1&pageSize=").append(this.pageSize)
	              .append(added_param).append("' class='btn btn-outline-secondary btn-sm'><i class='fi fi-rr-angle-double-small-left'></i></a>&nbsp;");
	        result.append("&nbsp;<a href='").append(url)
	              .append("?pageNumber=").append(this.pageNumber - 1).append("&pageSize=").append(this.pageSize)
	              .append(added_param).append("' class='btn btn-outline-secondary btn-sm'><i class='fi fi-rr-angle-small-left'></i></a>&nbsp;");
	    }
	    
	    // 가운데
	    for (int i = this.beginPage; i <= this.endPage; i++) {
	        if (i == this.pageNumber) {
	            result.append("&nbsp;<span class='btn btn-primary btn-sm'>").append(i).append("</span>&nbsp;");
	        } else {
	            result.append("&nbsp;<a href='").append(url)
	                  .append("?pageNumber=").append(i).append("&pageSize=").append(this.pageSize)
	                  .append(added_param).append("' class='btn btn-outline-secondary btn-sm'>").append(i).append("</a>&nbsp;");
	        }
	    }
	    
	    if (this.endPage < this.totalPage) { // 뒤쪽
	        result.append("&nbsp;<a href='").append(url)
	              .append("?pageNumber=").append(this.pageNumber + 1).append("&pageSize=").append(this.pageSize)
	              .append(added_param).append("' class='btn btn-outline-secondary btn-sm'><i class='fi fi-rr-angle-small-right'></i></a>&nbsp;");
	        result.append("&nbsp;<a href='").append(url)
	              .append("?pageNumber=").append(this.totalPage).append("&pageSize=").append(this.pageSize)
	              .append(added_param).append("' class='btn btn-outline-secondary btn-sm'><i class='fi fi-rr-angle-double-small-right'></i></a>&nbsp;");
	    }
	    
	    return result.toString();
	}

}


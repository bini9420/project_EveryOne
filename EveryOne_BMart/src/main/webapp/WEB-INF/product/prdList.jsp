<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/prdStyle.css">
    <script>
        function confirmDelete(pnum, pageNumber) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = 'delete.prd?pnum=' + pnum + "&pageNumber=" + pageNumber;
            }
        }
        function goUpdate(pnum, pageNumber) {
            location.href="update.prd?pnum=" + pnum +"&pageNumber=" + pageNumber;
        }
        function insert() {
        	location.href="insert.prd"
        }
    </script>
</head>
<body>
	
    <h1>상품 리스트 
    <c:if test="${!isAdmin}">
    	<input type="button" value="추가" onClick="insert()">
    </c:if>
    </h1>
    <table border="1">
        <tr>
            <th>번호</th>
            <c:if test="${loginInfo.id == 'admin' }">
            	<th>등록자</th>
            </c:if>
            <th>이름</th>
            <th>가격</th>
            <th>재고</th>
            <th>관리</th>
        </tr>
        <c:choose>
            <c:when test="${pageInfo.totalCount == 0}">
            <table align="center">
                <tr>
                    <td>
                        상품이 없습니다.
                    </td>
                </tr>
            </table>
            </c:when>
            <c:otherwise>
        <c:forEach var="prd" items="${products}">
            <tr>
                <td>${prd.pnum}</td>
                <c:if test="${loginInfo.id == 'admin' }">
	            	<td>${prd.id }</td>
	            </c:if>
                <td><a href="detail.prd?pnum=${prd.pnum}&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">${prd.pname}</a></td>
                <td>${prd.price}</td>
                <td>${prd.stock}</td>
                <td>
                    <input type="hidden" name="pnum" value="${prd.pnum}">
                    <input type="button" value="삭제" onClick="confirmDelete('${prd.pnum}','${pageInfo.pageNumber}')">
                    <c:if test="${!isAdmin}">
                    	<input type="button" value="수정" onClick="goUpdate('${prd.pnum}','${pageInfo.pageNumber}')">
                	</c:if>
                </td>
            </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
    </table>
    <c:if test="${loginInfo.id == 'admin' }">
	    <div class="search-form">
	        <form action="list.prd" method="get">
	            <select name="whatColumn">
	                <option value="all">전체검색</option>
	                <option value="id">등록자</option>
	            </select>
	            <input type="text" name="keyword" placeholder="검색어를 입력하세요">
	            <input type="submit" value="검색">
	        </form>
	    </div>
    </c:if>
    <center>${pageInfo.pagingHtml }</center>
    <div class="pagination">
        <c:if test="${count > 0}">
            <%
                int pageCount = (Integer) request.getAttribute("count") / (Integer) request.getAttribute("pageSize") + 
                                ((Integer) request.getAttribute("count") % (Integer) request.getAttribute("pageSize") == 0 ? 0 : 1);
                int pageBlock = 10;
                int startPage = ((Integer) request.getAttribute("currentPage") - 1) / pageBlock * pageBlock + 1;
                int endPage = startPage + pageBlock - 1;
                if (endPage > pageCount) {
                    endPage = pageCount;
                }
            %>
            <c:if test="${startPage > 1}">
                <a href="list.prd?pageNum=${startPage-1}">[이전]</a>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <a href="list.prd?pageNum=${i}" class="${pageInfo.currentPage == i ? 'active' : ''}">[${i}]</a>
            </c:forEach>
            <c:if test="${endPage < pageCount}">
                <a href="list.prd?pageNum=${startPage+pageBlock}">[다음]</a>    
            </c:if>
        </c:if>
    </div>
</body>
</html>

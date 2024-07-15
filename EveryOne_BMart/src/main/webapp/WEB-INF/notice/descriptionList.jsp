<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<h1 align="center">게시판 목록보기</h1>
	<form action="dlist.nt" align="center">
		<select name="whatColumn">
			<option value="all">전체검색 
			<option value="dsubject">제목
			<option value="id">작성자
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	<table border="1" align="center">
		<tr>
			<td colspan="6" align="right">
				<input type="button" value="추가하기" onClick="location.href='dinsert.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:choose>
			<c:when test="${pageInfo.totalCount == 0}">
		        <table align="center">
		            <tr>
		                <td>
		                    게시판에 저장된 글이 없습니다.
		                </td>
		            </tr>
		        </table>
	   		</c:when>
	   		<c:otherwise>
				<c:forEach var="d" items="${db}">
					<tr align="center">
		                   <td>${d.dnum}</td>
		                   <td align="left">
		                   		<c:if test="${d.re_level > 0}">
		                            <img src="images/level.gif" width="${20 * d.re_level}" height="15">
		                            <!-- <img src="images/re.gif">  -->
		                        </c:if>
		                        <a href="dcontent.nt?dnum=${d.dnum}&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">${d.dsubject}</a>
		                    </td>
		                    <td>${d.id}</td>
		                    <td><fmt:formatDate value="${d.ddate}" pattern="yyyy-MM-dd"/></td>
		                </tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<br><br>
	<center>${pageInfo.pagingHtml }</center>

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
    <div>
        <c:if test="${startPage > 10}">
            <a href="descriptionList.jsp?pageNum=${startPage - 10}">[이전]</a>
        </c:if>
        <c:forEach begin="${startPage}" end="${endPage}" var="i">
            <a href="descriptionList.jsp?pageNum=${i}">[${i}]</a>
        </c:forEach>
        <c:if test="${endPage < pageCount}">
            <a href="descriptionList.jsp?pageNum=${startPage + 10}">[다음]</a>
        </c:if>
    </div>
</c:if>
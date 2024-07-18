<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../common/common.jsp" %>
<style>
#approveBox:hover {
	cursor: pointer;
}
h6 {
	display: inline-block;
}

.btn-outline-primary {
	width: 30px;
	height: 30px;
}

#requestDocument:hover {
	background-color: #7dc9c6 !important;
	border-color: #bae8e6 !important;
}

body {
	font-family: Arial, sans-serif;
	background-color: #F5F5F5;
	color: #333333;
}

h1 {
	color: #48D1CC;
}

form {
	margin: 20px auto;
	text-align: center;
}

select, input[type="text"], input[type="submit"], input[type="button"] {
	padding: 10px;
	border: 1px solid #CCCCCC;
	border-radius: 5px;
	margin: 5px;
}

input[type="submit"], input[type="button"] {
	background-color: #48D1CC;
	color: white;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: #009f8e;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #CCCCCC;
}

th, td {
	padding: 10px;
	text-align: center;
}

th {
	background-color: #48D1CC;
	color: white;
}

td {
	background-color: white;
}

a {
	text-decoration: none;
	color: #00C7AE;
}

a:hover {
	text-decoration: underline;
}

.paging {
	text-align: center;
	margin: 20px;
}

.paging a {
	margin: 0 5px;
	color: #00C7AE;
}

.paging a:hover {
	text-decoration: underline;
}
</style>

<%@ include file="../admin/a_top.jsp"%>

<a href="top.sale"></a>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800"></h1>
		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
			<i class="fas fa-download fa-sm text-white-50"></i> Generate Report
		</a>
	</div>

	<!-- Content Row -->
	<div class="row">

		<form action="dlist.nt">
			<select name="whatColumn">
				<option value="all">전체검색</option>
				<option value="dsubject">제목</option>
				<option value="id">작성자</option>
			</select> <input type="text" name="keyword"> <input type="submit"
				value="검색">
		</form>
		<table>
			<tr>
				<td colspan="6" align="right"><input type="button" value="추가하기"
					onClick="location.href='dinsert.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
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
					<tr>
						<td colspan="4">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="d" items="${db}">
						<tr>
							<td>${d.dnum}</td>
							<td align="left"><c:if test="${d.re_level > 0}">
									<img src="images/level.gif" width="${20 * d.re_level}"
										height="15">L
                            </c:if> <a
								href="dcontent.nt?dnum=${d.dnum}&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">${d.dsubject}</a>
							</td>
							<td>${d.id}</td>
							<td><fmt:formatDate value="${d.ddate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<center>${pageInfo.pagingHtml}</center>
	<br>
	<div class="pagination">
		<c:if test="${count > 0}">
			<%
			int pageCount = (Integer) request.getAttribute("count") / (Integer) request.getAttribute("pageSize")
					+ ((Integer) request.getAttribute("count") % (Integer) request.getAttribute("pageSize") == 0 ? 0 : 1);
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
				<a href="list.prd?pageNum=${i}"
					class="${pageInfo.currentPage == i ? 'active' : ''}">[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="list.prd?pageNum=${startPage+pageBlock}">[다음]</a>
			</c:if>
		</c:if>
	</div>

</div>
<%@include file="../admin/a_bottom.jsp"%>
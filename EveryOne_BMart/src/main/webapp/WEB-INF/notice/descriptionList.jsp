<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	body {
		font-family: Arial, sans-serif;
		background-color: #F5F5F5;
		color: #363836;
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

<!-- Begin Page Content -->
<div class="card shadow mx-auto py-5" style="width :80%; margin-top: 80px">
	
	<div class="text-center my-3">
		<h3 style="font-weight: bold">문의게시판</h3>
	</div>

	<div class="container">
		<div style="text-align: right">
			<form action="dlist.nt" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
				<div class="input-group">
					<select name="whatColumn" style="margin-right: 8; border: 1px solid #CCCCCC; width: 90" class="form-select">
						<option value="all">전체
						<option value="id">작성자
						<option value="dsubject">제목
					</select>
					<input type="text" name="keyword" class="form-control bg-light border-0 small reading"
						placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="submit">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div>
		<table class="table table-striped table-hover table-bordered mx-auto text-center my-4" style="width: 90%">
			<thead style="background: rgba(42, 193, 188, 0.3); color: black">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
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
								<td style="text-align: left">
									<c:if test="${d.re_level > 0}">
										<img src="images/level.gif" width="${20 * d.re_level}" height="15">L
		                            </c:if> 
		                            <a href="dcontent.nt?dnum=${d.dnum}&pageNumber=${pageInfo.pageNumber}&whatColumn=${param.whatColumn}&keyword=${param.keyword}">${d.dsubject}</a>
								</td>
								<td>${d.id}</td>
								<td><fmt:formatDate value="${d.ddate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" style="text-align: right">
						<button class="btn btn-primary btn-sm"
							onClick="location.href='dinsert.nt?whatColumn=${param.whatColumn}&keyword=${param.keyword}&pageNumber=${param.pageNumber}'">
							<i class="fi fi-br-plus"></i> 추가하기
						</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<center>${pageInfo.pagingHtml}</center>

</div>
<%@include file="../admin/a_bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../common/common.jsp" %>
<html>
<head>
    <title>Review List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
    <script>
        function confirmDelete(rnum, pnum) {
            if (confirm("정말로 삭제하시겠습니까?")) {
                location.href = 'delete.rv?rnum=' + rnum + '&pnum=' + pnum;
            }
        }
    </script>
</head>
<body>
    <h2>리뷰 리스트</h2>
    <p>평균 별점: <fmt:formatNumber value="${avgScore }" pattern=".0"/></p>
    <c:choose>
        <c:when test="${not empty noReviewsMessage}">
            <p>${noReviewsMessage}</p>
        </c:when>
        <c:otherwise>
            <table border="1">
                <tr>
                    <th>작성자</th>
                    <th>평점</th>
                    <th>Comment</th>
                    <c:if test="${loginInfo.id == 'admin'}">
                    	<th>관리</th>
                    </c:if>
                </tr>
                <c:forEach var="review" items="${reviews}">
                    <tr>
                        <td>${review.id}</td>
                        <td>${review.score}</td>
                        <td>${review.rcomment}</td>
						<c:if test="${loginInfo.id == 'admin'}">
							<td><input type="button" value="삭제"
								onClick="confirmDelete('${review.rnum}', '${pnum}')"></td>
						</c:if>
					</tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <input type="button" value="돌아가기" onClick="history.back()">
</body>
</html>

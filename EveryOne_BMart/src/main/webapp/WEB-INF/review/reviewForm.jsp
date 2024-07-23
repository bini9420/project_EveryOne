<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %> 
<%
	String path = request.getContextPath();
%>

<style type="text/css">
	div{
		vertical-align: middle;
	}
	table{
		width: 80%;
		margin: auto;
		border: 0px;
		border-radius: 5px;
		color: #414141;
		text-align: center;
		background-color: #f0f0f0
	}
	td{
		padding: 7px;
	}
	.title{
		font-size: 20px;
		font-weight: bold;
	}
	.contents{
		border: 0px;
		border-radius: 10px;
		background-color: white;
		padding: 10px;
		resize: none;
		color: black;
	}
	.contentsTd{
		text-align: center;
	}
	.reviewBtnTr{
		text-align: center;
	}
	.reviewBtnTr input{
		border: 0px;
		border-radius: 5px;
		color: white;
		width: 95%;
		height: 35px;
		font-size: 17px;
		font-weight: bold;
		background-color: #2e59d9;
	}
	.star_rating {
	  width: 100%; 
	  box-sizing: border-box; 
	  display: inline-flex; 
	  float: left;
	  flex-direction: row; 
	  justify-content: flex-start;
	  margin-left: 37%;
	}
	.star_rating .star {
	  width: 35px; 
	  height: 35px; 
	  margin-right: 10px;
	  display: inline-block; 
	  background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png') no-repeat; 
	  background-size: 100%; 
	  box-sizing: border-box; 
	}
	.star_rating .star.on {
	  width: 35px; 
	  height: 35px;
	  margin-right: 10px;
	  display: inline-block; 
	  background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb2d6gV%2FbtsvbDoal87%2FXH5b17uLeEJcBP3RV3FyDk%2Fimg.png') no-repeat;
	  background-size: 100%; 
	  box-sizing: border-box; 
	}
	.product_Th{
		text-align: center;
	}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('.star_rating .star').click(function() {
        $(this).siblings().removeClass('on'); // 형제 요소의 'on' 클래스 제거
        $(this).addClass('on').prevAll('.star').addClass('on'); // 클릭한 별점 및 그 이전 별점들에 'on' 클래스 추가
        
        // 선택한 별점 값을 해당 폼 내의 hidden 필드에 설정
        var starValue = $(this).attr('value');
        $('#starRating').val(starValue);
    });
    
    $('.reviewForm').submit(function(e) {
        e.preventDefault(); // 기본 제출 이벤트 방지
        
        // AJAX를 사용하여 폼을 제출할 수도 있습니다.
        $.ajax({
            type: 'POST',
            url: 'insertForm.rv',
            data: $('.reviewForm').serialize(), // 폼 데이터 직렬화
            success: function(response) {
                // 리뷰가 등록되었다는 메시지 표시
                alert("리뷰가 등록되었습니다.");
                window.opener.location.href = 'mypage.mb?index=review';
                window.close(); // 현재 창 닫기
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 처리
                console.error('Error:', error);
            }
        });
    });
});
</script>

<div>
	<form class="reviewForm" action="insertForm.rv" method="post">
	<input type="hidden" name="pnum" value="${pnum}">
	<input type="hidden" id="starRating" name="starRating" value="1">
	<input type="hidden" name="onum" value="${onum}">
	<input type="hidden" name="id" value="${id}">
		<table>
			<tr>
				<td>
					<span class="title">${pname} 리뷰 작성</span>
				</td>
			</tr>
			<tr>
				<td class="star_Td">
					<div class ="star_rating">
					  <span class="star on" value="1"> </span>
					  <span class="star" value="2"> </span>
					  <span class="star" value="3"> </span>
					  <span class="star" value="4"> </span>
					  <span class="star" value="5"> </span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="contentsTd">
					<textarea class="contents" name="contents" rows="3" cols="88" placeholder="리뷰 내용을 작성해주세요."></textarea>
				</td>
			</tr>
			<tr class="reviewBtnTr">
				<td class="reviewBtnTd">
					<input type="submit" value="리뷰 등록" >
				</td>
			</tr>
		</table>
	</form>
</div>
    
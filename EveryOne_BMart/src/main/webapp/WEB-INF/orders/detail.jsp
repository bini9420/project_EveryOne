<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Begin Page Content -->
<style>
    .table-details {
        margin: 20px 0;
    }
    .table-details th {
        width: 30%;
        text-align: right;
        padding-right: 20px;
    }
    .table-details td {
        width: 70%;
        text-align: left;
        padding-left: 20px;
    }
    .table-details .total-row {
        font-weight: bold;
        background-color: #f2f2f2;
    }
    .btn-custom {
        background-color: #48D1CC;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
        padding: 10px 20px;
    }
    .btn-custom:hover {
        background-color: #3bb8b2;
    }
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<%@ include file="../member/owner/o_top.jsp"%>
<div class="container-fluid h-100">

    <!-- Content Row -->
    <div class="row justify-content-center">
        <h5 class="card-title text-primary fw-bolder">주문 상세 정보</h5>
        <table class="table table-bordered table-details">
            <tbody width="">
                <tr>
                    <th>주문번호:</th>
                    <td>${order.onum}</td>
                </tr>
                <tr>
                    <th>고객 ID:</th>
                    <td>${order.id}</td>
                </tr>
                <tr>
                    <th>상품번호:</th>
                    <td>${order.pnum}</td>
                </tr>
                <tr>
                    <th>수량:</th>
                    <td>${order.pamount}</td>
                </tr>
                <tr>
                    <th>금액:</th>
                    <td><fmt:formatNumber value="${order.price}" pattern="#,###" /></td>
                </tr>
                <tr>
                    <th>배송 방법:</th>
                    <td>${order.way}</td>
                </tr>
                <tr>
                    <th>상태:</th>
                    <td>
                       배송완료료
                    </td>
                </tr>
                <tr>
                    <th>요청사항:</th>
                    <td>${order.contents}</td>
                </tr>
                <tr>
                    <th>결제 방법:</th>
                    <td>${order.payment}</td>
                </tr>
                <tr>
                    <th>주문일:</th>
                    <td>${order.orderdate}</td>
                </tr>
            </tbody>
        </table>
        <div class="text-center">
            <button class="btn-custom" onClick="location.href='list.od?pageNumber=${param.pageNumber}'">돌아가기</button>
        </div>
    </div>
</div>

<!-- /.container-fluid -->

<!-- End of Main Content -->

<%@ include file="../member/owner/o_bottom.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>start</title>

<%
	String gotoMall = request.getContextPath()+"/main.mall";
	String top = request.getContextPath()+"/top.sale";
%>

<input type="button" value="마트보기" onClick="location='<%=gotoMall%>'">
<input type="button" value="탑세일" onClick="location='<%=top%>'">
      
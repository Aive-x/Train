<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.User"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火车票预订系统</title>
<style type="text/css">
	#container{
	background-color:#eef1f8;
	border-radius: 20px;
	margin:0 auto;
	padding-top:2%;
	margin-top:5%;
	margin-left:10%;
	margin-right:10%;
	margin-bottom:3%;
	padding-bottom: 2%;
}
	p {
	margin-left: 10%;
	margin-bottom: 2%;
}
a{
	text-decoration: none;
}
.orderMsg{
	background: #ff8201;
	color: white;
	padding: 3px 10px 3px 10px;
	border-radius: 4px;
}
.changeOrder{
	border: 1px solid black;
	padding: 3px 10px 3px 10px;
	border-radius: 4px;
	margin-left: 2%;
	background: white;
	color: black;
	margin-right: 3%;
}
#cancelBtn{
	padding: 5px 10px 5px 10px;
	border-radius: 4px;
	background: red;
	color: white;
	border:none;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


	<!-- 数据库查询该用户所有的订单简介，循环输出 -->
	<!-- 输出例子 -->
	<c:forEach items="${listOfOrder}" var="item" varStatus="loop">
	<form action="" method="post" id="container">
		<p>下单时间：${item.date }&nbsp;&nbsp;订单号：${item.order_id }</p>
		<p>${listOfTickets[loop.count-1].departure_station } --->  ${listOfTickets[loop.count-1].destination_station }&nbsp;&nbsp;车次号${item.train_number }</p>
		<p>总金额：${item.total_price }¥</p>
		<p style="margin-left: 60%;">
		<a href="SearchOrderDetails?orderNum=${item.order_id }" class="orderMsg">订单详情</a>
		<a href="changeOrder?orderNum=${item.order_id }" class="changeOrder">改签</a>
		<a href="RefundTickets?orderNum=${item.order_id }" class="changeOrder">退票</a></p>
	</form>
	</c:forEach>
<%@ include file="footer.jsp" %>
</body>
</html>
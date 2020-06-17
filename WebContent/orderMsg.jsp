<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.Order" import="Class.Ticket"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火车票预订系统</title>
<style type="text/css">
	a {
		text-decoration: none;
	}
	#bread{
		color: black;
		margin-left: 3%;
	}
	.container{
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
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	
	<p id="bread"><a href="orderCenter.jsp" style="color: black;">订单中心</a>-><a href="orderMsg.jsp" style="color: black;">订单详情</a></p>
	<%
		Order order = (Order)request.getAttribute("order");
		Ticket ticket = (Ticket)request.getAttribute("ticket");
		
		String date = order.getDate();
		String order_id = order.getOrder_id();
		String train_number = order.getTrain_number();
		String departure_station = ticket.getDeparture_station();
		String destination_station = ticket.getDestination_station();
	%>
	<!-- 根据订单号查询该订单详细的订单信息 -->
	<!-- 结果显示 -->
	<a href="searchOrderInformation" style="margin-left: 3%;border: 1px solid black;	padding: 3px 10px 3px 10px;	border-radius: 4px;	background: white;">返回</a>
	<c:forEach items="${listOfC_order}" var="item" varStatus="loop">
		<div class="container">
			<p>下单时间：<%=date %>&nbsp;&nbsp;订单号：<%=order_id %></p>
			<p><%=departure_station %>---><%=destination_station %>&nbsp;&nbsp;<%=train_number %></p>
			<p>金额：${item.price }¥</p>
			<!-- 循环显示乘车人 -->
			<p>姓名：${listOfPassenger[loop.count-1].name }</p>
			<p>身份证号：${item.passenger_id }</p>
			<p>座位号：${item.seat }</p>
			<p>车厢号：${item.carriage }</p>
		</div>
	</c:forEach>
	
<%@ include file="footer.jsp" %>
</body>
</html>
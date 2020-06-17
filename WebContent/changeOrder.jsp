<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "Class.Ticket"%>
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
	#searchForm{
		float: left;
		margin-left: 15%;
		margin-top: 4%;
		border: 1px dotted blue;
		padding-left:8%;
		padding-right:5%;
		border-radius: 4px;
	}
	#indexImg{
		float: right;
		margin-right: 10%;
	}
	#fromStation{
		margin-bottom: 10%;
		margin-top: 25%;
	}
	#toStation{
		margin-bottom: 10%;
		margin-top: 5%;
	}
	#date{
		margin-bottom: 10%;
		margin-top: 5%;
	}
	#searchBtn{
		width:80%;
		height:30px;
		background: #ff8201;
		color: white;
		border:none;
		margin-bottom: 20%;
		margin-top: 10%;
		border-radius: 5px;
	}
	label {
		margin-left: -20%;
		margin-right: 10%;
	}
	.container{
		overflow: hidden;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	
	<p id="bread"><a href="oederCenter.jsp" style="color: black;">订单中心</a>-><a href="changeOrder.jsp" style="color: black;">改签</a></p>
	
	<%

		Ticket changeBook1 = (Ticket)request.getAttribute("changeBook1");
		String departure_station = changeBook1.getDeparture_station();
		String destination_station = changeBook1.getDestination_station();
		String trainDate = changeBook1.getDate();
	%>
	
	<!-- 查询该订单车票的始发站和终点站 -->
	<div class="container">
	<form action="SearchTickets" method="post" id="searchForm">
		<div id="fromStation">
			<label>出发地</label>
			<input type="text" disabled="disabled" value="<%=departure_station %> ">
			<input type="hidden" value="<%=departure_station %> " name="departure_station" id="departure_station">
		</div>
		
		<div id="toStation">
		<label>到达地</label>
		<input type="text" disabled="disabled" value="<%=destination_station%>">
		<input type="hidden" value="<%=destination_station %> " name="destination_station" id="destination_station">
		</div>
		
		<div id="date">
		<label>出发日期</label>
		<input type="date" value="<%=trainDate%>"><!-- 出发时间 -->
		<input type="hidden" value="<%=trainDate %> " name="trainDate" id="trainDate">
		</div>
		
		<input type="submit" value="查&nbsp&nbsp&nbsp&nbsp&nbsp询" id="searchBtn" name="searchBtn"><!-- 查询按钮 -->
	</form>
	<img alt="" src="image/indexImg.jpg" id="indexImg">
	</div>
	
<%@ include file="footer.jsp" %>
</body>
</html>
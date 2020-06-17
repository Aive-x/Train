<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.Ticket"%>
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
	#table{
		border-collapse:collapse;
		text-align: center;
		width: 90%;
		margin-left: 5%;
	}
	#table td {
		border: 1px solid #2676e3;
		padding: 	7px 7px 7px 7px;
	}
	#table .titleT{
		color: white;
		padding-top:5px;
  		padding-bottom:4px;
  		background-color: #3b99fc;
	}
	#table .textT{
		background-color: #eef1f8;
	}
	#book{
		border-radius: 4px;
		background-color: #2676e3;
		color: white;
		padding: 5px 15px 5px 15px;
	}
</style>
</head>

<body>
<%@ include file="header.jsp" %>


	<p id="bread"><a href="index.jsp" style="color: black;">首页</a>-><a href="searchResult.jsp" style="color: black;">车次列表</a></p>
	<div class="container">
		<table id="table">
			<tr class="titleT">
				<td>车次</td>
				<td>出发站</td>
				<td>到达站</td>
				<td>出发时间</td>
				<td>商务座</td>
				<td>一等座</td>
				<td>二等座</td>
				<td>无座</td>
				<td>备注</td>
			</tr>
			<!--
				数据库查询符合的结果列表 
			 -->
			 <!-- 循环输出 -->
			<c:forEach items="${list}" var="item">
            <tr>
                <td>${item.train_number }</td>
                <td>${item.departure_station }</td>
                <td>${item.destination_station }</td>
                <td>${item.departure_time }</td>
                <td>${item.business_ticket }</td>
                <td>${item.lev1_ticket }</td>
                <td>${item.lev2_ticket }</td>
				<td>${item.noSeat_ticket }</td>
                <td><a href="BookTickets?trainNum=${item.train_number }"  id="book">预订</a></td>
            </tr>
        </c:forEach>
		</table>
	</div>
	
<%@ include file="footer.jsp" %>
</body>
</html>
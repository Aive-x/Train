<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="header.jsp"></jsp:include>
<%
String orderNum = request.getParameter("orderNum");/* 获取该订单的订单号 */
%>

	<p id="bread"><a href="orderCenter.jsp" style="color: black;">订单中心</a>-><a href="changeOrderList.jsp" style="color: black;">改签</a></p>
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
			 <tr class="textT">
				<td>G667</td>
				<td>上海</td>
				<td>北京</td>
				<td>17:20</td>
				<td>10</td>
				<td>20</td>
				<td>有</td>
				<td>有</td>
				<td><a href="changeBook.jsp?trainNum=车次号&&orderNum=订单号" id="book">预订</a></td>
			</tr>
		</table>
	</div>
	
<%@ include file="footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection" 
    import="java.sql.PreparedStatement" import="java.sql.ResultSet" import="java.sql.SQLException"
    import="Class.Ticket" import="java.util.List" import="java.util.ArrayList"
    import="Class.User" import="Class.Passenger"%>
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
	#orderForm{
		border-radius: 4px;
		border: 1px dashed blue;
		padding-left: 10%;
		padding-right: 5%;
		margin-right: 10%;
		padding-bottom: 3%;
		margin-left: 5%;
	}
	#btn{
		margin-top: 5%;
		margin-left: 15%;
	}
	table  td{
		border: 1px solid #2676e3;
		text-align: center;
	}
	#returnBack{
		margin-right: 5%;
		border-radius: 4px;
		background-color: gray;
		color:white;
		padding: 5px 15px 5px 15px;
	}
</style>
</head>

		<!-- <script type="text/javascript">
			alert("请先登陆！");
			window.location.href = 'login.jsp';
		</script> -->

<body>

<%
	
%>
<jsp:include page="header.jsp"></jsp:include>

	<p id="bread"><a href="index.jsp" style="color: black;">首页</a>-><a href="searchResult.jsp" style="color: black;">车次列表</a>-><a href="book.jsp" style="color: black;">预订</a></p>
	<div class="container">
		<!-- 订单表单 -->
		
		
		<form action="CreateOrder" method="post" id="orderForm">
			<!-- 列车信息 -->
			<div>
				<p style="color: #2676e3;">车次信息</p>
				<p>车次：<input type="hidden" value="${tickets.train_number }" name="trainNum" id="trainNum">${tickets.train_number }</p>
				<!-- 根据车次号进行数据库查询 -->
				<!-- 结果例子如下 -->
				<p>出发站：<input type="hidden" disabled="disabled" value="北京" name="fromStation">${tickets.departure_station }</p>
				<p>目的站：<input type="hidden" disabled="disabled" value="上海" name="toStation">${tickets.destination_station }</p>
				<p>出发时间：<input type="hidden" disabled="disabled" value="17:50" name="startTime">${tickets.departure_time }</p>
				<p>到达时间：<input type="hidden" disabled="disabled" value="20:40" name="arriveTime">${tickets.destination_time }</p>
				
				<p>剩余车票：商务座（${tickets.business_ticket }）一等座（${tickets.lev1_ticket }）二等座（${tickets.lev2_ticket }）</p>
				
				
				<input type="hidden" disabled="disabled" value="${tickets.business_price }" id="business_price">
				<input type="hidden" disabled="disabled" value="${tickets.lev1_price }" id="lev1_price">
				<input type="hidden" disabled="disabled" value="${tickets.lev2_price }" id="lev2_price">
				
			</div>
			<div>
				<p style="color: #2676e3;">乘客信息</p>
				<p><img src="images/people.png">乘车人</p>
				
				<span>
				<!-- 数据库中查询该用户有关乘车人并循环输出 -->
				<!-- 输出例子 -->
					<c:forEach items="${list}" var="item">
						<input type="checkbox" value="${item.passenger_id }/${item.name }/${item.phoneNumber }" id="passenger" name="passenger">${item.name }
					</c:forEach>
				</span>
				<table id="passengerMsg" style="border-collapse:collapse;width: 50%;margin-top: 2%;">
					<tr style="background-color: #3b99fc;color: white;">
						<td>席别</td>
						<td>姓名</td>
						<td>证件号</td>
						<td>手机号码</td>
					</tr>
				</table>
			</div>
			<div id="btn">
				<input type="button" value="上一步" id="returnBack" onclick="back()">
				<input type="submit" name="orderBtn" value="提交订单" style="border-radius: 4px;background-color: #2676e3;color: white;padding: 5px 15px 5px 15px;">
			</div>
		</form>
	</div>
	
<%@ include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function back() {
		window.history.back(-1);
	}
	$("input[type='checkbox']").change(function () {
		var check = this;//当前选择的复选框
		var passengerId = check.value;//当前勾选的乘车人ID
		
		var business_price = document.getElementById('business_price').value;
		var lev1_price = document.getElementById('lev1_price').value;
		var lev2_price = document.getElementById('lev2_price').value;
		
		var list = passengerId.split("/");
		var passenger_id = list[0];
		var name = list[1];
		var phoneNumber = list[2];
		
		if(this.checked==true)
		{
			/* 数据库查询该乘车人信息 */
			/* 结果显示 */
			var str = $("#passengerMsg").html();
			str=str+"<tr><td><select name='seat'><option>"+"商务座（" + business_price + "）" +"</option><option>"+"一等座（" + lev1_price + "）"+"</option><option>"+"二等座（" + lev2_price + "）"+"</option></select></td>";
			str=str+"<td><input type='text' name='passenger_name' disabled='disabled' value='"+name+"'><input type='hidden' name='passenger_name' value='"+name+"'></td>";
			str=str+"<td><input type='text' name='passenger_id' disabled='disabled' value='"+passenger_id+"'><input type='hidden' name='passenger_id'  value='"+passenger_id+"'></td>";
			str=str+"<td><input type='text' name='phoneNumber' disabled='disabled' value='"+phoneNumber+"'><input type='hidden' name='phoneNumber' value='"+phoneNumber+"'></td></tr>";
			$("#passengerMsg").html(str);
		}
	});
</script>
</body>
</html>
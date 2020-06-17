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

<body>
<jsp:include page="header.jsp"></jsp:include>

	<p id="bread"><a href="orderCenter.jsp" style="color: black;">订单中心</a>-><a href="changeBook.jsp" style="color: black;">改签</a></p>
	<div class="container">
		<!-- 订单表单 -->
		<% 
			String  trainNum = request.getParameter("trainNum");/* 获取传输过来的车次号 */
			String orderNum = request.getParameter("orderNum");/* 获取该订单的订单号 */
		%>
		<form action="" method="post" id="orderForm">
			<!-- 列车信息 -->
			<div>
				<p style="color: #2676e3;">车次信息</p>
				<p>车次：<input type="hidden" disabled="disabled" value="<%= trainNum%>" name="trainNum"><%= trainNum%></p>
				<!-- 根据车次号进行数据库查询 -->
				<!-- 结果例子如下 -->
				<p>出发站：<input type="hidden" disabled="disabled" value="上海" name="fromStation">上海</p>
				<p>目的站：<input type="hidden" disabled="disabled" value="北京" name="toStation">北京</p>
				<p>出发时间：<input type="hidden" disabled="disabled" value="17:50" name="startTime">17:50</p>
				<p>到达时间：<input type="hidden" disabled="disabled" value="20:40" name="arriveTime">20:40</p>
				<p>剩余车票：商务座（150.00）一等座（120.00）二等座（100.00）</p>
			</div>
			<div>
				<p style="color: #2676e3;">乘客信息</p>
				<p><img src="image/people.png">乘车人</p>
				<span>
				<!-- 数据库中查询该用户有关乘车人并循环输出 -->
				<!-- 输出例子 -->
					<input type="checkbox" value="身份证号" id="passenger">乘客姓名
					<input type="checkbox" value="身份证号" id="passenger">乘客姓名
				</span>
				<table id="passengerMsg" style="border-collapse:collapse;width: 50%;margin-top: 2%;">
					<tr style="background-color: #3b99fc;color: white;">
						<td>席别</td>
						<td>姓名</td>
						<td>证件号</td>
						<td>手机号码</td>
					</tr>
					<!-- 循环输出该订单中已有的乘车人 -->
					<!-- 例子 -->
					<tr>
						<td><select name='seat'>
						<option>商务座（票价）</option><option>一等座（票价）</option><option>二等座（票价）</option>
						</select></td>
						<td><input type='text' disabled='disabled' value='乘客姓名'></td>
						<td><input type='text' name='passengerID' disabled='disabled' value='身份证号'></td>
						<td><input type='text' disabled='disabled' value='手机号码'></td>
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
		var passengerId = check.val;//当前勾选的乘车人ID
		if(this.checked==true)
		{
			/* 数据库查询该乘车人信息 */
			/* 结果显示 */
			var str = $("#passengerMsg").html();
			str=str+"<tr><td><select name='seat'><option>"+"商务座（票价）"+"</option><option>"+"一等座（票价）"+"</option><option>"+"二等座（票价）"+"</option></select></td>";
			str=str+"<td><input type='text' disabled='disabled' value='"+"乘客姓名"+"'></td>";
			str=str+"<td><input type='text' name='passengerID' disabled='disabled' value='"+"身份证号"+"'></td>";
			str=str+"<td><input type='text' disabled='disabled' value='"+"手机号码"+"'></td></tr>";
			$("#passengerMsg").html(str);
		}
	});
</script>
</body>
</html>
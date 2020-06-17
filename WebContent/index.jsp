<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>火车票预订系统</title>
<style type="text/css">
	.container{
		overflow: hidden;
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
	select {
		width: 80%;
		margin-left: 4%;
	}
</style>
</head>

<%-- <%
	/* 获取登陆成功后保存进session的用户信息，用于将右上角的登陆/注册替换掉，和进行购票等操作时将用户id一并提交 */
	User user = (User)session.getAttribute("user");
 	if(user != null)
		System.out.println(user.getUser_id()); 
%> --%>

<body>
<%@ include file="header.jsp" %>
<!-- 查询表单 -->
<div class="container">
	<form action="SearchTickets" method="post" id="searchForm">
		<div id="fromStation">
			<label>出发地</label>
		<select name="departure_station">
			<option>请选择出发地</option>
			<option>北京</option>
			<option>上海</option>
			<option>嘉兴</option>
			<!-- 搜索数据库所有的站点，循环添加 -->
		</select><!-- 出发站 -->
		</div>
	
		<div id="toStation">
		<label>到达地</label>
		 <select name="destination_station">
			<option>请选择到达地</option>
			<option>北京</option>
			<option>上海</option>
			<option>嘉兴</option>
			<!-- 搜索数据库所有的站点，循环添加 -->
		</select><!-- 到达站 -->
		</div>
		
		<div id="date">
		<label>出发日期</label>
		<input type="date" name="trainDate" id="trainDate" value=""><!-- 出发时间 -->
		</div>
		
		<input type="submit" value="查&nbsp&nbsp&nbsp&nbsp&nbsp询" id="searchBtn" name="searchBtn"><!-- 查询按钮 -->
	</form>
	<img alt="" src="images/indexImg.jpg" id="indexImg">
</div>
<%@ include file="footer.jsp" %>

<script type="text/javascript">
/* 日期控件默认当天 */
	var date = new Date();
	var nowYear = date.getFullYear();
	var month = ("0"+(date.getMonth()+1)).slice(-2);
	var day = ("0"+date.getDate()).slice(-2);
	var today = nowYear+"-"+month+"-"+day;
	document.getElementById("trainDate").value=today;
	
</script>
</body>
</html>
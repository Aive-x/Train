<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.User"%>
<style>
	.topTitle{
		float: right;
		margin-right: 3%;
		position: relative;
		top: -45px;
	}
	.nav{
		list-style-type: none;
		width:95%;
		overflow: hidden;
		background: #3b99fc;
		margin-top: -3%;
	}
	li{
		float: left;
		padding: 1%;
		border-right: 1px solid white;
	}
	li a {
		display: block;
		color: white;
		text-align: center;
		text-decoration: none;
	}
	li:hover {
		background: #2676e3;
	}
	li:last-child {
		border-bottom: none;
	}
	.active{
		background: #2676e3;
	}
</style>

<%
	/* 获取登陆成功后保存进session的用户信息，用于将右上角的登陆/注册替换掉，和进行购票等操作时将用户id一并提交 */
	User user = (User)session.getAttribute("user");
	String user_name = ""; 
	
 	if(user != null){
 		user_name = user.getName();
 	}
%>

<header>
	<p><h2 style="margin-left: 2%">火车票预订系统</h2>
	<span class="topTitle" style="display:block" id="B_login"><a href="login.jsp">登录</a>/<a href="register.jsp">注册</a></span>
	<input type="hidden" disabled="disabled" value="<%=user_name %>" id="user_name">
	<span class="topTitle" style="display:none" id="A_login">欢迎，<%=user_name %>&nbsp;&nbsp;<a href="login.jsp">切换账号</a></span></p>
</header>
<ul class="nav">
	<li class="active"><a id="a1" href="index.jsp">首页</a></li>
	<li><a id="a2" href="searchOrderInformation">订单中心</a></li>
	<li><a id="a3" href="PersonalInformation">个人信息</a></li>
</ul>
<!-- 导航栏变色 -->
<script type="text/javascript">
	var buttons = document.getElementsByTagName("li");
	var l = buttons.length;
	for(var i =0;i<l;i++)
	{
		buttons[i].onclick=function(){
			for(var j=0;j<l;j++){
				 if(this==buttons[j]){
					this.className="active";
				}else{
					buttons[j].className="";
			 }
		}	
	}
	}
	
	window.onload = function()
	{
		var user_name = document.getElementById("user_name").value;
		if(user_name != ""){
			document.getElementById("B_login").style.display = "none";
			document.getElementById("A_login").style.display = "block";
		}
	}
	
</script>
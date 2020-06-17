<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<style>
			.topTitle{
				float: right;
				margin-right: 3%;
				position: relative;
				top: -50px;
			}
			.loginMain{
				position:absolute;
				top:160px;
				left:20%;
				width:55%;	
			}
			#loginForm{
				border:solid 1px gray;
				border-radius:10px;
				padding-bottom:15%;
			}
			#loginImg{
				width:40%;
				float:left;
				padding-left:5%;
				padding-right:7%;
				padding-top:50px;
				padding-bottom:30px;
			}
			.loginRight{
				padding-top:3%;
				position:relative;
				left:2%;
				top:20px;
			}
			#textPhone{
				width:35%;
				height:25px;
				text-align:center;
				margin-bottom:5px;
			}
			#textPwd{
				width:39%;
				height:25px;
				text-align:center;
			}
			#textCheck{
				text-transform: lowercase;
				height:25px;
				width:25%;
				text-align:center;
			}
			#checkImg{
				width:12%;
				position:relative;
				top:10px;
			}
			#changeImg{
				font-size:14px;
			}
			#createBtn{
				width:19%;
				height:30px;
				color:white;
				background:#417ACF;
			}
			#loginBtn{
				width:19%;
				height:30px;
				position:relative;
				left:1%;
				color:white;
				background:#417ACF;
			}
		</style>
	</head>
	<body>
		<p><h2 style="margin-left: 2%">火车票预订系统</h2>
			<span class="topTitle"><a href="index.jsp" id="backHome">返回</a></span>
		</p>
		<div class="loginMain">
			<form name="loginForm" method="post" action="Login" id="loginForm" onsubmit="return checkForm()">
				<img src="images/login.jpg" id="loginImg">
				<!-- 登录信息输入框 -->
				<div class="loginRight">
					<p style="color:red" id="tipPhone"></p>
					<p>+86<input type="text" name="textPhone" placeholder="账号（手机号）" id="textPhone"></p>
					<p style="color:red" id="tipPwd"></p>
					<p><input type="password" name="textPwd" placeholder="密码" id="textPwd"/></p>
					<p style="color:red" id="tipCheck"></p>
					<p><input type="text" name="textCheck" placeholder="验证码" id="textCheck"/><!-- 输入转为小写 -->  
						<img src="images/check1.jpeg" id="checkImg"></p>
					<p><a href="#" id="changeImg">看不清，换一张</a></p>
					<input type="button" name="createBtn" id="createBtn" value="注册" onclick="createOnclick()"/>
					<input type="submit" name="loginBtn" id="loginBtn" value="登录"/>
				</div>
			</form>
			<%@include file="footer.jsp" %>
		</div>
	</body>
	<script type="text/javascript">
		var textPhone = document.getElementById("textPhone");
		var textPwd = document.getElementById("textPwd");
		var checkImg = document.getElementById("checkImg");
		
		var flagOfTextPhone = false; 
		var flagOfTextPwd = false; 
		var flagOfCheckImg = false; 
		
		//验证码图片值
		var checkNumber="ysbqm";
		//获取验证码输入框对象
		var textCheck = document.getElementById("textCheck");
		//账号校验
		function isCorrectPhone(s)
		{
			//正则匹配11位电话号码
			var re = /^1[3,4,5,7,8]\d{9}$/;
			if(!re.test(s))
				return false;
			return true;
		}
		//密码校验
		function isCorrectPwd(s)
		{
			//正则匹配8~16位，大小英文数值混合
			var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[^]{8,16}$/;
			if(!re.test(s))
				return false;
			return true;
		}
		//点击超链接随机切换验证码
		changeImg.onclick=function(event)
		{
			//取消超链接跳转
			event.preventDefault();
			//随机生成一个1~5之间的数，用来切换
			var number = Math.floor(Math.random()*5 + 1);//floor输出生成随机数的最大整数
			//修改图片路径
			switch(number)
			{
				case 1:
					checkImg.src="images/check1.jpeg";
					checkNumber="ysbqm";
					break;
				case 2:
					checkImg.src="images/check2.png";
					checkNumber="7364";
					break;
				case 3:
					checkImgsrc="images/check3.jpeg";
					checkNumber="5dbcp";
					break;
				case 4:
					checkImg.src="images/check4.png";
					checkNumber="okjzr";
					break;
				case 5:
					checkImg.src="images/check5.png";
					checkNumber="x5tb";
					break;
			}
			//清空文本框
			textCheck.value="";
		}
		//输入框失去焦点时
		textPhone.onblur=function()
		{
			if(!isCorrectPhone(textPhone.value))
			{
				document.getElementById("tipPhone").innerHTML="账号不符合规范，请输入11位手机号";
				flagOfTextPhone = false;
			}
			else{
				document.getElementById("tipPhone").innerHTML="";
				flagOfTextPhone = true;
			}
		}
		textPwd.onblur=function()
		{
			if(!isCorrectPwd(textPwd.value))
			{
				document.getElementById("tipPwd").innerHTML="密码不符合规范，请输入8~16大小英文数值混合";
				flagOfTextPwd = false;
			}
			else{
				document.getElementById("tipPwd").innerHTML="";
				flagOfTextPwd = true;
			}
		}
		textCheck.onblur=function()
		{
			//验证码框输入信息匹配
			if(textCheck.value!=checkNumber)
			{
				document.getElementById("tipCheck").innerHTML="验证码不正确！";
				flagOfCheckImg = false;
			}
			else{
				document.getElementById("tipCheck").innerHTML="";
				flagOfCheckImg = true;
			}
		}
		/* 跳转到注册页  */
		function createOnclick(){
			location.href = "register.jsp";
		}
		
		function checkForm()
		{
			if(!flagOfTextPhone){
				alert("账号密码错误！");
				return false;
			}
			else if(!flagOfTextPwd){
				alert("账号密码错误！");
				return false;
			}
			else if(!flagOfCheckImg){
				alert("验证码错误！");
				return false;
			}
			else
				return true;
		}	
		
	</script>
</html>

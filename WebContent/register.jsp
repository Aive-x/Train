<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<style>
			.topTitle{
				float: right;
				margin-right: 3%;
				position: relative;
				top: -50px;
			}
			.createMain{
				position:absolute;
				top:160px;
				left:18%;
				width:67%;	
			}
			#createForm{
				border:solid 1px gray;
				border-radius:10px;
				padding-bottom:10%;
			}
			#createImg{
				width:47%;
				float:left;
				padding-left:5%;
				padding-right:3%;
				padding-top:70px;
				/* padding-bottom:30px; */
			}
			.createRight{
				padding-top:3%;
				position:relative;
				left:1%;
				top:25px;
			}
			#createPhone{
				width:38%;
				height:30px;
				text-align:center;
				margin-bottom:1%;
			}
			#createName{
				width:38%;
				height:30px;
				text-align:center;
				margin-bottom:1%;
			}
			#createID{
				width:38%;
				height:30px;
				text-align:center;
				margin-bottom:1%;
			}
			#createPwd{
				width:38%;
				height:30px;
				text-align:center;
				margin-bottom:1%;
			}
			#createPwded{
				width:38%;
				height:30px;
				text-align:center;
				margin-bottom:1%;
			}
			#resetBtn{
				width:18%;
				height:35px;
				color:white;
				background:#417ACF;
			}
			#submitBtn{
				width:18%;
				height:35px;
				position:relative;
				left:1%;
				color:white;
				background:#417ACF;
			}
		</style>
	</head>
	<body>
		<p>
			<h2 style="margin-left: 2%">火车票预订系统</h2>
			<span class="topTitle"><a href="index.jsp" id="backHome">返回</a></span>
		</p>
		<div class="createMain">
			<form name="createForm" method="post" action="Register" id="createForm" onsubmit="return checkForm()">
				<img src="images/login.jpg" id="createImg">
				<!-- 登录信息输入框 -->
				<div class="createRight">
					<p style="color:red" id="tipPhone"></p>
					<p><input type="text" name="createPhone" placeholder="账号（手机号+86）" id="createPhone"></p>
					<p style="color:red" id="tipName"></p>
					<p><input type="text" name="createName" placeholder="真实姓名" id="createName"/></p>
					<p style="color:red" id="tipID"></p>
					<p><input type="text" name="createID" placeholder="身份证号" id="createID"/></p>
					<p style="color:red" id="tipPwd"></p>
					<p><input type="password" name="createPwd" placeholder="密码" id="createPwd"/></p>
					<p style="color:red" id="tipPwded"></p>
					<p><input type="password" name="createPwded" placeholder="确认密码" id="createPwded"/></p>
					<p><input type="reset" name="resetBtn" id="resetBtn" value="重置"/>
					 	<input type="submit" name="submitBtn" id="submitBtn" value="确定" />
					</p>
				</div>
			</form>
			<%@include file="footer.jsp" %>
		</div>
	</body>
	<script src="//apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript">
		var createPhone = document.getElementById("createPhone");
		var createName = document.getElementById("createName");
		var createID = document.getElementById("createID");
		var createPwd = document.getElementById("createPwd");
		var createPwded = document.getElementById("createPwded");
		
		var flagCreatePhone = false;
		var flagCreateName = false;
		var flagCreateID = false;
		var flagCreatePwd = false;
		var flagCreatePwded = false;
		var phone_false = 0;
		//号码校验
		function isCorrectPhone(s)
		{
			phone_false = 0;
			//正则匹配11位电话号码
			var re = /^1[3,4,5,7,8]\d{9}$/;
			//if(isPhoneExist(s)){
				//console.log("号码已被注册");
				//phone_false = 1;
			//}
			if(!re.test(s)){
				phone_false = 1;
				return false;
			}else if(isPhoneExist(s)){
				console.log("号码已被注册");
				phone_false = 2;
				return false;
			}
			return true;
		}
		//号码是否已注册
		function isPhoneExist(phone)
		{
			url = "./IsPhoneExist";
			var flag = -1;
			$.ajaxSettings.async = false;
			$.post(url, {phone:phone}, function(result, stastus, xhr){
				if(result == "1"){
					flag = 1; //已注册
				}else{
					flag = 0; //未注册
				}
			});
			return flag;
		}
		//姓名校验
		function isCorrectName(s)
		{
			//正则匹配名字    中文2~20位，英文1~20位（含.）
			var re = /^([\u4e00-\u9fa5]{2,20}|[a-zA-Z\\.\\s]{1,20})$/;
			if(!re.test(s))
				return false;
			return true;
		}
		//身份证校验
		function isCorrectID(s)
		{
			//正则匹配身份证
			var re = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
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
		//输入框失去焦点时
		createPhone.onblur=function()
		{
			if(!isCorrectPhone(createPhone.value))
			{
				if(phone_false == 1)
				{
				    document.getElementById("tipPhone").innerHTML="账号不符合规范，请输入11位手机号";
				}else if(phone_false == 2){
					document.getElementById("tipPhone").innerHTML="该手机号已被注册！";
				}
				flagCreatePhone = false;
			}
			else{
				flagCreatePhone = true;
				document.getElementById("tipPhone").innerHTML="";
			}
		}
		createName.onblur=function()
		{
			if(!isCorrectName(createName.value))
			{
				document.getElementById("tipName").innerHTML="姓名不符合规范，请输入全中文、全英文(.)";
				flagCreateName = false;
			}
			else{
				flagCreateName = true;
				document.getElementById("tipName").innerHTML="";
			}
		}
		createID.onblur=function()
		{
			if(!isCorrectID(createID.value))
			{
				document.getElementById("tipID").innerHTML="身份证号不规范，请输入18位身份证号";
				flagCreateID = false;
			}
			else{
				flagCreateID = true;
				document.getElementById("tipID").innerHTML="";
			}
		}
		createPwd.onblur=function()
		{
			if(!isCorrectPwd(createPwd.value))
			{
				document.getElementById("tipPwd").innerHTML="密码不符合规范，请输入8~16大小英文数值混合";
				flagCreatePwd = false;
			}
			else{
				flagCreatePwd = true;
				document.getElementById("tipPwd").innerHTML="";
			}
		}
		createPwded.onblur=function()
		{
			if(createPwd.value != createPwded.value)
			{
				document.getElementById("tipPwded").innerHTML="密码不一致";
				flagCreatePwded = false;
			}
			else{
				flagCreatePwded = true;
				document.getElementById("tipPwded").innerHTML="";
			}
		}

		function checkForm()
		{
			if(!flagCreatePhone){
				alert("请正确填写信息！");
				return false;
			}
			else if(!flagCreateName){
				alert("请正确填写信息！");
				return false;
			}
			else if(!flagCreateID){
				alert("请正确填写信息！");
				return false;
			}
			else if(!createPwd){
				alert("请正确填写信息！");
				return false;
			}
			else if(!createPwded){
				alert("请正确填写信息！");
				return false;
			}
			else
				return true;
		}	
		
	</script>
</html>
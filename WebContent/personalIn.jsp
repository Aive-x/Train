<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Class.User"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<style>
			.bread{
				font-size:12px;
				position:relative;
				left:5%;
			}
			.information{
				border:1px solid gray;
				margin-left:5%;
				margin-right:5%;
				padding-left:4%;
				padding-right:4%;
			}
			.baseIn{
				border-bottom:1px dashed lightgray;
				text-align:center;
			}
			.contactIn{
				border-bottom:1px dashed lightgray;
				text-align:center;
			}
			.tip{
				color:red;
			}
			#editBtn{
				float:right;
				position:relative;
				left:-10px;
				width:80px;
			}
			#editIn{
				display:none;
				position:relative;
				top:-500px;
				border:1px solid gray;
				border-radius:20px;
				text-align:center;
				margin-left:26%;
				margin-right:26%;
				padding-top:40px;
				padding-bottom:40px;
				background:#F0F8FD;
			}
			#newPhone{
				width:220px;
				height:20px;
			}
			#newEmail{
				width:220px;
				height:20px;
			}
			#newAddress{
				width:220px;
				height:20px;
			}
			#cancelBtn{
				width:100px;
				height:30px;	
				background:#2AA5F8;
				color:white;
			}
			#editSubmit{
				width:100px;
				height:30px;
				position:relative;
				left:40px;
				background:#2AA5F8;
				color:white;
			}
			.passengerTable{
				text-align:center;
				width:90%;
			}
			#addBtn{
				margin:10px;
				width:100px;
				height:30px;
				background:#2AA5F8;
				color:white;
			}
			#addPassenger{
				margin-left:10px;
				display:none;
			}
			#editPass{
				display:none;
				border:1px solid gray;
				border-radius:20px;
				text-align:center;
				width:400px;
				position:relative;
				left:25%;
				background:#F0F8FD;
				padding-top:20px;
				padding-bottom:20px;
				position:relative;
				top:-300px;
			}
			#editpassName{
				width:250px;
			}
			#editpassID{
				width:200px;
			}
			#editpassPhone{
				width:220px;
			}
			#cancelEditBtn{
				width:80px;
			}
			#addSub{
				width:80px;
			}
			#newpassName{
				width:250px;
			}
			#newpassID{
				width:200px;
			}
			#newpassPhone{
				width:220px;
			}
			#addSub{
				margin-left:40px;
			}
		</style>
	</head>
	
	<%
		User userInformation = (User)request.getAttribute("user");
		String phoneNumber = userInformation.getPhoneNumber();
		String name = userInformation.getName();
		String user_id = userInformation.getUser_id();
	%>
	
	<body>
		<%@include file="header.jsp" %>
		<p class="bread">当前位置：个人信息>查看个人信息</p>
		<div class="information">
			<h4>基本信息</h4>
			<div class="baseIn">
				<p><span class="tip">*</span>账号：<%=phoneNumber%></p>
				<p><span class="tip">*</span>姓名：<%=user_name %></p>
				<p><span class="tip">*</span>身份证号码：<%=user_id %></p>
				<p><span class="tip">*</span>核验状态：已通过<%/*已通过/未通过 */%></p>
			</div>
			<h4>联系方式<input type="button" value="编辑" id="editBtn" onclick="openDialog()"/></h4>
			<div class="contactIn">
				<p><span class="tip">*</span>手机号：<%=phoneNumber %><%/*已通过核验/未通过核验 */%></p>
				<p>固定电话：<% %></p>
				<p>邮箱：<% %></p>
				<p>地址：<% %></p>
			</div>
			<h4>乘车人信息</h4>		
			<div class="passengerIn">
				<%-- <p><span>姓名：<% %></span><span>身份证号码：<% %></span><span>电话号码：<% %></span></p> --%>
				<table class="passengerTable">
					<!-- 连接数据库,输出全部乘车人-->
					<c:forEach items="${list}" var="item">
						<tr>
							<td>姓名：${item.name }</td>
							<td>身份证号码：${item.passenger_id }</td>
							<td>电话号码：${item.phoneNumber }</td>
							<td><input type="button" value="编辑" id="${item.name }/${item.passenger_id }/${item.phoneNumber }" onclick="editPassOnclick(this)"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			
			<input type="button" value="新增乘车人" id="addBtn" onclick="addOnclick()"/>	
			<div id="addPassenger">
				<form name="addPassengerForm" method="post" action="AddPassenger" id="addPassengerForm">
					<p><span class="tip">*</span>姓名：<input type="text" id="newpassName" name="newpassName"/> </p>
					<p><span class="tip">*</span>身份证号码： <input type="text" id="newpassID" name="newpassID"/> </p>
					<p><span class="tip">*</span>电话号码：<input type="text" id="newpassPhone" name="newpassPhone"/>
						<input type="submit" value="确定" id="addSub" name="addSub"/></p>
				</form>
			</div>
			
		</div>
		<%@include file="footer.jsp" %>
		<!-- 乘车人修改弹框 -->
		<div id="editPass">
			<form name="editPassForm" method="post" action="EditPassenger" id="editPassForm">
				<p><span class="tip">*</span>姓名：<input type="text" id="editpassName" name="editpassName" value=""/> </p>
				<p><span class="tip">*</span>身份证号码： <input type="text" id="editpassID" name="editpassID" value=""/> <input type="hidden" id="passengerID" name="passengerID" value=""/> </p>
				<p><span class="tip">*</span>电话号码：<input type="text" id="editpassPhone" name="editpassPhone" value=""/></p>
				<p><input type="button" value="取消" id="cancelEditBtn" onclick="cancelOnclick()"/>
					<input type="submit" value="确定" id="addSub" name="addSub"/></p>
			</form>
		</div>
		<!--  编辑信息弹框     -->
		<div id="editIn">
			<form name="editInForm" method="post" action="editInServlet" id="editInForm">
				<p>固定电话：<input type="text" id="newPhone" name="newPhone"/></p>
				<p>邮箱：<input type="text" id="newEmail" name="newEmail"/></p>
				<p>地址：<input type="text" id="newAddress" name="newAddress"/></p>
				<p>
					<input type="button" id="cancelBtn" value="取消" onclick="closeDialog()"/>
					<input type="submit" id="editSubmit" value="确定"/>
				</p>
			</form>
		</div>
		
	</body>
	<script>
		function openDialog(){
			document.getElementById("editIn").style.display ='block';
		}
		function closeDialog(){
			document.getElementById("editIn").style.display = 'none';
		}
		function editPassOnclick(element){
			document.getElementById("editPass").style.display = 'block';
			
			var buttonID = element.id;
			var list = buttonID.split("/");
			var name = list[0];
			var passenger_id = list[1];
			var phoneNumber = list[2];
			document.getElementById("editpassName").value = name;
			document.getElementById("editpassID").value = passenger_id;
			document.getElementById("passengerID").value = passenger_id;
			document.getElementById("editpassPhone").value = phoneNumber;
		}
		function cancelOnclick(){
			document.getElementById("editPass").style.display = 'none';
		}
		function addOnclick(){
			document.getElementById("addPassenger").style.display ='block';
		}
		
		var newpassName = document.getElementById("newpassName");
		var newpassID = document.getElementById("newpassID");
		var newpassPhone = document.getElementById("newpassPhone");
		//号码校验
		function isCorrectPhone(s)
		{
			//正则匹配11位电话号码
			var re = /^1[3,4,5,7,8]\d{9}$/;
			if(!re.test(s))
				return false;
			return true;
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
		//输入框失去焦点时
		newpassPhone.onblur=function()
		{
			if(!isCorrectPhone(newpassPhone.value))
			{
				alert("账号不符合规范，请输入11位手机号");
			}
		}
		newpassName.onblur=function()
		{
			if(!isCorrectName(newpassName.value))
			{
				alert("姓名不符合规范，请输入全中文、全英文(.)");
			}
		}
		newpassID.onblur=function()
		{
			if(!isCorrectID(newpassID.value))
			{
				alert("身份证号不规范，请输入18位身份证号");
			}
		}
	</script>
</html>		
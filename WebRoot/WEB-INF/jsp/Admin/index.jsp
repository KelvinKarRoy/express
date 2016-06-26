<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../Common/include/meta.jsp" %>
	<title>武汉地铁风险预警系统</title>
	<%@ include file="../Common/include/css.jsp" %>	
	<style type="text/css">
	.form-inline{
	margin-bottom:20px;}
	.content-wrapper{
	margin:0 100px}
	</style>
</head>
<body>
<%@ include file="./include/navbar.jsp" %>
<%-- <img src="${sessionScope.login_session_user.headImage}">
<form id="form1" method="post" action="<%=request.getContextPath()%>/users/headImage" enctype="multipart/form-data">
	<input name="filedata" type="file" size="20" >
	<input type="submit" name="submit" value="提交" >
</form>
<br> --%>
<%-- 绑定手机：<a href="https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id=101321036&redirect_uri=whrt.whut.edu.cn&scope=get_user_info"> --%>
                 

<%@ include file="../Common/include/script.jsp" %>
<div class="content-wrapper">
	<section class="content">
		<div class="box-header">
			<div class="box-title">主页</div>
			<p>
				<span><a href="#">首页</a>></span>
				<span><a href="#">主页</a>
			</p>
		</div>
		<div class="box">
			<div class="box-body">
				主页
			</div>
		</div>
	</section>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
     Object loginSessionUsers=session.getAttribute("login_session_user");
     if(loginSessionUsers!=null)
     {
         response.sendRedirect(request.getContextPath()+"/index");
     }
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<title>武汉地铁工程安全风险预警系统</title>
		<meta property="qc:admins" content="16322617734670546545636" />
		<link rel="icon" href="#">
		<!-- 项目必要的外部依赖 -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/ionicons/css/ionicons.min.css">
        <!-- 项目公用样式文件 -->
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/AdminLTE.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/common.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/skins/skin-blue.min.css">
		<!-- 修复IE下的问题 -->
		<!--[if lt IE 9]>
		<script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
		<script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/plugins/iCheck/minimal/blue.css">
        <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico" type="image/x-icon">
		<style type="text/css">
			body {
			    text-align: center; 
				background: url(<%=request.getContextPath() %>/assets/images/login/background.png);
				-webkit-background-size: 100%;
				-moz-background-size: 100%;
				-o-background-size: 100%;
				background-size: 100%;
				background-size: cover;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				overflow:hidden;
			}
            
            .wrapper {
			    position: absolute;
			    left: 50%;
			    top: 50%;
			    transform: translate(-50%,-50%);
			    min-height: auto;
            }
            .wrapper > .top > .top-logo {
                width: 320px;
            }
            .wrapper > .form {
                width: 240px;
                margin: 0 auto;
                padding: 30px 0;
            }
            .wrapper > .form > .form-group {
                position: relative;
            }
            .wrapper > .form > .form-group > input {
                margin: 20px 0;
                opacity: 0.4;
                padding-left: 11px;
            }
            .input-group .msg{
                opacity: 0.4;
            }

           .form-control{
                border-radius: 4px;
            }
           
            
            .wrapper > .form > .form-group > .input-icon {
                position: absolute;
                left: 10px;
                top: 10px;
            } 

            .wrapper > .form > .checkbox {
                text-align: right;
            }

            .wrapper > .form > .btn-primary {
                margin-top: 10px;
                width: 100%;
                height: 35px;
                line-height: 14px;
                font-size: 14px;
                color: #fff;
                border-radius: 2px;
            }

            span img {
                width:15px;
                height:15px;
                margin-right:10px
            }

            .send{
                width:96px;
                opacity: 0.7;
                border-radius: 4px;
            }
            
            .footer{
                width: 100%;
			    position: absolute;
			    bottom: 20px;
			    left: 0;
            }

            .footer p{
                opacity: 0.7;
            }

            .btn-primary{
                background-color:#3C8DBC;
                color:#fff;
            }
            a:hover{
            	opacity:0.5;
            }

            .wn_error{
                float: left;
                font-size: 12px;
                color:#DD4B39;
            }
		</style>
	</head>

	<body>
		<div class="container">
            <div class="wrapper">
                <div class="top">
                    <img class="top-logo" src="../assets/images/login/top.png">
                </div>

                <div class="form">
                    <div class="form-group">
                        <input class="form-control phone" type="text" id="phone" placeholder="手机号" maxlength="11">
                        <div class="input-group">
                            <input type="text" class="form-control msg" id="msg" placeholder="短信验证码">
                            <span class="input-group-btn">
                                <button class="btn btn-default send" id="send" type="button">发送验证码</button>
                            </span>
                        </div>   
                    </div>                             
                    <button class="btn btn-primary" id="login">登录</button>
                </div>

                <div>
                    <span>
                        <img src="<%=request.getContextPath() %>/assets/images/u8.png">
                    	<a href="<%=request.getContextPath() %><%=request.getContextPath() %>/qq/loginByQQ" style="font-size:14px" target="_blank">使用已绑定的QQ登录</a>
                    </span>
                </div>
            </div>
            <div class="footer">
                <p>
                    <span style="color:#333333;">版权所有： </span>
                    <a href="http://www.whut.edu.cn/" target="_blank"><span style="color:#40748C;">武汉理工大学</span></a>
                    <span style="color:#333333;">&nbsp;&nbsp; |&nbsp;&nbsp; 技术支持：</span>
                    <a href="http://www.1-xing.com/" target="_blank"><span style="color:#40748C;">益行人科技</span></a>
                </p>
            </div>
        </div>
		<!-- 项目必要的外部依赖 -->
		<script src="<%=request.getContextPath() %>/assets/jQuery/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/jQuery/jquery-ui.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/bootstrap/js/bootstrap.min.js"></script>
		<!-- 项目公共脚本 -->
		<script src="<%=request.getContextPath() %>/assets/plugins/bootbox/bootbox.min.js"></script>        
        <script src="<%=request.getContextPath() %>/assets/plugins/jquery-validate/jquery.validate.min.js"></script>
        <script src="<%=request.getContextPath() %>/assets/plugins/bootstrap-validation/bootstrap3-validation.js"></script>        
		<script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/js/demo.js"></script>
        <!-- 登录界面脚本 -->
        <script>

            $(function () {
            	if($(window).height() < 500){
                    $(".footer").hide();
                }else{
                    $(".footer").show();
                }
                $(window).resize(function(e){
                    if($(this).height() < 500){
                        $(".footer").hide();
                    }else{
                        $(".footer").show();
                    }
                });
                
                
                if(window != window.top) window.top.location.href = location.href;
                if(navigator.userAgent.match(/msie/i)) 
                {
                    alert('请使用Chrome浏览器或切换到高速模式', function() {
                        location.replace("http://www.google.cn/chrome/browser/");
                    });
                    
                }
            	var wait = 60, phone, code;
                function time(o) {  
                    if (wait == 0) {  
                        o.removeAttr("disabled");            
                        o.html("发送验证码");  
                        wait = 60;  
                    } else {
                        o.attr("disabled",true);  
                        o.html( wait +"s");
                        wait--;  
                        setTimeout(function() {  
                            time(o)  
                        },  
                        1000)  
                    }  
                }  

                function checkmobliemsg(str,type){
                    if(str==""){
                        return false;
                    }
                    else{
                        if(type === "phone"){
                            var re = /^1\d{10}$/
                        }else if(type === "code"){
                            var re = /^\d{6}$/
                        }
                        
                        if (re.test(str)) {
                            return true
                        } else {
                            return false;
                        }
                    }
                }

                function ajax(type){
                    if(type === "sendAjax"){
                        $.ajax({
                            method:'POST',
                            url:'<%=request.getContextPath()%>/sms/login',
                            data:{phone:phone},
                        }).done(function(data){
                            if(data.code === "200"){
                                time($("#send"));
                                appenderror("验证码发送成功！","#login")
                            }
                            else {alert(data.message,null,1500)}
                        }).fail(function(){
                            alert("网络连接超时！");
                        })
                        
                    }else if(type === "loginAjax"){
                        $.ajax({
                            method:'POST',
                            url:"<%=request.getContextPath()%>/user/login",
                            data:{
                                phone:phone,
                                code:code
                            }
                        }).done(function(data){
                            if(data.code != "200") 
                            {
                               alert(data.message,null,1500)
                            }
                            else if(data.code =="200") {
                                $("#login").attr("disabled",true).html("登陆中...");
                                window.location = "<%=request.getContextPath()%>/index"
                            }
                        }).fail(function(){
                            alert("网络连接超时！");
                        })
                    }
                }

                $("#send").on("click",function(){
                    phone = $("#phone").eq(0).val();
                    if(checkmobliemsg(phone,"phone")){
                        ajax("sendAjax");
                        if($('.wn_error').size() > 0) $('.wn_error').detach();
                    }else{
                        appenderror("请输入正确的手机格式！","#login");
                    }
                });

                $("#login").on("click",function(){
                    phone = $("#phone").eq(0).val();
                    code = $("#msg").eq(0).val();
                    if(checkmobliemsg(phone,"phone")){
                        if(checkmobliemsg(code,"code")){
                        	if($('.wn_error').size() > 0) $('.wn_error').detach();
                            ajax("loginAjax")
                        }else{
                            appenderror("请输入正确的验证码！","#login")
                        }
                    }else{
                        appenderror("请输入正确的手机格式！","#login")
                    }
                });

                $(document).keyup(function(e){
                    if(e.which==13){
                        console.log("sasd");
                        phone = $("#phone").eq(0).val();
                        code = $("#msg").eq(0).val();
                        if(checkmobliemsg(phone,"phone")){
                            if(checkmobliemsg(code,"code")){
                                if($('.wn_error').size() > 0) $('.wn_error').detach();
                                ajax("loginAjax")
                            }else{
                                appenderror("请输入正确的验证码！","#login")
                            }
                        }else{
                            appenderror("请输入正确的手机格式！","#login")
                        }
                    }
                })

                //错误提示
                function appenderror(errorstr,obj){
                    if($('.wn_error').size() > 0) $('.wn_error').detach(); 
                    $('<div class="wn_error">'+errorstr+'</div>').insertBefore(obj)
                }
    		});
        </script>
	</body>
</html>
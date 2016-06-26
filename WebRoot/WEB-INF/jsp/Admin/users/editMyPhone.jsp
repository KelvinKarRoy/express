<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>密码修改</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="../include/commonCSS.jsp"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
  <style type="text/css">
    label{
        padding-right: 0px;
    }
    .form-horizontal .form-group{
        position: relative;
        left:-15px;
        width:430px;
        margin-left: auto;
        margin-right: auto;
    }
    .form-group .autoreqmark{
        position: absolute;
        top:9px;
        right: 0px;
    }
    .pull-right{
    	margin-right:32.8%;
    }
  </style>
</head>
  
  <body>
     <!-- 测试 start-->
            <!-- 信息填写框 -->
            <div class="content-wrapper">
            <section class="content">
                <div class="box">
                    <div class="box-header">
                        <div class="box-title">修改密码</div>
                    </div>
                    <div class="box-body">
                        <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/user/resetMyPassword" method="post"> 
                            <!-- <div class="row">
                                <div class="col-md-6"> -->
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="oldPassword">原密码</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" name="oldPassword" required maxlength="15" placeholder="请输入原密码">
                                </div>
                                <span class="autoreqmark" style="color:#FF9966"> *</span>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="newPassword">新密码</label>
                                <div class="col-sm-9">
                                    <input type="password" id="newPassword" class="form-control" name="newPassword" required maxlength="15" placeholder="请输入新密码">
                                </div>
                                <span class="autoreqmark" style="color:#FF9966"> *</span>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">密码确认</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" name="confirmPassword" required maxlength="15" placeholder="请重新输入新密码">
                                </div>
                                <span class="autoreqmark" style="color:#FF9966"> *</span>
                            </div>
                            <div class="pull-right">
                                <input id="find btn" value="提交" type="submit" class="btn btn-primary"/>
                            </div>
                                <!-- </div>
                                
                            </div> -->
                            <div class="show"></div>
                    
                        </form>
                </div>
            </section>
		           
	        </div>
            </div>
            <!-- 测试end -->
            <%@ include file="../include/commonScript.jsp"%>
            <script src="<%=request.getContextPath() %>/assets/plugins/jquery-validate/jquery.validate.min.js"></script>
            <script>
            $(function() {
                $("form").validate({
                    rules:{
                        oldPassword:{
                            required:true,
                            maxlength:15
                        },
                        newPassword:{
                            required:true,
                            maxlength:15
                        },
                        confirmPassword:{
                            required:true,
                            equalTo:"#newPassword",
                            maxlength:15
                        }
                    },
                    messages:{
                        oldPassword:{
                            required:"必须输入的字段",
                            maxlength:"最大长度为15"
                        },
                        newPassword:{
                            required:"必须输入的字段",
                            maxlength:"最大长度为15"
                        },
                        confirmPassword:{
                            required:"必须输入的字段",
                            equalTo: "两次输入的密码不一致",
                            maxlength:"最大长度为15"
                        }
                    }

                });

            	$("form").submit(function(e) {
            		e.preventDefault();
            		var password_new = $("input[name=password_new]").val();
                	var password_new_compare = $("input[name=password_new_compare]").val();
                	if(password_new != password_new_compare) alert("两次输入的密码不一致",null,2000);
                	else {
                		$.post($(this).attr("action"), $(this).serialize(), function(data) {
                			alert(data.message, function() {
                				if(data.code == "200") window.top.location.assign("<%=request.getContextPath()%>/logout");
                			});
                		});
                	}
            	});

                /*$("form").validate({
                    rules:{
                        oldPassword:{
                            required:true,
                            maxlength:15
                        },
                        newPassword:{
                            required:true,
                            maxlength:15
                        },
                        confirmPassword:{
                            required:true,
                            equalTo:"#newPassword",
                            maxlength:15
                        }
                    },
                    messages:{
                        oldPassword:{
                            required:"必须输入的字段",
                            maxlength:"最大长度为15"
                        },
                        newPassword:{
                            required:"必须输入的字段",
                            maxlength:"最大长度为15"
                        },
                        confirmPassword:{
                            required:"必须输入的字段",
                            equalTo: "两次输入的密码不一致",
                            maxlength:"最大长度为15"
                        }
                    },
                    submitHandler:function(form){  
                        form.submit(function(e) {
                        e.preventDefault();
                        var password_new = $("input[name=password_new]").val();
                        var password_new_compare = $("input[name=password_new_compare]").val();
                        if(password_new != password_new_compare) alert("两次输入的密码不一致",null,2000);
                        else {
                            $.post($(this).attr("action"), $(this).serialize(), function(data) {
                                alert(data.message, function() {
                                    if(data.code == "200") window.top.location.assign("<%=request.getContextPath()%>/logout");
                                });
                            });
                        }
                    });
                    }    
                });*/
            });
            </script>
  </body>
 
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户列表</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="../include/commonCSS.jsp"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>

  <![endif]-->
  <!-- 补充bs样式 -->
  <style>
     .col-xs-6 {
	    margin-left: 9%;
	    width: 35%;
	 }
	 .pull-right{
	 	margin-right: 14.2%;
	 }
  </style>
</head>
  
  <body>
     <!-- 测试 start-->
            <!-- 信息填写框 -->
            <form class="infoForm">
            <div class="box">
                        <div class="box-header">
                            <div class="box-title"></div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-5  col-sm-5 col-md-offset-1">
                                    <div class="form-group">
                                        <label>用户名</label>
                                        <span id="autoreqmark" style="color:#FF9966"> *</span>
                                        <input type="text" class="form-control" id="username" value="${login_session_user.username}" readonly>
                                    </div>
                                 </div>
                                 <div class="col-md-5 col-sm-5">
                                     <div class="form-group">
                                        <label>中文名称</label>
                                        <span id="autoreqmark" style="color:#FF9966"> *</span>
                                        <input type="text" class="form-control" id="cnname" value="${login_session_user.cnname}" readonly>
                                    </div>
                                 </div>
                               
                           </div>
                           <div class="row">
                               <div class="col-md-5 col-sm-5 col-md-offset-1">
                                   <div class="form-group">
                                       <label>身份证</label>
                                       <input type="text" class="form-control" value="${login_session_user.idCard}"  id="idCard" name="idCard" maxlength="18" minlength="18">
                                   </div>
                               </div>
                               <div class="col-md-5 col-sm-5 ">
                                   <div class="form-group">
                                       <label>手机号码</label>
                                       <span id="autoreqmark" style="color:#FF9966"> *</span>
                                       <input type="text" class="form-control" name="phone" value="${login_session_user.phone}" required id="phone" required length="11" maxlength="11"/>
                                   </div>
                               </div>
                           </div>
                           <div class="row">
                                 <c:if test="${login_session_user.password=='e10adc3949ba59abbe56e057f20f883e'}">
		                               <div class="col-md-5  col-sm-5 col-md-offset-1">
		                              	   <div class="form-group">
			                                        <label>新密码</label>
													<span id="autoreqmark" style="color:#FF9966"> *</span>
			                                        <input type="password" class="form-control" id="newPassword" value="" name="newPassword" required>
			                                    </div>
		                                   
		                               </div>
		                               <div class="col-md-5 col-sm-5">
		                                   <div class="form-group">
			                                    <label>确认密码</label>
			                                    <span id="autoreqmark" style="color:#FF9966"> *</span>
			                                    <input type="password" class="form-control" name="confirmPassword" id="checkPassword" value="" required>
			                                </div>
		                      		   </div>
                                 </c:if>   
                           </div>
                           <div class="row">
                               <div class="col-md-5 col-sm-5 col-md-offset-1">
                                    <div class="form-group">
                                         <label>qq</label>
                                         <input type="text" class="form-control" id="qq" name="qq" value="${login_session_user.qq}" >
                                  	</div>
                               </div>
                               <div class="col-md-5 col-sm-5">
                                    <div class="form-group">
	                                     <label>email　</label>
	                                     <input type="text" class="form-control" id="email" value="${login_session_user.email}" name="email">
	                                </div>
	                           </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-md-5 col-sm-5 col-md-offset-1">
                                    <div class="form-group">
                                        <label>单位</label>
                                        <input type="text" class="form-control" id="unitId"  value="${login_session_user.unitId}" >
                                    </div>
                                </div>
	                            <div class="col-md-5 col-sm-5">
                                    <div class="form-group">
                                        <label>职位</label>
                                        <input type="text" class="form-control" id="positionID"  value="${login_session_user.positionID}"  >
                                    </div>
                                </div>
                      		</div>
                               
                            </div>
                        </div>
           
	                <div class="text-danger show" style="display:none!important"></div>
		            <div class="pull-right">
		            	<a id="logout_sub" class="btn btn-primary" href="<%=request.getContextPath()%>/logout">返回</a>
                        <button type="submit" class="btn btn-primary" id="submitInfo">保存</button>
                    </div>
	        </div>
            </form>
            <!-- 测试end -->
            <%@ include file="../include/commonScript.jsp"%>
            <script>
            $("#logout_sub").on("click",function(e){
				location.replace($(that).attr("href"));
			});

			
            jQuery.validator.addMethod("isIdCardNo", function (value, element) {
				return this.optional(element) || isIdCardNo(value);
			}, "请正确输入您的身份证号码");

			$("form").validate({
            		rules:{
            			phone:{
            				required: true,
        					minlength: 11,
        					maxlength: 11,
        					digits:true
            			},
            			idCard:{
            				minlength:18,
            				maxlength:18,
            				isIdCardNo:true
            			},
            			qq:{
            				digits:true,
            				rangelength:[5,11]
            			},
            			email:{
            				email:true
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
            			phone:{
            				required: "必须输入的字段",
        					minlength: "只能输入11位数字",
        					maxlength: "只能输入11位数字",
        					digits:"只能输入数字"
            			},
            			idCard:{
            				minlength:"只能输入18位字符",
							maxlength: "只能输入18位字符",
            				isIdCardNo:"请输入正确的身份证号"
            			},
            			qq:{
            				digits:"只能输入数字",
            				rangelength:"只能输入5-11位数字"
            			},
            			email:{
            				email:"必须输入正确格式的电子邮件"
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
		    $(function() {
               
			    //用户填完信息表事件
			    $("form").submit(function(e){
			     e.preventDefault();
			     
			     var newPassword  =$("#newPassword").val();
			     var checkPassword=$("#checkPassword").val();
			     var phone=$("#phone").val();
			     var idCard=$("#idCard").val();
			     var qq=$("#qq").val();
			     var unitId=$("#unitId").val();
			     var email=$("#email").val();
			     var positionID=$("#positionID").val();
			     
			     var data={
			        password:checkPassword,
			        phone:phone,
			        idCard:idCard,
			        qq:qq,
			        unitId:unitId,
			        email:email,
			        positionID:positionID
			     }
				     
		         if(phone==""){
		         	$(".show").html("手机号码不能为空").show();
		         }else{
		         	 if("${login_session_user.password}"=="e10adc3949ba59abbe56e057f20f883e"&&(newPassword==""||checkPassword=="")){
		         	 		 $(".show").html("新密码或确认密码不能为空").show();
				     }else	if("${login_session_user.password}"=="e10adc3949ba59abbe56e057f20f883e"&& newPassword !=checkPassword){
				        	 $(".show").html("两次的密码输入不一致").show();
				     }else if("${login_session_user.password}"=="e10adc3949ba59abbe56e057f20f883e"&& newPassword =="123456"){
				     		  $(".show").html("新密码不能为初始密码").show();
	                 }else{
					      data=JSON.stringify(data);
					     
					      $.ajax({
							type: "post",
							url: "<%=request.getContextPath()%>/modifyInfo",
							data: data,
							dataType: "json",
							cache:false,
							contentType:"application/json",
							success: function(data) {
							     $(".show").html(data.message).show();
							     if(data.code=="200"){
								     window.parent.bootbox.hideAll();
								     window.parent.alert(data.message,null,2000);
							     }
							   }
					       	});
				     }
			     }
			 	});
	        });
            
		</script>
  </body>
 
</html>

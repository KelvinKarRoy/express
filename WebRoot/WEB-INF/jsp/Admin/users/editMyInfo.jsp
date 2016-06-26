<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>个人设置</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@ include file="../../Common/include/css.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
<style type="text/css">
.form-group {
	width: 37.5%;
	float: left;
	margin: 0 10% 0 0;
	margin-bottom: 15px;
}

hr {
	width: 74%;
	margin-top: 10px;
	margin-bottom: 40px;
	border: 0;
	border-top: 1px solid #EEE;
}

.col-xs-offset-1 {
	margin: 0 0 0 13%;
	overflow: hidden;
}

.pull-right {
	margin: 0 13% 0 0;
}

.pull-right .esc {
	margin: 0 20px 0 0;
}
/* 第二期 */
form .change{
	float:left;
	margin-left: 20px;
}
.form-horizontal .form-group{
	width:65.5%;
}
.qqphone_option p,.users_option p{
    float: left;
    margin: -13px -61px 10px 7%;
    font-size: 18px;
}
.upload_img{
	position: relative;
}
.upload_img .uploadBtn{
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	width:100px;
	height:100px;
	line-height: 100px;
	text-align: center;
	border-radius: 50%;
	color:#fff;
	background-color: #868686;
	filter:alpha(opacity=0);
	opacity:0;
	cursor: pointer;
	z-index: 100;
}
.upload_img span{
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	width:100px;
	height:100px;
	line-height: 100px;
	text-align: center;
	border-radius: 50%;
	color:#fff;
	background-color: #868686;
	cursor: pointer;
}

.upload_img img{
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	width:100px;
	height:100px;
	line-height: 100px;
	border-radius: 50%;
	background-color: #868686;
	cursor: pointer;
	z-index: 100;
}
.modal-content .modal-body .form-group{
	width:100%;
	padding:0 10%;
}

@media (min-width: 768px){
	.modal-dialog {
	    width: 400px;
	    margin: 30px auto;
	}
}
.content-wrapper{
	margin-left:10%;
}

.wn{
	cursor: default;
	margin-left: 15px;
}

.wn1{
	margin-bottom: 0px;
}

.wn2{
	margin-top: 10px;
}

.wn_error{
    width: 34%;
    font-size: 12px;
    color: #DD4B39;
    margin: 0 auto;
    padding-bottom: 15px;
}

</style>
</head>

<body>
	<!-- 测试 start-->
	<!-- 信息填写框 -->
	<%@ include file="../include/navbar.jsp"%>
	<div class="content-wrapper">
		<section class="content">
			<div class="box-header">
				<div class="box-title">个人设置</div>
				<p>
					<span><a href="#">首页</a>></span>
					<span><a href="#">个人设置</a>
				</p>
			</div>
			<div class="box">
				<div class="box-body">
					<div class="upload_img" style="height:200px">
						<img src="${sessionScope.login_session_user.headImage}"/>
						<input type="file" class="uploadBtn" id="fileupload" name="filedata"></input>
						<span>点击修改头像</span>
					</div>
					<div class="qqphone_option">
						<p>绑定设置</p><hr>
						<div class="row">
							<form class="form-horizontal clear">
								<div class="form-group">
									<label for="inputPhone" class="col-sm-6 control-label">绑定手机号码</label>
									<div class="col-sm-4">
										<input type="" value="${user.phone}" class="form-control" id="inputPhone" readonly>
									</div>
								</div>
								
								<button type="button" class="btn btn-primary change" data-toggle="modal" data-target="#myModal">更换手机</button>
								<div class="form-group">
									<label for="inputQQ" class="col-sm-6 control-label">绑定QQ账号</label>
									<c:choose>
										<c:when test="${empty user.qqOpenId}">
											<span class="wn btn btn-danger">未绑定QQ</span>
										</c:when>
										<c:otherwise>
											<span class="wn btn btn-success">已绑定QQ</span>
										</c:otherwise>
									</c:choose></td>
								</div>
								<c:choose>
									<c:when test="${empty user.qqOpenId}">
										<a href="<%=request.getContextPath() %>/qq/relateQQ" class="change btn btn-primary" id="changeQQ">绑定QQ</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:;" class="change btn btn-primary" id="removeQQ">解绑QQ</a>
									</c:otherwise>
								</c:choose></td>
							</form>
						</div>
					</div>
					<div class="users_option">
						<p>基本信息</p><hr>
						<div class="row">
							<form id="form">
								<div class="row-xs-4 col-xs-offset-1">
									<div class="form-group">
										<label>姓名</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
										<input type="text" class="form-control" name="cnname" maxlength="32" value="${user.cnname}"id="username" readonly/>
									</div>
									
									<div class="form-group">
										<label>角色</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
									    <input type="text" class="form-control" placeholder="请选择账号的角色" name="roleName" value="${userRole}" maxlength="15" readonly/>
									</div>
									<div class="form-group" class="form-control">
										<label>组织</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
										<select name="groupsId" required class="form-control">
										<c:forEach items="${groupsList}" var="r" varStatus="ind">
											<option <c:if test="${r.id==user.groupsId}">selected</c:if> value="${r.id}">${r.name}</option>
										</c:forEach>
									</select>
									</div>
									<div class="form-group" class="form-control">
										<label>职位</label>
										<input type="text" class="form-control" name="position" value="${user.position}" maxlength="10" placeholder="职位" />
									</div>
								</div>
								<div class="row-xs-4 col-xs-offset-1">
									<div class="form-group">
										<label>身份证号</label>
										<input type="text" class="form-control" name="idCard" value="${user.idCard}" maxlength="18" minlength="18"/>
									</div>
									<div class="form-group">
										<label>QQ</label>
										<input type="text" class="form-control" name="qq" value="${user.qq}" />
									</div>
									<div class="form-group" style="float: none">
										<label>电子邮箱</label>
										<input type="text" class="form-control" name="email" value="${user.email}" maxlength="25" />
									</div>
								</div>
								<div class="pull-right">
									<input type="submit" value="保存" id="userInfoSubmit" class="btn btn-primary" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">更换手机</h4>
		      </div>
		      <div class="modal-body">
		         <div class="form clear">
                    <div class="form-group wn1">
                        <input class="form-control phone" type="text" id="phone" placeholder="手机号">
                        <div class="input-group wn2">
                            <input type="text" class="form-control msg" id="msg" placeholder="短信验证码">
                            <span class="input-group-btn">
                                <button class="btn btn-default send" id="send" type="button">发送验证码</button>
                            </span>
                        </div>   
                    </div>                            
                </div>
		      </div>
		      <div class="modal-footer">
		        
		        <button type="button" class="btn btn-primary" id="modelChangePhone" >保存</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<!-- 测试end -->
	<%@ include file="../../Common/include/script.jsp"%>
	<script src="<%=request.getContextPath() %>/assets/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/plugins/jQuery-File-Upload/js/jquery.fileupload.js"></script>
	<script>
		jQuery.validator.addMethod("isIdCardNo", function (value, element) {
			return this.optional(element) || isIdCardNo(value);
		}, "请正确输入您的身份证号码");
		/*编辑信息保存*/
		$("#form").validate({
			//验证失败
        	highlight: function(ele,errorClass){
        		$(ele).parent().addClass('has-error')
        	},
        	//验证成功
        	unhighlight: function(ele,errorClass){
        		$(ele).parent().removeClass('has-error')
        	},
    		rules:{
    			
    			idCard:{
    				minlength: 18,
    				maxlength: 18,
    				isIdCardNo:true
    			},
    			qq:{
    				digits:true,
    				rangelength:[5,11]
    			},
    			email:{
    				email:true
    			}
    		},
    		messages:{
    			
    			idCard:{
    				minlength: "只能输入18位字符",
    				maxlength: "只能输入18位字符",
    				isIdCardNo:"请输入正确的身份证号"
    			},
    			qq:{
    				digits:"只能输入数字",
    				rangelength:"只能输入5-11位数字"
    			},
    			email:{
    				email:"必须输入正确格式的电子邮件"
    			}
    		}
    	});
		$("#userInfoSubmit").click(function(e){
			e.preventDefault();
			$.post("<%=request.getContextPath() %>/users/editMyInfo",$("#form").serialize(),function(data){
				if(data.code == "200"){
					alert(data.message,null,1500,function(){
						window.location.reload();
					})
				}else{
					alert(data.message)
				}
			});
		});
		/**/
		/*解绑QQ*/
		$("#removeQQ").click(function(e){
			e.preventDefault();
			confirm("确定要解绑吗？", function(result) {
              if(result)
              {
              	$.ajax({
              	   url:"<%=request.getContextPath() %>/qq/unRelateQQ",
              	   type:"GET",
              	   cache:false,
              	   async:false,
              	   success:function(data)
              	   {
              		   if(data.code="200")
              	       {
              			   window.location.href="<%=request.getContextPath()%>/users/showEditMyInfo";
              	       }else
              	       {
              	    	   alert("解绑失败，请稍后重试或者联系管理员");
              	    	   return ;
              	        }
              	   },
              	   error:function()
              	   {
              		   alert("系统错误，请稍后重试");
              	   }
              	});
               }
            });
		});
		/**/
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
                    time(o);
                },  
                1000)  
            }  
        }  

		$('#fileupload').fileupload({
                url: '<%=request.getContextPath()%>/users/headImage',
                dataType: 'json',
                type:'post',
                done: function (e, data) {
                	$('#fileupload').next('span').html(data.files[0].name);                
                    
                    $('#fileupload').prev('img').css('z-index','100');
                    
                    window.location.reload();
                },
                progressall: function (e, data) {
                    $('#fileupload').next('span').html('上传中…');
                }
            });

		$("#send").on("click",function(){
            phone = $("#phone").eq(0).val();
            if(checkmobliemsg(phone,"phone")){
                ajax("sendAjax");
            }else{
                alert("请输入正确的手机格式！")
            }
        });

        $("#modelChangePhone").on("click",function(){
            phone = $("#phone").eq(0).val();
            code = $("#msg").eq(0).val();
            if(checkmobliemsg(phone,"phone")){
                if(checkmobliemsg(code,"code")){
                	$(this).attr("disabled",true)
                    ajax("loginAjax")
                }else{
                    appenderror("请输入正确的验证码！",".modal-footer")
                }
            }else{
                appenderror("请输入正确的手机格式！",".modal-footer")
            }
        })

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
                $.post(
                    "<%=request.getContextPath()%>/sms/changePhone",
                    {
                        phone:phone
                    },function(data){
                        if(data.code === "200"){time($("#send"));}
                        else {alert(data.message)}
                    }
                );
            }else if(type === "loginAjax"){
                $.post(
                    "<%=request.getContextPath()%>/users/resetPhone",
                    {
                        phone:phone,
                        code:code
                    },function(data){

                        if(data.code != "200") {alert(data.message)}
                        else if(data.code =="200") {window.location.reload()}

                        
                    }
                );
            }
        }

        //错误提示
        function appenderror(errorstr,obj){
            if($('.wn_error').size() > 0) $('.wn_error').detach(); 
            $('<div class="wn_error">'+errorstr+'</div>').insertBefore(obj)
        }
    </script>

</body>

</html>

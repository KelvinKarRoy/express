<%@page import="com.xing.whmetro.entity.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="../../Common/include/meta.jsp"%>
<title>用户列表</title>

<%@ include file="../../Common/include/css.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/child.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/ztree.css">
<style type="text/css">
.ztree li a {
	width: 100%;
}
.btn-operate{
	position:relative;
	height:300px;
}
.btn-operate>button {
	display: block;
	margin: 10px 0;
	width: 60%;
	height: 50px;
	font-size: 24px;
}

#list {
	width: 80%;
	height: 300px;
}
.col-md-5 select{
	border:1px solid #DCDCDC;
}
.col-md-5 select option{
	border-bottom:1px solid #DCDCDC;
	cursor: pointer;
	padding:5px;
}
.col-md-5 select option:hover{
	background-color: #DCDCDC;
}

/*重定义bs*/
.form-group{
    width: 37.5%;
    float: left;
    margin: 0 10% 0 0;
    margin-bottom: 15px;
}
      hr{
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
      .pull-right{
        margin:0 13% 0 0;
      }
      .pull-right .esc{
        margin: 0 20px 0 0;
      }
      .bg_shape{
      	position: absolute;
	    top: 35%;
	    left: 43.6%;
	    width: 0;
	    height: 0;
	    border-left: 15px solid #EAE0E0;
	    border-top: 28px solid transparent;
	    border-bottom: 28px solid transparent;
      }
      /*第二期*/
        .content-wrapper{
        	margin-left:10%;
        }
		.box-header{
			height:30px;
			padding:0px;
		}
		.box-title{
			float: left;
		}
		.box-header p{
			float: right;
		}
		.row form{
			margin-top: 15px;
		}
		.col-md-5{
			margin: 2% 2% 0 2%;
		    width: 38%;
		}
		.wn_left{
			margin-left: 10.5%;
		}
		.btn-operate{
			width: 7%;
			padding:0;
		    height: 300px;
		}
		.text-right{
			margin:2% 10% 0 0;
		}
      
</style>


<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body>
<%@ include file="../include/navbar.jsp"%>
	<!-- 测试 start-->
	<!-- 信息填写框 -->

	<div class="content-wrapper" style="min-height: 542px;">
		<section class="content">
			<div class="box-header">
				<div class="box-title">编辑账号</div>
				<p><span><a href="#">首页</a>></span><span><a href="">线路编辑</a>></span><span><a href="">二号线></a></span><span><a href="">宝通寺站</a></span></p>
			</div>
			<div class="box">
				<div class="box-body">
					<div class="row">
						<form action="<%=request.getContextPath()%>/admin/user/edit"
							method="post">
	
							<div class="row-xs-4 col-xs-offset-1">
								<div class="form-group">
									<label>姓名</label> 
									<span id="autoreqmark" style="color:#FF9966"> *</span>
									<input type="text" class="form-control" name="cnname" value="${user.cnname}" maxlength="32" placeholder="用户的真实姓名" id="cnname" readonly/>
									<input type="hidden" name="uid" value="${user.uid}">
								</div>
								<div class="form-group">
									<label>手机号码</label> 
									<span id="autoreqmark" style="color:#FF9966"> *</span>
									<input type="text" class="form-control" name="phone" value="${user.phone}" minlength="11" maxlength="11" placeholder="必填，用于登陆系统" readonly/>
								</div>
								<div class="form-group">
									<label>角色</label> 
									<span id="autoreqmark" style="color:#FF9966"> *</span>
									<input type="text" class="form-control" placeholder="请选择账号的角色" name="roleName" value="${userRole}" maxlength="15" readonly/>
								</div>
								<div class="form-group" class="form-control">
									<label>组织</label> 
									<span id="autoreqmark" style="color:#FF9966"> *</span>
									<select name="groupsId" required class="form-control">
										<c:forEach items="${groupsList}" var="r" varStatus="ind">
											<option <c:if test="${r.id==user.groupsId}">selected</c:if> value="${r.id}">${r.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<hr>
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
							<br>
							<div class="pull-right">
								<input type="button" value="取消" class="btn btn-default esc" id="addUser_esc" /> 
								<input type="submit" value="保存" class="btn btn-primary" />
							</div>
							<br>
						</form>
					</div>
				</div>
			</div>
			<div class="box-header">
				<div class="box-title">线路权限</div>
			</div>
			<div class="box">
				<c:choose>
					<c:when test="${!isAllWorkpoint}">
						<div class="box-body">
					<div class="row">
						<div class="col-md-5 wn_left">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
						<div class="col-md-2 btn-operate">
							<div class="bg_shape"></div>
						</div>
						<div class="col-md-5 wn_right">
							<select id="list" multiple class="form-control">
							<c:forEach items="${selected}" var="r">
								<option value="${r.id}">${r.name}</option>
							</c:forEach>
							</select>
						</div>
					</div>
					<p class="text-right"><button class="btn btn-primary" id="submitRight">保存</button></p>
						</div>
					</c:when>
					<c:otherwise>
						<p><h3 style="text-align:center;">该用户拥有全部的路线权限</h3></p>
					</c:otherwise>
				</c:choose>
		    </div>
		</section>
	</div>
	<!-- 测试end -->
	<%@ include file="../../Common/include/script.jsp"%>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/plugins/ztree/js/jquery.ztree.core.js"></script>
	<script>
		$(function() {

			var currentTree = null;
			jQuery.validator.addMethod("isIdCardNo", function (value, element) {
				return this.optional(element) || isIdCardNo(value);
			}, "请正确输入您的身份证号码");
			$("form").validate({
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
        	$("form").submit(function(e) {
        		
        		e.preventDefault();
            	
           		$.post($(this).attr("action"), $(this).serialize(), function(data) {
                	window.top.bootbox.dialog({
                		message:data.message
                	});
                	setTimeout(function(){
                		
                		if($("div[role=dialog]")){
				            $("div[role=dialog]").modal("hide");
				        }
                	},2000);
           		});
        	});
        	
        	
			$("#addTreeNode").click(
					function() {
						if (currentTree) {
							var objSelect = $("#list")[0];
							for (var i = 0; i < objSelect.options.length; i++) {
								if (objSelect.options[i].value == currentTree.id) {
									alert("该工点已添加！",null,2000);
									return;
								}
							}
							objSelect.options.add(new Option(
									currentTree.name, currentTree.id));
							} else
							alert('请先选择要添加的权限',null,2000);
					});
			
			$("#list").click(function() {
				var objSelect = this;
				if(objSelect.value) {
					for (var i = 0; i < objSelect.options.length; i++) {        
			            if (objSelect.options[i].value == objSelect.value) {        
			                objSelect.options.remove(i);        
			                break;        
			            }        
			        }
				}
				else alert('请先选择要删除的权限',null,2000);
				  
			});

			$("#addUser_esc").click(function(e){
				var that = this;
				e.preventDefault();
				confirm("确定要取消吗？", function(result) {
					if (result) {
						history.back();
					}
				});
			})
			
			$("#submitRight").click(function() {
				var objSelect = $("#list")[0];
				var lists = [];
				for (var i = 0; i < objSelect.options.length; i++) {
					lists.push($("#list")[0].options[i].value);
				}
			
				
				$.post(
				"<%=request.getContextPath()%>/authority/modifyWorkpoint",
				{selectedWorkpoint:lists.join('|'),operateUser:<%=((Users)(request.getAttribute("user"))).getUid()%>},
				function(data){
				alert(data.message,null,2000,function(){
					window.location.reload();
				});
				},
				"json"
				);
			});

			var curMenu = null, zTree_Menu = null;
			var setting = {
				view : {
					showLine : false,
					showIcon : true,
					selectedMulti : false,
					dblClickExpand : false,
					addDiyDom : addDiyDom
				},
				data : {
					simpleData : {
						enable : true
					}
				},
				callback : {
					beforeClick : function(treeId, treeNode) {
						if (treeNode.level == 0) {
							var zTree = $.fn.zTree.getZTreeObj("treeDemo");
							zTree.expandNode(treeNode);
							return false;
						}
						return true;
					},
					onClick : function(event, treeId, treeNode) {
						var objSelect = $("#list")[0];
							for (var i = 0; i < objSelect.options.length; i++) {
								if (objSelect.options[i].value == treeNode.id) {
									alert("该工点已添加！",null,2000);
									return;
								}
							}
							objSelect.options.add(new Option(
									treeNode.name, treeNode.id));
					}
				}
			};

			var zNodes = ${nodes};

			function addDiyDom(treeId, treeNode) {
				var spaceWidth = 5;
				var switchObj = $("#" + treeNode.tId + "_switch"), icoObj = $("#"
						+ treeNode.tId + "_ico");
				switchObj.remove();
				icoObj.before(switchObj);

				if (treeNode.level > 1) {
					var spaceStr = "<span style='display: inline-block;width:"
							+ (spaceWidth * treeNode.level) + "px'></span>";
					switchObj.before(spaceStr);
				}
			}

			var treeObj = $("#treeDemo");
			$.fn.zTree.init(treeObj, setting, zNodes);
			zTree_Menu = $.fn.zTree.getZTreeObj("treeDemo");
			curMenu = zTree_Menu.getNodes()[0]; //.children[0].children[0];
			zTree_Menu.selectNode(curMenu);

			treeObj.hover(function() {
				if (!treeObj.hasClass("showIcon")) {
					treeObj.addClass("showIcon");
				}
			}, function() {
				treeObj.removeClass("showIcon");
			});
		});
	</script>
</body>

</html>

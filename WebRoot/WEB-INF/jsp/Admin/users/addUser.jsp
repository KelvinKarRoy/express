<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="../../Common/include/meta.jsp"%>
<title>新增用户</title>
<%@ include file="../../Common/include/css.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/child.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/plugins/ztree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/ztree.css">
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath()%>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath()%>/assets/js/respond.min.js"></script>
  <![endif]-->
<!-- 重定义bs -->
<style type="text/css">
.ztree li a {
	width: 80%;
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
/* .modal-dialog{
        text-align: center;
      }
      .modal-content{
        width:25%;
        margin-left: 34%;
      }
      .modal-title{
        line-height: 0.45;
      }
      .modal-body{
        padding: 30px 15px;
      } */
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

.box-header{
	height: 30px;
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

.content-wrapper{
	margin-left:10%;
}
.error{
	color:red;
}
</style>
</head>

<body>
    <%@ include file="../include/navbar.jsp"%>
	<!-- 测试 start-->
	<!-- 信息填写框 -->
	
	<div class="content-wrapper" style="min-height: 542px;">
		<section class="content">
			<div class="box-header">
				<div class="box-title">用户信息</div>
				<p><span><a href="#">首页</a>></span><span><a href="<%=request.getContextPath()%>/admin/users/getUserByCondition">账号管理</a>></span><span><a href="">新建账号</a></span></p>
			</div>
			<div class="box">
				<div class="box-body">
					<div class="row">
						<form action=""method="post">

							<div class="row-xs-4 col-xs-offset-1">
								<div class="form-group">
									<label>姓名</label>
									<span class="autoreqmark" style="color:#FF9966"> *</span>
									<input type="text" class="form-control" name="cnname" maxlength="8" placeholder="用户的真实姓名" id="username" required/>
								</div>
								<div class="form-group">
									<label>手机号码</label>
									<span class="autoreqmark" style="color:#FF9966"> *</span>
									<input type="text" class="form-control" name="phone" minlength="11" maxlength="11" placeholder="必填，用于登陆系统" required/>
								</div>
								<div class="form-group">
									<label>角色</label>
									<span class="autoreqmark" style="color:#FF9966"> *</span>
									<select name="roleId" required class="form-control">
										<c:forEach items="${roleList}" var="r" varStatus="ind">
											<option <c:if test="${r.id==5}">selected</c:if> value="${r.id}">${r.roleName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group" class="form-control">
									<label>组织</label>
									<span class="autoreqmark" style="color:#FF9966"> *</span>
									<select name="groupsId" required class="form-control">
										<c:forEach items="${groupsList}" var="r" varStatus="ind">
											<option value="${r.id}">${r.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<hr>
							<div class="row-xs-4 col-xs-offset-1">
								<div class="form-group">
									<label>身份证号</label>
									<input type="text" class="form-control" name="idCard" maxlength="18" minlength="18"/>
								</div>
								<div class="form-group">
									<label>QQ</label>
									<input type="text" class="form-control" maxlength="12" name="qq" />
								</div>
								<div class="form-group" style="float: none">
									<label>电子邮箱</label>
									<input type="text" class="form-control" name="email" maxlength="25" />
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
			<div class="box-header" style="display:none" id="power2">
                <div class="box-title">线路权限</div>
            </div>
            <div class="box" style="display:none" id="power">
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
                                <option value="${r.id}">${r.workpointName}</option>
                            </c:forEach>
                        </select>
                        </div>
                    </div>
                    <p class="text-right">
                    <button class="btn btn-primary" id="submitRight">保存</button>
                    </div>
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
	        var currentTree;
	        var uid = 0;
            $(function() {
            	jQuery.validator.addMethod("isIdCardNo", function (value, element) {
				return this.optional(element) || isIdCardNo(value);
			}, "请正确输入您的身份证号码");
            $("form").validate({
            	submitHandler:function(form){
            		$.post("<%=request.getContextPath()%>/admin/user/create",$("form").serialize(),function(data) {
	           			//如果code等于200说明正确返回，并2000毫秒后刷新
	     		    	if(data.code === "200"){

	     		    		window.top.bootbox.dialog({
	              				message:data.message
	          	    		});
		                	setTimeout(function(){
		                		if(window.top.$("div[role=dialog]")){
						            window.top.$("div[role=dialog]").modal("hide");
						        }
						        //location.replace("<%=request.getHeader("referer")%>");
								$("#power").show();
								$("#power2").show();
								uid = data.object.user.uid;
								createTree(data.object.nodes);
							}, 2000);
						} else { //code返回不为200直接弹窗
							alert(data.message)
						}
					});
            	},
            	//验证失败
            	
            	highlight: function(ele,errorClass){
            		$(ele).parent().addClass('has-error')
            	},
            	//验证成功
            	unhighlight: function(ele,errorClass){
            		$(ele).parent().removeClass('has-error');
            	},
        		rules:{
        			phone:{
        				required:true,
    					minlength: 11,
    					maxlength: 11,
    					digits:true
        			},
        			idCard:{
        				minlength:18,
        				maxlength:18,
        				isIdCardNo:true,
        				/*remote:*/
        			},
        			qq:{
        				digits:true,
        				rangelength:[5,11]
        			},
        			email:{
        				email:true
        			},
        			username:{
        				required:true
        			},
        			cnname:{
        				required:true
        			}
        		},
        		messages:{
        			phone:{
        				required: "必须要输入的字段",
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
        			username:{
        				required:"必须要输入的字段"
        			},
        			cnname:{
        				required:"必须要输入的字段"
        			}
        		}
            });
        	
			//取消按钮
			$("#addUser_esc").on("click", function(e) {
				var that = this;
				e.preventDefault();
				confirm("确定要取消吗？", function(result) {
					if (result) {
						history.back();
					}
				});
			});

			$("#addTreeNode").click(
					function() {
						if (currentTree) {
							var objSelect = $("#list")[0];
							for (var i = 0; i < objSelect.options.length; i++) {
								if (objSelect.options[i].value == currentTree.id) {
									alert("该工点已添加！");
									return;
								}
							}
							objSelect.options.add(new Option(
									currentTree.name, currentTree.id));
							} else
							alert('请先选择要添加的权限');
					});

			$("#list").click(function() {
				var objSelect = this;
				if (objSelect.value) {
					for (var i = 0; i < objSelect.options.length; i++) {
						if (objSelect.options[i].value == objSelect.value) {
							objSelect.options.remove(i);
							break;
						}
					}
				} else
					alert('请先选择要删除的权限');

			});
			
			$("#submitRight").click(function() {
				var objSelect = $("#list")[0];
				var lists = [];
				for (var i = 0; i < objSelect.options.length; i++) {
					lists.push($("#list")[0].options[i].value);
				}
				
				$.post(
				"<%=request.getContextPath()%>/authority/addWorkpoint",
				{selectedWorkpoint:lists.join('|'),operateUser:uid},
				function(data){
					alert(data.message,null,1500,function(){
						location.replace("<%=request.getContextPath()%>/admin/users/getUserByCondition");
					});
				},
				"json"
				);
			});
		});
		function createTree(zNodes) {

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
		}

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
	</script>
</body>

</html>


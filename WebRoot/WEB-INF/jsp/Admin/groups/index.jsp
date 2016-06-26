<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../Common/include/meta.jsp" %>
	<title>组织管理</title>
	<%@ include file="../../Common/include/css.jsp" %>	
	<style type="text/css">
	a{
		color:#efefefccc;
	}
	.btn{
		margin-left:5px;
	}
	.content-header h1{
		font-family:"microsoft yahei";
		font-size: 20px;
		color: #3C8DBC;
	}
	.label-group{
		margin-top:20px;
	}
	.group-content{
		margin:0 auto;
		width:80%;
		padding-top:40px;
	}
	.group-content .user-label{
		width:120px;
		height:46px;
		background-color:#ffffff;
		border-radius:6px;
		font-weight:normal;
		margin-top:8px;
		margin-left:8px;
	}	
	.edit-group-btn{
		color:#ccc;
		margin-right:8px;
		margin-left:8px;
		margin-top:2px;
		cursor:pointer;
		display:none;
	}
	#groupOption{
		padding-top:5px;
		padding-bottom:5px;
	}
	#add-labelGroup{
		font-size:18px;
		color:#3c8dbc;
		cursor:pointer;
	}
	.add-labelGroup{
		margin-bottom:20px !important;
	}
	.add-form,
	.edit-form{
		display:none;
	}
	.edit-group-box{
		background:#fff;
		float:left;
	}
	.edit-group-box:hover .edit-group-btn{
		display:inline-block;
	}
	.edit-group-form{
		display:inline-block;
		background:#fff;
		max-width:300px;
		padding-right:20px;
	}
	.cancel-unsort-label{
		color:#ccc;
		padding-left:10px;	
		cursor:pointer;
	}
	.delete-group{
		padding-left:10px;
		line-height:34px;
		background:#fff;	
		font-size:14px !important;
		color:red;
		float:right;
		cursor:pointer;
	}
	.group-header{
		padding:0;
		height:32px;
	}
	.group-header:not(.add-labelGroup){
		background:url('<%=request.getContextPath() %>/assets/images/group-hd-bg.gif') 0 50% repeat-x;
	}
	.group-header>span,.edit-group-box>span{
		color:#333;
		float:left;
		background:#fff;
		padding-top:4px;
		padding-right:5px;
	}
	.edit-group-box>a{
		padding-top:5px;
	}
	.edit-unsort-group-btn,.edit-sort-group-btn{	
		font-size:16px;
		float:right;
		padding-left:10px;
		padding-top:6px;
		background:#fff;
		cursor:pointer;
		color:#666;
		font-size:14px !important;
		vertical-align:middle;
	}
	.edit-unsort-group-btn span,.edit-sort-group-btn span{
		font-size:14px !important;
		height:20px;
	}
	.edit-unsort-group-form,.edit-sort-group-form{
		background:#fff;
		float:right;
		display:none;
		margin:0 !important;
	}
	.head-image{
		float:left;
		padding:8px;
		display:inline-block;
		width:46px;
		height:100%;
		border-radius:100%;
	}

	.user-name{
		width:70px;
		overflow:hidden;
		text-overflow:ellipsis;
		color: #333;
 		font-size: 16px;
 		height:22px;
  		line-height:22px;
  		margin-top:4px;
	}
	.user-position{
		overflow:hidden;
		text-overflow:ellipsis;
		width:70px;
		color: #999;
		height:17px;
  		font-size: 12px;
  		line-height:17px;	
	}
	.cancel-group,#cancel{
		box-shadow:none !important;
		border:none;
		outline:0 !important;
		color:#999 !important;
	}
	.cancel-group-content{
		color:#ccc;
		padding-left:10px;	
	}
	.label-title{
		font-size:18px !important;
	}
	</style>
</head>
<body>
<%@ include file="../include/navbar.jsp" %>	
<div class="content-wrapper" style="min-height: 542px;">
	<section class="content-header">
    	<h1>组织管理</h1>
	    <ol class="breadcrumb">
	        <li><a href="#">首页</a></li>
	        <li class="active">组织管理</li>
	    </ol>
    </section>
	<section class="content">
		<div class="box">
			<div class="box-header" style="display:none">
			</div>
			<div class="box-body">
				<!-- 未分组账号固定管理 -->
				<div class="label-group">
					<div class="group-header col-md-10 col-md-offset-1">
						<span class="label-title">未分组织账号</span>
						<!-- 编辑按钮 -->
						<ul class="list-inline edit-unsort-group-btn" >
							<li><span class="glyphicon glyphicon-edit"></span> 编辑人员</li>
						</ul>
						<!-- 编辑选项 -->
						<ul class="list-inline edit-unsort-group-form">
							<li><a  href="javascript:;" class="cancel-unsort-label">取消</a></li>
							<li><button type="button" class="btn btn-danger delete-unsort-label" style="display:none;">删除</button></li>
							<li>
								<select class="form-control" name="" id="groupOption">
									<option value="">移动至</option>
									<c:forEach items="${groups}" var="g">
										<option value="${g.id}">${g.name}</option>
									</c:forEach>
								</select>
							</li>
						</ul>
					</div>
					<div class="group-content">
						<c:forEach items="${usersNoGroups}" var="user">
							<label class="user-label" data-id="${user.uid}" data-status="#ffffff">
								<!--<img class="head-image" src="<%=request.getContextPath() %>${user.headImage}"> -->
								<img class="head-image" src="<%=request.getContextPath() %>/assets/images/default-50x50.gif">
								<div class="user-name">${user.cnname}</div>
								<div class="user-position">${user.position}</div>
							</label>
						</c:forEach>
					</div>
				</div>
				<!-- 已分类组织人员管理 -->
				<c:forEach items="${groupsMap}" var="group">
					<div class="label-group">
						<div class="group-header col-md-10 col-md-offset-1">
							<div class="edit-group-box">
								<span class="label-title">${group.key.name}</span>
								<a class="edit-group-btn">编辑</a>
							</div>
							<div class="edit-form">
								<form class="edit-group-form">
									<input type="text" class="form-control labelGroup-name" value="${group.key.name}" style="width:130px;float:left;margin-right:10px;"/>
									<button type="button" class="btn btn-primary save-group"  data-id="${group.key.id}">保存</button>
									<button type="button" class="btn btn-link cancel-group" >取消</button>
								</form>
								<span class="delete-group" data-id="${group.key.id}">删除该组织</span>
							</div>
							<!-- 编辑按钮 -->
							<ul class="list-inline edit-sort-group-btn" >
								<li><span class="glyphicon glyphicon-edit"></span> 编辑人员</li>
							</ul>
							<!-- 编辑选项 -->
							<ul class="list-inline edit-sort-group-form" style="float:right;margin-top:-30px;display:none">
								<li><a href="javascript:;" class="cancel-group-content">取消</a></li>
								<li><button type="button" class="btn btn-danger delete-unsort-label" style="display:none;">删除</button></li>
								<li>
									<select class="form-control groupOption" name="">
										<option value="">添加至</option>
										<c:forEach items="${groups}" var="g">
											<option value="${g.id}">${g.name}</option>
										</c:forEach>
									</select>
								</li>
							</ul>
						</div>
						<div class="group-content">
							<c:forEach items="${group.value}" var="user">						     
								<label class="user-label" data-id="${user.uid}"  data-status="#ffffff">
								<!--<img class="head-image" src="<%=request.getContextPath() %>${user.headImage}"> -->
								<img class="head-image" src="<%=request.getContextPath() %>/assets/images/default-50x50.gif">
								<div class="user-name">${user.cnname}</div>
								<div class="user-position">${user.position}</div>
								</label>
							</c:forEach>
						</div>
				    </div>
			    </c:forEach>
			    <div class="label-group">
					<div class="group-header add-labelGroup col-md-10 col-md-offset-1">
						<span id="add-labelGroup">+新建组织</span>
						<!-- 编辑按钮 -->
						<div class="add-form">
							<form class="edit-group-form">
								<input type="text" class="form-control" id="labelGroupName" value="" placeholder="例如:武汉大学" style="width:130px;float:left"/>
								<button type="button" class="btn btn-primary" id="save">保存</button>
								<button type="button" class="btn btn-link" id="cancel">取消</button>
							</form>
						</div>
					</div>					
				</div>
			</div>
		</div>	
	</section>
</div>
<%@ include file="../../Common/include/script.jsp" %>	
<script>
	$("#add-labelGroup").click(function(){
		$(this).hide();
		$(this).next(".add-form").show();
		$(".edit-unsort-group-form").hide();
		$(".edit-unsort-group-btn").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
		$(".user-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	});
	$("#save").click(function(){
		var name=$("#labelGroupName").val();
		if(name==""){
			confirm("名称不能为空",function(){
				window.location.reload();
			});
		}else{
			$.post("<%=request.getContextPath() %>/groups/addGroups",
				{name:name},
				function(data){
						if(data.code=="200"){
						alert(data.message,null,1500,function(){
						window.location.reload();
						});
						}else if(data.code=="201"){
							confirm(data.message,function(){
								window.location.reload();
							});
						}	
			},"json");
		}	
	});
	$("#cancel").click(function(){
		$(this).parents(".add-form").hide();
		$("#add-labelGroup").show();
	});
	 $(".edit-group-btn").click(function(){
	 	$(".add-form").hide();
	 	$("#add-labelGroup").show();
	 	$(".edit-unsort-group-form").hide();
	 	$(".edit-unsort-group-btn").show();
	 	$(this).parent().hide();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
	 	$(this).parent().next(".edit-form").show().siblings(".edit-sort-group-btn").hide();
	 	$(this).parent().nextAll(".list-inline").hide();
	 	$(".group-content label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	 });
 	$(".delete-group").click(function(e){
 		var id=$(this).attr("data-id");
 		e.preventDefault();
 		confirm("确认要删除该组织么?",function(result){
 			if(result){
				$.post("<%=request.getContextPath() %>/groups/deleteGroups",
						{id:id},
						function(data){
							if(data.code=="200"){
								alert(data.message,null,1500,function(){
								window.location.reload();
							});
						}else if(data.code=="201"){
							confirm(data.message,function(){
							window.location.reload();
						});
					}	
				},"json");	
 			}
 		});
 	});
 	 $(".save-group").click(function(){
 		var name=$(this).siblings(".labelGroup-name").val();
		var id=$(this).attr("data-id");
		$.post("<%=request.getContextPath() %>/groups/edit",
				{
				  name:name,
				   id:id
				},
				function(data){
				if(data.code=="200"){
					alert(data.message,null,1500,function(){
					window.location.reload();
				});
				}else if(data.code=="201"){
					confirm(data.message,function(){
					window.location.reload();
					});
				}	
		},"json");
 	 });
 	$(".cancel-group").click(function(){
 		$(this).parents(".edit-form").hide().siblings(".edit-sort-group-btn").show();
			$(this).parents(".edit-form").prev().show();
			$(this).next(".edit-sort-group-btn").show();
 	});
	$(".user-label").click(function() {
		if($(this).attr("data-status")!="#ffffff"){
			var toggle = $(this).attr("data-status") == "#efefef" ? "#ceebeb" : "#efefef";
			console.log(toggle);
		    $(this).css("background-color", toggle).attr("data-status", toggle);
		}
	});
	function getLabelId() {
		var id_list = [];
		$(".user-label").each(function() {
		   if($(this).attr("data-status") == "#ceebeb") id_list.push($(this).attr("data-id"));
		});
		return id_list;
	};
	$(".edit-unsort-group-btn").click(function(){
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-sort-group-form").hide();
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-form").hide();
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-sort-group-btn").show();
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-group-box").show();
		$(this).hide();
		$(".user-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
		$(".edit-unsort-group-form").show();
		$(this).parent().next().children("label").css({"background-color":"#efefef","cursor":"pointer"}).attr("data-status","#efefef");
		$(this).parents(".label-group").siblings(".label-group").find(".edit-unsort-group-form").hide();
	});
	$("#groupOption").change(function(){
		//获取被选中的组织id集合
		var id_list=getLabelId();
		var ids=id_list.join("|");
		//获取被选中的组织组id
		var	group_id=$(this).find("option:selected").val();
		//执行分组操作
		$.post("<%=request.getContextPath() %>/groups/addUsers",
				{uids:ids,
				 groupsId:group_id},
					function(data){
					if(data.code=="200"){
						alert(data.message,null,1500,function(){
						window.location.reload();
					});
					}else if(data.code=="201"){
						confirm(data.message,function(){
						window.location.reload();
					});
				}	
			},"json");
	});
	$(".cancel-unsort-label").click(function(){
		$(this).parent().parent().hide();
 		$(this).parent().parent().prev().show();
 		$(this).parents(".group-header").next().children(".user-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	});
	 $(".edit-sort-group-btn").click(function(){
	 	$(".add-form").hide();
	 	$("#add-labelGroup").show();
	 	$(".user-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	 	$(this).hide();
	 	$(this).prev().prev().prev().children(".edit-group-btn").hide();
	 	$(this).next().show();
	 	$(this).parent().next().children("label").css({"background-color":"#efefef","cursor":"pointer"}).attr("data-status","#efefef");
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
		$(".edit-unsort-group-form").hide();
		$(".edit-unsort-group-btn").show();
	 });
	$(".groupOption").change(function(){
	var id_list=getLabelId();
	var ids=id_list.join("|");
	var	group_id=$(this).find("option:selected").val();
	$.post("<%=request.getContextPath() %>/groups/addUsers",
		{uids:ids,
		 groupsId:group_id},
			function(data){
				if(data.code=="200"){
					alert(data.message,null,1500,function(){
					window.location.reload();
				});
				}else if(data.code=="201"){
					confirm(data.message,function(){
					window.location.reload();
				});
			}	
		},"json");
	});
 	$(".cancel-group-content").click(function(){
 		$(this).parent().parent().hide();
 		$(this).parents(".list-inline").prevAll(".edit-group-form").prev().children(".edit-group-btn").show();
 		$(this).parent().parent().prev().show();
 		$(this).parents(".group-header").next().children(".user-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
 	});
</script>
</body>
</html>

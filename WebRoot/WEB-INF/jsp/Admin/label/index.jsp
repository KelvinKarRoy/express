<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../Common/include/meta.jsp" %>
	<title>标签管理</title>
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
	.label-group span{
		font-size:20px;
	}
	.group-content{
		margin-top:30px;
		margin-bottom:30px;
	}
	.tag-label{
		overflow:hidden;
		text-overflow:ellipsis;
		width: 120px;
		color:#5E5E5E;
		height:20px;
		background-color:#ffffff;
		border-radius:10px;
		text-align:center;
		line-height:20px;
		font-weight:normal;
	}	
	.add-unsort-label,.add-sort-label{
		display:none;
		background-color:#fff !important;
		border:1px dashed #ccc;
		overflow:hidden;
		width: 120px;
		color:#5E5E5E;
		height:20px;
		border-radius:10px;
		text-align:center;
		line-height:20px;
		font-weight:normal;
		cursor:pointer !important;
	}
	.add-unsort-label>span,.add-sort-label>span{
		color:#efefef;
		font-size:15px;
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
		color:#3c8dbc;
		cursor:pointer;
	}
	.add-labelGroup{
		height:34px;
		line-height:34px;
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
		padding-left:10px;
		color:#ccc;
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
	.cancel-group-content{
		color:#ccc;
		padding-left:10px;
	}
	.form-group>.control-label{
		font-size:16px;
		color:#333;
		background:#fff !important;
	}
	.modal-title{
		font-family:"microsoft yahei";
		font-size:18px;
		color:#333;
	}
	.cancel-group,#cancel{
		box-shadow:none !important;
		border:none;
		outline:0 !important;
		color:#999 !important;
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
    	<h1>标签管理</h1>
	    <ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath() %>/route/list">首页</a></li>
	        <li class="active">标签管理</li>
	    </ol>
    </section>
	<section class="content">
		<div class="box">
			<div class="box-header" style="display:none">
			</div>
			<div class="box-body">
				<!-- 未分类标签固定管理 -->
				<div class="label-group">
					<div class="group-header col-md-10 col-md-offset-1">
						<span class="label-title">未分类标签</span>
						<!-- 编辑按钮 -->
						<ul class="list-inline edit-unsort-group-btn" >
							<li><span class="glyphicon glyphicon-edit"></span> 编辑标签组</li>
						</ul>
						<!-- 编辑选项 -->
						<ul class="list-inline edit-unsort-group-form">
							<li><a href="javascript:;"  class="cancel-unsort-label">取消</a></li>
							<li><button type="button" class="btn  btn-danger delete-unsort-label">删除</button></li>
							<li>
								<select class="form-control" name="" id="groupOption">
									<option>添加至</option>
									<c:forEach items="${groupList}" var="labelGroup">
										<option value="${labelGroup.id}">${labelGroup.name}</option>
									</c:forEach>
								
								</select>
							</li>
						</ul>
					</div>
					<div class="group-content col-md-8 col-md-offset-2">
						<c:forEach items="${labels}" var="label">
							<label class="tag-label" data-id="${label.id}" data-status="#ffffff">${label.name}</label>
						</c:forEach>
							<label  class="add-unsort-label" data-toggle="modal" data-target="#addLabelModal" data-whatever="addUnsortLabel">
								+
							</label>
					</div>
				</div>			
				<!-- 已分类标签管理 -->
				<c:forEach items="${sortLabel}" var="group">
					<div class="label-group">
						<div class="group-header col-md-10 col-md-offset-1">
							<div class="edit-group-box">
								<span class="label-title">${group.key.name}</span>
								<a class="edit-group-btn">编辑</a>
							</div>
							<div class="edit-form">
								<form class="edit-group-form">
									<input type="text" class="form-control labelGroup-name" value="${group.key.name}"  style="width:130px;float:left;margin-right:10px;"/>
									<button type="button" class="btn btn-primary save-group"  data-id="${group.key.id}">保存</button>
									<button type="button" class="btn btn-link cancel-group" >取消</button>
								</form>
								<span class="delete-group" data-id="${group.key.id}" >删除该标签分组</span>						
							</div>
							<!-- 编辑按钮 -->
							<ul class="list-inline edit-sort-group-btn" >
								<li><span class="glyphicon glyphicon-edit"></span> 编辑标签组</li>
							</ul>
							<!-- 编辑选项 -->
							<ul class="list-inline edit-sort-group-form" style="float:right;margin-top:-30px;display:none">
								<li><a class="cancel-group-content" herf="javascript:;" style="cursor:pointer;">取消</a></li>
								<li><button type="button" class="btn-danger form-control delete-group-label" data-id="${group.key.id}">删除</button></li>
								<li>
									<select class="form-control groupOption" name="">
										<option value="">添加至</option>
										<c:forEach items="${groupList}" var="label">
											<option value="${label.id}">${label.name}</option>
										</c:forEach>
									</select>
								</li>
							</ul>
						</div>
						<div class="group-content col-md-8 col-md-offset-2">
							<c:forEach items="${group.value}" var="label">
								<label class="tag-label" data-id="${label.id}" data-status="#ffffff">${label.name}</label>
							</c:forEach>
							<label class="add-sort-label" data-toggle="modal" data-target="#addLabelModal"  data-whatever="addGroupLabel" data-id="${group.key.id}" data-name="${group.key.name}">
								+
							</label>
						</div>	
				    </div>
			    </c:forEach>
			    <div class="label-group add-group">
					<div class="group-header add-labelGroup col-md-10 col-md-offset-1">
						<span id="add-labelGroup">+新建标签组</span>
						<!-- 编辑按钮 -->
						<div class="add-form">
							<form class="edit-group-form">
								<input type="text" class="form-control" id="labelGroupName" value="" placeholder="例如：施工文明"  style="width:130px;float:left"/>
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
<div class="modal fade  bs-example-modal-sm" id="addLabelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">新增标签</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">标签名称</label>
            <input type="text" class="form-control" id="label-name" >
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">标签分组</label>
            <select class="form-control group-option" name="">
				<option value="">添加至</option>
				<c:forEach items="${groupList}" var="label">
					<option value="${label.id}">${label.name}</option>
				</c:forEach>
			</select>
			<input type="text" class="form-control" id="group-name" readonly style="display:none">
          </div>
        </form>
      </div>
      <div class="modal-footer">
      	<span id="callback-message" style="float:left;color:red"></span>
        <button type="button" class="btn btn-primary" id="confirm">确认</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="../../Common/include/script.jsp" %>   
<script>
	//新建
	$("#add-labelGroup").click(function(){
		$(this).hide();
		$(".add-unsort-label").hide();
		$(".edit-unsort-group-form").hide();
		$(".edit-unsort-group-btn").show();
		$(this).next(".add-form").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".delete-group").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
		$(".tag-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
		$(".add-sort-label").hide();
	});
	$("#save").click(function(){
		var name=$("#labelGroupName").val();
		if(name==""){
			confirm("名称不能为空",function(){
				window.location.reload();
			});
		}else{
			$.post("<%=request.getContextPath() %>/labelGroup/addLabelGroup",
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
	//编辑
	 $(".edit-group-btn").click(function(){
	 	$(".edit-unsort-group-form").hide();
	 	$(".edit-unsort-group-btn").show();
	 	$(".add-sort-label").hide();
	 	$(".add-unsort-label").hide();
	 	$("#add-labelGroup").show();
	 	$(".add-form").hide(); 
	 	$(this).parent(".edit-group-box").hide();
	 	$(this).parents(".label-group").find(".edit-form").show();
	 	$(this).parents(".label-group").find(".edit-sort-group-form").hide();
	 	$(this).parents(".label-group").find(".edit-sort-group-btn").hide();
	 	$(this).parents(".label-group").find(".delete-group").show();
	 	$(this).parent(".edit-group-box").siblings(".delete-group").show(); 	
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
	 	$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
	 	$(".group-content label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	 });
	 
	 $(".delete-group").click(function(e){
	 		var id=$(this).attr("data-id");
	 		e.preventDefault();
	 		confirm("确认要删除该标签组么?",function(result){
	 			if(result){
					$.post("<%=request.getContextPath() %>/labelGroup/deleteLabelGroup",
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
		$.post("<%=request.getContextPath() %>/labelGroup/edit",
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
	$(".edit-unsort-group-btn").click(function(){
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-sort-group-form").hide();
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-form").hide();
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-sort-group-btn").show();
		$(this).parents(".label-group").nextAll(".label-group").find(".edit-group-box").show();
		$("#add-labelGroup").show();
	 	$(".add-form").hide(); 
		$(this).hide();
		$(".tag-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
		$(".edit-unsort-group-form").show();
		$(this).parent().next().children("label:not(.add-unsort-label)").css({"background-color":"#efefef","cursor":"pointer"}).attr("data-status","#efefef");
		$(this).parent().next().children(".add-unsort-label").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-unsort-group-form").hide();
	});
	$("#groupOption").change(function(){
		var id_list=getLabelId();
		var ids=id_list.join("|");
		var	group_id=$(this).find("option:selected").val();
		$.post("<%=request.getContextPath() %>/labelRelatedGroup/adminLabel",
					{labelList:ids,
					 groupId:group_id},
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
 		$(this).parents(".group-header").next().children(".add-unsort-label").hide();
 		$(this).parents(".group-header").next().children("label:not(.add-unsort-label)").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	});
	$(".delete-unsort-label").click(function(e){
		e.preventDefault();
		confirm("确认要删除选中的标签吗",function(result){
			if(result){
				var id_list=getLabelId();
				var ids=id_list.join("|");
				$.post("<%=request.getContextPath() %>/label/deleteLabel",
							{idList:ids},
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
	$(".tag-label").on("click",function() {
		if($(this).attr("data-status")!="#ffffff"){
			var toggle = $(this).attr("data-status") == "#efefef" ? "#ceebeb" : "#efefef";
		    $(this).css("background-color", toggle).attr("data-status", toggle);    
		}
	});
	function getLabelId() {
		var id_list = [];
		$("label").each(function() {
		   if($(this).attr('data-status')== "#ceebeb") id_list.push($(this).data("id"));	  
		});
		console.log(id_list);
		return id_list;
	};
	 $(".edit-sort-group-btn").click(function(){
	 	$("label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	 	$(".add-sort-label").hide();
	 	$(".add-unsort-label").hide();
	 	$("#add-labelGroup").show();
	 	$(".add-form").hide();
	 	$(this).hide();
	 	$(this).prev().prev().prev().children(".edit-group-btn").hide();
	 	$(this).next().show();
	 	$(this).parent().next().children("label:not(.add-sort-label)").css({"background-color":"#efefef","cursor":"pointer"}).attr("data-status","#efefef");
		$(this).parent().next().children(".add-sort-label").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
		$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
		$(".edit-unsort-group-form").hide();
		$(".edit-unsort-group-btn").show();
	 });
	$(".delete-group-label").click(function(e){
		var id_list=getLabelId();
		var ids=id_list.join("|");
		var groupId=$(this).data("id");
		e.preventDefault();
		confirm("确认要删除选中的标签",function(result){
			if(result){
				$.post("<%=request.getContextPath() %>/labelRelatedGroup/deleteLabel",
						{
						 labelList:ids,
						 groupId:groupId
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
			}
		});
		
	});
	$(".groupOption").change(function(){
		var id_list=getLabelId();
		var ids=id_list.join("|");
		var	group_id=$(this).find("option:selected").val();
		$.post("<%=request.getContextPath() %>/labelRelatedGroup/adminLabel",
					{labelList:ids,
					 groupId:group_id},
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
 		$(this).parents(".edit-sort-group-form").hide();
 		$(this).parents(".edit-sort-group-form").prev(".edit-sort-group-btn").show();
 		$(this).parents(".group-header").next().find(".add-sort-label").hide();
 		$(this).parents(".group-header").next().children("label:not(.add-sort-label)").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
 	}); 
	$("#addLabelModal").on('shown.bs.modal', function (event){
		var button=$(event.relatedTarget);
		var addType=button.data("whatever");
		var modal=$(this);
		if(addType=="addUnsortLabel"){
			modal.find("#confirm").click(function(){
				var name=modal.find("#label-name").val();
				var groupId=modal.find(".group-option").children("option:selected").val();
				$.post("<%=request.getContextPath() %>/label/addLabel",
						{name:name,
						 groupId:groupId
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
		} else if(addType="addGroupLabel"){
			modal.find(".group-option").hide();
			modal.find("#group-name").val(button.attr("data-name"));
			modal.find("#group-name").show();
			//确认添加后
			modal.find("#confirm").click(function(){
				var name=modal.find("#label-name").val();
				var labelGroupId=button.data("id");
				
				$.post("<%=request.getContextPath() %>/labelRelatedGroup/addLabel",
						{
						  name:name,
						  labelGroupId:labelGroupId
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
		}
	});
</script>
</body>
</html>

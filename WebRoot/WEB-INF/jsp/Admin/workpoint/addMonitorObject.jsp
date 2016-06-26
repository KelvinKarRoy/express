<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../../Common/include/meta.jsp" %>
<title>新建工点(监测对象)</title>
<%@ include file="../../Common/include/css.jsp" %>
<style type="text/css">
	 .content-header h1{
		font-family:"microsoft yahei";
		font-size: 20px;
		color: #3C8DBC;
	}
	.box-title{
		padding-top:15px;
		padding-left:15px;
		font-size:18px !important;
		color:#333 !important;
	}
	.monitor-object {
		width: 80%;
		margin: 10px auto;
	}
	.monitor-object-title ,.monitor-object-add{
		font-size:18px;
		color:#333;
		float:left;
		background:#fff;
		padding-top:4px;
		padding-right:5px;
	}
	.monitor-object-edit{
		float:left;
		display:none;
		background:#fff;
		color:#ccc;
		padding:6px 8px;
	}
	.monitor-object-name {
		width:100px;
		display: inline-block;
	}
	.monitor-project-edit {
		font-size:14px;
		background:#fff;
		padding-top:3px;
		padding-left:10px;
		color: #666;
		float: right;
		cursor:pointer;
	}
	.monitor-object-cancel {
		padding:5px 8px 10px;
		background:#fff;
		color: #999;
		margin-left: 10px;
		cursor:pointer;
	}
	.monitor-project-bar .monitor-object-cancel{
		margin-left:0;
	}
	.monitor-object-remove {
		background:#fff;
		padding-top:5px;
		padding-left:8px;
		color: #bc4343;
		float: right;
		cursor:pointer;
	}
	.monitor-object-header {
		margin-bottom: 10px;
	}
	.monitor-object-header > button {
		margin-left: 10px;
	}
	.monitor-list {
		overflow: hidden;
	}
	.monitor-list  .monitor-label {
		color:#5E5E5E;
		width: 120px;
		border-radius: 10px;
		list-style: none;
		float: left;
		height: 20px;
		margin: 5px 10px;
		text-align:center;
		line-height:20px;
		overflow:hidden;
		text-overflow:ellipsis;
		background-color:#ffffff;
	}
	.add-monitor-project{
		color:#5E5E5E;
		width: 120px;
		border-radius: 10px;
		list-style: none;
		float: left;
		height: 20px;
		border:1px dashed #ccc !important;
		margin: 5px 10px;
		text-align:center;
		line-height:20px;
		overflow:hidden;
		text-overflow:ellipsis;
		background-color:#fff !important;
		display:none;
		cursor:pointer;
	}
	.monitor-object-add{
		 color: #3c8dbc;
     	cursor: pointer;
	}
	.monitor-object-header{
		background:#fff;
		padding:0;
		height:32px;
		
	}
	.monitor-object-header:not(.add-header){
		background:#fff;
		padding:0;
		height:32px;
		background:url('<%=request.getContextPath() %>/assets/images/group-hd-bg.gif') 0 50% repeat-x;
	}
	
	.monitor-object-header:{
		background:#fff;
		padding:0;
		height:32px;
		background:url('<%=request.getContextPath() %>/assets/images/group-hd-bg.gif') 0 50% repeat-x;
	}
	.monitor-object-box{
		display: inline-block;
   		background: #fff;
   		max-width: 300px;
  		padding-right: 20px;
	}
	.modal-title{
		font-family:"microsoft yahei";
		font-size:18px;
		color:#333;
	}
	.form-group>.control-label{
		font-size:16px;
		color:#333;
		background:#fff !important;
	}
	.monitor-object-bar:hover .monitor-object-edit{
		display:block;
	}
	.remove-object{
		display:none;
	}
	
	</style>
</head>
<body>
<%@ include file="../include/navbar.jsp" %>	
<div class="content-wrapper" style="min-height: 542px;">
	<section class="content-header">
    	<h1>新建工点</h1>
	    <ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath() %>/index">首页</a></li>
	        <li><a href="<%=request.getContextPath() %>/route/list">线路编辑</a></li>
	        <li><a href="#">${route.name}</a></li>
	        <li class="active"><c:if test="${edit!=1}">新建对象</c:if>
	         <c:if test="${edit==1}">编辑对象</c:if></li>
	    </ol>
    </section>
	<section class="content">
		<div class="box">
			<div class="box-header">
				<div class="box-title">监测对象</div>
			</div>
			<div class="box-body">
				<c:forEach items="${map}" var="monitor">
					<div class="monitor-object ">
						<div class="monitor-object-header">
							<div class="monitor-object-bar">
								<span class="monitor-object-title">${monitor.key.name}</span>
								<a href="javascript:;" class="monitor-object-edit">编辑</a>
							</div>
							<span class="monitor-project-edit">
								<span class="glyphicon glyphicon-edit" style="vertical-align:middle;margin-bottom:2px;"></span> 编辑该监测对象
							</span>
							<div class="monitor-object-box" style="display:none">
								<span><input class="form-control monitor-object-name" type="text" value="${monitor.key.name}"></span>
								<button class="btn btn-primary save save-edit" data-id="${monitor.key.id}">保存</button>
								<span class="monitor-object-cancel cancel-edit">取消</span>
							</div>
							<span class="monitor-object-remove remove-Btn remove-object" data-id="${monitor.key.id}">删除该对象</span>
							<div class="monitor-project-bar" style="display:none">
								
								<span class="monitor-object-remove remove-btn" data-id="${monitor.key.id}" style="float:right">删除监测项目</span>
								<span class="monitor-object-cancel" style="float:right">取消</span>
							</div>
						</div>
						<ul class="monitor-list">
							<c:forEach items="${monitor.value}" var="project">
								<li class="monitor-label"  data-id="${project.id}" data-status="#ffffff"> ${project.name}</li>
							</c:forEach>
								<li class="add-monitor-project" data-toggle="modal" data-target="#addMonitorProjectModal" data-objectId="${monitor.key.id }" data-workpointId="${workpoint.id}">+</li>
						</ul>
					</div>
				</c:forEach>
				
				<!-- 新建监测对象 -->
				<div class="monitor-object">
					<div class="monitor-object-header add-header">
						<span class="monitor-object-add">+新建对象</span>
						<span class="monitor-object-box" style="display:none">
							<span><input class="form-control monitor-object-name" style="width:130px;float:left;margin-right:8px;" type="text" placeholder="例如：高架桥"></span>
							<button class="btn btn-primary save save-add " data-id="${workpoint.id}">保存</button>
							<span class="monitor-object-cancel cancel-new">取消</span>
						</span>
					</div>
				</div>
			</div>
			<div class="box-footer text-right">
				<c:if test="${edit!=1}">
					<a href="<%=request.getContextPath()%>/route/list">跳过</a>
					<a href="<%=request.getContextPath()%>/workpoint/editWorkpointInfo?workpointId=${workpoint.id}">
	            	<button type="button" class="btn btn-default">上一步</button>
	        		</a>
	            	<a href="<%=request.getContextPath()%>/riskSource/showAdd?workpointId=${workpoint.id}">
	            	<button type="button" class="btn btn-primary" id="next-step">下一步</button>
	            	</a>
            	</c:if>
            	<c:if test="${edit==1}">
            		<a href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}">
	            	<button type="button" class="btn btn-primary">完成</button>
	        		</a>
            	</c:if>
            </div>
		</div>
	</section>
</div>
<!-- 新建监测项目弹窗 -->
<div class="modal fade  bs-example-modal-sm" id="addMonitorProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">新增监测项目</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">监测项目类型</label>
            <select class="form-control monitorType" name="">
				<c:forEach items="${monitorTypes}" var="types">
					<option value="${types.sorts}" data-id="${label.id}" data-status="#ffffff">${types.itemname}</option>
				</c:forEach>
			</select>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">监测项目名称</label>
			<input type="text" class="form-control" id="monitor-project-name">
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
	//新建监测对象
	$(".monitor-object-add").click(function(){
		$(this).hide().next(".monitor-object-box").show();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-object-bar").show();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-project-edit").show();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-object-box").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".remove-object").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-project-bar").hide();
		$(".monitor-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
		$(".add-monitor-project").hide();
	});
	//保存新建
	$(".save-add").click(function(){
		var name=$(this).parent(".monitor-object-box").find(".monitor-object-name").val();
		var workpointId=$(this).attr("data-id");
		$.post("<%=request.getContextPath()%>/monitorobject/add",
		   {
		   	name:name,
		    workpointId:workpointId
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
	//取消新建
	$(".cancel-new").click(function(){
		$(".monitor-object-add").show().next(".monitor-object-box").hide();
	});
	//编辑
	$(".monitor-object-edit").click(function(){
		$(this).parent(".monitor-object-bar").hide();
		$(this).parent(".monitor-object-bar").nextAll(".monitor-project-edit").hide();
		$(this).parent(".monitor-object-bar").nextAll(".monitor-project-bar").hide();
		$(this).parent(".monitor-object-bar").nextAll(".monitor-object-box").show();
		$(this).parent(".monitor-object-bar").nextAll(".monitor-object-remove").show();	
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-object-box").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-project-bar").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".remove-object").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-project-edit").show();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-object-bar").show();
		$(".add-monitor-project").hide();
		$(".monitor-object-add").show();
		$(".monitor-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	});
	//删除监测对象
	$(".remove-Btn").click(function(e){
		e.preventDefault();
		var id=$(this).attr("data-id");
		confirm("确认要删除此对象",function(result){
			if(result){
				$.post("<%=request.getContextPath()%>/monitorobject/delete",
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
	//编辑保存
	$(".save-edit").click(function(){	
		var name=$(this).prev("span").find(".monitor-object-name").val();
		var id=$(this).attr("data-id");
	    $.post("<%=request.getContextPath()%>/monitorobject/edit",
		   {	name:name,
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
	//取消编辑
	$(".cancel-edit").click(function(){
		$(this).parent(".monitor-object-box").hide();
		$(this).parent(".monitor-object-box").next(".monitor-object-remove").hide();
		$(this).parent(".monitor-object-box").prev(".monitor-project-edit").show();
		$(this).parent(".monitor-object-box").prev(".monitor-project-edit").prev(".monitor-object-bar").show();	
	});
	//点击多个监测对象后进行的操作
	$(".monitor-label").click(function() {
		if($(this).data("status")!="#ffffff"){
			var toggle = $(this).data("status") == "#efefef" ? "#ceebeb" : "#efefef";
		    $(this).css("background-color", toggle).data("status", toggle);
		}
	});
	//获取选中的id集合
	function getLabelId() {
		var id_list = [];
		$(".monitor-label").each(function() {
		   if($(this).data("status") == "#ceebeb") id_list.push($(this).data("id"));
		});
		return id_list;
	};
	//编辑该监测对象
	$(".monitor-project-edit").click(function(){
		$(this).hide();
		$(".monitor-object-add").show();
		$(this).parents(".monitor-object-header").find(".monitor-project-bar").show();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-project-bar").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-object-box").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".remove-object").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-object-bar").show();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-project-edit").show();		
		$(this).parents(".monitor-object").find(".add-monitor-project").show();
		$(this).parents(".monitor-object").find(".monitor-label").css({"background-color":"#efefef","cursor":"pointer"}).attr("data-status","#efefef");
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".add-monitor-project").hide();
		$(this).parents(".monitor-object").siblings(".monitor-object").find(".monitor-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
	});
	//删除选中的监测项目
	$(".remove-btn").click(function(e){		
		var id_list=getLabelId();
		var idList=id_list.join("|");
		e.preventDefault();
		confirm("确认要删除选中的监测项目么",function(result){
			if(result){
				$.post("<%=request.getContextPath()%>/monitorproject/delete",
				   {idList:idList},
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
	//取消编辑监测对象下面的的监测项目
	$(".monitor-object-cancel").click(function(){
		$(this).parent(".monitor-project-bar").hide();
		$(this).parents(".monitor-object-header").find(".monitor-project-edit").show();
		$(this).parent(".monitor-project-bar").prev(".monitor-object-remove").prev(".monitor-object-box").prev(".monitor-object-bar").find(".monitor-project-edit").show();
		$(".monitor-label").css({"background-color":"#ffffff","cursor":"auto"}).attr("data-status","#ffffff");
		$(".add-monitor-project").hide();
	});	
	//新建监测项目
	$("#addMonitorProjectModal").on('shown.bs.modal', function (event){
		var modal=$(this);
		var button=$(event.relatedTarget);
		modal.find("#confirm").click(function(){
			var type=modal.find(".monitorType").children("option:selected").val();
			var name=modal.find("#monitor-project-name").val();
			var workpointId=button.attr("data-workpointId");
			var monitorobjectId=button.attr("data-objectId");
			if(name=="")
			{
				modal.find("#callback-message").text("监测项目名不能为空");
			}else{
				$.post("<%=request.getContextPath()%>/monitorproject/add",
				   {
				 	type:type,
				 	name:name,
				 	workpointId:workpointId,
				 	monitorobjectId:monitorobjectId
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

</script>	
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../Common/include/meta.jsp" %>
	<title>武汉地铁风险预警系统</title>
	<%@ include file="../../Common/include/css.jsp" %>	
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
	        <li class="active"><c:if test="${edit==1}">编辑工点</c:if><c:if test="${edit!=1}">新建工点</c:if></li>
	    </ol>
    </section>
	<section class="content">
		<div class="box">
			<div class="box-header">
				<div class="box-title">工点信息</div>
				<c:if test="${edit==1}">
				<span id="delete-workpoint" style="float:right" data-id="${workpoint.id}">删除工点</span>
				</c:if>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-5 col-md-offset-1">
						<div class="form-group">
							<label>工点名称</label> 
							<input type="text" class="form-control" id="workpointName" value="${workpoint.name}" name="workpointName" required maxlength="6"  placeholder="必填，6字内">
						</div>
						<div class="form-group">
							<label>工点类型</label>
							<select class="form-control" name="workpointType" id="workpointType" required>
								<option <c:if test="${workpoint.type==1}">selected</c:if> value="1">车站</option>
								<option <c:if test="${workpoint.type==2}">selected</c:if> value="2">区间</option>
								<option <c:if test="${workpoint.type==3}">selected</c:if> value="3">车辆厂</option>
							</select>
						</div>
						<div class="form-group">
							<label>工点长度（单位：m）</label> 
							<input type="text" class="form-control" id="workpointLength" value="${workpoint.length}" name="workpointLength" required maxlength="16" placeholder="选填">
						</div>
						<div class="form-group">
							<label>开工时间</label> 
							<input type="date" class="form-control" id="startTime" value="<fmt:formatDate value="${workpoint.startTime}" pattern="yyyy-MM-dd"/>" name="startTime" required>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label>所属标段</label> 
							<input type="text" class="form-control" id="workpointSection" value="${workpoint.section}" name="workpointSection" required maxlength="20" placeholder="必填，20字内">
						</div>
						<div class="form-group">
							<label>施工类型</label>
							<select class="form-control" name="constructType" id="constructType" required>
								<option <c:if test="${workpoint.constructType==1}">selected</c:if> value="1">高架</option>
								<option <c:if test="${workpoint.constructType==2}">selected</c:if> value="2">明控</option>
								<option <c:if test="${workpoint.constructType==3}">selected</c:if> value="3">盾构</option>
								<option <c:if test="${workpoint.constructType==4}">selected</c:if> value="4">爆破</option>
							</select>
						</div>
						<div class="form-group">
							<label>工点状态</label>
							<select class="form-control" name="workpointStatus" id="workpointStatus" required>
								<option  <c:if test="${workpoint.status==0}">selected</c:if> value="0">施工中</option>
								<option <c:if test="${workpoint.status==1}">selected</c:if> value="1">已完成</option>
								<option <c:if test="${workpoint.status==-1}">selected</c:if> value="-1">未施工</option>
							</select>
						</div>
						<div class="form-group">
							<label>完工时间</label> 
							<input type="date" class="form-control" id="endTime" value="<fmt:formatDate value="${workpoint.finishTime}" pattern="yyyy-MM-dd"/>" name="endTime" required>
						</div>
					</div>
			    </div>
			    <div class="row">
					<div class="col-md-10 col-md-offset-1">
					    <div class="form-group">
							<label>工点描述</label> 
							<textarea class="form-control" id="workpointDesc" name="workpointDesc">${workpoint.description}</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer text-right">
				<c:if test="${edit!=1}">
					<a href="<%=request.getContextPath() %>/route/list">
					<button type="button" class="btn btn-default">取消</button>
					</a>
	            	<button type="button" class="btn btn-primary" id="next-step" data-id="${route.id}">下一步</button>
            	</c:if>
            	<c:if test="${edit==1}">
            		<a href="<%=request.getContextPath() %>/workpoint/index?id=${workpoint.id}">
					<button type="button" class="btn btn-default">取消</button>
					</a>
	            	<button type="button" class="btn btn-primary" id="save" data-wId="${workpoint.id}" data-rId="${workpoint.routeId}">保存</button>
            	</c:if>	
            </div>
		</div>
	</section>
</div>

<%@ include file="../../Common/include/script.jsp" %>	
<script src="<%=request.getContextPath() %>/assets/plugins/datepicker/bootstrap-datepicker.js"></script>  
 <script>
	
	//新建工点操作
	$("#next-step").click(function(){
	var	 name=$("#workpointName").val(),
		 type=$("#workpointType").val(),
		 length=$("#workpointLength").val(),
		 startTime=new Date($("#startTime").val()),
		 section=$("#workpointSection").val(),
		 constructType=$("#constructType").val(),
		 status=$("#workpointStatus").val(),
		 description=$("#workpointDesc").val(),
		 routeId=$(this).attr("data-id");
		$.post(
			"<%=request.getContextPath()%>/workpoint/add",
			{
				name:name,
				type:type,
				length:length,
				startTime:startTime,
				section:section,
				constructType:constructType,
				status:status,
				description:description,
				routeId:routeId
			},
			function(data){
				if(data.code=="200")
				{
				 var workpointId=data.object.id;
				 window.location.href="<%=request.getContextPath()%>/monitorobject/show?workpointId="+workpointId;
				}else if(data.code="201")
				{
					confirm(data.message,function(){
						window.location.reload();
					});
				}
	 		},"json");
	});
	
	//编辑工点操作
	$("#save").click(function(){
	var	 name=$("#workpointName").val(),
		 type=$("#workpointType").val(),
		 length=$("#workpointLength").val(),
		 startTime=new Date($("#startTime").val()),
		 section=$("#workpointSection").val(),
		 constructType=$("#constructType").val(),
		 status=$("#workpointStatus").val(),
		 description=$("#workpointDesc").val();
		 workpointId=$(this).attr("data-wId");
		 routeId=$(this).attr("data-rId");
		
		$.post(
			"<%=request.getContextPath()%>/workpoint/edit",
			{
				name:name,
				type:type,
				length:length,
				startTime:startTime,
				section:section,
				constructType:constructType,
				status:status,
				description:description,
				routeId:routeId,
				id:workpointId
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
	
	//删除工点操作
	$("#delete-workpoint").click(function(event){
		var workpointId=$(this).attr("data-id");
		event.preventDefault();
		
		confirm("确认要删除该工点吗",function(result){
			if(result)
			{
			 	console.log("workpointId"+workpointId);
				//执行删除操作
				$.post(
					"<%=request.getContextPath()%>/workpoint/delete",
					{id:workpointId},
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

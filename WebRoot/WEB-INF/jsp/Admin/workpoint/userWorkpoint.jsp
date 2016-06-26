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
${roleUsers}

<div class="content-wrapper" style="min-height: 542px;">
	<section class="content-header">
    	<h1>编辑工点</h1>
	    <ol class="breadcrumb">
	        <li><a href="#">首页</a></li>
	        <li><a href="#">线路编辑</a></li>
	        <li><a href="#"></a></li>
	        <li class="active">编辑工点</li>
	    </ol>
    </section>
	<section class="content">
		<form>
		<div class="box">
			<div class="box-header">
				<div class="box-title">工点信息</div>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-md-5 col-md-offset-1">
						<div class="form-group">
							<label>工点名称</label> 
							<input type="text" class="form-control" id="workpointName" value="" name="workpointName" required maxlength="16">
						</div>
						<div class="form-group">
							<label>工点类型</label>
							<select class="form-control" name="workpointType" id="workpointType" required>
								<option  value="1">车站</option>
								<option  value="2">区间</option>
								<option  value="3">车辆厂</option>
							</select>
						</div>
						<div class="form-group">
							<label>工点长度（单位：KM）</label> 
							<input type="text" class="form-control" id="workpointLength" value="" name="workpointLength" required maxlength="16">
						</div>
						<div class="form-group">
							<label>开工时间</label> 
							<input type="date" class="form-control" id="startTime" value="" name="startTime" required>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label>所属标段</label> 
							<input type="text" class="form-control" id="workpointSection" value="" name="workpointSection" required maxlength="16">
						</div>
						<div class="form-group">
							<label>施工类型</label>
							<select class="form-control" name="constructType" id="constructType" required>
								<option  value="1">高架</option>
								<option  value="2">明控</option>
								<option  value="3">盾构</option>
								<option  value="4">爆破</option>
							</select>
						</div>
						<div class="form-group">
							<label>工点状态</label>
							<select class="form-control" name="workpointStatus" id="workpointStatus" required>
								<option value="0">施工中</option>
								<option value="1">已完成</option>
								<option value="-1">未施工</option>
							</select>
						</div>
						<div class="form-group">
							<label>完工时间</label> 
							<input type="date" class="form-control" id="endTime" value="" name="endTime" required>
						</div>
					</div>
			    </div>
			    <div class="row">
					<div class="col-md-10 col-md-offset-1">
					    <div class="form-group">
							<label>工点描述</label> 
							<textarea class="form-control" id="workpointDesc" name="workpointDesc"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer text-right">
            	<button type="button" class="btn btn-default">取消</button>
            	<button type="button" class="btn btn-primary" id="next-step">下一步</button>
            </div>
		</div>
	</div>
	</form>
	</section>
</div>

<%@ include file="../../Common/include/script.jsp" %>	

   <script src="<%=request.getContextPath() %>/assets/plugins/jquery-minicolors-master/jquery.minicolors.min.js"></script>
   <script src="<%=request.getContextPath() %>/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
    
 <script>

	//编辑工点操作
	$("#edit").click(function(){
	var	 name=$("#workpointName").val(),
		 type=$("#workpointType").val(),
		 length=$("#workpointLength").val(),
		 startTime=new Date($("#startTime").val()),
		 section=$("#workpointSection").val(),
		 constructType=$("#constructType").val(),
		 status=$("#workpointStatus").val(),
		 description=$("#workpointDesc").val();
	var	 workpointId=${workpointId};
	var	 routeId=${routeId};
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
				workpointId:workpointId
			},
			function(data){
	 			alert(data.message);
	 		},"josn");
	});
	
 </script>
</body>
</html>

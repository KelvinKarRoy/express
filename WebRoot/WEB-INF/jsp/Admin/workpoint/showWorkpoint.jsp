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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/plugins/select2/select2.min.css">
	<style type="text/css">
		.pagination {
			margin: 0 10px;
		}
		table.workpoint-info .tip {
			color: #999;
		}
		table.workpoint-info .divider {
			border-bottom: 1px solid #999;
			vertical-align: top;
		}
		table.workpoint-info tr {
			height: 30px;
			vertical-align: bottom;
		}
		.box-title  .form-control {
			display: inline-block;
			width: 160px;
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
		.monitor-object-name {
			width:100px;
			display: inline-block;
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
    	<h1>宝通寺</h1>
    	<ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath() %>/index">首页</a></li>
	        <li><a href="#">${workpoint.name}</a></li>
	    </ol>
    </section>
	<section class="content">
	<div class="row">
		<div class="col-md-8">
			<div class="box">
				<div class="box-header">
					<div class="box-title">监测对象</div>
					<span class="pull-right"><a href="<%=request.getContextPath() %>/monitorobject/show?edit=1&workpointId=${workpoint.id}">编辑监测对象</a></span>
				</div>
				<div class="box-body">
					<c:forEach items="${structure}" var="monitor">
						<div class="monitor-object ">
							<div class="monitor-object-header">
								<div class="monitor-object-bar">
									<span class="monitor-object-title">${monitor.key.name}</span>
								</div>
							</div>
							<ul class="monitor-list">
								<c:forEach items="${monitor.value}" var="project">
									<li class="monitor-label"  data-id="${project.id}"> ${project.name}</li>
								</c:forEach>
							</ul>
						</div>
					</c:forEach>
				</div>
	         </div>
	         <div class="box">
				<div class="box-header">
					<span class="pull-right"><a href="<%=request.getContextPath() %>/riskSource/showAdd?edit=1&workpointId=${workpoint.id}">编辑风险源</a></span>
					<div class="box-title">风险源</div>
				</div>
				<div class="box-body">
					<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>风险源名称</th>
							<th>关键字</th>
							<th>类型</th>
							<th>等级</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${risksources}" var="risk">
							<tr>
								<td>${risk.name}</td>
								<td>${risk.keyword}</td>
								<td>
									<c:if test="${risk.type==1}">环境</c:if>
									<c:if test="${risk.type==2}">工程本体</c:if>
									<c:if test="${risk.type==3}">施工</c:if>
								</td>
								<td>
									<c:if test="${risk.level==1}">一级</c:if>
									<c:if test="${risk.level==2}">二级</c:if>
									<c:if test="${risk.level==3}">三级</c:if>
								</td>
								<td>
									<span class="text-danger">重点关注</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<div class="box-footer">
				  <ul class="pagination">
	                     <li>
	                         <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}"</c:if>>首页</a>
	                     </li>
	                     <li>
	                         <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&page_num=${paging_vo.prePage}"</c:if>>
	                             <span aria-hidden="true">&laquo;</span>
	                         </a>
	                     </li>
	                     <c:forEach begin="${paging_vo.pageNumStart }" end="${paging_vo.pageNumEnd }"  var="pageIndex">
	                         <c:if test="${paging_vo.currentPage==pageIndex }">
	                             <li class="active"><a href="javascript:;">${pageIndex}</a></li>
	                         </c:if>
	                         <c:if test="${paging_vo.currentPage!=pageIndex }">        
	                             <li><a href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&page_num=${pageIndex}">${pageIndex}</a></li>
	                         </c:if>
	                     </c:forEach>
	                     <li>
	                         <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&page_num=${paging_vo.nextPage}"</c:if>>&raquo;</a>
	                     </li>
	                     <li>
	                         <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&page_num=${paging_vo.totalPage}"</c:if>>尾页</a>
	                     </li>
	                 </ul>
           		 </div>
	         </div>
	         <div class="box">
				<div class="box-header">
					<span class="pull-right"><a href="<%=request.getContextPath()%>/monitorPoint/showDetail?edit=1&workpointId=${workpoint.id}">编辑测点</a></span>
					<div class="box-title">
						<form action="<%=request.getContextPath() %>/workpoint/index?id=${workpoint.id}" method="post">
						测点详情　<input type="text" class="form-control" name="serachName"  placeholder="请输入测点编号">&nbsp;
						<button class="btn btn-primary" type="submit">搜索</button>
						</form>
					</div>
				</div>
				<div class="box-body">
					<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>测点编号</th>
							<th>监测对象</th>
							<th>监测项目</th>
							<th>初值</th>
							<th>正一级</th>
							<th>正二级</th>
							<th>正三级</th>
							<th>负一级</th>
							<th>负二级</th>
							<th>负三级</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${monitorPoints}" var="monitor">
							<tr>
								<td>${monitor.name}</td>
								<td>${monitor.monitorObjectName}</td>
								<td>${monitor.monitorProjectName}</td>
								<td>${monitor.first}</td>
								<td>${monitor.negthresholdOne}</td>
								<td>${monitor.negthresholdTwo}</td>
								<td>${monitor.negthresholdThree}</td>
								<td>${monitor.posthresholdOne}</td>
								<td>${monitor.posthresholdTwo}</td>
								<td>${monitor.posthresholdThree}</td>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
				</div>
				<div class="box-footer">
				  <ul class="pagination">
                     <li>
                         <a <c:if test="${monitor_paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}"</c:if>>首页</a>
                     </li>
                     <li>
                         <a <c:if test="${monitor_paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&monitorPageNum=${monitor_paging_vo.prePage}"</c:if>>
                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>
                     <c:forEach begin="${monitor_paging_vo.pageNumStart }" end="${monitor_paging_vo.pageNumEnd }"  var="pageIndex">
                         <c:if test="${monitor_paging_vo.currentPage==pageIndex }">
                             <li class="active"><a href="javascript:;">${pageIndex}</a></li>
                         </c:if>
                         <c:if test="${monitor_paging_vo.currentPage!=pageIndex }">        
                             <li><a href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&monitorPageNum=${pageIndex}">${pageIndex}</a></li>
                         </c:if>
                     </c:forEach>
                     <li>
                         <a <c:if test="${monitor_paging_vo.currentPage!=monitor_paging_vo.totalPage }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&monitorPageNum=${monitor_paging_vo.nextPage}"</c:if>>&raquo;</a>
                     </li>
                     <li>
                         <a <c:if test="${monitor_paging_vo.currentPage!=monitor_paging_vo.totalPage }"> href="<%=request.getContextPath()%>/workpoint/index?id=${workpoint.id}&monitorPageNum=${monitor_paging_vo.totalPage}"</c:if>>尾页</a>
                     </li>
                 </ul>
	            </div>
	         </div>
	         <div class="box">
				<div class="box-header">
					<div class="box-title">工点成员</div>
				</div>
				<div class="box-body">
					
				</div>
				<div class="box-footer">
				  
	            </div>
	         </div>
	    </div>
	    <div class="col-md-4">
			<div class="box">
				<div class="box-body" style="border-left: 5px solid ${route.color}"><!-- 颜色绑定数据请修改 #f00 值 -->
					<table class="text-center workpoint-info" style="width: 95%;margin:0 auto;">
					<tr>
						<td rowspan="2" style="vertical-align:middle"><span style="font-size: 28px">${workpoint.name}</span></td>
						<td class="tip">工点长度</td>
						<td><a href="<%=request.getContextPath() %>/workpoint/editWorkpointInfo?workpointId=${workpoint.id}">编辑工点</a></td>
					</tr>
					<tr class="divider">
						<td>${workpoint.length}</td>
						<td></td>
					</tr>
					<tr>
						<td class="tip">所属线路</td>
						<td class="tip">所属标段</td>
						<td class="tip">工点状态</td>
					</tr>
					<tr class="divider">
						<td>${route.name}</td>
						<td>${workpoint.section}</td>
						<td>
							<c:if test="${workpoint.status==-1}">未施工</c:if>
							<c:if test="${workpoint.status==0}">施工中</c:if>
							<c:if test="${workpoint.status==-1}">已完成</c:if>
						</td>
					</tr>
					<tr>
						<td class="tip">开工时间</td>
						<td></td>
						<td class="tip">完工时间</td>
					</tr>
					<tr class="divider">
						<td><fmt:formatDate value="${workpoint.startTime}" pattern="yyyy-MM-dd"/></td>
						<td>——</td>
						<td><fmt:formatDate value="${workpoint.finishTime}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: left;vertical-align:middle;height: 140px;">${workpoint.description}</td>
					</tr>
					</table>
				</div>
		     </div>
		</div>
	</div>

	</section>
</div>
<%@ include file="../../Common/include/script.jsp" %>
<script>
	
</script>
</body>
</html>

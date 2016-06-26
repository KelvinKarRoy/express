<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>用户列表</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@ include file="../../Common/include/css.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/styles/child.css">
<style type="text/css">
.bottom-10 {
	margin-bottom: 10px;
}
/* 补充bs */

.content-wrapper{
	margin-left:10%;
}
section.content{
	padding:3px 15px 15px 15px;
}
.box-body{
	padding: 20px 20px 0 20px;
}

</style>
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sidebar-mini">
	<%@ include file="../include/navbar.jsp" %>	
	<!-- 中间内容 -->
	<div class="content-wrapper" style="min-height: 542px;">
		<section class="content">
			<div class="box-header">
				<div class="box-title">账号管理</div>
			</div>
			<div class="box">
				<div class="box-body">
					
					<form name="getUsers" action="<%=request.getContextPath()%>/admin/users/getUserByCondition" class="form-inline bottom-10" method="post" style="float: left">
						<select class="role form-control" name="conditionType" style="float:left">
							<option <c:if test="${conditionType=='cnname'}">selected</c:if> value="cnname">姓名</option>
							<option <c:if test="${conditionType=='phone'}">selected</c:if> value="phone">电话</option>
							<option <c:if test="${conditionType=='group'}">selected</c:if> value="group">单位</option>
						    <option <c:if test="${conditionType=='roleName'}">selected</c:if> value="roleName">角色</option>
						</select>
						<input id="find btn" name="condition" value="${condition}" type="text" class="form-control" />
						<input id="find btn" value="查找" type="submit" class="btn btn-primary" />
						<!-- <input type="reset" value="重置" class="btn btn-primary" /> -->
					</form>
					<!-- 表格结束 -->
					<div class="pull-right">
						<a class="btn btn-success"
							href="<%=request.getContextPath()%>/admin/user/showAdd">新增用户</a>
					</div>
	                
					<!-- 表格 -->
					<table class="table table-bordered table-hover table-striped text-center">
						<thead>
							<tr>
							<!-- <th><input type="checkbox"></th> -->
								<th>姓名</th>
								<th>电话</th>
								<th>所在组织</th>
								<th>账号角色</th>
								<th>账号状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>	
						<c:forEach items="${paging_vo.object}" var="r"  varStatus="ind" >
							<tr>
							<!-- <td><input type="checkbox"></td> -->
								<td>${r.cnname}</td>
								<td>${r.phone}</td>
								<td>${r.groupsName}</td>
								<td>${r.roleName}</td>
								<%-- <td>${r.status}</td> --%>
								<td>
								<c:choose>
										<c:when test="${r.status==-1}">
											<span class="label label-danger">禁用</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success">可用</span>
										</c:otherwise>
									</c:choose></td>
								<td>
									<a href="<%=request.getContextPath()%>/admin/user/showEdit?uid=${r.uid}" >编辑</a> 
									<c:if test="${r.status==1 }">
											<a href="<%=request.getContextPath()%>/admin/user/forbid?uid=${r.uid}&cnname=${r.cnname}" class="btn-forbidden"
												>禁用</a>
									</c:if> 
									<c:if test="${r.status==-1 }">
											<a href="<%=request.getContextPath()%>/admin//user/activate?uid=${r.uid}&cnname=${r.cnname}&phone=${r.phone}" class="btn-activate"
												>启用账号</a>
									</c:if> 
								</td>
							</tr>
						</c:forEach>
						
						</tbody>
					</table>
					<c:choose>
						<c:when test="${paging_vo.totalRecord==0}">
							<div class="empty-table text-center" style="margin: 20px 0">
								<img src="<%=request.getContextPath()%>/assets/images/empty.jpg"
									height="30" width="30"> <span>记录为空</span>
							</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>

					<div>
						<ul class="pagination">
							<li><a
								<c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/admin/users/getUserByCondition?conditionType=${conditionType}&condition=${condition}"</c:if>>首页</a>
							</li>
							<li><a
								<c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/admin/users/getUserByCondition?conditionType=${conditionType}&condition=${condition}&page_num=${paging_vo.prePage}"</c:if>>
									<span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach begin="${paging_vo.pageNumStart }"
								end="${paging_vo.pageNumEnd }" var="pageIndex">
								<c:if test="${paging_vo.currentPage==pageIndex }">
									<li class="active"><a href="javascript:;">${pageIndex}</a></li>
								</c:if>
								<c:if test="${paging_vo.currentPage!=pageIndex }">
									<li><a
										href="<%=request.getContextPath()%>/admin/users/getUserByCondition?page_num=${pageIndex}&conditionType=${conditionType}&condition=${condition}">${pageIndex}</a></li>
								</c:if>
							</c:forEach>
							<li><a
								<c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/admin/users/getUserByCondition?page_num=${paging_vo.nextPage}&conditionType=${conditionType}&condition=${condition}"</c:if>>&raquo;</a>
							</li>
							<li><a
								<c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/admin/users/getUserByCondition?page_num=${paging_vo.totalPage}&conditionType=${conditionType}&condition=${condition}"</c:if>>尾页</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="../../Common/include/script.jsp"%>
	<script>
		$(function() {
			var totalPage = ${paging_vo.totalPage};
			if (totalPage < 2)
				$(".pagination").hide();

			 $(".btn-forbidden").click(function(e) {
				var that =this;
				e.preventDefault();
				
				confirm("确定要禁止吗", function(result) {
					if(result){
						$.get($(that).attr("href"), function(data) {
							window.parent.alert(data.message, null,2000,function() {
								location.reload();
							});
						});
					};
				});
			}); 

			$(".btn-reset").click(function(e) {
				var that =this;
				e.preventDefault();
				confirm("确定要重置吗", function(result) {
					if(result){
						$.get($(that).attr("href"), function(data) {
							window.parent.alert(data.message, null,2000,function() {
								location.reload();
							});
						});
					}
				});
				
			});

			 $(".btn-activate").click(function(e) {
				var that =this;
				e.preventDefault();
				confirm("确定要开启吗", function(result) {
					if(result){
						$.get($(that).attr("href"), function(data) {
							window.parent.alert(data.message, null,2000,function() {
								location.reload();
							});
						});
					}
				});
			}); 

			
		});
	</script>
</body>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>测点编辑</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@ include file="../include/commonCSS.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/assets/styles/child.css">
	<style type="text/css">
	select {
	width:85px !important
	}
	</style>
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body>
	<div class="content-wrapper" style="min-height: 542px;">
		<section class="content">
		<!--测点基本信息  -->
		<form method="post" action="<%=request.getContextPath()%>/monitorPoint/modifyMonitorPoint">
		<div class="box">
			<div class="box-body">
				<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th rowspan="2">名称</th>
							<th rowspan="2">对象</th>
							<th rowspan="2" >类型</th>
							<th rowspan="2">初值</th>
							<th colspan="3">负累计增量</th>
							<th colspan="3">正累计增量</th>
							<th colspan="3">变化速率</th>
							<th rowspan="2">状态</th>
						</tr>
						<tr>
							<th>一级风险</th>
							<th>二级风险</th>
							<th>三级风险</th>
							<th>一级风险</th>
							<th>二级风险</th>
							<th>三级风险</th>
							<th>一级风险</th>
							<th>二级风险</th>
							<th>三级风险</th>
						 </tr>
					</thead>
					<c:forEach items="${monitorPointlist}" var="r">
						<tr>
						    <input type="hidden" value="${idList}" name="idList">
						    <input type="hidden" value="${r.workpointId}" name="workpointId[${r.id}]" >
							<td><input type="text" value="${r.monitorName}" class="form-control" name="monitorName[${r.id}]" ></td>
							<td>
								<select class="form-control" name="monitorObject[${r.id}]">
							 		<c:forEach items="${monitorObjectItem}" var="d">
							 		 <option <c:if test="${r.monitorObject==d.sorts}">selected</c:if> value="${d.sorts}">${d.itemname }</option>
							 		</c:forEach>  		
							    </select>
							</td>
						    <td>
						    	<select class="form-control" name="monitorType[${r.id}]">
							 		<c:forEach items="${monitorTypeItem}" var="t">
							 		 <option <c:if test="${r.monitorType==t.sorts}">selected</c:if> value="${t.sorts}">${t.itemname }</option>
							 		</c:forEach>  		
							    </select>
						    </td>
							<td><input type="text" value="${r.monitorFirst}"class="form-control" name="monitorFirst[${r.id}]"></td>
							<td><input type="text" value="${r.negthresholdOne}" class="form-control" name="negthresholdOne[${r.id}]"></td>
							<td><input type="text" value="${r.negthresholdTwo}" class="form-control" name="negthresholdTwo[${r.id}]"></td>
							<td><input type="text" value="${r.negthresholdThree}" class="form-control" name="negthresholdThree[${r.id}]"></td>
							<td><input type="text" value="${r.posthresholdOne}" class="form-control" name="posthresholdOne[${r.id}]"></td>
							<td><input type="text" value="${r.posthresholdTwo}" class="form-control" name="posthresholdTwo[${r.id}]"></td>
						    <td><input type="text" value="${r.posthresholdThree}" class="form-control" name="posthresholdThree[${r.id}]"></td>
							 <td><input type="text" value="${r.rateOne}" class="form-control" name="rateOne[${r.id}]"></td>
							<td><input type="text" value="${r.rateTwo}" class="form-control" name="rateTwo[${r.id}]"></td>
							<td><input type="text" value="${r.rateThree}" class="form-control" name="rateThree[${r.id}]"></td> 
							<td>
							<select name="status[${r.id}]" class="form-control">
							<option <c:if test="${r.status==4}" >selected</c:if> value="4">停测</option>
							<option <c:if test="${r.status!=4}" >selected</c:if> value="1" >启测</option>
							</select>
							</td>
						</tr>
					 </c:forEach>
				 </table>
			</div>
		    <div class="text-right" style="margin-right:10px;padding-bottom:10px;">
		    	  <button type="button" class="btn btn-default" onclick="history.back()">取消</button>
                 <button type="submit" class="btn btn-primary" id="batchSave">保存</button>
            </div>
		</div>
		</form>
		</section>
	</div>

	<%@ include file="../include/commonScript.jsp"%>
	<script>
	
	</script>
</body>
</html>

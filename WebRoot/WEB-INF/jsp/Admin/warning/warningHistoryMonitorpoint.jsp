<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>测点历史信息表</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@ include file="../include/commonCSS.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/child.css">
<style type="text/css">
.bottom-10 {
	margin-bottom: 10px;
}
.label-info{
    background-color:#FFE42F !important;
}
tr td:last-child{
    overflow:hidden;
    text-align:center;
    vertical-align:baseline;
}
</style>
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="skin-blue sidebar-mini">
	<!-- 中间内容 -->
	<section class="content">
		<div class="box">
			<div class="box-header">
				<div class="box-title">${monitorpointName}历史记录</div>
			</div>
			<div class="box-body">
				<form name="getUsers" action="<%=request.getContextPath()%>/monitorPointData/showHistory" class="form-inline bottom-10" method="post">
					<div class="form-group">
                        <label>开始时间</label>
                        <input type="text" id="datepickerStart" name="startTime" value="${startTime}" class="form-control" data-date-format="yyyy-mm-dd">
                    </div>
                    <div class="form-group">
                        <label>结束时间</label>
                        <input type="text" id="datepickerEnd" name="endTime" value="${endTime}" class="form-control" data-date-format="yyyy-mm-dd">
                    </div>
					<input id="find btn" value="查找" type="submit" class="btn btn-primary" /><br>
					<input name="monitorpointName" type="hidden" value="${monitorpointName}">
					<input name="monitorpointId" type="hidden" value="${monitorpointId}">
					<input name="monitorType" type="hidden" value="${monitorType}">
				</form>
                
				
				<!-- 表格 -->
				<table class="table table-bordered table-hover table-striped text-center">
					<thead>
						<tr>
						<th><input type="checkbox"></th>
							<c:if test="${monitorType==1}">
							   <th>深度</th>		
							</c:if>
							<th>当次测值</th>
							<th>累计增量</th>
							<th>本次变化率</th>
							<th>多日平均变化率</th>
							<th>检测时间</th>
							<th>检测单位</th>
							<th>检测人</th>
							
							<th>预警级别</th>
						</tr>
					</thead>
					
					<tbody>	
					<c:forEach items="${paging_vo.object}" var="r"  varStatus="ind" >
						<tr>
						<td><input type="checkbox"></td>
							<c:if test="${monitorType==1}">
							   	<td>${r.depth}</td>
							</c:if>
							<td>${r.lastData}</td>
							<td>${r.increment}</td>
							<td>${r.rateResult}</td>
							<td>${r.rateThreeday}</td>
							<td>
							<fmt:formatDate value="${r.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
							</td>
							<td>
							<c:if test="${r.createUserRole==5}">施工监测</c:if>
							<c:if test="${r.createUserRole==6}">第三方监测</c:if>
							</td>
							<td>${r.createBy}</td>
							
							<td><span class="label">${r.warningLevel}</span></td>
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

				<!-- 表格结束 -->
				
				<!-- 表格结束 -->
				<div>
					<ul class="pagination">
						<li><a
							<c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/monitorPointData/showHistory?monitorpointId=${monitorpointId}&monitorpointName=${monitorpointName}&startTime=${startTime}&endTime=${endTime}&monitorType=${monitorType}"</c:if>>首页</a>
						</li>
						<li><a
							<c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/monitorPointData/showHistory?monitorpointId=${monitorpointId}&monitorpointName=${monitorpointName}&startTime=${startTime}&endTime=${endTime}&page_num=${paging_vo.prePage}&monitorType=${monitorType}"</c:if>>
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach begin="${paging_vo.pageNumStart }"
							end="${paging_vo.pageNumEnd }" var="pageIndex">
							<c:if test="${paging_vo.currentPage==pageIndex }">
								<li class="active"><a href="javascript:;">${pageIndex}</a></li>
							</c:if>
							<c:if test="${paging_vo.currentPage!=pageIndex }">
								<li><a
									href="<%=request.getContextPath()%>/monitorPointData/showHistory?monitorpointId=${monitorpointId}&monitorpointName=${monitorpointName}&page_num=${pageIndex}&startTime=${startTime}&endTime=${endTime}&monitorType=${monitorType}">${pageIndex}</a></li>
							</c:if>
						</c:forEach>
						<li><a
							<c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/monitorPointData/showHistory?page_num=${paging_vo.nextPage}&monitorpointId=${monitorpointId}&monitorpointName=${monitorpointName}&startTime=${startTime}&endTime=${endTime}&monitorType=${monitorType}"</c:if>>&raquo;</a>
						</li>
						<li><a
							<c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/monitorPointData/showHistory?page_num=${paging_vo.totalPage}&monitorpointId=${monitorpointId}&monitorpointName=${monitorpointName}&startTime=${startTime}&endTime=${endTime}&monitorType=${monitorType}"</c:if>>尾页</a>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
	</section>
	<%@ include file="../include/commonScript.jsp"%>
	<script>
	 $(function() {
	 	var totalPage = ${paging_vo.totalPage};
		if (totalPage < 2)
			$(".pagination").hide();
     });
	 var color = $("td:last-child"),
        colorLen = color.length;
    for(var i = 0;i < colorLen;i++){
        (function(i){
            iscolor(color.eq(i).text(),i);
        })(i)
    }
     $("#datepickerStart").datepicker();
     $("#datepickerEnd").datepicker();
     $("form").submit(function(e){
     	var time=$("#datepickerStart").val();
     	var time=$("#datepickerEnd").val();
     	/* if(time==""){
     		e.preventDefault();
     		alert("时间不能为空");
     	} */
     });
    </script>
</body>

</html>

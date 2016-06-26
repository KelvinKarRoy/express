<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>测点信息表</title>
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
				<div class="box-title">${workpointName}</div>
			</div>
			<div class="box-body">
				<form name="getUsers" action="<%=request.getContextPath()%>/monitorPointData/showMonitorpoint" class="form-inline bottom-10" method="post">
					<div class="form-group" class="form-control">
                        <label>测点类型：</label>
                        <select name="monitorType" check-type="required" class="form-control">
                             <option value="0" <c:if test="${monitorType==0}"> selected</c:if>>预警</option>
                             <option value="1" <c:if test="${monitorType==1}"> selected</c:if>> 测斜</option>
                             <option value="2" <c:if test="${monitorType==2}"> selected</c:if>>收敛</option>
                             <option value="3" <c:if test="${monitorType==3}"> selected</c:if>>沉降</option>
                             <option value="4" <c:if test="${monitorType==4}"> selected</c:if>>水平位移</option>
                             <option value="5" <c:if test="${monitorType==5}"> selected</c:if>>土压力</option>
                             <option value="6" <c:if test="${monitorType==6}"> selected</c:if>>应力</option>
                             <option value="7" <c:if test="${monitorType==7}"> selected</c:if>>支撑轴力</option>
                             <option value="8" <c:if test="${monitorType==8}"> selected</c:if>>水位</option>

                        </select>
                    </div>
					测点名称：<input name="monitorpointName" type="text" value="${monitorpointName}" class="form-control" />
					<input id="find btn" value="查找" type="submit" class="btn btn-primary" /><br>
					<input name="workpointName" type="hidden" value="${workpointName}">
					<input name="workpointId" type="hidden" value="${workpointId}">
				</form>
                
				
				<!-- 表格 -->
				<table class="table table-bordered table-hover table-striped text-center">
					<thead>
						<tr>
						<th><input type="checkbox"></th>
							<!-- <th>测点ID</th> -->
							<th>测点名称</th>
							<c:if test="${monitorType==1}">
							   <th>深度</th>		
							</c:if>
							<th>对象</th>
							<th>当次测值</th>
							<th>累计增量</th>
							<th>本次变化率</th>
							<th>多日平均变化率</th>
							<th>检测时间</th>
							<th>检测单位</th>
							<th>检测人</th>
							<th>测点状态</th>
							<th>预警级别</th>
						</tr>
					</thead>
					
					<tbody>	
					<c:forEach items="${paging_vo.object}" var="r"  varStatus="ind" >
						<tr>
						<td><input type="checkbox"></td>
							<%-- <td>${r.monitorpointId}</td> --%>
							<td><a href="<%=request.getContextPath()%>/monitorPointData/showHistory?monitorpointId=${r.monitorpointId}&monitorpointName=${r.monitorName}&monitorType=${monitorType}">${r.monitorName}</a></td>
							<c:if test="${monitorType==1}">
							   	<td>${r.depth}</td>
							</c:if>
							<td>
                              <c:if test="${r.monitorObject==1}">建筑物</c:if>
                              <c:if test="${r.monitorObject==2}">地表</c:if>
							  <c:if test="${r.monitorObject==3}">管线</c:if>
							  <c:if test="${r.monitorObject==4}">围护结构</c:if>
							  <c:if test="${r.monitorObject==5}">水平位移</c:if>
							  <c:if test="${r.monitorObject==6}">支撑</c:if>
							</td>
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
							<td>
								<c:choose>
									<c:when test="${r.status==4}">
										<span class="label label-danger">停测</span>
									</c:when>
									<c:otherwise>
										<span class="label label-success">未停测</span>
									</c:otherwise>
								</c:choose>
							</td>
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
							<c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/monitorPointData/showMonitorpoint?monitorType=${monitorType}&workpointName=${workpointName}&workpointId=${workpointId}&monitorpointName=${monitorpointName}"</c:if>>首页</a>
						</li>
						<li><a
							<c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/monitorPointData/showMonitorpoint?monitorType=${monitorType}&workpointName=${workpointName}&workpointId=${workpointId}&monitorpointName=${monitorpointName}&page_num=${paging_vo.prePage}"</c:if>>
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach begin="${paging_vo.pageNumStart }"
							end="${paging_vo.pageNumEnd }" var="pageIndex">
							<c:if test="${paging_vo.currentPage==pageIndex }">
								<li class="active"><a href="javascript:;">${pageIndex}</a></li>
							</c:if>
							<c:if test="${paging_vo.currentPage!=pageIndex }">
								<li><a
									href="<%=request.getContextPath()%>/monitorPointData/showMonitorpoint?page_num=${pageIndex}&monitorType=${monitorType}&workpointName=${workpointName}&workpointId=${workpointId}&monitorpointName=${monitorpointName}">${pageIndex}</a></li>
							</c:if>
						</c:forEach>
						<li><a
							<c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/monitorPointData/showMonitorpoint?page_num=${paging_vo.nextPage}&monitorType=${monitorType}&workpointName=${workpointName}&workpointId=${workpointId}&monitorpointName=${monitorpointName}"</c:if>>&raquo;</a>
						</li>
						<li><a
							<c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/monitorPointData/showMonitorpoint?page_num=${paging_vo.totalPage}&monitorType=${monitorType}&workpointName=${workpointName}&workpointId=${workpointId}&monitorpointName=${monitorpointName}"</c:if>>尾页</a>
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
			var color = $("td:last-child"),
		        colorLen = color.length;
		    for(var i = 0;i < colorLen;i++){
		        (function(i){
		            iscolor(color.eq(i).text(),i);
		        })(i)
		    }
			/* $(".btn-forbidden").click(function(e) {
				e.preventDefault();
				$.get($(this).attr("href"), function(data) {
					window.parent.alert(data.message, function() {
						location.reload();
					});
				});
			});

			$(".btn-activate").click(function(e) {
				e.preventDefault();
				$.get($(this).attr("href"), function(data) {
					window.parent.alert(data.message, function() {
						location.reload();
					});
				});
			});  */
		});
	</script>
</body>

</html>

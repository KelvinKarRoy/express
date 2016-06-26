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
	<style type="text/css">
		.pagination {
			margin: 0 10px;
		}
		.box-title  .form-control {
			display: inline-block;
			width: 160px;
		}
		.box-header a {
			color: #999;
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
	        <li class="active">
		        <c:if test="${edit!=1}">新建测点</c:if>
		        <c:if test="${edit==1}">编辑测点</c:if>
	         </li>
	    </ol>
    </section>
	<section class="content">
		<div class="box">
			<div class="box-header">
				<div class="box-title">测点详情
					<form action="<%=request.getContextPath() %>/monitorPoint/showDetail?workpointId=${workpoint.id}" method="post">
						<input type="text" class="form-control" name="serachName"  placeholder="请输入测点编号">　
						<button class="btn btn-primary" type="submit">搜索</button>
					</form>
				</div>
				<div class="pull-right"><a href="#">下载模板</a>　　<a href="#">上传模板</a></div>
			</div>
			<div class="box-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>全选</th>
							<th>测点编号</th>
							<th>监测对象</th>
							<th>监测项目</th>
							<th>初值</th>
							<th>正累积一级</th>
							<th>正累积二级</th>
							<th>正累积三级</th>
							<th>负累积一级</th>
							<th>负累积二级</th>
							<th>负累积三级</th>
							<th>速率一级</th>
							<th>速率二级</th>
							<th>速率三级</th>
							<th>X</th>
							<th>Y</th>
							<th>Z</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${monitorPoints}" var="monitor">
							<tr>
								<td><input type="checkbox" data-id="${monitor.id}"></td>
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
								<td>${monitor.rateOne}/d</td>
								<td>${monitor.rateTwo}/d</td>
								<td>${monitor.rateThree}/d</td>
								<td>${monitor.xcoor}</td>
								<td>${monitor.ycoor}</td>
								<td>${monitor.zcoor}</td>
								<td>
									<c:if test="${monitor.status==1}">未启测 </c:if>
									<c:if test="${monitor.status==2}">正常 </c:if>
									<c:if test="${monitor.status==3}">停测 </c:if>
								</td>
							</tr>
						</c:forEach>				
					</tbody>
				</table>
				<p><button class="btn btn-primary" id="start-monitor">批量启测</button>　<button class="btn btn-primary" id="stop-monitor">批量停测</button>　<button class="btn btn-primary" id="edit-monitor" data-toggle="modal" data-target="#editMonitorpointModal">批量编辑</button>　<button class="btn btn-danger" id="delete-monitor">批量删除</button></p>
			</div>
			<div class="box-footer">
				  <ul class="pagination">
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/monitorPoint/showDetail?workpointId=${workpoint.id}"</c:if>>首页</a>
                     </li>
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/monitorPoint/showDetail?workpointId=${workpoint.id}&page_num=${paging_vo.prePage}"</c:if>>
                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>
                     <c:forEach begin="${paging_vo.pageNumStart }" end="${paging_vo.pageNumEnd }"  var="pageIndex">
                         <c:if test="${paging_vo.currentPage==pageIndex }">
                             <li class="active"><a href="javascript:;">${pageIndex}</a></li>
                         </c:if>
                         <c:if test="${paging_vo.currentPage!=pageIndex }">        
                             <li><a href="<%=request.getContextPath()%>/monitorPoint/showDetail?workpointId=${workpoint.id}&page_num=${pageIndex}">${pageIndex}</a></li>
                         </c:if>
                     </c:forEach>
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/monitorPoint/showDetail?workpointId=${workpoint.id}&page_num=${paging_vo.nextPage}"</c:if>>&raquo;</a>
                     </li>
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/monitorPoint/showDetail?workpointId=${workpoint.id}&page_num=${paging_vo.totalPage}"</c:if>>尾页</a>
                     </li>
                 </ul>
				<div class="pull-right">
					<c:if test="${edit!=1}">
						<a href="<%=request.getContextPath() %>/route/list">跳过</a>
						<a href="<%=request.getContextPath() %>/riskSource/showAdd?workpointId=${workpoint.id}">
						<button type="button" class="btn btn-default">上一步</button>
						</a>
						<a href="<%=request.getContextPath() %>/userWorkpoint/showAdd?workpointId=${workpoint.id}">
						<button type="button" class="btn btn-primary">下一步</button>
						</a>
					</c:if>
					<c:if test="${edit==1}">
						<a href="<%=request.getContextPath() %>/workpoint/index?id=${workpoint.id}">
							<button type="button" class="btn btn-primary">完成</button>
						</a>
					</c:if>
				</div>
            </div>
		</div>
	</section>
</div>

<!-- 编辑测点管理 -->
<div class="modal fade  bs-example-modal-lg" id="editMonitorpointModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">编辑测点</h4>
      </div>
      <div class="modal-body">
        <form action="<%=request.getContextPath() %>/monitorPoint/editMonitor" method="post">
        	<table class="table table-bordered table-hover table-striped">
				    <thead>
						<tr>
							<th>测点编号</th>
							<th>监测对象</th>
							<th>监测项目</th>
							<th>初值</th>
							<th>正累积一级</th>
							<th>正累积二级</th>
							<th>正累积三级</th>
							<th>负累积一级</th>
							<th>负累积二级</th>
							<th>负累积三级</th>
							<th>速率一级</th>
							<th>速率二级</th>
							<th>速率三级</th>
							<th>X</th>
							<th>Y</th>
							<th>Z</th>
						</tr>
					</thead>
					<tbody id="editBody">
					</tbody>
				 </table>
         </div>
	     <div class="text-right" style="margin-right:10px;padding-bottom:10px;">
	          <button type="submit" class="btn btn-primary" id="batchSave">保存</button>
	     </div>
	    </form>
    </div>
  </div>
</div>

<%@ include file="../../Common/include/script.jsp" %>	
</body>
<script>
//获取选中的测点id 
function getIdList(){
	var idList=[];
	$("table").find("td > input[type=checkbox]:checked").each(function(){
		idList.push($(this).data("id"));
	});
	ids=idList.join("|");
	return ids;
}
//进行批量启测操作
$("#start-monitor").click(function(){
	//获取选中的测点的id
	var idList=getIdList();
	
	$.post("<%=request.getContextPath() %>/monitorPoint/startMonitor",
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
});

//进行批量停测操作
$("#stop-monitor").click(function(){
	//获取选中的测点的id
	var idList=getIdList();
	
	$.post("<%=request.getContextPath() %>/monitorPoint/stopMonitor",
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
	
});
//进行批量删除操作
$("#delete-monitor").click(function(event){
	event.preventDefault();

	confirm("确认要删除选中的测点吗",function(result){
		if(result){
		  var idList=getIdList();   
	      $.post("<%=request.getContextPath() %>/monitorPoint/delete",
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

//进行批量编辑操作
$("#editMonitorpointModal").on('show.bs.modal', function (event){
	var idList = getIdList();
	var modal=$(this);

	//获取测点的信息
   $.post("<%=request.getContextPath() %>/monitorPoint/batchMonitor",
			   {idList:idList},
			   function(data){
			   if(data.code=="200")
			   {
				   var html = '';
				   for(var i in data.object)
				   {
					   var item = data.object[i];
					   html += '<tr>' +
						'<td><input type="text" value="'+item.name+'" class="form-control" name="monitorName[' + item.id + ']" readonly></td>' +
						'<td><input type="text" value="'+item.monitorObjectName+'" class="form-control" name="monitorObjectName[' + item.id + ']" readonly></td>' +
					    '<td><input type="text" value="' + item.monitorProjectName + '" class="form-control" name="monitorProjectName[' + item.id + ']" readonly></td>' +
						'<td><input type="text" value="' + item.first + '"class="form-control" name="monitorFirst[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.negthresholdOne + '" class="form-control" name="negthresholdOne[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.negthresholdTwo + '" class="form-control" name="negthresholdTwo[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.negthresholdThree + '" class="form-control" name="negthresholdThree[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.posthresholdOne + '" class="form-control" name="posthresholdOne[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.posthresholdTwo + '" class="form-control" name="posthresholdTwo[' + item.id + ']"></td>' +
					    '<td><input type="text" value="' + item.posthresholdThree + '" class="form-control" name="posthresholdThree[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.rateOne + '" class="form-control" name="rateOne[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.rateTwo + '" class="form-control" name="rateTwo[' + item.id + ']"></td>' +
						'<td><input type="text" value="' + item.rateThree + '" class="form-control" name="rateThree[' + item.id + ']"></td> ' +
						'<td><input type="text" value="' + item.xcoor + '" class="form-control" name="xcoor[' + item.id + ']"></td> ' +
						'<td><input type="text" value="' + item.ycoor + '" class="form-control" name="ycoor[' + item.id + ']"></td> ' +
						'<td><input type="text" value="' + item.zcoor + '" class="form-control" name="zcoor[' + item.id + ']"></td> ' +
					'</tr>';
				   }
			       $("#editBody").html(html);
			   }else if(data.code="201")
			   {
			    confirm(data.message,function(){
					window.location.reload();
				 });
			   }
		},"json");	
});

//进行下载模板操作

//进行上传模板操作

</script>


</html>

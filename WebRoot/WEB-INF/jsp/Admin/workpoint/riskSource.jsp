<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../Common/include/meta.jsp" %>
	<title>武汉地铁风险预警系统</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/plugins/select2/select2.min.css">
	<%@ include file="../../Common/include/css.jsp" %>
	
	<style type="text/css">
		.pagination {
			margin: 0 10px;
		}
		.risksource-label{
			list-style:none;
		}
		.risksource-img{
			list-style:none;
			overflow: hidden;
			padding-left: 0;
		}
		.risksource-img>li:hover {
			border-color: #57c5f7;
		}
		.risksource-img>li{
			border: 1px dashed #d2d6de;
		    -webkit-transition: border-color .3s ease;
		    transition: border-color .3s ease;
		    cursor: pointer;
		    border-radius: 6px;
		    text-align: center;
		    width: 150px;
		    height: 100px;
		    position: relative;
			margin-bottom: 10px;
			float: left;
			margin-right: 10px;
			background-position: center;
			background-repeat: no-repeat;
		}
		.risksource-label>li{
			width: 80px;
			background-color:blue;
			border-radius: 6px;
			display: inline;
			float: left;
			height: 20px;
			margin: 5px 10px;
			text-align:center;
			
		}
		.file {
			opacity: 0;
			position: absolute;
			top: 0;
			left: 0;
			height: 100%;
			width: 100%;
			cursor:pointer;
		}
		.plus {
			        background-image: url(/assets/images/plus.svg);
			        
    background-size: 60% 60%;
		}
		.modal-dialog {
    margin: 5% auto;
  }
	</style>
</head>
<body>
<%@ include file="../include/navbar.jsp" %>	

<div class="content-wrapper" style="min-height: 542px;">
	<section class="content-header">
    	<h1>新建工点</h1>
	    <ol class="breadcrumb">
	        <li><a href="#">首页</a></li>
	        <li><a href="#">线路编辑</a></li>
	        <li><a href="#">${route.name}</a></li>
	        <li class="active">
		        <c:if test="${edit!=1}">新建风险源</c:if>
		        <c:if test="${edit==1}">编辑风险源</c:if>
	         </li>
	    </ol>
    </section>
	<section class="content">
		<div class="box">
			<div class="box-header">
				<div class="box-title">风险源</div>
				<button class="btn btn-success pull-right" data-toggle="modal" data-target="#addRisksourceModal" data-whatever="risksource-add">新建风险源</button>
			</div>
			<div class="box-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>风险源名称</th>
							<th>风险源关键字</th>
							<th>风险源类型</th>
							<th>风险源等级</th>
							<th>操作</th>
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
									<a href="#" class="risksouce-edit" data-toggle="modal" data-target="#addRisksourceModal" data-id="${risk.id}" data-whatever="risksource-edit">编辑</a>　
								    <a href="#" class="risksouce-delete" data-id="${risk.id}">删除</a>　
								    <a href="#" class="risksouce-info" data-toggle="modal" data-target="#addRisksourceModal" data-id="${risk.id}" data-whatever="risksource-info">详情</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="box-footer">
			  <ul class="pagination">
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/riskSource/showAdd?workpointId=${workpoint.id}"</c:if>>首页</a>
                     </li>
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/riskSource/showAdd?workpointId=${workpoint.id}&page_num=${paging_vo.prePage}"</c:if>>
                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>
                     <c:forEach begin="${paging_vo.pageNumStart }" end="${paging_vo.pageNumEnd }"  var="pageIndex">
                         <c:if test="${paging_vo.currentPage==pageIndex }">
                             <li class="active"><a href="javascript:;">${pageIndex}</a></li>
                         </c:if>
                         <c:if test="${paging_vo.currentPage!=pageIndex }">        
                             <li><a href="<%=request.getContextPath()%>/riskSource/showAdd?workpointId=${workpoint.id}&page_num=${pageIndex}">${pageIndex}</a></li>
                         </c:if>
                     </c:forEach>
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/riskSource/showAdd?workpointId=${workpoint.id}&page_num=${paging_vo.nextPage}"</c:if>>&raquo;</a>
                     </li>
                     <li>
                         <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/riskSource/showAdd?workpointId=${workpoint.id}&page_num=${paging_vo.totalPage}"</c:if>>尾页</a>
                     </li>
                 </ul>
				<div class="pull-right">
					<c:if test="${edit!=1}">
						<a href="<%=request.getContextPath() %>/route/list">跳过</a>
						<a href="<%=request.getContextPath() %>/monitorobject/show?workpointId=${workpoint.id}">
						<button type="button" class="btn btn-default">上一步</button>
						</a>
						<a href="<%=request.getContextPath() %>/monitorPoint/showDetail?workpointId=${workpoint.id}">
						<button type="button" class="btn btn-primary" id="next-step">下一步</button>
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

<!-- 风险源详情弹窗 -->
<div class="modal fade bs-example-modal-lg" id="detailRisksourceModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
		    <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       <h4 class="modal-title" id="exampleModalLabel">风险源详情</h4>
		     </div>
		     <div class="modal-body">
		       	<div class="row">
		        	<div class="col-md-5 col-md-offset-1">
				        <div class="form-group">
				            <label for="recipient-name" class="control-label">风险源名称</label>名称
				        </div>
				  
				        <div class="form-group">
				            <label for="message-text" class="control-label">风险源等级</label>一级风险
				        </div>
		            </div>
		 
		        	<div class="col-md-5">
		        		<div class="form-group">
				            <label for="message-text" class="control-label">风险源关键字</label>
							关键词
				        </div>
				        
				        <div class="form-group">
				            <label for="message-text" class="control-label">风险源类型</label>
							工程本体
				        </div>  
				    </div>
		      </div>
		 
		      <div class="row">
			      <div class="col-md-10 col-md-offset-1">
			          <div class="form-group">
			            <label for="message-text" class="control-label">风险分析</label>风险分析
			          </div>
						<input class="form-control" name="workpointId" value="${workpoint.id}" type="hidden">
			      </div>
		      </div>
		      
		     <div class="row">
			      <div class="col-md-10 col-md-offset-1">
			          <div class="form-group">
			          	<ul class="risksource-img">
			          		<li class="thumbnail">
			          			
							</li>
			          	</ul>
			          </div>
			      </div>
		      </div>
		      
		       <div class="row">
			      <div class="col-md-10 col-md-offset-1">
			          <div class="form-group">
			            <label for="message-text" class="control-label">自定义标签</label>
			            自定义标签
			          </div>
		      </div>
		     </div>
    </div>
  </div>
</div>

<!-- 新建风险源弹窗 -->
<div class="modal fade  bs-example-modal-lg" id="addRisksourceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    	<form action="<%=request.getContextPath() %>/riskSource/add" method="post" enctype= "multipart/form-data">
		    <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       <h4 class="modal-title" id="exampleModalLabel">新增风险源</h4>
		     </div>
		     <div class="modal-body">
		       	<div class="row">
		        	<div class="col-md-5 col-md-offset-1">
				        <div class="form-group">
				            <label for="recipient-name" class="control-label">风险源名称</label>
				            <input type="text" class="form-control" name="name" placeholder="请输入20字以内的内容">
				        </div>
				  
				        <div class="form-group">
				            <label for="message-text" class="control-label">风险源等级</label>
							<select name="level" class="form-control">
								<option value="1">一级风险</option>
								<option value="2">二级风险</option>
								<option value="3">三级风险</option>
							</select>
				        </div>
		            </div>
		 
		        	<div class="col-md-5">
		        		<div class="form-group">
				            <label for="message-text" class="control-label">风险源关键字</label>
							<input type="text" class="form-control" name="keyword" placeholder="请输入5字以内的内容" >
				        </div>
				        
				        <div class="form-group">
				            <label for="message-text" class="control-label">风险源类型</label>
							<select name="type" class="form-control">
								<option value="1">环境</option>
								<option value="2">工程本体</option>
								<option value="3">施工</option>
							</select>
				        </div>  
				    </div>
		      </div>
		 
		      <div class="row">
			      <div class="col-md-10 col-md-offset-1">
			          <div class="form-group">
			            <label for="message-text" class="control-label">风险分析</label>
						<textarea class="form-control" name="analysis" placeholder="请输入包括风险因素、风险危害、风险控制措施，500字内的内容"></textarea>
			          </div>
						<input class="form-control" name="workpointId" value="${workpoint.id}" type="hidden">
			      </div>
		      </div>
		      
		     <div class="row">
			      <div class="col-md-10 col-md-offset-1">
			          <div class="form-group">
			          	<ul class="risksource-img">
			          		<li class="plus">
			          			<input type="file" name="workpointFile[]" class="file" accept="image/*">
							</li>
			          	</ul>
			          </div>
			      </div>
		      </div>
		      
		       <div class="row">
			      <div class="col-md-10 col-md-offset-1">
			          <div class="form-group">
			            <label for="message-text" class="control-label">自定义标签</label>
			            <select id="risksource-type" class="form-control select2"  name="labels" multiple="multiple" data-placeholder="自定义标签" style="width: 100%;">
			                  <c:forEach items="${labels}" var="r">
			                 	 <option value="${r.id}">${r.name}</option>
			                  </c:forEach>
		                </select>
			          </div>
		      </div>
		     </div>
		     <div class="modal-footer">
		     	<span id="callback-message" style="float:left;color:red"></span>
		       <button type="submit" class="btn btn-primary" id="confirm">确认</button>
		     </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="../../Common/include/script.jsp" %>
<script src="<%=request.getContextPath() %>/assets/plugins/select2/select2.full.min.js"></script>
<script>
	//初始化选择控件
	$(".select2").select2();
	//删除风险源操作
	$(".risksouce-delete").click(function(event){
		event.preventDefault();
		var id=$(this).data("id");
		console.log("id"+id);
		confirm("确认要删除该风险源么",function(result){
				if(result){
					$.post("<%=request.getContextPath()%>/riskSource/delete",
						   {id:id},
						   function(data){
						   	 if(data.code=="200"){
						   	  window.location.reload();
							 } else if(data.code=="201"){
						  		alert(data.message,null,1500);
						  	  }		
						   },
						   "json");
				}
		});
	});
	
	$(".risksource-img").on("change", ".file", function() {
		if(this.files) {
			var url = window.URL.createObjectURL(this.files[0]);
			if($(this).parent().hasClass("plus")) $(".risksource-img").append('<li class="plus"><input type="file" name="workpointFile[]" class="file" accept="image/*"></li>');
			$(this).parent().removeClass("plus").addClass("thumbnail").data("src", url).css({"background-image": "url("+url+")", "background-size": "95% 95%"});
		}
	});
	
	$(".risksource-img > li").click(function() {
		var $this = $(this);
		//if($this.hasClass("plus")) a;
	});
	//编辑风险源操作
	//查看风险源详情操作
	//添加风险源
</script>
</body>
</html>

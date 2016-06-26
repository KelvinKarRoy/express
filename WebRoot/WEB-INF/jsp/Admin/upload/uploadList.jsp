<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- 项目必要的外部依赖 -->
    <%@ include file="/WEB-INF/jsp/include/commonCSS.jsp"%>
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/child.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/datetimepicker/bootstrap-datetimepicker.min.css">
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
  <style>
  .label-info{
    background-color:#FFE42F !important;
  }
  tr td:last-child{
    overflow:hidden;
    text-align:center;
    vertical-align:baseline;
  }

  th{
    text-align: center;
  }

  td{
    text-align: center;
  }
  
  td.wn_danger{
    text-align: center;
  }
  </style>

</head>

<body class="skin-blue sidebar-mini">
        <!-- 中间内容 -->
        <div class="content-wrapper" style="min-height: 542px;">
        	<c:if test="${uploadable}">
        	<section class="content" style="padding-top: 15px;padding-bottom: 0px;"">
                <form method="post" action="showEdit" style="margin-bottom: 0px;">
                    <div class="box" style="border-top: 3px solid #00a65a;margin-bottom: 0px;">
                        <div class="box-header">
                            <div class="box-title">新增上传</div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                            	<div class="col-md-1">
                            	</div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>填报人</label>
                                        <input value="${login_session_user.cnname}" type="text" class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>工点</label>
                                        <select class="form-control" name="workpointName">
                                           <c:forEach items="${workpoints}" var="r">
                                            	<option value="${r.workpointName}">${r.workpointName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-md-1">
                            	</div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label>类型</label>
                                        <select class="form-control" name="type">
                                            <c:forEach items="${monitorTypes}" var="r">
                                            	<option value="${r}">${r}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div  class="col-md-5">
                                    <div class="form-group">
                                        <label>监测时间</label>
                                        <input type="text" autocomplete="off" id="datepicker" name="createTime" class="form-control" placeholder="请选择监测时间">
                                    </div>
                                </div>
                                <div class="col-md-1">
                            	</div> 
                            </div>
                            <div class="row" style="margin-top: 20px;margin-bottom: 20px;">
	                            <div class="col-md-11">
		                            <div class="pull-right">
		                                <button type="submit" class="btn btn-success">开始上传</button>
		                            </div>
	                            </div>
	                            <div class="col-md-1">
	                            </div>
	                        </div>
                        </div>
                    </div>
                </form>
               
            </section>
             </c:if>
             
            <section class="content" style="padding-bottom: 0px;">
                <div class="box" style="border-top: 3px solid #3dc0fc;">
                	<div class="box-header">
                		<div class="box-title">上传记录</div>
                	</div>
                    <div class="box-body">
                        <!-- 表格 -->
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>上传人</th>
                                    <th>工点</th>
                                    <th>对象</th>
                                    <th>类型</th>
                                    <th>监测日期</th>
                                    <th>填报日期</th>                                    
                                    <th>危险级别</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${paging_vo.object}" var="r" varStatus="ind"> 
						   			 <tr>

									       <td><a href="<%=request.getContextPath()%>/monitorPointData/showUpload?batch=${r.batch}&monitorType=${types[ind.index]}">${cnnames[ind.index]}</a></td>

									       

									       <td>${workpointNames[ind.index]}</td>
									       <td>${objs[ind.index]}</td>
									       <td>${types[ind.index]}</td>
									       <td><fmt:formatDate value="${r.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									       <td><fmt:formatDate value="${r.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						             	   <td class="wn_danger"><span class="label">${r.warnningLevel}</span></td>
						             	   <td class="delete"><a href="<%=request.getContextPath()%>/monitorPointData/delete?type=${types[ind.index]}&workpointName=${workpointNames[ind.index]}&batch=${r.batch}">删除</a></td>
						             </tr>
						  		 </c:forEach>
                            </tbody>
                        </table>
                        <!-- 表格结束 -->
                        <c:if test="${paging_vo.totalPage>1}">
                        <div>
                        	<ul class="pagination">
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/upload/showUploadList"</c:if>>首页</a>
                                </li>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/upload/showUploadList?page_num=${paging_vo.prePage}"</c:if>>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="${paging_vo.pageNumStart }" end="${paging_vo.pageNumEnd }"  var="pageIndex">
                                    <c:if test="${paging_vo.currentPage==pageIndex }">
                                        <li class="active"><a href="javascript:;">${pageIndex}</a></li>
                                    </c:if>
                                    <c:if test="${paging_vo.currentPage!=pageIndex }">        
                                        <li><a href="<%=request.getContextPath()%>/upload/showUploadList?page_num=${pageIndex}">${pageIndex}</a></li>
                                    </c:if>
                                </c:forEach>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/upload/showUploadList?page_num=${paging_vo.nextPage}"</c:if>>&raquo;</a>
                                </li>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/upload/showUploadList?page_num=${paging_vo.totalPage}"</c:if>>尾页</a>
                                </li>
                            </ul>
                        </div>
                     </c:if>
                </div>
                </section>
        </div>

    <!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
          <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" 
                   aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   上传记录
                </h4>
             </div>
             <div class="modal-body">
                 <table class="table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                            <th>说明</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    	<th>这个功能先不搞了</th>
                    </tbody>
                 </table>
             </div>
             <div class="modal-footer">
                <button type="button" class="btn btn-default" 
                   data-dismiss="modal">
                   关闭
                </button>
             </div>
          </div><!-- /.modal-content -->
       </div><!-- /.modal-dialog -->
    </div><!-- /.modal --> -->
    <%@ include file="../include/commonScript.jsp"%>
    
    <script>
    
    
    $("#datepicker").datepicker({
        format:'yyyy-mm-dd 00:00:00'
    });

    $("form").submit(function(e){
    	var time=$("#datepicker").val();
    	if(time==""){
    		e.preventDefault();
    		alert("监测时间不能为空",null,2000);
    	}
    });
    

    $(".delete a").click(function(e){
        var that = this;
        e.preventDefault();
        confirm("确定要删除吗",function(result){
            if(result){
                $.get($(that).attr("href"), function(data) {
                    
                    window.top.bootbox.dialog({
                        message:data.message
                    });
                    setTimeout(function(){
                        if(window.top.$("div[role=dialog]")){
                            window.top.$("div[role=dialog]").modal("hide");
                        }
                    },2000);
                });
            }
        })
    });

    var color = $("td.wn_danger"),
        colorLen = color.length;
    for(var i = 0;i < colorLen;i++){
        (function(i){
            iscolor_t(color.eq(i).text(),i);
        })(i)
    }



    function iscolor_t(date,i){
    if(date == 0){
        $("td.wn_danger span").eq(i).addClass("label-success").html("正　常");
    }else if(date == 1){
        $("td.wn_danger span").eq(i).addClass("label-important").html("一级预警");
        
    }else if(date == 2){
        $("td.wn_danger span").eq(i).addClass("label-important").html("二级预警");
        
    }else if(date == 3){
        $("td.wn_danger span").eq(i).addClass("label-important").html("三级预警");
        
    }else if(date == 4){
        $("td.wn_danger span").eq(i).addClass("label-warning").html("异　常");
    }
}

    </script>
</body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="../../Common/include/meta.jsp" %>
    <title>短信管理列表</title>
    <%@ include file="../../Common/include/css.jsp"%>
    <style>
      .table{
               margin-top:10px;
            }  
            .box-body{
                     padding:20px 20px 15px 20px;
            }
            .pagination{ margin:20px 0px 0px 0px;
            } 
   .content-header h1 {
    font-family: "microsoft yahei";
    font-size: 20px;
    color: #3C8DBC;
}
    </style>   
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body>
    <!-- 中间内容 -->
    <%@ include file="../include/navbar.jsp" %>	
    <div class="content-wrapper" style="min-height: 542px;">
        <section class="content-header">
    	<h1>短信管理</h1>
	    <ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath() %>/index">首页</a></li>
	        <li class="active">短息管理</li>
	    </ol>
    </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-body">
                	<form action="<%=request.getContextPath()%>/sms/phoneSmsList" class="form-inline">
	                   	<input type="text" class="form-control color" name="name" style="width:200px" placeholder="请输入姓名进行搜索" value="${name}" />
	                   	<input type="submit" class="btn btn-primary" value="查找" />
                   	</form>
                    <!-- 表格 -->
                    <table class="table table-bordered table-hover table-striped">
                    <thead>
                        <tr>
                             <th>姓名</th>
                            <th>电话号码</th>
                            <th>短信内容</th>
                            <th>发送状态</th>
                            <th>短信说明</th>
                            <th>创建时间</th>
                         </tr>
                      </thead>
                     
						<tbody>
						  <c:forEach items="${paging_vo.object}" var="r"> 
						   			 <tr>
						   			       <td>${r.cnname}</td>
									       <td>${r.phone}</td>
									       <td>${r.content}</td>
									       <td>
									       	<c:if test="${r.status==1}">成功</c:if>
											<c:if test="${r.status==-1}">失败</c:if>
									       </td>
									       <td>${r.target}</td>
									       <td><fmt:formatDate value="${r.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
                            <ul class="pagination">
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=1}"> href="<%=request.getContextPath()%>/sms/phoneSmsList?name=${name}"</c:if>>首页</a>
                                </li>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=1}"> href="<%=request.getContextPath()%>/sms/phoneSmsList?name=${name}&page_num=${paging_vo.prePage}"</c:if>>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="${paging_vo.pageNumStart}" end="${paging_vo.pageNumEnd}"  var="pageIndex">
                                    <c:if test="${paging_vo.currentPage==pageIndex}">
                                        <li class="active"><a href="javascript:;">${pageIndex}</a></li>
                                    </c:if>
                                    <c:if test="${paging_vo.currentPage!=pageIndex }">        
                                        <li><a href="<%=request.getContextPath()%>/sms/phoneSmsList?name=${name}&page_num=${pageIndex}">${pageIndex}</a></li>
                                    </c:if>
                                </c:forEach>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage}"> href="<%=request.getContextPath()%>/sms/phoneSmsList?name=${name}&page_num=${paging_vo.nextPage}"</c:if>>&raquo;</a>
                                </li>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage}"> href="<%=request.getContextPath()%>/sms/phoneSmsList?name=${name}&page_num=${paging_vo.totalPage}"</c:if>>尾页</a>
                                </li>
                            </ul>
                        </div>
					</div>
 
                    </div>
                </div>
            </section>
        </div>
    </div>
    <%@ include file="../../Common/include/script.jsp"%>
    <script>
      $(function() {
			var totalPage = ${paging_vo.totalPage};
			if (totalPage < 2)
				$(".pagination").hide();
				});
    </script>
</body>

</html>

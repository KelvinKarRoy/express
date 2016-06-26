<!DOCTYPE html>
<html lang="zh-CN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>信息检索</title>

<%@ include file="../Common/include/meta.jsp"%>
<link
	href="<%=request.getContextPath()%>/assets/plugins/select2/select2.css"
	rel="stylesheet">
<%@ include file="../Common/include/css.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/child.css">
<link
	href="<%=request.getContextPath()%>/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  		<script src="<%=request.getContextPath()%>/assets/js/html5shiv.js"></script>
  		<script src="<%=request.getContextPath()%>/assets/js/respond.min.js"></script>
  	<![endif]-->
</head>
<style>
@
-webkit-keyframes passing-through { 0% {
	opacity: 0;
	-webkit-transform: translateY(40px);
	-moz-transform: translateY(40px);
	-ms-transform: translateY(40px);
	-o-transform: translateY(40px);
	transform: translateY(40px);
}

30%,70%
{opacity:1;
-webkit-transform:translateY(0px);
-moz-transform:translateY(0px);
-ms-transform:translateY(0px);
-o-transform:translateY(0px);
transform:translateY(0px);
}
100%{
opacity:0;
-webkit-transform:translateY(-40px);
-moz-transform:translateY(-40px);
-ms-transform:translateY(-40px);
-o-transform:translateY(-40px);
transform:translateY(-40px);
}
}
@
-moz-keyframes passing-through { 0% {
	opacity: 0;
	-webkit-transform: translateY(40px);
	-moz-transform: translateY(40px);
	-ms-transform: translateY(40px);
	-o-transform: translateY(40px);
	transform: translateY(40px);
}

30%,
70%
{
opacity:1;
-webkit-transform:translateY(0px);
-moz-transform:translateY(0px);
-ms-transform:translateY(0px);
-o-transform:translateY(0px);
transform:translateY(0px);
}
100%
{
opacity:0;
-webkit-transform:translateY(-40px);
-moz-transform:translateY(-40px);
-ms-transform:translateY(-40px);
-o-transform:translateY(-40px);
transform:translateY(-40px);
}
}
@
keyframes passing-through { 0% {
	opacity: 0;
	-webkit-transform: translateY(40px);
	-moz-transform: translateY(40px);
	-ms-transform: translateY(40px);
	-o-transform: translateY(40px);
	transform: translateY(40px);
}

30%,
70%
{
opacity:1;
-webkit-transform:translateY(0px);
-moz-transform:translateY(0px);
-ms-transform:translateY(0px);
-o-transform:translateY(0px);
transform:translateY(0px);}
100%
{
opacity:0;
-webkit-transform:translateY(-40px);        
-moz-transform:translateY(-40px);
-ms-transform:translateY(-40px);        
-o-transform:translateY(-40px);       
transform:translateY(-40px);    
}
}
@
-webkit-keyframes slide-in { 0% {
	opacity: 0;
	-webkit-transform: translateY(40px);
	-moz-transform: translateY(40px);
	-ms-transform: translateY(40px);
	-o-transform: translateY(40px);
	transform: translateY(40px);
}
30%
{
opacity:1;
-webkit-transform:translateY(0px);       
-moz-transform:translateY(0px);        
-ms-transform:translateY(0px);        
-o-transform:translateY(0px);        
transform:translateY(0px);
}
}
@
-moz-keyframes slide-in { 0% {
	opacity: 0;
	-webkit-transform: translateY(40px);
	-moz-transform: translateY(40px);
	-ms-transform: translateY(40px);
	-o-transform: translateY(40px);
	transform: translateY(40px);
}

30%
{
opacity:1;
-webkit-transform:translateY(0px);     
-moz-transform:translateY(0px);       
-ms-transform:translateY(0px);      
-o-transform:translateY(0px);      
transform:translateY(0px);  
}
}
@
keyframes slide-in { 0% {
	opacity: 0;
	-webkit-transform: translateY(40px);
	-moz-transform: translateY(40px);
	-ms-transform: translateY(40px);
	-o-transform: translateY(40px);
	transform: translateY(40px);
}

30%
{
opacity:1;
-webkit-transform:translateY(0px);      
-moz-transform:translateY(0px);        
-ms-transform:translateY(0px);       
-o-transform:translateY(0px);       
transform:translateY(0px);    
}
}
@
-webkit-keyframes pulse { 0% {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}

10%
{
-webkit-transform:scale(1.1);
-moz-transform:scale(1.1);
-ms-transform:scale(1.1);
-o-transform:scale(1.1);
transform:scale(1.1);
}
20%
{
-webkit-transform:scale(1);
-moz-transform:scale(1);
-ms-transform:scale(1);
-o-transform:scale(1);
transform:scale(1);
}
}
@
-moz-keyframes pulse { 0% {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}
10%
{
-webkit-transform:scale(1.1);
-moz-transform:scale(1.1);
-ms-transform:scale(1.1);
-o-transform:scale(1.1);
transform:scale(1.1);
}
20%
{
-webkit-transform:scale(1);
-moz-transform:scale(1);
-ms-transform:scale(1);
-o-transform:scale(1);
transform:scale(1);
}
}
@
keyframes pulse { 0% {
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transform: scale(1);
}
10%
{
-webkit-transform:scale(1.1);
-moz-transform:scale(1.1);
-ms-transform:scale(1.1);
-o-transform:scale(1.1);
transform:scale(1.1);
}
20%
{
-webkit-transform:scale(1);
-moz-transform:scale(1);
-ms-transform:scale(1);
-o-transform:scale(1);
transform:scale(1);
}
}
.dropzone,.dropzone * {
	box-sizing: border-box;
}

.dropzone {
	min-height: 150px;
	border: 2px solid rgba(0, 0, 0, 0.3);
	background: white;
	padding: 20px 20px;
}

.dropzone.dz-clickable {
	cursor: pointer;
}

.dropzone.dz-clickable * {
	cursor: default;
}

.dropzone.dz-clickable .dz-message,.dropzone.dz-clickable .dz-message *
	{
	cursor: pointer;
}

.dropzone.dz-started .dz-message {
	display: none;
}

.dropzone.dz-drag-hover {
	border-style: solid;
}

.dropzone.dz-drag-hover .dz-message {
	opacity: 0.5;
}

.dropzone .dz-message {
	text-align: center;
	margin: 2em 0;
}

.dropzone .dz-preview {
	position: relative;
	display: inline-block;
	vertical-align: top;
	margin: 16px;
	min-height: 100px;
}

.dropzone .dz-preview:hover {
	z-index: 1000;
}

.dropzone .dz-preview:hover .dz-details {
	opacity: 1;
}

.dropzone .dz-preview.dz-file-preview .dz-image {
	border-radius: 20px;
	background: #999;
	background: linear-gradient(to bottom, #eee, #ddd);
}

.dropzone .dz-preview.dz-file-preview .dz-details {
	opacity: 1;
}

.dropzone .dz-preview.dz-image-preview {
	background: white;
}

.dropzone .dz-preview.dz-image-preview .dz-details {
	-webkit-transition: opacity 0.2s linear;
	-moz-transition: opacity 0.2s linear;
	-ms-transition: opacity 0.2s linear;
	-o-transition: opacity 0.2s linear;
	transition: opacity 0.2s linear;
}

.dropzone .dz-preview .dz-remove {
	font-size: 14px;
	text-align: center;
	display: block;
	cursor: pointer;
	border: none;
}

.dropzone .dz-preview .dz-remove:hover {
	text-decoration: underline;
}

.dropzone .dz-preview:hover .dz-details {
	opacity: 1;
}

.dropzone .dz-preview .dz-details {
	z-index: 20;
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	font-size: 13px;
	min-width: 100%;
	max-width: 100%;
	padding: 2em 1em;
	text-align: center;
	color: rgba(0, 0, 0, 0.9);
	line-height: 150%;
}

.dropzone .dz-preview .dz-details .dz-size {
	margin-bottom: 1em;
	font-size: 16px;
}

.dropzone .dz-preview .dz-details .dz-filename {
	white-space: nowrap;
}

.dropzone .dz-preview .dz-details .dz-filename:hover span {
	border: 1px solid rgba(200, 200, 200, 0.8);
	background-color: rgba(255, 255, 255, 0.8);
}

.dropzone
 
.dz-preview
 
.dz-details
 
.dz-filename
:not
 
(
:hover
 
)
{
overflow
:
 
hidden
;

	
text-overflow
:
 
ellipsis
;


}
.dropzone .dz-preview .dz-details .dz-filename:not (:hover ) span {
	border: 1px solid transparent;
}

.dropzone .dz-preview .dz-details .dz-filename span,.dropzone .dz-preview .dz-details .dz-size span
	{
	background-color: rgba(255, 255, 255, 0.4);
	padding: 0 0.4em;
	border-radius: 3px;
}

.dropzone .dz-preview:hover .dz-image img {
	-webkit-transform: scale(1.05, 1.05);
	-moz-transform: scale(1.05, 1.05);
	-ms-transform: scale(1.05, 1.05);
	-o-transform: scale(1.05, 1.05);
	transform: scale(1.05, 1.05);
	-webkit-filter: blur(8px);
	filter: blur(8px);
}

.dropzone .dz-preview .dz-image {
	border-radius: 20px;
	overflow: hidden;
	width: 120px;
	height: 120px;
	position: relative;
	display: block;
	z-index: 10;
}

.dropzone .dz-preview .dz-image img {
	display: block;
}

.dropzone .dz-preview.dz-success .dz-success-mark {
	-webkit-animation: passing-through 3s cubic-bezier(0.77, 0, 0.175, 1);
	-moz-animation: passing-through 3s cubic-bezier(0.77, 0, 0.175, 1);
	-ms-animation: passing-through 3s cubic-bezier(0.77, 0, 0.175, 1);
	-o-animation: passing-through 3s cubic-bezier(0.77, 0, 0.175, 1);
	animation: passing-through 3s cubic-bezier(0.77, 0, 0.175, 1);
}

.dropzone .dz-preview.dz-error .dz-error-mark {
	opacity: 1;
	-webkit-animation: slide-in 3s cubic-bezier(0.77, 0, 0.175, 1);
	-moz-animation: slide-in 3s cubic-bezier(0.77, 0, 0.175, 1);
	-ms-animation: slide-in 3s cubic-bezier(0.77, 0, 0.175, 1);
	-o-animation: slide-in 3s cubic-bezier(0.77, 0, 0.175, 1);
	animation: slide-in 3s cubic-bezier(0.77, 0, 0.175, 1);
}

.dropzone .dz-preview .dz-success-mark,.dropzone .dz-preview .dz-error-mark
	{
	pointer-events: none;
	opacity: 0;
	z-index: 500;
	position: absolute;
	display: block;
	top: 50%;
	left: 50%;
	margin-left: -27px;
	margin-top: -27px;
}

.dropzone .dz-preview .dz-success-mark svg,.dropzone .dz-preview .dz-error-mark svg
	{
	display: block;
	width: 54px;
	height: 54px;
}

.dropzone .dz-preview.dz-processing .dz-progress {
	opacity: 1;
	-webkit-transition: all 0.2s linear;
	-moz-transition: all 0.2s linear;
	-ms-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

.dropzone .dz-preview.dz-complete .dz-progress {
	opacity: 0;
	-webkit-transition: opacity 0.4s ease-in;
	-moz-transition: opacity 0.4s ease-in;
	-ms-transition: opacity 0.4s ease-in;
	-o-transition: opacity 0.4s ease-in;
	transition: opacity 0.4s ease-in;
}

.dropzone .dz-preview:not (.dz-processing ) .dz-progress {
	-webkit-animation: pulse 6s ease infinite;
	-moz-animation: pulse 6s ease infinite;
	-ms-animation: pulse 6s ease infinite;
	-o-animation: pulse 6s ease infinite;
	animation: pulse 6s ease infinite;
}

.dropzone .dz-preview .dz-progress {
	opacity: 1;
	z-index: 1000;
	pointer-events: none;
	position: absolute;
	height: 16px;
	left: 50%;
	top: 50%;
	margin-top: -8px;
	width: 80px;
	margin-left: -40px;
	background: rgba(255, 255, 255, 0.9);
	-webkit-transform: scale(1);
	border-radius: 8px;
	overflow: hidden;
}

.dropzone .dz-preview .dz-progress .dz-upload {
	background: #333;
	background: linear-gradient(to bottom, #666, #444);
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 0;
	-webkit-transition: width 300ms ease-in-out;
	-moz-transition: width 300ms ease-in-out;
	-ms-transition: width 300ms ease-in-out;
	-o-transition: width 300ms ease-in-out;
	transition: width 300ms ease-in-out;
}

.dropzone .dz-preview.dz-error .dz-error-message {
	display: block;
}

.dropzone .dz-preview.dz-error:hover .dz-error-message {
	opacity: 1;
	pointer-events: auto;
}

.dropzone .dz-preview .dz-error-message {
	pointer-events: none;
	z-index: 1000;
	position: absolute;
	display: block;
	display: none;
	opacity: 0;
	-webkit-transition: opacity 0.3s ease;
	-moz-transition: opacity 0.3s ease;
	-ms-transition: opacity 0.3s ease;
	-o-transition: opacity 0.3s ease;
	transition: opacity 0.3s ease;
	border-radius: 8px;
	font-size: 13px;
	top: 130px;
	left: -10px;
	width: 140px;
	background: #be2626;
	background: linear-gradient(to bottom, #be2626, #a92222);
	padding: 0.5em 1.2em;
	color: white;
}

.dropzone .dz-preview .dz-error-message:after {
	content: '';
	position: absolute;
	top: -6px;
	left: 64px;
	width: 0;
	height: 0;
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
	border-bottom: 6px solid #be2626;
}

/*需求文档高度未定结束时要改正
样式中一部分的margin-bottom和margin-top是为了调试而写的，
具体的样式还需要改*/
body {
	background-color: #ECF0F5;
}

input {
	outline: none;
}

/*清除浮动*/
.clear {
	zoom: 1
}

.clear:after {
	content: "";
	display: block;
	clear: both;
}

/*导航条测试样式*/
.my-nav {
	height: 50px;
	width: 100%;
	background-color: #3C8DBC;
}

/*post-area为上传文档区*/
.post-area {
	padding: 10px 20px;
	background-color: white;
	/*以下样式为了调试*/
	margin-top: 40px;
}

h4 {
	font-family: '微软雅黑';
	font-size: 18px;
}

.post-box-1 {
	width: 80%;
	margin: 0 auto;
}

.post-area .post-box-1-1 {
	/*实验属性为了间隔*/
	margin: 5px 0px;
}

.post-area .post-box-1-1 span {
	font-family: '微软雅黑';
	font-size: 14px;
}

.post-area .post-box-1-1 select {
	font-size: 11px;
	width: 100%;
	/*实验属性为了间隔*/
	margin-top: 5px;
}

#post-people {
	margin-top: 5px;
}

#post-people:focus {
	outline: none;
	border-color: #ccc;
	box-shadow: none;
	border-radius: 5px;
}

.tabs{
	width:100%;
}
.tabs span{
	font-weight:normal !important;	
}
.select2-container{
	width:100% !important;
}
.select2-selection_rendered{
	width:100% !important;
}
.select2-selection{
	border-radius:5px !important;
}
.select2-search__field{
	width:150px !important;
	
}


/*文件上传区*/
.file-post {
	
}

.file-post>span {
	display: block;
	font-family: '微软雅黑';
	font-size: 14px;
	margin-bottom: 5px;
}

.dropz {
	font-family: '微软雅黑';
	width: 100%;
	border: 2px dashed #CCCCCC !important;
	min-height: 200px;
	border-radius: 20px;
}

.dropz .dz-message {
	font-size: 16px;
	color: #cccccc;
}

.dropz .dz-details {
	width: 45%;
	float: left;
}

.dropz .dz-details img {
	border-radius: 4px;
}
.dropz .dz-filename{
	width:50%;
	overflow:hidden;
}
.dropz .dz-details .dz-remove {
	margin-left: 10px;
}

.file-post button {
	font-family: '微软雅黑';
	margin-top: 5px;
	float: right;
}

/*文档列表区*/
.unfile-list{
    padding: 10px 20px;
    background-color: white;
    margin-top: 10px;
    min-height: 500px;
}
.unfile-list h4{
    display: inline-block;
    font-family: Microsoft YaHei;
    font-size:18px;
    margin-right: 15px;
}
#list-search-text{
    display: inline-block;
    font-family: Microsoft YaHei;
    width: 200px;
}
#search-btn{
    display: inline-block;
    position: relative;
    font-family: Microsoft YaHei;
    top: -1px;
}
/*表格样式*/

.table th{
    font-family: Microsoft YaHei;
    font-weight: normal;
    text-align: center;
}
.table .filename{
    font-size: 16px;
}
.table .realname{
    color:#3C8DBC;
}
.table .thum{
    height: 35px;
    width: 35px;
    border-radius: 5px;
}
.table th{
    color: #cccccc;
}
.table th:first-child{
    text-align: left;
}
.table tr{
    height: 40px;
    line-height: 40px;
}
.table tr td{
    font-family: Microsoft YaHei;
    text-align: center;
}
.table tr td:first-child{
    text-align: left;
}
.operation{
    color: #3C8DBC;
    font-family: Microsoft YaHei;
    outline: none !important;
}
.operation:hover{
    color: #3C8DBC;
}
.operation:visited{
    color: #3C8DBC;
    text-decoration:none;
}
.page a{
    margin: 0 10px;
    border-radius: 5px;

}
/*弹出框样式*/
.modal-content{

}
.modal-title{
    font-family: Microsoft YaHei;
}
.modal-footer .btn{
    font-family: Microsoft YaHei;
}
.modal-body .file-list{
	padding-left:0px;
    width: 80%;
    margin:0 auto;
}
.modal-body ul li{
	list-style:none;
	height:25px;
	line-height:25px;
}
.modal-body ul li:hover{
	background-color:#3C8DBC;
	color:white;
}
#need-data{
    display:none;
}

/*宽度大于720px的样式*/
@media screen and (min-width: 720px) {
	/*map为地图区*/
	.map {
		background-color: white;
		/*以下样式为了调试*/
		margin-top: 40px;
		height: 50px;
	}
}

/*宽度小于720px时*/
@media screen and (max-width: 720px) {
	/*固定宽度*/
	.container {
		width: 720px;
	}
	/*map为地图区*/
	.map {
		display: none;
	}
}
</style>


<body>
	<%@ include file="../Admin/include/navbar.jsp" %> 
	<!-- 正文内容应该是固定宽度在一个container容器中 -->
	<div class='container'>
		<div class='row'>
			<div class='col-md-9 col-xs-9'>
				<div class="box-header">
					<br/>
					<div class="box-title">货物列表</div>
				</div>
				<!-- 货物列表区 -->
                <div class="unfile-list">
                    <br/>
                    <form name="getUsers" action="<%=request.getContextPath()%>/express/search" class="form-inline bottom-10" method="post" style="float: left">
						<select class="role form-control" name="conditionType" style="float:left">
							<option value="1">物品名</option>
							<option value="2">入库时间</option>
						</select>
						<input id="find btn" name="condition" type="text" class="form-control" />
						<input id="find btn" value="查找" type="submit" class="btn btn-primary" />
						<!-- <input type="reset" value="重置" class="btn btn-primary" /> -->
					</form>
                    <!--列表-->
                    <table class="table table-stried">
                        <thead>
                            <th>物品编号</th>
                            <th>物品名称</th>
                            <th>入库时间</th>
                            <th>入库原因</th>
                            <th>所在位置</th>
                            <th>二维码</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        	<c:forEach items="${paging_vo.object}" var="r">
                            <tr>
                                <td>${r.id}</td>
                                <td>${r.name}</td>
                                <td><fmt:formatDate value="${r.createTime}" pattern="yyyy-MM-dd"/></td>
                                <td>${r.message}</td>
                                <td>${r.location}</td>
                                <td>${r.code}</td>
                                <td><button class="btn btn-primary delete" data-id="${r.id}" >出货</botton></td>
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
                                    <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/express/show"</c:if>>首页</a>
                                </li>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=1 }"> href="<%=request.getContextPath()%>/express/show?page_num=${paging_vo.prePage}"</c:if>>
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="${paging_vo.pageNumStart }" end="${paging_vo.pageNumEnd }"  var="pageIndex">
                                    <c:if test="${paging_vo.currentPage==pageIndex }">
                                        <li class="active"><a href="javascript:;">${pageIndex}</a></li>
                                    </c:if>
                                    <c:if test="${paging_vo.currentPage!=pageIndex }">        
                                        <li><a href="<%=request.getContextPath()%>/express/show?page_num=${pageIndex}">${pageIndex}</a></li>
                                    </c:if>
                                </c:forEach>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/express/show?page_num=${paging_vo.nextPage}"</c:if>>&raquo;</a>
                                </li>
                                <li>
                                    <a <c:if test="${paging_vo.currentPage!=paging_vo.totalPage }"> href="<%=request.getContextPath()%>/express/show?page_num=${paging_vo.totalPage}"</c:if>>尾页</a>
                                </li>
                            </ul>
                </div>
				<!-- 文档列表区结束 -->
				
			</div>
			
		</div>
	</div>
	
	<!-- js文件引入 -->
	<script src="<%=request.getContextPath()%>/assets/jQuery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js"></script>
	<%@ include file="../Common/include/script.jsp"%>
	<script src="<%=request.getContextPath()%>/assets/plugins/select2/select2.js"></script>

	<script type="text/javascript">
		$(".delete").click(function() {
				var id=$(this).attr("data-id");	
				
				$.post(
				"<%=request.getContextPath()%>/express/deleteGoods",
				{goodsId:id},
				function(data){
				alert(data.message,null,2000);
				window.location.reload();
				},
				"json"
				);
			});
	</script>
</body>

</html>


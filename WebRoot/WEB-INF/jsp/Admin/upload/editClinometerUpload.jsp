<%@page import="com.xing.whmetro.entity.Workpoint"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- 项目必要的外部依赖 -->
<%@ include file="/WEB-INF/jsp/include/commonCSS.jsp"%>

<link rel="stylesheet"
	href="../assets/plugins/jQuery-File-Upload/css/jquery.fileupload.css">

<!-- 项目公用样式文件 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/styles/child.css">
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="skin-blue sidebar-mini">

	<!-- 中间内容 -->
	<div class="content-wrapper" style="min-height: 542px;">
		<section class="content">
			<div class="box" style="border-top: 3px solid #00a65a;">
				<div class="box-header">
					<div class="box-title">数据上传</div>
				</div>
				<div class="box-body">
					<form method="post" action="uploadWebMonitorData">
					<input type="hidden" value="测斜" name="type"> 
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-5">
								<div class="form-group">
									<label>填报人</label> <input value="${login_session_user.cnname}"
										type="text" class="form-control" readonly>
								</div>
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<label>工点</label> <input value="${workpointName}" type="text"
										class="form-control" readonly>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-5">
								<div class="form-group">
									<label>类型</label> <input value="${type}" type="text"
										class="form-control" readonly>
								</div>
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<label>监测时间</label> <input value="${createTime}" type="text"
										id="datetimepicker" name="createTime" class="form-control"
										readonly>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
						<h4>请用模板上传侧斜的数据！</h4>
						<table
							class="table table-bordered table-hover table-striped edittable text-center"
							style="margin-top: 30px;font-size:14px;">
							<thead>
								<tr id="header">
									<th>监测对象</th>
									<th>测点名称</th>
									<th>深度(m)</th>
									<th>上次变形累计(mm)</th>
									<th>上次监测日期</th>
									<th>本次变形累计(mm)</th>
									<th>本次变形(mm)</th>
									<th>本次变化速率(mm/d)</th>
									<th>预警级别</th>
									<th>备注</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${objects}" var="r" varStatus="ind">
									<tr>
										<td>${r}
											<input type="hidden" value="${monitors[ind.index].id}" name="ids"> 
											<input type="hidden" value="${lastDates[ind.index]}" name="lastDate[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].negthresholdOne}" name="negthresholdOne[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].negthresholdTwo}" name="negthresholdTwo[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].negthresholdThree}" name="negthresholdThree[${monitors[ind.index].id}]">
											<input type="hidden" value="${monitors[ind.index].posthresholdOne}" name="posthresholdOne[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].posthresholdTwo}" name="posthresholdTwo[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].posthresholdThree}" name="posthresholdThree[${monitors[ind.index].id}]">
											<input type="hidden" value="${monitors[ind.index].rateOne}" name="rateOne[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].rateTwo}" name="rateTwo[${monitors[ind.index].id}]"> 
											<input type="hidden" value="${monitors[ind.index].rateThree}" name="rateThree[${monitors[ind.index].id}]">
										</td>
										<td><input type="text" class="form-control" name="monitorName[${monitors[ind.index].id}]" value="${monitors[ind.index].monitorName}" readonly></td>
										<c:choose>
											<c:when test="${depths[ind.index]==-1}">
												<td><input type="text" value="" class="form-control" name="depth[${monitors[ind.index].id}]"></td>
											</c:when>
											<c:otherwise>
												<td><input type="text" value="${depths[ind.index]}" class="form-control" name="depth[${monitors[ind.index].id}]" readonly></td>
											</c:otherwise>
										</c:choose>
										<td id="lastValue_${monitors[ind.index].id}">${lastValues[ind.index]}</td>
										<td id="lastDate_${monitors[ind.index].id}">${lastDates[ind.index]}</td>
										<td id="value_${monitors[ind.index].id}"></td>
										<td>
											<input type="text" value="" class="form-control creament" name="creament[${monitors[ind.index].id}]" data-id="${monitors[ind.index].id}">
										</td>
										<td id="rate_${monitors[ind.index].id}"></td>
										<td id="warnningLevel_${monitors[ind.index].id}"></td>
										<td><input type="text" value="" class="form-control"
											name="message[${monitors[ind.index].id}]"
											data-id="${monitors[ind.index].id}"></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- 表格结束 -->
						<!-- 分页组件 -->
						<div class="row" style="margin-top: 20px;margin-bottom: 30px;">
							<div class="col-md-8">
								<a class="btn btn-primary" id="submitInfo"
									href="<%=request.getContextPath() %>/download/monitorData?
							workpointName=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode((String)request.getAttribute("workpointName"),"UTF-8"),"UTF-8")%>
							&type=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode((String)request.getAttribute("type"),"UTF-8"),"UTF-8") %>&createTime=${createTime}"
									download="${type}监测数据模板.xls"
									style="margin-left: 15px;margin-right: 15px" type="button">下载模板</a>
								<span class="btn btn-success fileinput-button" type="button">上传模板
								<input id="fileupload" type="file" name="file" accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
								</span>
							</div>
							<div class="col-md-4 text-right">
								<span style="margin-right: 15px"><button type="button"
										class="btn btn-success" id="rowadd">添加</button></span> <span style="margin-right: 15px"><button type="submit"
										class="btn btn-primary">保存</button></span> <span
									style="margin-right: 15px"><button type="button"
										class="btn btn-default" onclick="history.back()">返回</button></span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
		
	</div>
	</div>
	<%@ include file="../include/commonScript.jsp"%>

	<script
		src="../assets/plugins/jQuery-File-Upload/js/jquery.fileupload.js"></script>
	<script>
        $(function() {
        	
        	$("input").attr("disabled", "disabled");
        	
            $('#fileupload').fileupload({
                url: '<%=request.getContextPath()%>/upload/uploadMonitorData?createTime=${createTime}&type=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode((String)request.getAttribute("type"),"UTF-8"),"UTF-8")%>&workpointName=<%=java.net.URLEncoder.encode(java.net.URLEncoder.encode((String)request.getAttribute("workpointName"),"UTF-8"),"UTF-8")%>',
                dataType: 'json',
                type:'post',
                done: function (e, data) {
                    $('#fileupload').button('reset');                    
                    alert(data.result.message,null,2000);
                    window.location.reload();
                },
                progressall: function (e, data) {
                    $('#fileupload').button('上传中…');
                }
            });
            
            $(".edittable .creament").blur(function() {
            	var id = $(this).data("id");
            	if(this.value.trim() == "") {
            		$("#warnningLevel_"+id).html('<span class="label label-danger">异常</span>');
                	$("#accuCreament_"+id).html("");
                	$("#rate_"+id).html("");
                	$("#value_"+id).html("");
            		return;
            	}
            	var g5 = parseFloat(this.value);
            	var temp = $("#lastValue_"+id).html();
            	if(temp.trim() == "") return;
            	var d5 = parseFloat(temp);
            	var f5 = g5+d5;
            	var c5 = parseFloat($("#depths_"+id).html());
            	var h5 = f5-d5;
            	var e5 = parseInt($("input[name='lastDate["+id+"]']").val())/1000;
            	var createtime = ${nowTime}/1000;
            	$("#value_"+id).html(f5.toFixed(5));
            	$("#rate_"+id).html((h5/(createtime-e5)/86400).toFixed(5));
            	var jibie = f5;
            	var jibie2 = Math.abs(h5);
        	
        		var range;
        		var range2;
        		var nthree = parseFloat($("input[name='negthresholdThree["+id+"]']").val()) * -1;
        		var ntwo = parseFloat($("input[name='negthresholdTwo["+id+"]']").val()) * -1;
        		var none = parseFloat($("input[name='negthresholdOne["+id+"]").val()) * -1;
        		var three = parseFloat($("input[name='posthresholdThree["+id+"]").val());
        		var two = parseFloat($("input[name='posthresholdTwo["+id+"]").val());
        		var one = parseFloat($("input[name='posthresholdOne["+id+"]").val());
        		var rthree = parseFloat($("input[name='rateThree["+id+"]").val());
        		var rtwo = parseFloat($("input[name='rateTwo["+id+"]").val());
        		var rone = parseFloat($("input[name='rateOne["+id+"]").val());
        		if(jibie<nthree) range=3;
        		else if(jibie<ntwo) range=2;
        		else if(jibie<none) range=1;
        		else if(jibie<one) range=0;
        		else if(jibie<two) range=1;
        		else if(jibie<three) range=2;
        		else if(jibie>=three) range=3;
        		if(jibie2<rone) range2=0;
        		else if(jibie2<rtwo) range2=1;
        		else if(jibie2<rthree) range2=2;
        		else if(jibie2>=rthree) range2=3;
        		range = Math.max(range, range2);
        		if(range==0) $("#warnningLevel_"+id).html('<span class="label label-success">正常</span>');
        		else if(range==1) $("#warnningLevel_"+id).html('<span class="label label-danger">一级预警</span>');
        		else if(range==2) $("#warnningLevel_"+id).html('<span class="label label-danger">二级预警</span>');
        		else if(range==3) $("#warnningLevel_"+id).html('<span class="label label-danger">三级预警</span>');
            });
            
            $("#rowadd").click(function() {
            	$("tbody").append('<tr><td><a class="text-red" href="javascript:;">删除</a></td><td><input type="text" class="form-control" name="monitorName[]" value=""></td><td><input type="text" value="" class="form-control" name="depth[]"></td><td></td><td></td><td></td><td><input type="text" value="" class="form-control" name="creament[]"></td><td></td><td></td><td><input type="text" value="" class="form-control" name="message[]"></td></tr>');
            });
            
            $("tbody").on('click', 'a.text-red', function() {
            	var that = this;
            	confirm("是否要删除此列数据？", function(result) {
            		if(result) $(that).parent().parent().remove();
            	});
            });
        }); 
          
    </script>
</body>

</html>

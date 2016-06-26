<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>提交仓库信息</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<%@ include file="../Common/include/css.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/route.css">
    
<!-- 修复IE下的问题 -->
<!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
<style type="text/css">
.datetimepicker{padding:4px;margin-top:1px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;direction:ltr}.datetimepicker-inline{width:220px}.datetimepicker.datetimepicker-rtl{direction:rtl}.datetimepicker.datetimepicker-rtl table tr td span{float:right}.datetimepicker-dropdown,.datetimepicker-dropdown-left{top:0;left:0}[class*=" datetimepicker-dropdown"]:before{content:'';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0,0,0,0.2);position:absolute}[class*=" datetimepicker-dropdown"]:after{content:'';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid #fff;position:absolute}[class*=" datetimepicker-dropdown-top"]:before{content:'';display:inline-block;border-left:7px solid transparent;border-right:7px solid transparent;border-top:7px solid #ccc;border-top-color:rgba(0,0,0,0.2);border-bottom:0}[class*=" datetimepicker-dropdown-top"]:after{content:'';display:inline-block;border-left:6px solid transparent;border-right:6px solid transparent;border-top:6px solid #fff;border-bottom:0}.datetimepicker-dropdown-bottom-left:before{top:-7px;right:6px}.datetimepicker-dropdown-bottom-left:after{top:-6px;right:7px}.datetimepicker-dropdown-bottom-right:before{top:-7px;left:6px}.datetimepicker-dropdown-bottom-right:after{top:-6px;left:7px}.datetimepicker-dropdown-top-left:before{bottom:-7px;right:6px}.datetimepicker-dropdown-top-left:after{bottom:-6px;right:7px}.datetimepicker-dropdown-top-right:before{bottom:-7px;left:6px}.datetimepicker-dropdown-top-right:after{bottom:-6px;left:7px}.datetimepicker>div{display:none}.datetimepicker.minutes div.datetimepicker-minutes{display:block}.datetimepicker.hours div.datetimepicker-hours{display:block}.datetimepicker.days div.datetimepicker-days{display:block}.datetimepicker.months div.datetimepicker-months{display:block}.datetimepicker.years div.datetimepicker-years{display:block}.datetimepicker table{margin:0}.datetimepicker td,.datetimepicker th{text-align:center;width:20px;height:20px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;border:0}.table-striped .datetimepicker table tr td,.table-striped .datetimepicker table tr th{background-color:transparent}.datetimepicker table tr td.minute:hover{background:#eee;cursor:pointer}.datetimepicker table tr td.hour:hover{background:#eee;cursor:pointer}.datetimepicker table tr td.day:hover{background:#eee;cursor:pointer}.datetimepicker table tr td.old,.datetimepicker table tr td.new{color:#999}.datetimepicker table tr td.disabled,.datetimepicker table tr td.disabled:hover{background:0;color:#999;cursor:default}.datetimepicker table tr td.today,.datetimepicker table tr td.today:hover,.datetimepicker table tr td.today.disabled,.datetimepicker table tr td.today.disabled:hover{background-color:#fde19a;background-image:-moz-linear-gradient(top,#fdd49a,#fdf59a);background-image:-ms-linear-gradient(top,#fdd49a,#fdf59a);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fdd49a),to(#fdf59a));background-image:-webkit-linear-gradient(top,#fdd49a,#fdf59a);background-image:-o-linear-gradient(top,#fdd49a,#fdf59a);background-image:linear-gradient(top,#fdd49a,#fdf59a);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdd49a',endColorstr='#fdf59a',GradientType=0);border-color:#fdf59a #fdf59a #fbed50;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.datetimepicker table tr td.today:hover,.datetimepicker table tr td.today:hover:hover,.datetimepicker table tr td.today.disabled:hover,.datetimepicker table tr td.today.disabled:hover:hover,.datetimepicker table tr td.today:active,.datetimepicker table tr td.today:hover:active,.datetimepicker table tr td.today.disabled:active,.datetimepicker table tr td.today.disabled:hover:active,.datetimepicker table tr td.today.active,.datetimepicker table tr td.today:hover.active,.datetimepicker table tr td.today.disabled.active,.datetimepicker table tr td.today.disabled:hover.active,.datetimepicker table tr td.today.disabled,.datetimepicker table tr td.today:hover.disabled,.datetimepicker table tr td.today.disabled.disabled,.datetimepicker table tr td.today.disabled:hover.disabled,.datetimepicker table tr td.today[disabled],.datetimepicker table tr td.today:hover[disabled],.datetimepicker table tr td.today.disabled[disabled],.datetimepicker table tr td.today.disabled:hover[disabled]{background-color:#fdf59a}.datetimepicker table tr td.today:active,.datetimepicker table tr td.today:hover:active,.datetimepicker table tr td.today.disabled:active,.datetimepicker table tr td.today.disabled:hover:active,.datetimepicker table tr td.today.active,.datetimepicker table tr td.today:hover.active,.datetimepicker table tr td.today.disabled.active,.datetimepicker table tr td.today.disabled:hover.active{background-color:#fbf069}.datetimepicker table tr td.active,.datetimepicker table tr td.active:hover,.datetimepicker table tr td.active.disabled,.datetimepicker table tr td.active.disabled:hover{background-color:#006dcc;background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-ms-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(top,#08c,#04c);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc',endColorstr='#0044cc',GradientType=0);border-color:#04c #04c #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.datetimepicker table tr td.active:hover,.datetimepicker table tr td.active:hover:hover,.datetimepicker table tr td.active.disabled:hover,.datetimepicker table tr td.active.disabled:hover:hover,.datetimepicker table tr td.active:active,.datetimepicker table tr td.active:hover:active,.datetimepicker table tr td.active.disabled:active,.datetimepicker table tr td.active.disabled:hover:active,.datetimepicker table tr td.active.active,.datetimepicker table tr td.active:hover.active,.datetimepicker table tr td.active.disabled.active,.datetimepicker table tr td.active.disabled:hover.active,.datetimepicker table tr td.active.disabled,.datetimepicker table tr td.active:hover.disabled,.datetimepicker table tr td.active.disabled.disabled,.datetimepicker table tr td.active.disabled:hover.disabled,.datetimepicker table tr td.active[disabled],.datetimepicker table tr td.active:hover[disabled],.datetimepicker table tr td.active.disabled[disabled],.datetimepicker table tr td.active.disabled:hover[disabled]{background-color:#04c}.datetimepicker table tr td.active:active,.datetimepicker table tr td.active:hover:active,.datetimepicker table tr td.active.disabled:active,.datetimepicker table tr td.active.disabled:hover:active,.datetimepicker table tr td.active.active,.datetimepicker table tr td.active:hover.active,.datetimepicker table tr td.active.disabled.active,.datetimepicker table tr td.active.disabled:hover.active{background-color:#039}.datetimepicker table tr td span{display:block;width:23%;height:54px;line-height:54px;float:left;margin:1%;cursor:pointer;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.datetimepicker .datetimepicker-hours span{height:26px;line-height:26px}.datetimepicker .datetimepicker-hours table tr td span.hour_am,.datetimepicker .datetimepicker-hours table tr td span.hour_pm{width:14.6%}.datetimepicker .datetimepicker-hours fieldset legend,.datetimepicker .datetimepicker-minutes fieldset legend{margin-bottom:inherit;line-height:30px}.datetimepicker .datetimepicker-minutes span{height:26px;line-height:26px}.datetimepicker table tr td span:hover{background:#eee}.datetimepicker table tr td span.disabled,.datetimepicker table tr td span.disabled:hover{background:0;color:#999;cursor:default}.datetimepicker table tr td span.active,.datetimepicker table tr td span.active:hover,.datetimepicker table tr td span.active.disabled,.datetimepicker table tr td span.active.disabled:hover{background-color:#006dcc;background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-ms-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(top,#08c,#04c);background-repeat:repeat-x;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0088cc',endColorstr='#0044cc',GradientType=0);border-color:#04c #04c #002a80;border-color:rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.datetimepicker table tr td span.active:hover,.datetimepicker table tr td span.active:hover:hover,.datetimepicker table tr td span.active.disabled:hover,.datetimepicker table tr td span.active.disabled:hover:hover,.datetimepicker table tr td span.active:active,.datetimepicker table tr td span.active:hover:active,.datetimepicker table tr td span.active.disabled:active,.datetimepicker table tr td span.active.disabled:hover:active,.datetimepicker table tr td span.active.active,.datetimepicker table tr td span.active:hover.active,.datetimepicker table tr td span.active.disabled.active,.datetimepicker table tr td span.active.disabled:hover.active,.datetimepicker table tr td span.active.disabled,.datetimepicker table tr td span.active:hover.disabled,.datetimepicker table tr td span.active.disabled.disabled,.datetimepicker table tr td span.active.disabled:hover.disabled,.datetimepicker table tr td span.active[disabled],.datetimepicker table tr td span.active:hover[disabled],.datetimepicker table tr td span.active.disabled[disabled],.datetimepicker table tr td span.active.disabled:hover[disabled]{background-color:#04c}.datetimepicker table tr td span.active:active,.datetimepicker table tr td span.active:hover:active,.datetimepicker table tr td span.active.disabled:active,.datetimepicker table tr td span.active.disabled:hover:active,.datetimepicker table tr td span.active.active,.datetimepicker table tr td span.active:hover.active,.datetimepicker table tr td span.active.disabled.active,.datetimepicker table tr td span.active.disabled:hover.active{background-color:#039}.datetimepicker table tr td span.old{color:#999}.datetimepicker th.switch{width:145px}.datetimepicker th span.glyphicon{pointer-events:none}.datetimepicker thead tr:first-child th,.datetimepicker tfoot th{cursor:pointer}.datetimepicker thead tr:first-child th:hover,.datetimepicker tfoot th:hover{background:#eee}.input-append.date .add-on i,.input-prepend.date .add-on i,.input-group.date .input-group-addon span{cursor:pointer;width:14px;height:14px}

.form-group {
	width: 37.5%;
	float: left;
	margin: 0 10% 0 0;
	margin-bottom: 15px;
}

hr {
	width: 74%;
	margin-top: 5px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid #EEE;
}

.col-xs-offset-1 {
	margin: 0 0 0 8%;
	overflow: hidden;
}

.pull-right {
	margin: 0 13% 0 0;
}

.pull-right .esc {
	margin: 0 20px 0 0;
}
/* 第二期 */
form .change{
	float:left;
	margin-left: 20px;
}
.form-horizontal .form-group{
	width:65.5%;
}
.qqphone_option p,.users_option p{
    float: left;
    margin: -13px -61px 10px 7%;
    font-size: 18px;
}
.upload_img{
	position: relative;
}
.upload_img .uploadBtn{
	position: absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
	width:100px;
	height:100px;
	line-height: 100px;
	text-align: center;
	border-radius: 50%;
	color:#fff;
	background-color: #868686;
	filter:alpha(opacity=0);
	opacity:0;
	cursor: pointer;
	z-index: 100;
}

.modal-content .modal-body .form-group{
	width:100%;
	padding:0 10%;
}

@media (min-width: 768px){
	.modal-dialog {
	    width: 400px;
	    margin: 30px auto;
	}
}
.content-wrapper{
	margin-left:10%;
}

.wn{
	cursor: default;
	margin-left: 15px;
}

.wn1{
	margin-bottom: 0px;
}

.wn2{
	margin-top: 10px;
}

.wn_error{
    width: 34%;
    font-size: 12px;
    color: #DD4B39;
    margin: 0 auto;
    padding-bottom: 15px;
}

</style>
</head>

<body>
	<!-- 测试 start-->
	<!-- 信息填写框 -->
	<%@ include file="../Admin/include/navbar.jsp" %> 
	<div class="content-wrapper">
		<section class="content">
		
			<div class="box-header">
				<div class="box-title">信息录入</div>
				<hr/>
			</div>
			<div class="box">
				<div class="box-body">
					<div class="users_option">
					<hr>
						<div class="row">
							<form id="form">
								<div class="row-xs-4 col-xs-offset-1">
									<div class="form-group">
										<label>物品名称</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
										<input type="text" value="物品名1" class="form-control" name="name" maxlength="32" minlength="1" id="name"/>
									</div>
									
									<div class="form-group">
										<label>入库时间</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
									    <input class="datepicker form-control" value="2016-06-18" minlength="1" name="startTime" id="startTime" type="date" placeholder="请选择时间"/>
									</div>
									
								</div>
								<div class="row-xs-4 col-xs-offset-1">
									<div class="form-group" class="form-control">
										<label>入库原因</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
										<br/>
										<select class="form-control" name="message" id="message" minlength="1">
											<option>无人签收</option>
											<option>地址错误</option>
										</select>
									</div>
									<div class="form-group" class="form-control">
										<label>存放位置</label>
										<input type="text" class="form-control" name="location" value="位置1" id="location" maxlength="10" minlength="1" placeholder="所在位置" />
									</div>
									<div class="form-group">
										<label>二维码</label>
										<span class="autoreqmark" style="color:#FF9966"> *</span>
										<input type="text" class="form-control" name="code" value="123456789123456789" id="code" maxlength="18" minlength="18"/>
									</div>
								</div>
								<div class="pull-right">
									<button type="button" class="btn btn-primary" id="infoSubmit" >保存</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		
		
		      <div class="modal-footer">
		        
		        <button type="button" class="btn btn-primary" id="modelChangePhone" >提交</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<!-- 测试end -->
	<%@ include file="../Common/include/script.jsp"%>
	<script type="text/javascript" src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript">

	
	
	$("#infoSubmit").click(function(e){
	        console.log(1);
			e.preventDefault();
			$.post("/express/add",$("#form").serialize(),function(data){
				if(data.code == "200"){
					alert(data.message,null,1500,function(){
					})
				}else{
					alert(data.message)
				}
			});
		});
		</script>
</body>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title></title>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- 项目必要的外部依赖 -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/ionicons/css/ionicons.min.css">
		<!-- 项目公用样式文件 -->
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/AdminLTE.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/common.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/skins/skin-blue.min.css">
        <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/images/favicon.ico" type="image/x-icon">
		<!-- 修复IE下的问题 -->
		<!--[if lt IE 9]>
  		<script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  		<script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  		<![endif]-->
	</head>
	<body class="skin-blue sidebar-mini">
	<!-- 项目必要的外部依赖 -->
		<script src="<%=request.getContextPath() %>/assets/jQuery/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/jQuery/jquery-ui.min.js"></script>
		<!-- 解决jQuery UI tooltip和Bootstrap tooltip之间的冲突 -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script src="<%=request.getContextPath() %>/assets/bootstrap/js/bootstrap.min.js"></script>

		<!-- 项目公共脚本 -->
		<script src="<%=request.getContextPath() %>/assets/plugins/bootbox/bootbox.min.js"></script>        
		<script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/js/demo.js"></script>
		<script>
		  bootbox.dialog({message:"测点修改成功"});
          setTimeout(function(){
            if($("div[role=dialog]")){
				   $("div[role=dialog]").modal("hide");
			 }
	        location.replace("<%=request.getContextPath() %>/workpoint/showWorkpoint?workPointid=${workPointid}");
			$("#power").show();
					createTree(data.object);
			}, 2000);
		  

		</script>
	</body>
</html>
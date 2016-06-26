<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
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
    <!-- 表单相关样式 -->
    <style type="text/css">
    .form-group {
        margin: 10px 0;
    }
    textarea {
        width: 100% !important;
        resize: none;
    }
    form {
        overflow: hidden;
    }
    </style>
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="skin-blue sidebar-mini">
    <div class="wrapper">
        <header class="main-header">
            <!-- 左上Logo+Title -->
            <a href="#" class="logo">
                <span class="logo-mini"></span>
                <span class="logo-lg"></span>
            </a>
            <nav class="navbar navbar-static-top">
                <!-- 汉堡线 -->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"></a>
                <!-- 右上的用户信息 -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li><a href="/"><i class="fa fa-home"></i> 首页</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i> {$user} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">个人信息</a></li>
                                <li><a href="#">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">注销</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- 左边栏 -->
        <aside class="main-sidebar">
            <section class="sidebar">
                <!-- 搜索框 -->
                <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control" placeholder="搜索…">
                        <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                    </div>
                </form>
                <!-- 功能模块 -->
                <ul class="sidebar-menu">
                    <li class="header">功能模块</li>
                    <li class="active">
                        <a href="#">
                            <i class="fa fa-newspaper-o"></i> <span>信息展示</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-bar-chart"></i> <span>统计分析</span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-server"></i> <span>综合管理</span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="active"><a href="#"><i class="fa fa-pencil-square-o"></i> 线路编辑</a></li>
                            <li><a href="#"><i class="fa fa-group"></i> 账号管理</a></li>
                            <li><a href="#"><i class="fa fa-bookmark"></i> 标签管理</a></li>
                            <li><a href="#"><i class="fa fa-exchange"></i> 应急联动</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-calendar-o"></i> <span>日志管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-upload"></i> <span>数据上传</span>
                        </a>
                    </li>
                </ul>
            </section>
        </aside>
        <!-- 中间内容 -->
        <div class="content-wrapper" style="min-height: 542px;">
            <section class="content">
                <!-- 表单 -->
                <form class="form-inline" method="post" action="#">
                    <div class="box">
                        <div class="box-header">
                            <div class="box-title">工点基本信息</div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>工点编号</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>工点类型</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>工点名称</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>施工方法</label>
                                        <input type="text" class="form-control" placeholder="盾构条数（注意）">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>所属标段</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>工点长度</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-header">
                            <div class="box-title">相关人员</div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>管理人员</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>预警人员</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>第三方检测</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>施工单位</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>监理单位</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>相关人员</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>业主　　</label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-header">
                            <div class="box-title">应急方案</div>
                        </div>
                        <div class="box-body">
                            <textarea class="form-control" rows="8"></textarea>
                        </div>          
                    </div>
                    <div class="box">
                        <div class="box-header">
                            <div class="box-title">工点情况概述</div>
                        </div>
                        <div class="box-body">
                            <textarea class="form-control" rows="8"></textarea>
                        </div>          
                    </div>
                    <div class="pull-right">
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                </form>
                <!-- 表单结束 -->
            </section>
        </div>
    </div>
    <!-- 项目必要的外部依赖 -->
    <script src="<%=request.getContextPath() %>/assets/jQuery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/jQuery/jquery-ui.min.js"></script>
    <!-- 解决jQuery UI tooltip和Bootstrap tooltip之间的冲突 -->
    <script>
    $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="<%=request.getContextPath() %>/assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- 项目公共脚本 -->
    <script src="<%=request.getContextPath() %>/assets/js/app.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/demo.js"></script>
</body>

</html>

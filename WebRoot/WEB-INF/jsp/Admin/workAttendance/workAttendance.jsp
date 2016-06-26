<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>短信管理列表</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <style>
      .table{
               margin-top:10px;
            }
      .form-control{
             border-color:#15ADFF!important;
            }
       thead>tr{background-color:#15ADFF;
                      color:#fff;
                 }   
          span{
            padding-left: 20px;
            font-size: 12px;
        }
        tr>th,tr>td{
            text-align: center;
        }
       a:link,a:visited,a:hover{
            text-decoration: none;
        }
        .container{
            margin-top: 4px;
        }                  
    </style>
    <%@ include file="../../Common/include/css.jsp"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="skin-blue sidebar-mini">
    <!-- 中间内容 -->
    <%@ include file="../include/navbar.jsp" %>	
      <section class="content-header">
    	<h1>工作考勤</h1>
	    <ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath() %>/index">首页</a></li>
	        <li class="active">工作考勤</li>
	    </ol>
    </section>
    <div class="content-wrapper" style="min-height: 542px;">
        <section class="content">
            <div class="box">
            	<div class="box-header with-border">
              	</div>
                <div class="box-body">
                	 <div class="container">
       <div class="col-md-3">武汉理工大学 <span>最近三十天的考勤：</span></div>
       <div class="col-md-8">
           <div class="progress">
               <div class="progress-bar progress-bar-primary" style="width: 70%">
                   <span class="sr-only">70% Complete (success)</span>
               </div>
               <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                   <span class="sr-only">20% Complete (warning)</span>
               </div>
               <div class="progress-bar progress-bar-primary" style="width: 10%">
                   <span class="sr-only">10% Complete (danger)</span>
               </div>
           </div>
       </div>
       <div class="col-md-1">
         <a href="#">导出</a>
           <a href="javascript:change();" id="ok">收起</a>
       </div>
       <div id="a1">
           <table class="table table-bordered text-center">
               <thead>
               <tr>
                   <th>姓名</th>
                   <th>电话</th>
                   <th>角色</th>
                   <th>本职工作（应/实</th>
                   <th>回应反馈（应/实）</th>
                   <th>主动发布</th>
               </tr>
               </thead>
               <tbody>
               <tr>
                   <td>杨峻</td>
                   <td>15827109561</td>
                   <td>开发人员</td>
                   <td>21/4</td>
                   <td>21/20</td>
                   <td>32</td>
               </tr>
               <tr>
                   <td>杨峻</td>
                   <td>15827109561</td>
                   <td>开发人员</td>
                   <td>21/4</td>
                   <td>21/20</td>
                   <td>32</td>
               </tr>
               <tr>
                   <td>杨峻</td>
                   <td>15827109561</td>
                   <td>开发人员</td>
                   <td>21/4</td>
                   <td>21/20</td>
                   <td>32</td>
               </tr>
               <tr>
                   <td>杨峻</td>
                   <td>15827109561</td>
                   <td>开发人员</td>
                   <td>21/4</td>
                   <td>21/20</td>
                   <td>32</td>
               </tr>
               </tbody>
           </table>
       </div>
   </div>
    <div class="container"> 三十天的考勤：</span></div>
        <div class="col-md-8">
            <div class="progress">
                <div class="progress-bar progress-bar-primary" style="width: 70%">
                    <span class="sr-only">70% Complete (success)</span>
                </div>
                <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                    <span class="sr-only">20% Complete (warning)</span>
                </div>
                <div class="progress-bar progress-bar-success" style="width: 10%">
                    <span class="sr-only">10% Complete (danger)</span>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            <a href="#">导出</a>
            <a href="javascript:change1();" id="ok1">收起</a>
        </div>
        <div id="a2">
            <table class="table table-bordered text-center">
                <thead >
                <tr>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>角色</th>
                    <th>本职工作（应/实</th>
                    <th>回应反馈（应/实）</th>
                    <th>主动发布</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="container">
        <div class="col-md-3">武汉理工大学 <span>最近三十天的考勤：</span></div>
        <div class="col-md-8">
            <div class="progress">
                <div class="progress-bar progress-bar-primary" style="width: 70%">
                    <span class="sr-only">70% Complete (success)</span>
                </div>
                <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 20%">
                    <span class="sr-only">20% Complete (warning)</span>
                </div>
                <div class="progress-bar progress-bar-primary" style="width: 10%">
                    <span class="sr-only">10% Complete (danger)</span>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            <a href="#">收起</a>
            <a href="javascript:change2();" id="ok2">导出</a>
        </div>
        <div id="a3">
            <table class="table table-bordered text-center">
                <thead >
                <tr>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>角色</th>
                    <th>本职工作（应/实</th>
                    <th>回应反馈（应/实）</th>
                    <th>主动发布</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                <tr>
                    <td>杨峻</td>
                    <td>15827109561</td>
                    <td>开发人员</td>
                    <td>21/4</td>
                    <td>21/20</td>
                    <td>32</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
            </section>
        </div>
    </div>
    <%@ include file="../../Common/include/script.jsp"%>
   <script>
   function change(){
       var v=$('#ok');
        if(v.html()=='收起'){
            $('#a1').hide();
            v.html('展开')
        }
       else{
            $('#a1').show();
            v.html('收起')
        }
   }
   function change1(){
       var c=$('#ok1');
       if(c.html()=='收起'){
           $('#a2').hide();
           c.html('展开')
       }
       else{
           $('#a2').show();
           c.html('收起')
       }
   }
   function change2(){
       var c=$('#ok2');
       if(c.html()=='收起'){
           $('#a3').hide();
           c.html('展开')
       }
       else{
           $('#a3').show();
           c.html('收起')
       }
   }
   $('#export').click(function(){
       $('#a1').tableExport({type:'pdf',escape:'false'});
   });
</script>
</body>

</html>

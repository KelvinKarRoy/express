<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户列表</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="../include/commonCSS.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
  <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
  <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
  <![endif]-->
  
   <style type="text/css">
    .box-body {
        position: relative;
    }
    
    /*三角形*/
    .shape{
        position: absolute;
        top:-15px;
        left:3.5%;
        width: 0;
        height: 0;
        border-left: 12px solid transparent;
        border-right: 12px solid transparent;
        border-bottom: 15px solid #ECF0F5;
    }
    .form_add{
        position: relative;
        float: left;
        width:99%;
        background: #ECF0F5;
        font-size: 18px;
        padding: 2% 0% 1% 5%;
        margin:-15px 0 15px 5px;
    }
    /*弹出层添加工点按钮*/
    .form_add .addBtn{
        float: right;
        font:normal bold 30px/45px "汉真广标";
        background-color: #fff;
        color: #ECF0F5;
        padding:0 35px;
        margin: -215px 200px 0 0;
    }
    /*添加白色的背景条*/
    .form_add .bg_bar{
        position: absolute;
        top: 0;
        left:42.2%;
        width: 15px;
        background-color: #fff;
        height: 100%;
    }
    /*添加白色三角形*/
    .bg_shape{
        position: absolute;
        top:30px;
        left:43.6%;
        width: 0;
        height: 0;
        border-left: 15px solid #fff;
        border-top: 12px solid transparent;
        border-bottom: 12px solid transparent;
    }
    .form_add .boxform{
        width:39%;
        float: left;
        padding:10px;
        background-color: #ECF0F5;
    }
    .form_add .boxform p{
        width:98%;
    }
    .form_add .ul{
        width:60%;
        position:absolute;
        top:20px;
        right:0px;
        text-align: center;
    }
        
    .form_add .ul li{
    	box-sizing: content-box;
        float: left;
        width: 22%;
        height:25px;
        list-style: none;
        color: rgba(0,0,0,0.8);
        padding: 8px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .form_add .ul li a{
        color:rgba(0,0,0,1);
    }
    .form_add .ul li a:hover{
        color: rgba(0,0,0,0.8);
    }
    .form_add .ul .addMetro{
        float: left;
        display: block;
        width: 53px;
        height: 28px;
        line-height: 28px;
        border: none;
        margin: 6px 0 0 6%;
        background-color: #fff;
        color: rgba(0,0,0,0.8);
    }
    .form_add p span{
        width:100px;
        display: block;
        line-height: 28px;
        float: left;
        font-weight: bold;
        color: rgba(0,0,0,0.8);
    }
    .form_add p input{
        width:150px;
        height: 28px;
        background-color: #fff;
        padding: 6px;
        font-size: 18px;
        line-height: 1.42857143;
        color: rgba(0,0,0,0.8);
        background-image: none;
        border:none;
        /* border-radius: 4px; */
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    }
    .form_add p .s1{
        border:0;
        box-shadow: none;
        background: #ECF0F5;
        color: rgba(0,0,0,0.8);
    }
    .form_add p.save{
        width:86px;
        height: 41px;
        font-weight: 400;
        font-size: 20px;
        line-height: 41px;
        background-color: #ECF0F5;
        color:rgba(0,0,0,0.8);
        margin-left: 50px;
    }
    .form_add p select{
        width:150px;
        border:0;
        height:27px;
        font-size: 13px;
    }
    .form_add p .autoreqmark{
        color:#FF9966;
        float: right;
        margin-left:5px;
    }
    .form_add .boxform button{
        float:right;
        display: block;
        width:74px;
        height:33px;
        line-height: 33px;
        background-color: #fff;
        color:rgba(0,0,0,0.8);
        border:none;
    }

    /*补充bs样式*/

    #txtStatus{
    font-weight:normal;
    }
    .info-box{
        box-shadow: 1px 1px 1px rgba(0,0,0,0.1);
    }
    .line-block{
        width:24%;
        float: left;
        margin:0 0.5% 20px 0.5%;
        cursor: pointer;
    }
    /*纠正margin-bottom*/
    .bootom-supply{
        width:8.5%;
        margin-bottom: 34px;
    }
    .line-block .line-title{
        text-align: center;
        box-shadow: 1px 1px 1px rgba(0,0,0,0.1);
        background-color: #00C0EF;
    }
    .info-box .supply{
        padding-top:25px;
    }
    </style>
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
                <div class="box">
                    <div class="box-body">
                        <c:forEach items="${route}" var="r">
                        <!-- <div class="col-md-3 col-sm-6 col-xs-12"> -->
                        <div class="line-block hash">
                          <div class="info-box">
                            <span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline supply"></i></span>
                            <div class="info-box-content">
                              <span class="info-box-text">${r.routeName }</span>
                              <span class="info-box-number">${r.routeLength}<small>km</small></span>
                            </div>
                          </div>
                        </div>
                        </c:forEach>                 
                        
                    </div>
                </div>
            </section>
        </div>
       
     <%@ include file="../include/commonScript.jsp"%>

     
     <script>
        var loop = {},
            loop3 = 1;
        window.onload = function(){
            var lineBlocks = $(".line-block");
            for(var i =1;i<=lineBlocks.length;i++){
                (function(i){
                    lineBlocks.eq(i-1).on("click",function(){

                        $(".form_add .ul").html('<i class="fa fa-spinner"></i>&nbsp;加载中……');
                        
                        insert(i, lineBlocks.length);//增加DOM
                        
                        shapeMove(i-1);              //三角形移动

                        $("#boxform p input").addClass("s1");
                        $("#boxform p input").attr("disabled","disabled");
                        $("#boxform p select").hide();
                        $("#txtStatus").html($("#boxform p select").val()).show();

                        var id_update;

                        $.ajax({
			                type:"GET",
			                url:"<%=request.getContextPath() %>/route/routeInfo",
			                success:function(data){
                                $("#lineName").val(data.object[i-1].routeName);
                                $("#lineLength").val(data.object[i-1].routeLength);
                                $("#people").val(data.object[i-1].routeMain);
                                var time=data.object[i-1].startTime;
                                
                                $("#datepicker").val(changeTime(time));

                                id_update = data.object[i-1].id;   //赋值id
                                if(data.object[i-1].status == 1){
                                    $(".status").val("已完工");
                                }else if(data.object[i-1].status == 0){
                                    $(".status").val("施工中");
                                }else if(data.object[i-1].status == -1){
                                    $(".status").val("未施工");
                                }
			                }
			            });

                        $.ajax({
                            type:"GET",
                            url:"<%=request.getContextPath() %>/route/workpointInfo",
                            success:function(data){
                                $(".form_add .ul").html("");
                                $.each(data.object[i-1],function(index,ele){
                                    $(".form_add .ul").append('<li><a href="<%=request.getContextPath() %>/monitorPointData/showWarning?workpointId='+ele.id+'&workpointName='+ele.workpointName+'">'+ele.workpointName+'</a></li>');
                                });
                                
                            }
                        });
                        
                    })
                })(i);
            }
        };
        
  
        //三角形移动
        function shapeMove(i){
            var index = i%4;
            $(".shape").animate({left:index*25.2+3.5+'%'},"fast");
        }
        //插入左侧DOM结构(编辑信息)
         function insert(i, length){
            
            var line = indexLine(i);
            var ifForm = $(".box-body .hash").index($(".form_add"));
            if(line > length-1) line = length - 1;
            /*检测是不是存在旧的插入块*/    
            if($(".box-body .form_add") && ifForm > 0 && ifForm !== (line + 1) )
            {
                $(".form_add").remove();
                loop[line] = 0;
            }
            /**/
            if(!loop[line]){
                var target = document.querySelectorAll(".line-block")[line];
                var strDom ='<div class="shape"></div><div class="boxform" id="boxform"><p><span>线路名</span><input id="lineName" type="text"/></p>'+
                        '<p><span>线路长度</span><input id="lineLength" type="text"/><input type="hidden" value=""></p>'+
                        '<p><span>质安负责人</span><input id="people" type="text"/></p>'+
                        '<p><span>开始时间</span><input id="datepicker" class="" type="text" data-date-format="yyyy-mm-dd"/></p>'+
                        '<p style="overflow:hidden;"><span>线路状态</span><span id="txtStatus" style="margin-left:5px"></span><select id="status" class="status">'+
                        '<option value="施工中">施工中</option>'+
                        '<option value="未施工">未施工</option>'+
                        '<option value="已完工">已完工</option>'+
                        '</select></p>'+
                        '</div><div class="bg_bar"></div><div class="bg_shape"></div>'+
                        '<ul class="ul"><i class="fa fa-spinner"></i>&nbsp;加载中……</ul>';
                var oDiv = document.createElement("div");
                oDiv.className = "form_add hash";
                oDiv.innerHTML = strDom;
                insertAfter(oDiv,target);
                $("#datepicker").datepicker();
                loop[line] = 1;
            }
        }

        //像某个元素后插入元素
        function insertAfter(newElement,targetElement){
            var parent = targetElement.parentNode;
            if(parent.lastChild == targetElement){
                parent.appendChild(newElement);
            }else{
                parent.insertBefore(newElement,targetElement.nextSibling);
            }
        }
        //获取当前要插入的行数
        function indexLine(i){
            return Math.ceil(i/4)*4-1;
        }
    </script>
    
  </body>
</html>

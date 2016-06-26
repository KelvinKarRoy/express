<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <title>用户列表</title>
    <%@ include file="../../Common/include/meta.jsp"%>
    <%@ include file="../../Common/include/css.jsp"%>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/child.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/plugins/jquery-minicolors-master/jquery.minicolors.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/styles/route.css">
    
    <!-- 修复IE下的问题 -->
    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath() %>/assets/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath() %>/assets/js/respond.min.js"></script>
    <![endif]-->
    <style>
    	.content-wrapper{
    		width:100%;
    	}
    	
    </style>
</head>

<body class="sidebar-mini">
    <%@ include file="../include/navbar.jsp" %>     
    <div class="content-wrapper" style="min-height: 542px;">
            
            <section class="content">
                <div class="box_wn">
                    <div class="box-header">
                        <div class="box-title">线路编辑</div>
                    </div>
                    <div class="box-body">
                    	<c:forEach items="${routes}" var="route" >
	                        <div class="line-block hash" data-id="${route.id}">
	                            <div class="info-box" style="border-left:5px solid ${route.color}">
	                            <div class="info-box-content">
	                              <span class="info-box-number">${route.name}</span>
	                              <span class="info-box-text">
	                              	<c:if test="${route.status==-1}">未施工</c:if>
	                              	<c:if test="${route.status==0}">施工中</c:if>
	                              	<c:if test="${route.status==1}">已完工</c:if>
	                              	<c:if test="${route.status==-4}">已删除</c:if>
	                              </span>　
	                              <span class="info-box-text">${route.length}<small>km</small></span>
	                            </div>
	                          </div>
	                        </div>
                        </c:forEach>
                                  
                        <div class="line-block bootom-supply hash">
                            <div class="line-title">+</div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

    <%@ include file="../../Common/include/script.jsp"%>

    <script src="<%=request.getContextPath() %>/assets/plugins/jquery-minicolors-master/jquery.minicolors.min.js"></script>
    <script src="<%=request.getContextPath() %>/assets/plugins/datepicker/bootstrap-datepicker.js"></script>

     <script>
     
        var loop = {},
        	loop4 = 0,
            loop3 = 1;
        window.onload = function(){

           
            var lineBlocks = $(".line-block");
            
            for(var i =1;i<=lineBlocks.length;i++){
                (function(i){
                    lineBlocks.eq(i-1).on("click",function(){
                        if(i == lineBlocks.length){
                            $("#delete").hide();      //把删除按钮hide掉
 							
                            insert(i, lineBlocks.length);
                            /*限制输入长度*/
                            $("#lineLength").keydown(function(){limit(this,5);});
                            $("#routeColor").keydown(function(){limit(this,8);});
                            $("#people").keydown(function(){limit(this,32);});
                            $("#lineName").keydown(function(){limit(this,32);});

                            if($(".form_add").css('display') == 'none'){
								$(".form_add").show();
							}else{
								$(".add_close").click(function(){
									$(".form_add").hide();
								});
							}

                            $(".form_add .boxform .addFinishTime").hide();
                            $(".form_add .ul").html("");//把正在加载中remove掉
                            shapeMove(i-1,true);

                            $("#boxform p input").removeClass("s1").removeAttr("disabled").val("");
                            $("#boxform p select").removeAttr("disabled").show();
                            $("#txtStatus").hide();
                            $("#save").html("保存");
                            addline();                   //增加线路
                        }
                        if(i !== lineBlocks.length){
							var id_update,
                            id = $(this).data("id");

                            $(".form_add .ul").html('<i class="fa fa-spinner"></i>&nbsp;加载中……');
                            $("#delete").hide();
                            $(".addstarkey").hide();
                            
                            //if(loop4 == i) $(".form_add").remove();
							//else 
							//loop4 = i;
							insert(i, lineBlocks.length);//增加DOM$(".form_add")

                            $("#lineLength").keydown(function(){limit(this,5);});
                            $("#routeColor").keydown(function(){limit(this,8);});
                            $("#people").keydown(function(){limit(this,32);});
                            $("#lineName").keydown(function(){limit(this,32);});
							if($(".form_add").css('display') == 'none'){
								$(".form_add").show();
							}else{
								$(".add_close").click(function(){
									$(".form_add").hide();
								});
							}
                            shapeMove(i-1,false);              //三角形移动
							
                            $.ajax({
                                type:"POST",
              url:"<%=request.getContextPath() %>/route/info?id="+id,
                                success:function(data){
                                    $(".addFinishTime").hide();
                                    
                                    var time = data.object.route[0].startTime;
                                    var finishTime = data.object.route[0].finishTime;
                                    var pointColor = data.object.route[0].color;
                                    $("#lineName").val(data.object.route[0].name);
                                    $("#lineLength").val(data.object.route[0].length);
                                    $("#people").val(data.object.route[0].main);
                                    $(".status").val(status_wn(data.object.route[0].status));
                                    $(".wn_start").val(changeTime(time)); 
                                    $("#routeColor").val(pointColor);
                                    
                                    $(".minicolors-swatch .minicolors-swatch-color").css('backgroundColor',""+pointColor+"")
                                    
                                    /*线路状态改为“已完工”后应该记录并显示该线路的结束时间，默认为当天*/
                                    if(data.object.route[0].status == "1"){
                                        $(".addFinishTime").show();
                                        $(".wn_finish").val(changeTime(finishTime));
                                    }
                                    id_update = data.object.route[0].id;   //赋值id
                                    lookline(id_update);       //查看线路并把id传给后台
                                    $("#txtStatus").html($("#boxform p select").val()).show();

                                    $(".form_add .ul").html("");
                                    $.each(data.object.workpoints,function(index,ele){
                                        $(".form_add .ul").append('<li style="border"><a href="<%=request.getContextPath() %>/workpoint/index?id='+ele.id+'">'+ele.name+'</a></li>');
                                    });
                                    $(".form_add .ul").append('<a href="<%=request.getContextPath() %>/workpoint/addWorkpointInfo?routeId='+id_update+'" class="addMetro btn btn-default" id="addMetro">+</a>');
                                    $(".form_add .ul li").css({
                                        'border-left':"2px solid "+pointColor+""
                                    })

                                    $("#boxform p input").addClass("s1");
                                    $("#boxform p input").attr("disabled","disabled");
                                    $("#boxform p select").hide();
                                    $("#txtStatus").html($("#boxform p select").val()).show();
                                }
                            });
                        }
                    });
                })(i);
            }
        };
        
        
        //查看线路
        function lookline(id){
            var loop2 = 1,
            	flag = 0;
            $("#delete").hide();
            $("#save").html("编辑");
            $("#save").unbind();
            $("#save").on("click",function(e){
                var lineName = $("#lineName").val(),
                lineLength = $("#lineLength").val(),
                safePeople = $("#people").val(),
                finishStatus = $(".form_add p select").val(),
                startTime = new Date($(".wn_start").val()),  //传给后台的startTime
                startTime_check = $(".wn_start").val(),      //前端检测的startTime_check
                wn_finishTime = new Date($(".wn_finish").val()),
                color = $("#routeColor").val();
                status = 0;
                
                $(".form_add p").removeClass("has-success has-error");

                if(finishStatus == "未施工"){
                    status = -1;
                }else if(finishStatus == "已完工"){
                    status = 1;
                }else if(finishStatus == "施工中"){
                    status = 0;
                }
                
	        	if(!loop2){
	                var that = this;
	                e.preventDefault();
	                if(!(lineName && lineLength && safePeople && startTime_check && color)){
	                	if(!lineName){
	                		$("#lineName").parent().addClass('has-error');
	                	}
	                	if(!lineLength){
	                		$("#lineLength").parent().addClass('has-error');
	                	}
	                	if(!safePeople){
	                		$("#people").parent().addClass('has-error');
	                	}
	                	if(!startTime_check){
	                		$(".wn_start").parent().addClass('has-error');
	                	}
                        if(!color){
                            $("#routeColor").parent().parent().addClass('has-error');
                        }
                        $("#lineName").change(function(){
                            if($(this).val()) $("#lineName").parent().addClass('has-success').removeClass('has-error');
                        })
                        $("#lineLength").change(function(){
                            if(isNum($(this).val())) $("#lineLength").parent().addClass('has-success').removeClass('has-error');
                        })
                        $("#people").change(function(){
                            if($(this).val()) $("#people").parent().addClass('has-success').removeClass('has-error');
                        })
                        $(".wn_start").change(function(){
                            if($(this).val()) $(".wn_start").parent().addClass('has-success').removeClass('has-error');
                        })
                        $("#routeColor").change(function(){
                            if($(this).val()) $("#routeColor").parent().parent().addClass('has-success').removeClass('has-error');
                        })
                		alert('请输入完整的字段',null);
                	}else if(!isNum(lineLength)){

	                	$("#lineLength").parent().addClass('has-error');
                		alert('线路请输入数字',null);
                	}else{
                		flag = 1;
                		$(".form_add p input").parent().addClass('has-success');
                        $.post(
                            "<%=request.getContextPath() %>/route/edit",
                            {
                                name:lineName,
                                length:lineLength,
                                main:safePeople,
                                startTime:startTime,
                                status:status,
                                color:color,
                                id:id
                            },function(data){
                                if(data.code!=200){
                                    alert(data.message,null)
                                }else{
                                    alert(data.message,null,1500,function(){
                                        window.location.reload()
                                    })
                                }
                            }
                        );
		            }
	        	}
	            if(loop2){
	                $("#lineName").val(lineName);
	                $("#lineLength").val(lineLength);
	                $("#people").val(safePeople);
	                $(".wn_start").val(changeTime(startTime));
	                $(".form_add p select").val(finishStatus);
	                
	                $("#boxform p input").removeClass("s1");
	                $("#boxform p input").removeAttr("disabled");
	                $("#boxform p select").show();
	                $("#boxform p select").removeAttr("disabled");

	                $("#txtStatus").hide();
	                $("#save").html("保存");

	                $("#delete").show();

	                $(".addstarkey").show();

	                /*当删除出现的时候，添加删除事件*/
	                $("#delete").unbind();
	                $("#delete").on("click",function(e){
	                    
	                	if($(".form_add .ul li").length > 0){
	                        alert("您无权限删除此路线，因为此线路下有工点！");
	                    }else{
	                        var that = this;
	                        e.preventDefault();
	                        confirm("确定要删除吗？", function(result) {
	                            if(result){
	                                $.post(
	                                "<%=request.getContextPath() %>/route/delete",
	                                {
	                                    id:id
	                                },function(data){
                                        if(data.code!=200){
                                            alert(data.message,null)
                                        }else{
                                            alert(data.message,null,1500,function(){
                                                window.location.reload();
                                            })
                                        }
	                                }
	                                );
	                            }
	                        });
	                    }
	                });
	                /**/
	                loop2 = 0;
	            }else{
	            	if(flag){
		                $("#boxform p input").addClass("s1");
		                $("#boxform p input").attr("disabled","disabled");
		                $("#boxform p select").hide();
		                $("#txtStatus").html($("#boxform p select").val()).show();
		                $("#save").html("编辑");
		                $(".addstarkey").hide();
		                $("#delete").hide();
		                loop2 = 1;
		            }
	            }
            	
        	});
        }
        //增加线路
        function addline(){
            $(".addstarkey").show();
            $("#save").unbind();
            $("#save").on("click",function(e){
                var lineName = $("#lineName").val(),
                lineLength = $("#lineLength").val(),
                safePeople = $("#people").val(),
                startTime = new Date($(".wn_start").val()), //提交给后台的startTime
                startTime_check = $(".wn_start").val(),     //前端检测用的startTime_check
                finishStatus = $(".form_add p select").val(),
                color = $("#routeColor").val();
                status;
                
                if(finishStatus == "未施工"){
                    status = -1;
                }else if(finishStatus == "施工中"){
                    status = 0;
                }else if(finishStatus == "已完工"){
                    status = 1;
                }

                $(".form_add p select").parent().addClass('has-success');

                if(!(lineName && lineLength && safePeople && startTime_check && color)){
                	if(!lineName){
                		$("#lineName").parent().addClass('has-error');
                	}
                	if(!lineLength){
                		$("#lineLength").parent().addClass('has-error');
                	}
                	if(!safePeople){
                		$("#people").parent().addClass('has-error');
                	}
                	if(!startTime_check){
                		$(".wn_start").parent().addClass('has-error');
                	}
                    if(!color){
                        $("#routeColor").parent().parent().addClass('has-error');
                    }
                    $("#lineName").change(function(){
                        if($(this).val()) $("#lineName").parent().addClass('has-success').removeClass('has-error');
                    })
                    $("#lineLength").change(function(){
                        if(isNum($(this).val())) $("#lineLength").parent().addClass('has-success').removeClass('has-error');
                    })
                    $("#people").change(function(){
                        if($(this).val()) $("#people").parent().addClass('has-success').removeClass('has-error');
                    })
                    $(".wn_start").change(function(){
                        if($(this).val()) $(".wn_start").parent().addClass('has-success').removeClass('has-error');
                    })
                    $("#routeColor").change(function(){
                        if($(this).val()) $("#routeColor").parent().parent().addClass('has-success').removeClass('has-error');
                    })
                	alert('请输入正确的格式',null);
                }else if(!isNum(lineLength)){
                	$("#lineLength").parent().addClass('has-error');
                	alert('线路请输入数字',null);
                }else{
                    
                	$(".form_add p").addClass('has-success');
	                if(loop3){
                        var that = this;
                        e.preventDefault();
                        confirm("是否确定添加？", function(result) {
                            if(result){
                                $.post("<%=request.getContextPath() %>/route/checkRouteExists",{routeName:lineName},function(data){
                                    	if(data.code!="200"){
                                    		alert(data.message,null,1500);
                                    		$("#boxform p input").removeClass("s1");
    					                    $("#boxform p input").removeAttr("disabled");
    					                    $("#boxform p select").show();
    					                    $("#txtStatus").hide();
    					                    loop3 = 1;
                                    	}else if(data.code=="200"){
                                            $.post(
                                            "<%=request.getContextPath() %>/route/add",
                                            {
                                                name:lineName,
                                                length:lineLength,
                                                main:safePeople,
                                                startTime:startTime,
                                                status:status,
                                                color:color
                                            },function(data){
                                                if(data.code!=200){
                                                    alert(data.message,null)
                                                }else{
                                                	alert(data.message,null,1500,function(){
                                                        window.location.reload();
                                                    });
                                                }                                        
                                            }
                                            );
                                    	}
                                    },"json");
                                }else{
                                    $("#boxform p input").removeClass("s1");
                                    $("#boxform p input").removeAttr("disabled");
                                    $("#boxform p select").show();
                                    $("#txtStatus").hide();
                                    $("#save").html("保存");
                                    loop3 = 1;
                                }
                            }
                        );
                    }
	            }
            });
        }
        //三角形移动
        function shapeMove(i,bool){
            var index = i%4;
            if(!bool){
                $(".shape").animate({left:index*25.2+11.5+'%'},"fast");
            }else{
                $(".shape").animate({left:index*25.2+3.9+'%'},"fast");
            }
            
        }
        //插入左侧DOM结构(编辑信息)
        function insert(i, length){
        
            var line = indexLine(i);
            var ifForm = $(".box-body .hash").index($(".form_add"));
            if(line > length-1) line = length - 1;
            //检测是不是存在旧的插入块
            if($(".box-body .form_add") && ifForm > 0 && ifForm !== (line + 1) )
            {
                $(".form_add").remove();
                loop[line] = false;
            }
            
            if(!loop[line]){
                var target = document.querySelectorAll(".line-block")[line];
                var strDom ='<div class="shape"></div><div class="boxform" id="boxform"><form><p class="clear"><span>线路名</span><input id="lineName" class="form-control" name="lineName" type="text" placeholder="请输入线路名"/><i class="addstarkey" id="addstarkey"> *</i></p>'+
                        '<p class="clear"><span>线路长度</span><input id="lineLength" class="form-control" name="lineLength" type="text" placeholder="请输入数字(km)"/><input type="hidden" value=""><i class="addstarkey" id="addstarkey"> *</i></p>'+
                        '<p class="clear"><span>质安负责人</span><input id="people" class="form-control" name="safePeople" type="text" placeholder="请输入负责人姓名"/><i class="addstarkey"> *</i></p>'+
                        '<p class="clear"><span>开始时间</span><input class="datepicker wn_start form-control" name="startTime" type="text" data-date-format="yyyy-mm-dd" placeholder="请选择时间"/><i class="addstarkey"> *</i></p>'+
                        '<p class="addFinishTime clear"><span>结束时间</span><input class="datepicker wn_finish form-control" name="finishTime" type="text" data-date-format="yyyy-mm-dd" placeholder="请选择时间"/></p>'+
                        '<p class="clear" style="overflow:hidden;"><span>线路状态</span><span id="txtStatus" style="margin-left:11px"></span><select id="status" class="status form-control" name="status">'+
                        '<option value="施工中">施工中</option>'+
                        '<option value="未施工">未施工</option>'+
                        '<option value="已完工">已完工</option>'+
                        '</select><i class="addstarkey" > *</i></p>'+
                        '<p class="clear"><span>线路颜色</span><input id="routeColor" class="form-control" name="color" type="text" placeholder="选择颜色"/><i class="addstarkey"> *</i></p></form>'+
                        '<button class="save btn btn-default" id="save">编辑</button>'+
                        '<button class="delete btn btn-link" id="delete" style="float:right;margin-right:11px;display:none;color:#dd4b39">删除</button>'+
                        '</div><div class="bg_bar"></div><div class="bg_shape"></div><div class="add_close">×</div>'+
                        '<ul class="ul"><i class="fa fa-spinner"></i>&nbsp;加载中……</ul>';
                var oDiv = document.createElement("div");
                oDiv.className = "form_add hash";
                oDiv.innerHTML = strDom;
                insertAfter(oDiv,target);
                //初始化日历插件
                $(".datepicker").datepicker();
                //初始化颜色选择插件
                var settings = {
                        animationSpeed: 50,
                        animationEasing: 'swing',
                        change: null,
                        changeDelay: 0,
                        control: 'wheel',
                        defaultValue: '',
                        hide: null,
                        hideSpeed: 100,
                        inline: false,
                        letterCase: 'lowercase',
                        opacity: false,
                        position: 'bottom left',
                        show: null,
                        showSpeed: 100,
                        theme: 'bootstrap'
                }
                $('#routeColor').minicolors(settings);
                $(".addstarkey").hide();
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

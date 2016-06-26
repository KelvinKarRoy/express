<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../Common/include/meta.jsp" %>
	<title>武汉地铁风险预警系统</title>
	<%@ include file="../../Common/include/css.jsp" %>	
	<style>
	body{
	     font-family: "microsoft yahei";
	}
      .box-body{
      margin:0 auto;
      padding:3% 22%;}
      form{
            margin-left:80px;
            padding:4px 0;
      }
      .h4{padding-right:10px;
      color:#333333;
      font-size:16px;
      font-family: "microsoft yahei";
      }
      .h5{margin-left:-40px;
        color:#333333;
        font-size:14px;
        font-family: "microsoft yahei";
      }
      input,select{ width:60px;
      }
      hr{magrin-left:10px;
      height:1px;
      border-top:1px solid #cccccc;
      }
      label{
         color:#666666;
         font-weight:normal;
      }
     
  .content-header h1 {
    font-family: "microsoft yahei";
    font-size: 20px;
    color: #3C8DBC;
}
	</style>
</head>
<body>
<%@ include file="../include/navbar.jsp" %>	
 <div class="content-wrapper" style="min-height: 542px;">
     <section class="content-header">
    	<h1>系统配置</h1>
	    <ol class="breadcrumb">
	        <li><a href="<%=request.getContextPath() %>/index">首页</a></li>
	        <li class="active">系统配置</li>
	    </ol>
    </section>
       <section class="content">
            <div class="box box-primary">      	             	
               <div class="box-body">
               <div class="h4  pull-left">自动异常设置</div>
                <div><hr></div>              
                  <form action="<%=request.getContextPath()%>/system/config" name="systermconfig" role="form"  method="post" id="form1"
                  >
                   <div class="h5">施工监测</div>
                   <div class="form-inline">
                    <input type="hidden" name="code" value="auto_exception">
                    <label>已报警测点</label>
                    <input type="number" id="construct_warning_days" name="construct_warning_days">                   
                      <label>天之后开始报异常</label>                     
                    </div>                                                         
                     <div class="form-inline">
                     <label>原正常测点</label>
                     <input type="number" id="construct_normal_days"  name="construct_normal_days">                   
                    <label>天之后开始报异常</label>                     
                    </div>               
                    <div class="h5">第三方监测</div> 
                    <div class="form-inline">                
	                     <label>已报警测点</label>
	                     <input type="number" id="thirdparty_warning_days"  name="thirdparty_warning_days">	                     
	                    <label>天之后开始报异常</label>
	                    </div>	                                  
                     <div class="form-inline">
                     <label>原正常测点</label>
                     <input type="number" id="thirdparty_normal_days"  name="thirdparty_normal_days">                    
                    <label>天之后开始报异常</label>
                      <button class="btn btn-primary pull-right" type="submit">保存</button>  
                    </div>                 
                </form>                 
                  <div class="h4  pull-left">自动预警设置</div>
                    <div><hr></div>              
                  <form action="<%=request.getContextPath()%>/system/config" name="systermconfig4" role="form"  method="post" id="form2">
                    <div class="form-inline">
                     <input type="hidden" name="code" value="auto_warning">
                     <label>速率连续</label>
                     <input type="number"  id="increase_days" name="increase_days">                      
                     <label>天超过速率阈值</label>
                     <input type="number"  id="increase_threshold" name="increase_threshold">                    
                     <label>%将会自动预警</label>                     
                    </div>                                                  
                     <div class="form-inline">
                     <label>速率连续</label>
                     <input type="number"  id="decrease_days" name="decrease_days">                      
                    <label>天低于速率阈值</label>
                    <input type="number"  id="decrease_threshold" name="decrease_threshold">                    
                       <label>%将会自动降低预警等级</label>
                        <button class="btn btn-primary pull-right" type="submit">保存</button>        
                    </div>              
                  </form>                 
                   <div class="h4 pull-left">自动转发设置</div>
                   <div><hr></div>                
                  <form action="<%=request.getContextPath()%>/system/config" name="systermconfig6" role="form"  method="post" id="form3">                  
                   <div class="form-inline">
                    <input type="hidden" name="code" value="auto_transmit">
                    <label>超过</label>
                    <select type="tel" id="auto_warning_level"  name="auto_warning_level">                   
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>                     
                      </select>
                    <label>级预警等级的预警数据将会自动发送成预警信息</label>                     
                   </div>                
                   <div class="form-inline">
                     <label>超过</label>
                     <input type="number"  id="auto_construct_exception_days"  name="auto_construct_exception_days">                     
                    <label>天连续异常的施工预警数据将会自动发送成预警信息</label>                            
                    </div>                                                     
                   <div class="form-inline">
                     <label>超过</label>
                     <input type="number" id="auto_thirdparty_exception_days"  name="auto_thirdparty_exception_days">                     
                     <label>天连续异常的第三方预警数据将会自动发送成预警信息</label>
                     <button class="btn btn-primary  pull-right" type="submit">保存</button>        
                    </div>
                  </form> 
              </div>                
              </div>
          
        </section>  
 </div>   
</div>
<%@ include file="../../Common/include/script.jsp"%>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery-validate/jquery.validate.min.js"></script>
<script type="text/javascript">
var construct_warning_days="${dataMap.construct_warning_days}";
$("#construct_warning_days").get(0).value=construct_warning_days;

var construct_normal_days="${dataMap.construct_normal_days}";
$("#construct_normal_days").get(0).value=construct_normal_days;

var thirdparty_warning_days="${dataMap.thirdparty_warning_days}";
$("#thirdparty_warning_days").get(0).value=thirdparty_warning_days;

var thirdparty_normal_days="${dataMap.thirdparty_normal_days}";
$("#thirdparty_normal_days").get(0).value=thirdparty_normal_days;

var increase_days="${dataMap.increase_days}";
$("#increase_days").get(0).value=increase_days;

var increase_threshold="${dataMap.increase_threshold}";
$("#increase_threshold").get(0).value=increase_threshold;

var decrease_days="${dataMap.decrease_days}";
$("#decrease_days").get(0).value=decrease_days;

var decrease_threshold="${dataMap.decrease_threshold}";
$("#decrease_threshold").get(0).value=decrease_threshold;

var auto_warning_level="${dataMap.auto_warning_level}";
$("#auto_warning_level").get(0).value=auto_warning_level;

var auto_construct_exception_days="${dataMap.auto_construct_exception_days}";
$("#auto_construct_exception_days").get(0).value=auto_construct_exception_days;

var auto_thirdparty_exception_days="${dataMap.auto_thirdparty_exception_days}";
$("#auto_thirdparty_exception_days").get(0).value=auto_thirdparty_exception_days;
      		  	$(function() {  
      		  	                   $("#form1").validate({            
                    rules:{
               construct_warning_days:{
                            digits:true,
                            number:true,
                            min:0,
                            max:99,
                            required:true
                        }, 
                         construct_normal_days:{
                            digits:true,
                             number:true,
                             min:0,
                             max:99,
                            required:true
                        }, 
                       thirdparty_warning_days:{
                            digits:true,
                             number:true,
                            min:0,
                            max:99,
                            required:true
                        },
                        thirdparty_normal_days:{
                            digits:true,
                             number:true,
                            min:0,
                            max:99,
                            required:true
                        },                                                                        
                    },
                    messages:{
                       construct_warning_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字",
                            number:"请输入合法的数字"
                        }, 
                        construct_normal_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字",
                              number:"请输入合法的数字"
                        }, 
                        thirdparty_warning_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字",
                             number:"请输入合法的数字"
                        }, 
                        thirdparty_normal_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字",
                             number:"请输入合法的数字",
                        },                                                                                   
                    }           	
            	});
            	$("#form1").submit(function(e) {     
            	e.preventDefault();      		                     
                		$.post($(this).attr("action"), $(this).serialize(), function(data) {
                			alert(data.message, function() {
                				if(data.code == "200") {window.location.href="<%=request.getContextPath()%>/system/allconfigs";}                		               				                  			
                				
                			});
                		});
                	
            	});
                  $("#form2").validate({
                   rules:{            
                      increase_days:{
                            required:true,
                            digits:true,
                            min:0,
                            max:99,                         
                        }, 
                        increase_threshold:{
                             required:true,
                            digits:true,
                            min:0,
                            max:99,  
                        }, 
                       decrease_days:{
                            required:true,
                            digits:true,
                            min:0,
                            max:99,  
                        },
                       decrease_threshold:{
                             required:true,
                            digits:true,
                            min:0,
                            max:99,  
                        },                                                                        
                 },
                    messages:{                  
                     increase_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字"
                        }, 
                       increase_threshold:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字"
                        }, 
                        decrease_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字"
                        }, 
                        decrease_threshold:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字"
                        },                                                       
                    }           	
            	});
            	$("#form2").submit(function(e) {     
            	          e.preventDefault();      		                   
                		$.post($(this).attr("action"), $(this).serialize(), function(data) {
                			alert(data.message, function() {
                				if(data.code == "200") {window.location.href="<%=request.getContextPath()%>/system/allconfigs";}
                				                			
                			});
                		});
                	
            	});                 
            	 $("#form3").validate({            
                    rules:{
                        auto_construct_exception_days:{
                            digits:true,
                            min:0,
                            max:99,
                            required:true
                        },  
                        auto_thirdparty_exception_days:{
                            digits:true,
                            min:0,
                            max:99,
                            required:true
                        }                                                
                    },
                    messages:{
                      auto_construct_exception_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字"
                        } ,
                        auto_thirdparty_exception_days:{
                            digits:"请输入正整数",
                            min:"请输入0到99之间的数字",
                            max:"请输入0到99之间的数字",
                            required:"请输入数字"
                        },                                         
                    }           	
            	});
            	$("#form3").submit(function(e) {     
            	e.preventDefault();      		
                    
                		$.post( $(this).attr("action"), $(this).serialize(), function(data) {
                			alert(data.message, function() 
                			{
                				if(data.code == "200") {
                				window.location.href="<%=request.getContextPath()%>/system/allconfigs";
                				}             				
                				
                		       });  
                		       });            	
            	     });
            	
  });             
                               
</script>
</body>
</html>
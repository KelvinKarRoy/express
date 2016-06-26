<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../../Common/include/meta.jsp" %>
<title>角色管理</title>
<%@ include file="../../Common/include/css.jsp" %>	
<style type="text/css">
  	.group-header{
		padding:0;
		height:32px;
	}
	.group-header:not(.add-labelGroup){
		background:url('<%=request.getContextPath() %>/assets/images/group-hd-bg.gif') 0 50% repeat-x;
	}
   a {
     color: #efefefccc;
   }
   .btn {
     margin-left: 5px;
   }
   .content-header h1{
		font-family:"microsoft yahei";
		font-size: 20px;
		color: #3C8DBC;
	}
   .label-group {
     margin-top: 20px;
   }
   .group-header>span,.edit-group-box>span{
		font-size:18px;
		color:#333;
		float:left;
		background:#fff;
		padding-top:5px;
		padding-right:5px;
	}
   .group-content {
     margin-top: 30px;
     margin-bottom: 30px;
   }
   .group-content label {
    	overflow:hidden;
		text-overflow:ellipsis;
		width: 120px;
		color:#5E5E5E;
		height:20px;
		background-color:#f5f5f5;
		border-radius:10px;
		text-align:center;
		line-height:20px;
		font-weight:normal;
   }
	.edit-unsort-group-btn,.edit-sort-group-btn{	
		font-size:16px;
		float:right;
		padding-left:10px;
		padding-top:6px;
		background:#fff;
		cursor:pointer;
		color:#666;
		font-size:14px !important;
		vertical-align:middle;
	}
	.edit-unsort-group-btn span,.edit-sort-group-btn span{
		font-size:14px !important;
		height:20px;
	}
   #add-labelGroup {
     color: #3c8dbc;
     cursor: pointer;
   }
   .add-labelGroup {
     margin-bottom: 20px !important;
   }
   .edit-group-form{
     display: inline-block;
   	 background: #fff;
   	 max-width: 300px;
   }
   .edit-group-box {
     background: #fff;
     float: left;
   }
   .edit-group-btn{
   		color:#ccc;
		margin-right:8px;
		margin-left:8px;
		margin-top:2px;
		cursor:pointer;
		display:none;
   }
   .edit-group-box:hover .edit-group-btn {
     display: inline-block;
   }
   
   .label-group .delete-group {
   	 padding-top:0;
   	 display:none;
     padding-left: 10px;
     line-height: 34px;
     background: #fff;
     font-size: 14px !important;
     color: red;
     float: right;
     cursor: pointer;
   }
   .group-header>span,.edit-group-box>span {
     float: left;
     background: #fff;
     padding-right: 10px;
   }
   .edit-group-box>a {
     padding-top: 5px;
   }
 
   .edit-sort-group-form {
     background: #fff;
     float: right;
     display: none;
     margin: 0 !important;
   }
   .cancel-group-content{
		padding-left:10px;
	}
	.cancel-group,#cancel{
		box-shadow:none !important;
		border:none;
		outline:0 !important;
		color:#999 !important;
	}
</style>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<div class="content-wrapper" style="min-height: 542px;">
  <section class="content-header">
    <h1>角色管理</h1>
    <ol class="breadcrumb">
      <li><a href="#">首页</a>
      </li>
      <li class="active">角色管理</li>
    </ol>
  </section>
  <section class="content">
    <div class="box">
      <div class="box-body">
        <!-- 已分类的角色管理 -->
        <!-- 循环输出 -->
        <c:forEach items="${listRole}" var="role" varStatus="status">
          <div class="label-group">
            <div class="group-header col-md-10 col-md-offset-1">
              <div class="edit-group-box">
                <span>${role.roleName}</span> <a href="javascript:;" class="edit-group-btn">编辑</a>
              </div>
              <!-- 点击编辑后的表单 -->
                <form class="edit-group-form edit-form" style="display:none;">
                  <input type="text" class="form-control labelGroup-name"
                         value="${role.roleName}" style="width:130px;float:left;margin-right:10px;">
                  <button type="button" class="btn btn-primary save-group"
                          data-id="${role.id}">保存</button>
                  <button type="button" class="btn btn-link cancel-group">取消</button>
                </form>
                <span class="delete-group" data-id="${role.id}">删除该角色组</span>
              <!-- 编辑权限按钮 -->
              <ul class="list-inline edit-sort-group-btn">
                <li><span class="glyphicon glyphicon-edit" ></span> 编辑权限</li>
              </ul>
              <!-- 编辑选项 -->
              <ul class="list-inline edit-sort-group-form"
                  style="float:right;margin-top:-30px;display:none">
                <li><a href="javascript:;" data-id="${role.id}" class="cancel-group-content">取消</a>
                </li>
                <li>
                  <button type="button" class="btn btn-primary delete-unsort-label groupOption">保存</button>
                </li>
              </ul>
            </div>
              <!-- 角色内容 -->
              <div class="group-content col-md-8 col-md-offset-2">
                <!-- 循环输出每个角色 -->
                <c:forEach items="${allMenu}" var="menu">
                  <label style="display:<c:if test="${menu.changable==false}">none</c:if>" class="role-label" data-edit="false" data-id="${menu.id}" data-changable="${menu.changable}" data-status="#e<c:forEach items="${listOfListMenu[status.index]}" var="rr"><c:if test="${menu.id==rr.id}">f</c:if></c:forEach>">${menu.menuName}</label>
                </c:forEach>
              </div>
          </div>
        </c:forEach>
        <!-- 新建角色组 -->
        <div class="label-group add-group">
          <div class="group-header add-labelGroup col-md-10 col-md-offset-1">
            <span id="add-labelGroup">+新建角色组</span>
            <!-- 编辑按钮 -->
              <form class="edit-group-form add-form" style="display:none;">
                <input type="text" class="form-control" id="labelGroupName"
                       value="" placeholder="例如：预警人员" style="width:130px;float:left" />
                <button type="button" class="btn btn-primary" id="save">保存</button>
                <button type="button" class="btn btn-link" id="cancel">取消</button>
              </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<%@ include file="../../Common/include/script.jsp" %>
	<script>

  $("#add-labelGroup").click(function(){
    $(this).hide().next(".add-form").show();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
    $(this).parents(".label-group").siblings(".label-group").find(".delete-group").hide();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
    $(".role-label").css({"cursor":"auto"});
  });
  $("#save").click(function(){
    var name=$("#labelGroupName").val();
    if(name==""){
      confirm("名称不能为空",function(){
        window.location.reload();
      });
    }else{
      $.post("<%=request.getContextPath()%>/role/newRole",
          {roleName:name},
          function(data){
            if(data.code=="200"){
              alert(data.message,null,1500,function(){
                window.location.reload();
              });
            }else if(data.code=="201"){
              confirm(data.message,function(){
                window.location.reload();
              });
            }
          },"json");
    }
  });
  $("#cancel").click(function(){
    $(this).parents(".add-form").hide();
    $("#add-labelGroup").show();
  });
  //编辑
  $(".edit-group-btn").click(function(){
   $(".role-label").css("cursor","auto");
  	for(var i = 0;i<=listLabels-1;i++){
 		if($(".box-body").find("label").eq(i).attr("data-mark")=="yes"){
				$(".box-body").find("label").eq(i).attr("data-status","#ef").css("background-color","#ceebeb");
			}else{
				$(".box-body").find("label").eq(i).attr("data-status","#e").css("background-color","#f5f5f5");
			}
		}
    $(this).parent(".edit-group-box").hide();
    $(this).parents(".label-group").find(".edit-form").show();
    $(this).parents(".label-group").find(".edit-sort-group-btn").hide();
    $(this).parents(".label-group").find(".edit-sort-group-form").hide();
    $(this).parents(".label-group").find(".delete-group").hide();
    $(this).parents(".label-group").find(".delete-group").show();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
    $(this).parents(".label-group").siblings(".label-group").find(".delete-group").hide();
    $(".add-form").hide();
    $("#add-labelGroup").show();
  });
  $(".delete-group").click(function(e){
    var id=$(this).attr("data-id");
    e.preventDefault();
    confirm("确认要删除角色组么?",function(result){
      if(result){
        $.post("<%=request.getContextPath()%>/role/deleteRole",
            {roleId:id},
            function(data){
              if(data.code=="200"){
                alert(data.message,null,1500,function(){
                  window.location.reload();
                });
              }else if(data.code=="201"){
                confirm(data.message,function(){
                  window.location.reload();
                });
              }
            },"json");
      }
    });
  });
  $(".save-group").click(function(){
    var name=$(this).siblings(".labelGroup-name").val();
    var id=$(this).attr("data-id");
    console.log(name+'-'+id);
    $.post("<%=request.getContextPath()%>/role/modifyName",
        {
          roleName:name,
          roleId:id
        },
        function(data){
          if(data.code=="200"){
            alert(data.message,null,1500,function(){
              window.location.reload();
            });
          }else if(data.code=="201"){
            confirm(data.message,function(){
              window.location.reload();
            });
          }
        },"json");
  });
  //取消编辑
  $(".cancel-group").click(function(){
  	$(this).parents(".edit-form").hide();
  	$(this).parents(".edit-form").siblings(".delete-group").hide();
  	$(this).parents(".edit-form").find(".edit-sort-group-form").hide();
  	$(this).parents(".edit-form").siblings(".edit-form").find(".edit-sort-group-form").hide();
    $(this).parents(".edit-form").siblings(".edit-group-box").show();
    $(this).parents(".edit-form").siblings(".edit-sort-group-btn").show();
  });
 var arrayLabel =[];	
  $(".group-content label").each(function(){
  	if($(this).attr("data-status")=="#ef"){
  		$(this).css("background-color", "#ceebeb");
  		if($(this).attr("data-status","#ef")) arrayLabel.push($(this).attr("data-id"));
  	}
  });
  $(".group-content label").click(function() {
  	var changable = $(this).parent(".group-content").prev(".group-header").find(".edit-sort-group-form");
  	if(changable.css("display")=="block"){
		  	if($(this).attr("data-changable")=="true"){
		      var toggle = $(this).attr("data-status") == "#ef" ? "#e" : "#ef";
		      var color = toggle == "#ef" ? "#ceebeb" : "#f5f5f5"; 
		      $(this).css("background-color", color).attr("data-status", toggle);
		    }
  		}
  });
  //编辑权限
  $(".edit-sort-group-btn").click(function(){
  	$(this).parents(".label-group").find(".role-label").css({"cursor":"pointer"});
  	$(this).parents(".label-group").siblings(".label-group").find(".role-label").css("cursor","auto");
    $(this).hide();
    $(this).next(".edit-sort-group-form").show();
    $(".edit-group-form").hide();
    $("#add-labelGroup").show();
    $(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-form").hide();
	$(this).parents(".label-group").siblings(".label-group").find(".edit-form").hide();
	$(this).parents(".label-group").siblings(".label-group").find(".delete-group").hide();
	$(this).parents(".label-group").siblings(".label-group").find(".edit-sort-group-btn").show();
	$(this).parents(".label-group").siblings(".label-group").find(".edit-group-box").show();
  });
  $(".groupOption").click(function(){
	 var id_list = [];
	 $(this).parents(".group-header").next(".group-content").find("label").each(function() {
      if($(this).attr("data-status") == "#ef") id_list.push($(this).attr("data-id"));
    });
    var ids=id_list.join("|");	
	var roleId = $(this).parents(".group-header").find(".delete-group").attr("data-id");	
   $.post("<%=request.getContextPath()%>/role/submitEdit", {
        ids : ids,
        roleId : roleId
  }, function(data) {
    if (data.code == "200") {
      alert(data.message, null, 1500, function() {
        window.location.reload();
      });
    } else if (data.code == "201") {
      confirm(data.message, function() {
        window.location.reload();
      });
    }
  }, "json");
  });
 var listLabels = $(".box-body").find("label").size();
 var arrayLabels = [];
 for(var i = 0;i<=listLabels-1;i++){
 	if($(".box-body").find("label").eq(i).attr("data-status")=="#ef"){
 		$(".box-body").find("label").eq(i).attr("data-mark","yes");
 	}
 	if($(".box-body").find("label").eq(i).attr("data-changable")=="false"){
 		$(".box-body").find("label").eq(i).css({"background":"#EAEAEA","color":"#fff"});
 	}
 }
 $(".cancel-group-content").click(function() {
 	$(".role-label").css("cursor","auto");
	 for(var i = 0;i<=listLabels-1;i++){
		if($(".box-body").find("label").eq(i).attr("data-mark")=="yes"){
			$(".box-body").find("label").eq(i).attr("data-status","#ef").css("background-color","#ceebeb");
		}else{
			$(".box-body").find("label").eq(i).attr("data-status","#e").css("background-color","#f5f5f5");
		}
	}
       $(this).parents(".edit-sort-group-form").hide();
       $(this).parents(".edit-sort-group-form").prev(".edit-sort-group-btn").show();
     });
	</script>
</body>
</html>

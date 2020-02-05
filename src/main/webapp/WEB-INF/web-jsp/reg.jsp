<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>奥利给动漫注册页面</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath()%>/img/aoligeiico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
 <div class="container">
    <div class="panel">
      <form id="form-register" method="post" >
        <div class="txt">
          <p>新账号注册
            <span>
              <a href="login.do">直接登录</a>
            </span>
          </p>
        </div>
        <div class="form-group">
          <label for="uname">用户名：</label>
          <input class="input" maxlength="8" type="text" placeholder="请输入用户名"  name="uname" id="uname"/>
          <span class="msg-default hidden">用户名长度在4到8位之间</span>
        </div>
        <div style="padding-left:200px;" class="showResult" id="resultMessage1"></div>
        <div class="form-group">
          <label for="upwd">登录密码：</label>
          <input class="input"  type="password" maxlength="12" placeholder="请输入密码" name="upwd"  id="upwd"/>
          <span class="msg-default hidden">密码长度在8到12位之间</span>
        </div>
        <div style="padding-left:200px;" class="showResult" id="resultMessage2"></div>
		 <div class="form-group">
          <label for="upwdconfirm">确认密码：</label>
          <input class="input" type="password" maxlength="12" placeholder="请确认密码" name="upwdconfirm"  id="upwdconfirm"/>
          <span class="msg-default hidden">至少数字字母各一个</span>
        </div>
        <div style="padding-left:200px;" class="showResult" id="resultMessage3"></div>
        <div style="padding-left:200px;" id="showResult"></div>
        <div class="form-group">
         <label></label>
          <input type="button" value="提交注册信息" 
          	id="bt-register" />
        </div>
      </form>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script type="text/javascript" >
$(function() { 
	$("#resultMessage1").text("用户名不能为空");
    $("#resultMessage1").css("color","red");
    $("#resultMessage2").text("密码不能为空");
    $("#resultMessage2").css("color","red");
    $("#resultMessage3").text("密码不能为空");
    $("#resultMessage3").css("color","red");
});
	$(".input").blur(function(){
		$(this).parent().find(".msg-default").addClass("hidden");
	});
	$(".input").focus(function(){
		$(this).parent().find(".msg-default").removeClass("hidden");
	});
	
	$("#uname").blur(function(){
		var uname=$("#uname").val().trim();
		if(uname==""){
			$("#resultMessage1").text("用户名不能为空");
		    $("#resultMessage1").css("color","red");
		}else{
			if(uname.length<4){
				$("#resultMessage1").text("用户名过短");
			    $("#resultMessage1").css("color","red");
			}else{
				$("#resultMessage1").text("");
			};
		}
	});
	
	$("#upwd").blur(function(){
		var pwd=$("#upwd").val();
		var pwdc=$("#upwdconfirm").val();
		if(pwd==""){
			$("#resultMessage2").text("密码不能为空");
		    $("#resultMessage2").css("color","red");
		}else{
			if(pwd.length<8){
				$("#resultMessage2").text("密码过短");
			    $("#resultMessage2").css("color","red");
			}else{
				$("#resultMessage2").text("");
			};
		}
		if(pwdc!==""){
			if(pwd===pwdc){
				$("#resultMessage3").text("前后密码一致");
				$("#resultMessage3").css("color","green");
			}
		}
	});
	
	$("#upwdconfirm").blur(function(){
		var pwd=$("#upwd").val();
		var pwdc=$("#upwdconfirm").val();
		if(pwdc==""){
			$("#resultMessage3").text("密码不能为空");
		    $("#resultMessage3").css("color","red");
		}else{
			if(pwd!==pwdc){
				$("#resultMessage3").text("前后密码不一致");
			    $("#resultMessage3").css("color","red");
			}else{
				$("#resultMessage3").text("前后密码一致");
				$("#resultMessage3").css("color","green");
			};
		}
	});

$('#bt-register').click(function(){
	var unameReg=/(^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,8}$)/;
	var pwdReg=/(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$)/;
	var username = $("#uname").val().trim();
	var password = $("#upwd").val();
	if(!unameReg.test(username)){
		$("#showResult").text("用户名格式错误");
        $("#showResult").css("color","red");
        return false;
	}
	if(!pwdReg.test(password)){
		$("#showResult").text("密码格式错误");
        $("#showResult").css("color","red");
        return false;
	}
	var pwdc=$("#upwdconfirm").val();
	if(password!==pwdc){
		return false;
	}
	var url = "handleReg.do";
	var data = {"username": username ,
			    "password": password};
	$.ajax({
		"url": url, 
		"data": data, 
		"dataType": "json", 
		"type": "POST", 
		"success": function(obj) {
			if(obj.state == 1){
				$("#showResult").text("用户名已被注册");
	            $("#showResult").css("color","red");
			} else if(obj.state == 2){
				location.href="homePage.do";
			} else {
				alert("系统故障！" );
			}
		},
		"error":function(obj) {
			alert("系统故障！" );
		}
	});
})

</script>
</html>
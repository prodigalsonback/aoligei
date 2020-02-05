<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>奥利给动漫登录页面</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath()%>/img/aoligeiico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
<div id="container">
    <div id="cover" >
        <form id="login-form" method="post" name="form1">
            <div class="txt">
                <p>
					登录已有账号<span><a href="reg.do">新账号注册</a></span>
                </p>
                <div class="text">
                    <input type="text" placeholder="请输入您的用户名" name="lname"maxlength="8" id="username" >
                    <span><img src="<%=request.getContextPath()%>/img/yhm.png"></span>
                </div>
                
                <div class="text">
                    <input type="password" id="password" placeholder="请输入您的密码" name="lwd"  maxlength="12">
                    <span><img src="<%=request.getContextPath()%>/img/mm.png"></span>
                </div>
                <!-- <div class="chose">
                    <input type="checkbox" class="checkbox" id="ck_rmbUser" value="0">自动登录
                    <span>忘记密码？</span>
                </div> -->
                <!--错误提示-->
                <div id="showResult"></div>
                <input class="button_login" type="button" value="登录" id="bt-login"/>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script type="text/javascript" >
var wrongtimes=0;
$('#bt-login').click(function(){
	var unameReg=/(^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,8}$)/;
	var pwdReg=/(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$)/;
	var username = $("#username").val().trim();
	var password = $("#password").val();
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
	var url = "handleLogin.do";
	var data = {"username" : username, 
	            "password": password};
	$.ajax({
		"url": url,
		"data": data,
		"type": "POST",
		"dataType": "json",
		"success": function(obj) {
			if (obj.state == 1) {
				$("#showResult").text("用户不存在");
		        $("#showResult").css("color","red");
			} else if (obj.state == 2){
				location.href="homePage.do";
			}else if (obj.state == 3){
				$("#showResult").text("密码错误");
		        $("#showResult").css("color","red");
				wrongtimes++;
			}
			if(wrongtimes>3){
				location.href="reg.do";
			}
		},
		"error":function(obj) {
			alert("系统故障！" );
		}
	});
});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>奥利给动漫</title>
<meta charset="utf-8">
<link href="<%=request.getContextPath()%>/img/aoligeiico.jpg" rel="icon" type="image/x-ico">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css">
</head>
<body>
	<div style="text-align:center">
        <video width="60%"  id="video" controls="controls" he>
            <source src="<%=request.getContextPath()%>/mp4/test.mp4" type="video/mp4">
        </video>
    </div>
    <input id="usid" type="hidden" value="<%=session.getAttribute("usid")%>" />
    <input id="uname" type="hidden" value="<%=session.getAttribute("uname")%>" />  
    <input id="tid" type="hidden" value="<%=request.getAttribute("tid")%>"/> 
    <input id="onumbers" type="hidden" value="<%=((List)request.getAttribute("outterTribunes")).size()%>"/> 
    <section class="tent_info">
		<div class="col-md-12 col-sm-12 col-xl-12 textarea one">
			<textarea class="text_send" id="text_send" placeholder="评论一下"></textarea>
			<div class="col-md-12 col-sm-12 col-xl-12 btn btn_send" >提交</div>
		</div>
	</section>
	<!-- -------------------------------- -->
	<%-- <c:set var="index" value="${index+1}" /> 
	id="${id}"--%>
	<c:forEach items="${outterTribunes}" var="o" >
	<div class="col-md-12 col-sm-12 col-xl-12 one cont">
	<%-- <input id="oid"+outter.id type="hidden" value="outter.id" /> --%>
				<div class="col-md-2 col-sm-2 col-xl-12 one img">
					<img src="<%=request.getContextPath()%>/img/aoligeiico.jpg">
				</div>
				<div class="col-md-10 col-sm-10 col-xl-12 one content">
				<div class="comment-right">
					<h4>${o.uname}</h4>
					<div class="comment-content-header three">
						<span><i class="glyphicon glyphicon-time two"></i>${o.createdTime}</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span><i class="glyphicon glyphicon-map-marker two"></i>${o.uip}</span>
					</div>
					<p class="tent">${o.comment}</p>
					<div class="comment-content-footer">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xl-12 three">
								<span><i class="glyphicon glyphicon-globe two"></i>${o.uagent}</span>
							</div>
						</div>
					</div>
					<c:forEach items="${o.listOfTribunes}" var="i" >
				  <c:if test="${i.iuname!=null}">
				<div class="reply-list three">
						<div class="reply">
					<div class="three">
						<a class="replyname">${i.iuname}</a>:<span >@${o.uname}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${i.createdTimeInner}</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span><i class="glyphicon glyphicon-map-marker" style="color: #d4a3a3;"></i>${i.iuip}</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span><i class="glyphicon glyphicon-globe"style="color: #d4a3a3;"></i>${i.iuagent}</span>
					</div>
					</div>
					<p><span>${i.icomment}</span></p>
				</div>
				  </c:if>
					</c:forEach>
					<div class="col-md-12 col-sm-12 col-xl-12 content_text one three">
						<textarea class="col-md-10 col-sm-10 col-xl-10 con_back"  placeholder="评论一下"></textarea>
						<div class="col-md-2 col-sm-2 col-xl-2 btn btn_back" id="${o.id}" >提交</div>
						<input class="inumbers" type="hidden" value="${o.listOfTribunes.size()}"/>
					</div>
				</div>
			</div>
</div></c:forEach>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript" >
$(".btn_send").on('click',function(){
	//获取评论信息
	var text_send = $("#text_send").val().trim();
	if((text_send.indexOf("<")!=-1)||(text_send.indexOf(">")!=-1)||
			(text_send.indexOf("&")!=-1)||(text_send.indexOf("/")!=-1)
			||(text_send.indexOf("'")!=-1)||(text_send.indexOf('"')!=-1)){
		alert("评论中含有非法字符（尖括号，单、双引号等）");
		return false;
	}
	if(text_send == ""){
		return false;
	}
	if(text_send.length>254){
		alert("评论字符数不要超过254个字符");
		return false;
	}
	var onumbers=$("#onumbers").val();
	if(onumbers>9){
		alert("评论数已达上限");
		return false;
	}
	var tid=$("#tid").val();
	var uname=$("#uname").val();
	
	/* if(uname==null){
		console.log(uname);
		return false;
	} */
	var explorer = window.navigator.userAgent.toLowerCase();
	//ie
	if (explorer.indexOf("msie") >= 0) {
		var uagent="IE";
	}
	//firefox
	else if (explorer.indexOf("firefox") >= 0) {
		var uagent="火狐";
	}
	//Chrome
	else if (explorer.indexOf("chrome") >= 0) {
		var uagent="谷歌";	
	}
	//Opera
	else if (explorer.indexOf("opera") >= 0) {
		var uagent="欧朋";
	}
	//Safari
	else if (explorer.indexOf("Safari") >= 0) {
		var uagent="苹果";
	}else{
		var uagent="未知";
	}
	/*returnCitySN["cip"]*/
	var uip=returnCitySN["cname"];
	if(uip==null){
		uip="未知";
	}
	var createdTime = time();
	var url = "addocomments.do";
	// 提交的数据
	var data ={"tid":tid 
		    , "uname" :uname 
		    , "uip" : uip
		    , "uagent" : uagent
		    , "createdTime" : createdTime
			, "comment" : text_send}
	// 提交AJAX请求并处理结果
	$.ajax({
		"url": url,
		"data": data,
		"type": "POST",
		"dataType": "json",
		"success": function(obj) {
			if (obj.state == 1) {
				//成功
				//重新加载页面
				window.location.reload();
			} else {
				alert("系统故障！" );
			}
		},
		"error":function(obj) {
			var REDIRECT = obj.getResponseHeader("REDIRECT");
			if (REDIRECT == "REDIRECT")
            {
                var win = window;
                while (win != win.top)
                {
                    win = win.top;
                }
                win.location.href = obj.getResponseHeader("CONTEXTPATH");
            }else{
            	alert("系统故障！" );
            }
		}
	});
	$(".text_send").val("");
	
});


$('.btn_back').on('click',function(){
	//获取评论信息
	var con_back = $(this).parent().find(".con_back").val().trim();
	if((con_back.indexOf("<")!=-1)||(con_back.indexOf(">")!=-1)||
			(con_back.indexOf("&")!=-1)||(con_back.indexOf("/")!=-1)
			||(con_back.indexOf("'")!=-1)||(con_back.indexOf('"')!=-1)){
		alert("评论中含有非法字符（尖括号，单、双引号等）");
		return false;
	}
	if(con_back == ""){
		return false;
	}
	if(con_back.length>254){
		alert("评论字符数不要超过254个字符");
		return false;
	}
	var inumbers=$(this).parent().find(".inumbers").val();
	if(inumbers>9){
		alert("评论数已达上限");
		return false;
	}
	var createdTimeInner = time();
	var oid=this.id;
	var iuname=$("#uname").val();
	/* if(iuname==null){
		return false;
	} */
	var explorer = window.navigator.userAgent.toLowerCase();
	//ie
	if (explorer.indexOf("msie") >= 0) {
		var iuagent="IE";
	}
	//firefox
	else if (explorer.indexOf("firefox") >= 0) {
		var iuagent="火狐";
	}
	//Chrome
	else if (explorer.indexOf("chrome") >= 0) {
		var iuagent="谷歌";	
	}
	//Opera
	else if (explorer.indexOf("opera") >= 0) {
		var iuagent="欧朋";
	}
	//Safari
	else if (explorer.indexOf("Safari") >= 0) {
		var iuagent="苹果";
	}else{
		var iuagent="未知";
	}
	/*returnCitySN["cip"]*/
	var iuip=returnCitySN["cname"];
	if(iuip==null){
		iuip="未知";
	}
	var iurl = "addicomments.do";
	// 提交的数据
	var idata ={"oid":oid 
		    , "iuname" :iuname 
		    , "iuip" : iuip
		    , "iuagent" : iuagent
		    , "createdTimeInner" : createdTimeInner
			, "icomment" : con_back}
	$.ajax({
		"url": iurl,
		"data": idata,
		"type": "POST",
		"dataType": "json",
		"success": function(obj) {
			if (obj.state == 1) {
				//成功
				//重新加载页面
				window.location.reload();
			} else {
				alert("系统故障！" );
			}
		},
		"error":function(obj) {
			var REDIRECT = obj.getResponseHeader("REDIRECT");
			if (REDIRECT == "REDIRECT")
            {
                var win = window;
                while (win != win.top)
                {
                    win = win.top;
                }
                win.location.href = obj.getResponseHeader("CONTEXTPATH");
            }else{
            	alert("系统故障！" );
            }
		}
	});
	$(this).parent().find(".con_back").val("");
});

function time(){
	function time(s) {
	    return s < 10 ? '0' + s: s;
	}
	var myDate = new Date();
	//获取当前年
	var year=myDate.getFullYear();
	//获取当前月
	var month=myDate.getMonth()+1;
	//获取当前日
	var date=myDate.getDate(); 
	var h=myDate.getHours();       //获取当前小时数(0-23)
	var m=myDate.getMinutes();     //获取当前分钟数(0-59)
	var s=myDate.getSeconds();  
	return year+'-'+time(month)+"-"+time(date)+" "+time(h)+':'+time(m)+":"+time(s);
}
</script> 
</html>
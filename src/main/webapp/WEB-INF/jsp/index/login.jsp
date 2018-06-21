<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>喵星人管理系统登录</title>
<script src="${baseResPath}/BJUI/js/jquery-1.7.2.min.js"></script>
<script src="${baseResPath}/BJUI/js/jquery.cookie.js"></script>
<script src="${baseResPath}/BJUI/js/sha256.js"></script>
<link href="${baseResPath}/BJUI/themes/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
* {font-family: "Verdana", "Tahoma", "Lucida Grande", "Microsoft YaHei", "Hiragino Sans GB", sans-serif;}
body {
    background: url(${baseResPath}/images/loginbg.jpg) no-repeat top center;
}
a:link {color: #285e8e;}
input,input:focus{outline:none;}
.main_box {
    position: absolute; top:50%; left:50%; margin-top:-260px; margin-left:-300px; padding:30px; width:600px; height:460px;
    background: #FAFAFA; background: rgba(255,255,255,0.5); border: 1px #DDD solid;
    border-radius: 5px;
    -webkit-box-shadow:0 0 10px #999; -moz-box-shadow:0 0 10px #999; -ms-box-shadow:0 0 10px #999; box-shadow:0 0 10px #999;
}
.login_logo {margin-bottom: 20px; height: 50px; text-align: center;}
.login_msg {text-align: center; font-size: 16px;}
.login_form {padding-top: 20px; font-size: 16px;}
.login_box .form-control {display: inline-block; *display: inline; zoom: 1; width: auto; font-size: 18px;}
.login_box .form-control.x319 {width: 319px;}
.login_box .form-control.x164 {width: 164px;}
.login_box .form-group {margin-bottom: 20px;}
.login_box .form-group label.t {width: 120px; text-align: right; cursor: pointer;}
.login_box .form-group img {margin-top: 1px; height: 32px; vertical-align: top;}
.login_box .m {cursor: pointer;}
.bottom {text-align: center; font-size: 12px;}
</style>

<script type="text/javascript">
$(function() {
	
	function loginErrorMsg(msg){
		$('div#login_errMsg > font').html(msg);
		$('#login_errMsg').show();
	}
	
	//刷新验证码
	function login_reloadImage(){
		$('#login_validateCodeId').attr('src','${baseUrl}/manage/validateCode');
	}
	//页面初始化验证码
	login_reloadImage();
	$('#login_validateCodeId').click(function(){
		login_reloadImage();
	});
	//校验验证码
	function checkImgCode() {
		var code = $('#inputCode').val();
		var isEqual = false;
		$.ajax({
			url:'${baseUrl}/manage/checkValidateCodeAjax.jspx',
			type:'get',
			async:false,
			data:{inputCode:code,id:Math.random()},
			dataType:'json',
			success:function(response){
				if(response.isEqual){
					isEqual = true;
				}else{
					isEqual = false;
					login_reloadImage();
				}
			},
			error:function(response){
				alert("校验验证码服务繁忙！");
				return false;
			}
		});
		return isEqual;
	}
	
	function onLogin(){
		var issubmit = true;
		var i_index  = 0;
		$('#login_form').find('.in').each(function(i){
			if ($.trim($(this).val()).length == 0) {
				$(this).css('border', '1px #ff0000 solid');
				issubmit = false;
				if (i_index == 0)
					i_index  = i;
			}
		});
		if (!issubmit) {
			$(this).find('.in').eq(i_index).focus();
			return false;
		}
		if(!checkImgCode()){
			alert('验证码错误!');
			return false;
		}
		$("#login_ok").attr("disabled", true).val('登录中..');
		var accountStr = $('#login_username').val();
		var password = $('#login_password').val();
		$.ajax({
			url:'${baseUrl}/manage/loginAjax.jspx?randomId='+Math.random(),
			type:'get',
			data:{accountStr:accountStr, password:password},
			dataType:'json',
			async:false,
			success:function(response){
				if(response.isFail){
					loginErrorMsg(response.msg);
					$("#login_ok").attr("disabled", false).val('登录');
					login_reloadImage();
					return false;
				}else{
					window.location = '${baseUrl}/manage/index.jspx';
				}
			},
			error:function(response){
				alert("服务器繁忙！");
				$("#login_ok").attr("disabled", false).val('登录');
				return false;
			}
		});
        return false;
	}
	
	$('#inputCode').keydown(function(eventObj){
		if (eventObj.keyCode == 13){
			onLogin();
		}
	});
	
	$('#password').keydown(function(eventObj){
		if (eventObj.keyCode == 13){
			onLogin();
		}
	});
	
	$("#login_ok").click(function(){
		onLogin();
	});
});
</script>
</head>
<body>
<!--[if lte IE 7]>
<style type="text/css">
#errorie {position: fixed; top: 0; z-index: 100000; height: 30px; background: #FCF8E3;}
#errorie div {width: 900px; margin: 0 auto; line-height: 30px; color: orange; font-size: 14px; text-align: center;}
#errorie div a {color: #459f79;font-size: 14px;}
#errorie div a:hover {text-decoration: underline;}
</style>
<div id="errorie"><div>您还在使用老掉牙的IE，请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
<![endif]-->
<div class="main_box">
	<div class="login_box">
        <div class="login_logo">
            <img src="${baseResPath}/images/logo.jpg" >
        </div>
		<div class="login_msg" id="login_errMsg" style="display: none;">
      		<font color="red"></font>
    	</div>
        <div class="login_form">
    		<form id="login_form" name="login_form" method="post">
    			<div class="form-group">
    				<label for="login_username" class="t">用户名：</label> <input id="login_username" value="" name="login_username" type="text" class="form-control x319 in" autocomplete="off">
    			</div>
    			<div class="form-group">
    				<label for="login_password" class="t">密　码：</label> <input id="login_password" value="" name="login_username" type="password" class="form-control x319 in" autocomplete="off">
    			</div>
    			<div class="form-group">
    				<label for="login_validateCodeId" class="t">验证码：</label> <input id="inputCode" type="text" class="form-control x164 in">
    				<img id="login_validateCodeId"  href="JavaScript:void(0)"  alt="点击更换" title="点击更换" src="" class="m" height="25" />
    			</div>
    			<!-- <div class="form-group">
                    <label class="t"></label>
                    <label for="j_remember" class="m"><input id="j_remember" type="checkbox" value="true">&nbsp;记住登陆账号!</label>
    			</div> -->
    			<div class="form-group space">
                    <label class="t"></label>　　　
    				<input type="button" id="login_ok" value="&nbsp;登&nbsp;录&nbsp;" class="btn btn-warning btn-lg">&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
    			</div>
    		</form>
        </div>
	</div>
	<!-- <div class="bottom">Copyright &copy; 2015 <a href="http://www.syhvip.com/" target="_blank">www.syhvip.com</a></div> -->
</div>
</body>
</html>
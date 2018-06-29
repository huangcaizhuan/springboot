<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script type="text/javascript">
function addManager_submitcallback(json){
	if(!json.success){
		$.CurrentDialog.find('#addManager_form').alertmsg('error', json.msg);
		return;
	}
	$("#addManager_js-cancel").click();
	$(this).navtab('refresh');
}
var _index = 0;
//提交数据
/* $.CurrentDialog.find('#addManager_submieData').on('click',function(){
	var baseinfo = $.CurrentDialog.find('#addManager_form').serializeObject();
	var citys = '';
	if($.CurrentDialog.find("#city").val() != null &&　$.CurrentDialog.find("#city").val() != ''){
		citys = $.CurrentDialog.find("#city").val()+",";
	}
	for(var i=0;i<_index;i++){
		var cityIndex = $.CurrentDialog.find('[name="city['+i+']"]').val();
		if(cityIndex != null && cityIndex != ''){
			citys = cityIndex+","+ citys;
		}
	}
	
	var tel = $.CurrentDialog.find('[name="vo.tel"]').val(); 
	var regTel = /^1[3458]\d{9}$/;
	if(tel != '' && !regTel.test(tel)){
		$.CurrentNavtab.alertmsg('error', '手机号码格式不正确');
		return;
	}
	
	var email = $.CurrentDialog.find('[name="vo.email"]').val();
	var regEmail = /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
	if(email != null　&&　email != '' && !regEmail.test(email)){
		$.CurrentNavtab.alertmsg('error', '邮箱格式不正确');
		return;
	}
	$.ajax({
		type :  'post',
        url : './addManagerAjax.jspx',
        data : {data : JSON.stringify(baseinfo),citys:citys},
        dataType : 'json',
        success :  function(json){
        	if(!json.success){
        		$.CurrentNavtab.alertmsg('error', json.msg);
        		return;
        	}else if(json.msg != ''){
        		$.CurrentNavtab.alertmsg('ok', json.msg);
        	}
        	$.CurrentDialog.dialog("closeCurrent");
        	$.CurrentNavtab.navtab('refresh');
		}
     });
}); */

</script>
<div class="bjui-pageContent">
   	<form id="addManager_form" class="pageForm" data-toggle="validate"  data-loadingmask="false"  data-toggle="ajaxform" 
    	action="./addManagerAjax" method="post" data-alertmsg="false" data-loadingmask="false"  data-callback="addManager_submitcallback" >
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#proInfo" role="tab" data-toggle="tab">增加管理员</a></li>
        </ul>
        <div class="tab-content" >
        	<div class="tab-pane fade active in" id="proInfo">
                <table class="table table-condensed table-noborder" width="100%">
                    <tbody>
                        <tr>    
                            <td >
                                <label for="name" class="control-label x75">姓名：</label>
                                <input type="text" name="name"  value="" data-rule="required" size="20">
                                
                                <label for="email" class="control-label x75">邮箱：</label>
                                <input type="text" name="email"  value="" data-rule="email" size="20">
                            </td>
                        </tr>
                        <tr>    
                             <td>
                             	<label for="tel" class="control-label x75">电话：</label>
                             	<input type="text" name="tel"  value="" data-rule="mobile" size="20">
                            </td>
                        </tr>
                        <tr>
                         	<td>
                         		<label for="userName" class="control-label x75">登录名：</label>
                                <input type="text" name="userName"  value="" data-rule="required" size="20">
                                
                                <label for="password" class="control-label x75">密码：</label>
                                <input type="text" name="password"  value="" data-rule="password" size="20">
                        	</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close" id="addManager_js-cancel">取消</button></li>
        <li><button type="submit" class="btn-green" data-icon="save" id="addManager_submieData">保存</button></li>
    </ul>
</div>
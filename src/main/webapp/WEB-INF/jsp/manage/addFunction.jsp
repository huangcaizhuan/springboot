<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script type="text/javascript">
function addFunction_submitcallback(json){
	if(!json.success){
		$.CurrentNavtab.alertmsg('error', json.msg);
		return;
	}
	$.CurrentDialog.find("#js-cancel").click();
	$.CurrentNavtab.navtab('refresh');
}

//提交数据
/* $('#addFunction_submieData').on('click',function(){
	var baseinfo = $('#addFunction_form').serializeObject();
	$.ajax({
		type :  'post',
        url : './addFunctionAjax',
        data : {data : JSON.stringify(baseinfo)},
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
    <form id="addFunction_form" class="pageForm" data-toggle="validate"  data-loadingmask="false"  data-toggle="ajaxform" 
    		   action="./addFunctionAjax" method="post" data-alertmsg="false" data-loadingmask="false"
    		   data-callback="addFunction_submitcallback"  >	
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#addFunction_baseInfo" role="tab" data-toggle="tab">增加功能信息框</a></li>
        </ul>
        <div class="tab-content" >
        	<div class="tab-pane fade active in" id="addFunction_baseInfo">
                <table class="table table-condensed table-noborder" width="100%">
                    <tbody>
                    	<tr>    
                            <td>
                                <label for="supId" class="control-label x100">上级功能：</label>
                                <select name="supId" data-toggle="selectpicker">
			                        <option value="">无</option>
			                        	<c:forEach items="${firstList}" var="item">
			                        		<option value="${item.id}">${item.name }</option>
			                        	</c:forEach>
			                    </select>
                            </td>
                        </tr>
                        <tr>    
                            <td>
                                <label for="name" class="control-label x100">功能名称：</label>
                                <input type="text" name="name"  value="" data-rule="required" size="20">
                            </td>
                        </tr>
                        
                        <tr>    
                            <td>
                                <label for="page" class="control-label x100">返回的页面：</label>
                                <input type="text" name="page"  value="" size="30">
                            </td>
                        </tr>
                        <tr>    
                            <td>
                                <label for="orderLevel" class="control-label x100">排序等级：</label>
                                <input type="text" name="orderLevel"  value="" data-rule="required;number" size="20">
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
        <li><button type="button" class="btn-close" data-icon="close" id="js-cancel">取消</button></li>
        <li><button type="submit" class="btn-green" data-icon="save" id="addFunction_submieData">保存</button></li>
    </ul>
</div>
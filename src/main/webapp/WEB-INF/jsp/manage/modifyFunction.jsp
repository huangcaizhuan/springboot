<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script type="text/javascript">
function modifyFunction_submitcallback(json){
	if(!json.success){
		$.CurrentNavtab.alertmsg('error', json.msg);
		return;
	}
	$.CurrentDialog.find("#js-cancel").click();
	$.CurrentNavtab.navtab('refresh');
}

</script>
<div class="bjui-pageContent">
    <form id="modifyFunction_form" class="pageForm" data-toggle="validate"  data-loadingmask="false"  data-toggle="ajaxform" 
    		   action="./modifyFunctionAjax" method="post" data-alertmsg="false" data-loadingmask="false"
    		   data-callback="modifyFunction_submitcallback"  >	
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#modifyFunction_baseInfo" role="tab" data-toggle="tab">修改功能信息框</a></li>
        </ul>
        <div class="tab-content" >
        	<div class="tab-pane fade active in" id="modifyFunction_baseInfo">
                <table class="table table-condensed table-noborder" width="100%">
                    <tbody>
                    	<tr>    
                            <td>
                            	<input type="hidden" name="id" value="${function.id}">
                                <label for="supId" class="control-label x100">上级功能：</label>
                                <label>
                                	<c:if test="${empty  function.supId}"> 
                                		无
                                		<input type="hidden" name="supId" value="">
                                	</c:if>
                                	<c:if test="${not empty  function.supId}">
                                		${supFunction.name }
                                		<input type="hidden" name="supId" value="${function.supId}">
                                	 </c:if>
                                </label>
                            </td> 
                        </tr>
                        <tr>    
                            <td>
                                <label for="name" class="control-label x100">功能名称：</label>
                                <input type="text" name="name"  value="${function.name}" data-rule="required" size="20">
                            </td>
                        </tr>
                        <tr>    
                            <td>
                                <label for="code" class="control-label x100">功能编码：</label>
                                <input type="text" name="code"  value="${function.code}" data-rule="required" size="20">
                            </td>
                        </tr>
                        
                        <tr>    
                            <td>
                                <label for="page" class="control-label x100">返回的页面：</label>
                                <input type="text" name="page"  value="${function.page}" size="30">
                            </td>
                        </tr>
                        <tr>    
                            <td>
                                <label for="orderLevel" class="control-label x100">排序等级：</label>
                                <input type="text" name="orderLevel"  value="${function.orderLevel}" data-rule="required;number" size="20">
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
        <li><button type="submit" class="btn-green" data-icon="save" id="modifyFunction_submieData">保存</button></li>
    </ul>
</div>
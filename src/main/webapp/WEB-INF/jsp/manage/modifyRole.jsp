<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script type="text/javascript">
function modifyRole_submitcallback(json){
	if(!json.success){
		$.CurrentDialog.find('#modifyRole_form').alertmsg('error', json.msg);
		return;
	}
	$("#modifyRole_js-cancel").click();
	$(this).navtab('refresh');
}
</script>
<div class="bjui-pageContent">
   	<form id="modifyRole_form" class="pageForm" data-toggle="validate"  data-loadingmask="false"  data-toggle="ajaxform" 
    	action="./modifyRoleAjax" method="post" data-alertmsg="false" data-loadingmask="false"  data-callback="modifyRole_submitcallback" >
        <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#proInfo" role="tab" data-toggle="tab">增加角色</a></li>
        </ul>
        <div class="tab-content" >
        	<div class="tab-pane fade active in" id="proInfo">
                <table class="table table-condensed table-noborder" width="100%">
                    <tbody>
                        <tr>    
                            <td >
                                <label for="name" class="control-label x75">名称：</label>
                                <input type="text" name="name"  value="${role.name }" data-rule="required" size="20">
                                <input type="hidden" name="roleId"  value="${role.id }">
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
        <li><button type="button" class="btn-close" data-icon="close" id="modifyRole_js-cancel">取消</button></li>
        <li><button type="submit" class="btn-green" data-icon="save" id="modifyRole_submieData">保存</button></li>
    </ul>
</div>
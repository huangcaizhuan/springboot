<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script>
	function roleList_chagecallback(json){
		if(!json.success){
			$.CurrentNavtab.alertmsg('error', json.msg);
			return;
		}else if(json.msg && json.msg != ''){
			$.CurrentNavtab.alertmsg('ok', json.msg);
		}
		$.CurrentNavtab.find('.roleList_form').bjuiajax('doSearch',{cusPage:'${ pageCurrent}'});
	}
</script>
<form class="roleList_form" id="pagerForm" data-toggle="ajaxsearch" action="./roleList" method="post">
	<input type="hidden" name="pageSize" value="${pageSize}">             <!-- 页大小 -->
	<input type="hidden" name="pageCurrent" value="${pageCurrent}">       <!-- 当前页 -->
</form>
<div class="bjui-pageContent tableContent">
    <table data-toggle="tablefixed" data-width="100%" data-nowrap="true" id="fixedtable">
        <thead>
            <tr>
                <th width="40px" align="center">行号</th>
                <th align="center">角色名称</th>
                <th align="center">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="item" varStatus="stus">
        		<tr data-id="${item.id }">
	                <td align="center">${stus.index + 1 }</td>
	                <td align="center">${item.name }</td>
	                <td align="center">
	                	<button class="btn btn-sm btn-blue" data-url="./modifyRole?roleId=${item.id }&pageCurrent=${pageCurrent}" data-id="qxpz-dialog-mask" data-mask="true" data-toggle="dialog" data-width="500" data-height="290" data-icon="edit" data-title="角色【${item.name }】信息编辑">编辑</button>
	                	<button class="btn btn-sm btn-blue" data-url="./deleteRoleAjax?roleId=${item.id }" data-toggle="doajax" data-confirm-msg="确定要删除选中角色吗？" class="btn btn-red" data-icon="remove"  data-callback="roleList_chagecallback">删除角色</button>
	                	<button class="btn btn-sm btn-blue" data-url="./popedomList?roleId=${item.id}&pageCurrent=${pageCurrent}" data-id="szqx-dialog-mask" data-mask="true" data-toggle="dialog" data-width="1000" data-height="500" data-icon="edit" data-title="分配【${item.name }】权限">分配权限</button>
	                </td>
	            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
	<div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                <option value="50">50</option>
                <option value="100">100</option>
                <option value="200">200</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${count } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${count }" data-page-size=" ${pageSize }" data-page-current="${ pageCurrent}"></div>
    <div class="clear ht10"></div>
    <div class="pull-left">
        <button type="button" class="btn btn-blue" data-url="./addRole" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="500" data-height="290" data-icon="plus" data-title="新增角色">新增角色</button>
        <span class="bw10"></span>
    </div>
    <ul>
        <li><button type="button" class="btn-close" data-icon="sign-out" >退出</button></li>
    </ul>
</div>

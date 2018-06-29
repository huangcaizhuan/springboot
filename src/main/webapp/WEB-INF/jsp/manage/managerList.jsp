<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script>
	function managerList_chagecallback(json){
		if(!json.success){
			$.CurrentNavtab.alertmsg('error', json.msg);
			return;
		}else if(json.msg && json.msg != ''){
			$.CurrentNavtab.alertmsg('ok', json.msg);
		}
		$.CurrentNavtab.find('.managerList_form').bjuiajax('doSearch',{cusPage:'${ page}'});
	}
</script>
<div class="bjui-pageHeader">
	<style type="text/css">.n-right{ display:inline}</style>
<form class="managerList_form" id="pagerForm" data-toggle="ajaxsearch" action="./managerList" method="post">
	<input type="hidden" name="pageSize" value="${pageSize}">
    <input type="hidden" name="page" value="${page}">
    <div class="bjui-searchBar">
         <div class="pull-left">
             <div class="form-div">
                <label>名称：</label>
             	<input type="text" value="${name }" name="name" size="20">
             	<span class="bw10"></span>
             	<label>手机：</label>
             	<input type="text" value="${tel }" name="tel" size="20">
             	<span class="bw10"></span>
             	<label>状态：</label>
               	<select name="status" data-toggle="selectpicker">
                    <option value="">请选择</option>
                    <option value="1" >启用</option>
                    <option value="-1" >冻结</option>
                </select>
                <span class="bw10"></span>
                <label>角色：</label>
               	<select name="roleId" data-toggle="selectpicker">
                    <option value="">请选择</option>
                   <%--  <c:forEach items="${roleList }" var="item" varStatus="stus">
	                    <option value="${item.id }" <c:if test="${roleId == item.id }">selected="selected"</c:if>>${item.name }</option>
                    </c:forEach> --%>
                </select>
                <span class="bw10"></span>
                
              	<button type="submit" class="btn-default" data-icon="search">查询</button>
              	<a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a></li>	
              	
             </div>
         </div>
         <div class="pull-right">
             <div class="form-div"></div>
         </div>
     </div>
</form>
</div>
<div class="bjui-pageContent tableContent">
    <table class="table table-bordered table-condensed table-hover table-tbth nowrap" data-width="100%" data-nowrap="true" id="fixedtable">
        <thead>
            <tr>
                <th width="40px" align="center">行号</th>
                <th align="center">姓名</th>
                <th align="center">邮箱</th>
                <th align="center">电话</th>
                <th align="center">状态</th>
                <th align="center">登录名</th>
                <th align="center">角色</th>
                <th align="center" width="100px">操作</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="item" varStatus="stus">
        		<tr data-id="${item.id }">
	                <td align="center">${stus.index + 1 }</td>
	                <td align="center">${ item.name }</td>
	                <td align="center">${ item.email }</td>
	                <td align="center">${ item.tel }</td>
	                <td align="center">
	                	<c:choose>
	                		<c:when test="${item.status eq -1 }">冻结</c:when>
	                		<c:when test="${item.status eq 1  }">启用</c:when>
							<c:otherwise>数据异常</c:otherwise>
	                	</c:choose>
	                </td>
	                 <td align="center">${item.userName}</td>
	                <td align="center"></td>
	                <td align="center">
	                    <button class="btn btn-sm btn-blue" data-url="./modifyManager?id=${item.id }&page=${ page}" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="750" data-height="600" data-icon="edit" data-title="信息编辑">编辑</button>
	                	<%-- <c:choose>
	                		<c:when test="${item.status eq -1 }">
	                			<button class="btn btn-sm btn-blue" data-url="./changeManagerStatusAjax.jspx?id=${item.id }"  data-toggle="doajax" data-confirm-msg="确定将 ' ${ item.name }' 修改为启用状态吗？"   data-callback="managerList_chagecallback" >启用</button>
	                		</c:when>
	                		<c:when test="${item.status eq 1 }">
	                    		<button class="btn btn-sm btn-blue" data-url="./changeManagerStatusAjax.jspx?id=${item.id }"  data-toggle="doajax" data-confirm-msg="确定将 ' ${ item.name }' 冻结吗？"   data-callback="managerList_chagecallback">冻结</button>
	                		</c:when>
	                	</c:choose>
	                    <c:if test="${item.status eq 1 }">
	                    	<button class="btn btn-sm btn-blue" data-url="./authManager.jspx?id=${item.id }&pageIndex=${ pageModel.pageIndex}" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="500" data-height="290" data-icon="edit" data-title="授权">授权</button>
	                    </c:if>
	                     <c:if test="${item.status eq 1 }">
	                    	<button class="btn btn-sm btn-blue" data-url="./authenticationManager.jspx?id=${item.id }&pageIndex=${ pageModel.pageIndex}" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="500" data-height="290" data-icon="edit" data-title="绑定用户">绑定/解绑用户</button>
	                    </c:if>
	                    <c:if test="${not empty item.userId }">
	                    <button class="btn btn-sm btn-blue" data-url="./resetManagerPwdAjax.jspx?id=${item.id }"  data-toggle="doajax" data-confirm-msg="确定将 ' ${ item.name }' 密码重置吗？"   data-callback="managerList_chagecallback">重置密码</button>
	                    </c:if> --%>
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
        <span>&nbsp;条，共 ${count} 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${count }" data-page-size=" ${pageSize }" data-page-current="${ page}"></div>
    <div class="clear ht10"></div>
    <div class="pull-left">
        <button type="button" class="btn btn-blue" data-url="./addManager" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="750" data-height="600" data-icon="plus" data-title="新增管理员">新增管理员</button>
        <span class="bw10"></span>
    </div>
    <ul>
        <li><button type="button" class="btn-close" data-icon="sign-out" >退出</button></li>
    </ul>
</div>

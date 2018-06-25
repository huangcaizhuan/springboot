<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib uri="http://lol.redScarf.org/lol/tags" prefix="lol"%> --%>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script>
function functionList_chagecallback(json){
	if(!json.success){
		$.CurrentNavtab.alertmsg('error', json.msg);
		return;
	}else if(json.msg && json.msg != ''){
		$.CurrentNavtab.alertmsg('ok', json.msg);
	}
	$.CurrentNavtab.find('.functionList_form').bjuiajax('doSearch',{cusPage:'${ pageModel.pageIndex}'});
}
//监听lookup带回值后的事件
/* $.CurrentNavtab.find('.bondLogList_form').on('afterchange.bjui.lookup', function(e,data) {
	$.CurrentNavtab.find('input[name="user.id"]').val(data.id);
	$.CurrentNavtab.find('input[name="user.mobile"]').val(data.mobile);
	$.CurrentNavtab.find('#searchWalletLogList').click();
	
}); */

/* $(function(){
	//保证金日志导出
	$('#bondLogList_exprot').click(function(){
		var submitfrom = $('.bondLogList_form').clone();
		submitfrom.attr({'data-toggle':''});
		submitfrom.attr({'action':'./exprotBondLogList.jspx'});
		submitfrom.attr({'target':'_blank'});
		submitfrom.attr({'method':'post'});
		$(document.body).append(submitfrom);
		submitfrom.submit();
		submitfrom.remove();
	});

}); */

</script>
<div class="bjui-pageHeader">
	<style type="text/css">.n-right{ display:inline}</style>
    <form id="pagerForm" data-toggle="ajaxsearch" action="./functionList" method="post" class="functionList_form">
        <%-- <input type="hidden" name="companyId" value="${companyId}"> 
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}"> --%>
        <div class="bjui-searchBar">
            <div class="pull-left">
                <div class="form-div">
               	  <%-- <label>功能名称：</label>
               	  <input type="text" value="${name}" name="name" size="20"> --%>
                 <!--  <button type="submit" class="btn-default" data-icon="search">查询</button> -->
                  
                  <!-- <a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">刷新</a> -->
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
                <th align="center">操作</th>
    			<th align="center">功能名称</th>
    			<th align="center">功能编码</th>
    			<th align="center">排序等级</th>
    			<th align="center">返回页面</th>
    			<th align="center">创建时间</th>
    			<th align="center">功能等级</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="item" varStatus="stus">
        		<c:if test="${item.cateLevel == 1  }">
        		<tr data-id="${item.id }">
	            	<td align="center">
	            		<button class="btn btn-sm btn-blue" data-url="./modifyFunction?id=${item.id }"  data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="700" data-height="470"  data-icon="edit" data-title="编辑功能">编辑</button>
	            		<button class="btn btn-sm btn-red" data-url="./delFunctionAjax?id=${item.id }"  data-toggle="doajax" data-confirm-msg="确定要删除吗？" data-callback="functionList_chagecallback" data-icon="remove">删除</button>
	            	</td>
        			<td>${item.name}</td>
        			<td align="center">${item.code}</td>
        			<td align="center">${item.orderLevel}</td>
        			<td align="center">${item.page}</td>
        			<td align="center">${item.createTimestamp}</td>
        			<td align="center" >
	                	<c:choose>
	                		<c:when test="${item.cateLevel == 1  }">一级</c:when>
	                		<c:when test="${item.cateLevel == 2  }">二级</c:when>
						</c:choose>
	                </td>
	            </tr>
	            
	            <c:forEach var="iitem" items="${list}">
                  	<c:if test="${iitem.supId == item.id }">
                  	<tr data-id="${iitem.id }">
		            	<td align="center">
	            			<button class="btn btn-sm btn-blue" data-url="./modifyFunction?id=${iitem.id }"  data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="700" data-height="470"  data-icon="edit" data-title="编辑功能">编辑</button>
	            			<button class="btn btn-sm btn-red" data-url="./delFunctionAjax?id=${iitem.id }"  data-toggle="doajax" data-confirm-msg="确定要删除吗？" data-callback="functionList_chagecallback" data-icon="remove">删除</button>
	            		</td>
	        			<td>
	        				<span class="bw10"></span><span class="bw10"></span>
	        				${iitem.name}
	        			</td>
	        			<td align="center">${iitem.code}</td>
	        			<td align="center">${iitem.orderLevel}</td>
	        			<td align="center">${iitem.page}</td>
	        			<td align="center">${iitem.createTimestamp}</td>
	        			<td align="center" >
		                	<c:choose>
		                		<c:when test="${iitem.cateLevel == 1  }">一级</c:when>
		                		<c:when test="${iitem.cateLevel == 2  }">二级</c:when>
							</c:choose>
		                </td>
		            </tr>
                  	</c:if>
                  	</c:forEach>
        		</c:if>
        	</c:forEach>
        </tbody>
    </table>
</div>
<div class="bjui-pageFooter">
	<%-- 
	<div class="pages">
        <span>每页&nbsp;</span>
        <div class="selectPagesize">
            <select data-toggle="selectpicker" data-toggle-change="changepagesize">
            	<option value="50">50</option>
                <option value="100">100</option>
                <option value="200">200</option>
            </select>
        </div>
        <span>&nbsp;条，共 ${pageModel.recordCount } 条</span>
    </div>
    <div class="pagination-box" data-toggle="pagination" data-total="${pageModel.recordCount }" data-page-size=" ${pageModel.pageSize }" data-page-current="${ pageModel.pageIndex}"></div>
     --%>
    <div class="clear ht10"></div>
    <div class="pull-left">
    <button type="button" class="btn btn-blue" data-url="./addFunction" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="700" data-height="470" data-icon="plus" data-title="新增功能">新增功能</button>
    </div>
    <ul>
        <li><button type="button" class="btn-close" data-icon="sign-out" >关闭</button></li>
    </ul>
</div>

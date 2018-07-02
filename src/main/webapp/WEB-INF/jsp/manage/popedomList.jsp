<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$('input[type="checkbox"]').each(function(i,item){
		var povalue = '${popedoms}';
		<c:if test="${not empty popedoms}">
		var editReArr = povalue.split(",")
		for(var i=0;i<=editReArr.length-1;i++){
			if(item.value == editReArr[i]){
				$(item).attr('checked',true);
			}
		}
		</c:if>
	});
	//提交数据
	$('#popedom_submieData').on('click',function(){
		var roleId = '${role.id}';
		var _popedomJson = $('#popedom_j_form_form').serializeObject();
		$.ajax({
			type :  'post',
	        url : './modifyPopedomAjax',
	        data : {roleId : roleId,popedomJson:JSON.stringify(_popedomJson)},
	        dataType : 'json',
	        success :  function(json){
	        	if(!json.success){
	        		$.CurrentNavtab.alertmsg('error', json.msg);
	        		return;
	        	}else{
	        		$.CurrentNavtab.alertmsg('ok', json.msg);
	        	}
	        	//$("#popedom_js-cancel").click();
	        	//$(this).navtab('refresh');
	        	$.CurrentDialog.dialog('closeCurrent');
	        	$.CurrentNavtab.find('.roleList_form').bjuiajax('doSearch',{cusPage:'${ param.pageCurrent}'});
			}
	     }); 
	});
});
</script>

<div class="bjui-pageContent">
    <form id="popedom_j_form_form" class="pageForm" data-toggle="validate" data-alertmsg="false">
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#popedom_cggl_Power" role="tab" data-toggle="tab">猫星人系统功能管理</a></li>
    </ul>
    <div class="tab-content" style="height:366px;overflow:auto">
        <div class="tab-pane fade active in" id="popedom_cggl_Power">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 power-list" id="cggl_left_ywqx">
                <ul class="row">
                	<c:forEach items="${funlist}" var="item" varStatus="stus">
                		<c:if test="${item.cateLevel == 1 }">
                			<li  <c:if test="${stus.index== 0}"> class="active"</c:if> >
                				<a href="#popedom_left_${item.id }" role="tab " data-toggle="tab">${item.name} </a>
                			</li>
                		</c:if>
                	</c:forEach>
                </ul>
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="row-right">
                    <div class="tab-content-t">
                    	<c:forEach items="${funlist }" var="item" varStatus="stus">
                    			<div class="row-right tab-pane fade  in <c:if test='${stus.index== 0}'>active</c:if> " id="popedom_left_${item.id }">
				                    <table data-toggle="tablefixed" data-width="600" data-height="345" data-nowrap="true">
				                        <thead style="border-top:#ddd 1px solid;">
				                            <tr>
				                               	<th width="30px">名称</th>
				                                <th width="30px" align="center">权限</th>
				                            </tr>
				                        </thead>
				                        <tbody>
				                           <c:forEach items="${funlist }" var="iitem">
				                           <c:if test="${iitem.supId == item.id }">
				                           		<tr>
				                           			 <td>${iitem.name }</td>
				                           			 <td align="center"><input type="checkbox" data-toggle="icheck"  name="${iitem.code }" value="${iitem.code }" data-label=""></td>
				                           		</tr>
				                           </c:if>
				                           </c:forEach>
				                       </tbody>
				                    </table>                    
				                </div>
                    	</c:forEach>
            		</div>
            	</div>
            </div>
        </div>
    </div>
    </form>
</div>
<div class="bjui-pageFooter">
    <ul>
        <li><button type="button" class="btn-close" data-icon="close" id="popedom_js-cancel">取消</button></li>
        <li><button type="button" class="btn-green" data-icon="save" id="popedom_submieData">保存</button></li>
    </ul>
</div>

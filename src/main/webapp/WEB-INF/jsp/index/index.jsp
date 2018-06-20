<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>XXXXXXXXXXXX管理后台</title>
<!-- bootstrap - css -->
<link href="${baseResPath}/BJUI/themes/css/bootstrap.css" rel="stylesheet">
<!-- core - css -->
<link href="${baseResPath}/BJUI/themes/css/shopstyle.css" rel="stylesheet">
<link href="${baseResPath}/BJUI/themes/green1/core.css" id="bjui-link-theme" rel="stylesheet">
<!-- plug - css -->
<link href="${baseResPath}/BJUI/plugins/kindeditor_4.1.10/themes/default/default.css" rel="stylesheet">
<link href="${baseResPath}/BJUI/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<link href="${baseResPath}/BJUI/plugins/niceValidator/jquery.validator.css" rel="stylesheet">
<link href="${baseResPath}/BJUI/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
<link href="${baseResPath}/BJUI/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
<!--[if lte IE 7]>
<link href="${baseResPath}/BJUI/themes/css/ie7.css" rel="stylesheet">
<![endif]-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 9]>
    <script src="${baseResPath}/BJUI/other/html5shiv.min.js"></script>
    <script src="${baseResPath}/BJUI/other/respond.min.js"></script>
<![endif]-->
<!-- jquery -->
<script src="${baseResPath}/BJUI/js/jquery-1.7.2.min.js"></script>
<script src="${baseResPath}/BJUI/js/jquery.cookie.js"></script>
<!--[if lte IE 9]>
<script src="${baseResPath}/BJUI/other/jquery.iframe-transport.js"></script>    
<![endif]-->
<!-- BJUI.all 分模块压缩版 -->
<!-- 
<script src="${baseResPath}/BJUI/js/bjui-all.js"></script>
 -->
<!-- 以下是B-JUI的分模块未压缩版，建议开发调试阶段使用下面的版本 -->
<script src="${baseResPath}/BJUI/js/bjui-core.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-regional.zh-CN.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-frag.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-extends.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-basedrag.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-slidebar.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-contextmenu.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-navtab.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-dialog.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-taskbar.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-ajax.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-alertmsg.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-pagination.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-util.date.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-datepicker.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-ajaxtab.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-datagrid.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-tablefixed.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-tabledit.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-spinner.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-lookup.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-tags.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-upload.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-theme.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-initui.js"></script>
<script src="${baseResPath}/BJUI/js/bjui-plugins.js"></script>
<!-- plugins -->
<!-- swfupload for uploadify && kindeditor -->
<script src="${baseResPath}/BJUI/other/Locality.js"></script>
<script src="${baseResPath}/BJUI/plugins/swfupload/swfupload.js"></script>
<!-- kindeditor -->
<script src="${baseResPath}/BJUI/plugins/kindeditor_4.1.10/kindeditor-all.min.js"></script>
<script src="${baseResPath}/BJUI/plugins/kindeditor_4.1.10/lang/zh_CN.js"></script>
<!-- colorpicker -->
<script src="${baseResPath}/BJUI/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- ztree -->
<script src="${baseResPath}/BJUI/plugins/ztree/jquery.ztree.all-3.5.js"></script>
<!-- nice validate -->
<script src="${baseResPath}/BJUI/plugins/niceValidator/jquery.validator.js"></script>
<script src="${baseResPath}/BJUI/plugins/niceValidator/jquery.validator.themes.js"></script>
<!-- bootstrap plugins -->
<script src="${baseResPath}/BJUI/plugins/bootstrap.min.js"></script>
<script src="${baseResPath}/BJUI/plugins/bootstrapSelect/bootstrap-select.min.js"></script>
<script src="${baseResPath}/BJUI/plugins/bootstrapSelect/defaults-zh_CN.min.js"></script>
<!-- icheck -->
<script src="${baseResPath}/BJUI/plugins/icheck/icheck.min.js"></script>
<!-- dragsort -->
<script src="${baseResPath}/BJUI/plugins/dragsort/jquery.dragsort-0.5.1.min.js"></script>
<!-- HighCharts -->
<script src="${baseResPath}/BJUI/plugins/highcharts/highcharts.js"></script>
<script src="${baseResPath}/BJUI/plugins/highcharts/highcharts-3d.js"></script>
<script src="${baseResPath}/BJUI/plugins/highcharts/themes/gray.js"></script>
<!-- ECharts -->
<script src="${baseResPath}/BJUI/plugins/echarts/echarts.js"></script>
<!-- other plugins -->
<script src="${baseResPath}/BJUI/plugins/other/jquery.autosize.js"></script>
<link href="${baseResPath}/BJUI/plugins/uploadify/css/uploadify.css" rel="stylesheet">
<script src="${baseResPath}/BJUI/plugins/uploadify/scripts/jquery.uploadify.min.js"></script>
<script src="${baseResPath}/BJUI/plugins/download/jquery.fileDownload.js"></script>
<script src="${baseResPath}/BJUI/plugins/jqprint/jquery.jqprint-0.3.js"></script>
<script src="${baseResPath}/BJUI/plugins/jqprint/jquery.jqprint-0.3.js"></script>
<script src="${baseResPath}/BJUI/plugins/barcode/jquery-barcode.js"></script>
<script src="${baseResPath}/BJUI/plugins/qrcode/jquery.qrcode.min.js"></script>
<!-- plupload  -->
<script type="text/javascript" src="${baseResPath}/BJUI/third/plupload-2.1.2/js/plupload.full.min.js"></script>
<!-- init -->
<script type="text/javascript">
$(function() {
    BJUI.init({
        JSPATH       : '${baseResPath}/BJUI/',         //[可选]框架路径
        PLUGINPATH   : '${baseResPath}/BJUI/plugins/', //[可选]插件路径
        loginInfo    : {url:'${baseUrl}login.jpsx', title:'登录', width:400, height:200}, // 会话超时后弹出登录对话框
        statusCode   : {ok:200, error:300, timeout:301}, //[可选]
        ajaxTimeout  : 50000, //[可选]全局Ajax请求超时时间(毫秒)
        pageInfo     : {total:'total', pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
        alertMsg     : {displayPosition:'topcenter', displayMode:'slide', alertTimeout:3000}, //[可选]信息提示的显示位置，显隐方式，及[info/correct]方式时自动关闭延时(毫秒)
        keys         : {statusCode:'statusCode', message:'message'}, //[可选]
        ui           : {
                         windowWidth      : 0,    //框架可视宽度，0=100%宽，> 600为则居中显示
                         showSlidebar     : true, //[可选]左侧导航栏锁定/隐藏
                         clientPaging     : true, //[可选]是否在客户端响应分页及排序参数
                         overwriteHomeTab : true //[可选]当打开一个未定义id的navtab时，是否可以覆盖主navtab(我的主页)
                       },
        debug        : false,    // [可选]调试模式 [true|false，默认false]
        theme        : 'sky' // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[五种皮肤:default, orange, purple, blue, red, green]
    })
    
    /*$(document).on('bjui.afterInitUI', function() {
    	$.CurrentNavtab.alertmsg('error', '${errorMessage}');
	})*/
    
    // main - menu
    $('#bjui-accordionmenu')
        .collapse()
        .on('hidden.bs.collapse', function(e) {
            $(this).find('> .panel > .panel-heading').each(function() {
                var $heading = $(this), $a = $heading.find('> h4 > a')
                if ($a.hasClass('collapsed')){
					$heading.removeClass('active');
					$heading.find('b i.fa').addClass('fa-angle-right').removeClass('fa-angle-down');
				}
            })
        })
        .on('shown.bs.collapse', function (e) {
            $(this).find('> .panel > .panel-heading').each(function() {
                var $heading = $(this), $a = $heading.find('> h4 > a')
                if (!$a.hasClass('collapsed')){
					$heading.addClass('active');
					$heading.find('b i.fa').addClass('fa-angle-down').removeClass('fa-angle-right');
				}
            })
        })
        
    $(document).on('click', 'ul.menu-items li > a', function(e) {
        var $a = $(this), $li = $a.parent(), options = $a.data('options').toObj(), $children = $li.find('> .menu-items-children')
        var onClose = function() {
            $li.removeClass('active')
        }
        var onSwitch = function() {
            $('#bjui-accordionmenu').find('ul.menu-items li').removeClass('switch')
            $li.addClass('switch')
        }
        
        $li.addClass('active')
        if (options) {
            options.url      = $a.attr('href')
            options.onClose  = onClose
            options.onSwitch = onSwitch
            if (!options.title) options.title = $a.text()
            
            if (!options.target)
                $a.navtab(options)
            else
                $a.dialog(options)
        }
        if ($children.length) {
            $li.toggleClass('open');
            var _thisi=$li.find('b i.fa');
			if(_thisi.hasClass('fa-angle-right')){
				_thisi.removeClass('fa-angle-right').addClass('fa-angle-down');
			}else{
				_thisi.removeClass('fa-angle-down').addClass('fa-angle-right');
			}
			
        }
        
        e.preventDefault()
    })
    
    //时钟
    var today = new Date(), time = today.getTime()
    $('#bjui-date').html(today.formatDate('yyyy/MM/dd'))
    setInterval(function() {
        today = new Date(today.setSeconds(today.getSeconds() + 1))
        $('#bjui-clock').html(today.formatDate('HH:mm:ss'))
    }, 1000)

})

function logout_callback(json){
	//window.location = '${baseUrl}/shop/login.jspx';
}

//菜单-事件
function MainMenuClick(event, treeId, treeNode) {
    event.preventDefault()
    
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)
        
        zTree.expandNode(treeNode, !treeNode.open, false, true, true)
        return
    }
    
    if (treeNode.target && treeNode.target == 'dialog')
        $(event.target).dialog({id:treeNode.tabid, url:treeNode.url, title:treeNode.name})
    else
        $(event.target).navtab({id:treeNode.tabid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
}

//将form表单转化为key:value的json对象
$.fn.serializeObject = function() {  
   var o = {};  
   var a = this.serializeArray();  
   $.each(a, function() {  
       if (o[this.name]) {  
           if (!o[this.name].push) {  
               o[this.name] = [o[this.name]];  
           }  
           o[this.name].push(this.value || '');  
       } else {  
           o[this.name] = this.value || '';  
       }  
   });  
   return o;  
};

//加法函数，用来得到精确的加法结果 
//说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。 
//调用：accAdd(arg1,arg2) 
//返回值：arg1加上arg2的精确结果 
function accAdd(arg1,arg2){ 
var r1,r2,m; 
try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0} 
try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0} 
m=Math.pow(10,Math.max(r1,r2)) 
return (arg1*m+arg2*m)/m 
} 
//给Number类型增加一个add方法，调用起来更加方便。 
Number.prototype.add = function (arg){ 
return accAdd(arg,this); 
}

//加法函数，用来得到精确的加法结果 
//说明：javascript的加法结果会有误差，在两个浮点数相加的时候会比较明显。这个函数返回较为精确的加法结果。 
//调用：accAdd(arg1,arg2) 
//返回值：arg1加上arg2的精确结果 
function accSub(arg1,arg2){
  var r1,r2,m,n;
  try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
  try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
  m=Math.pow(10,Math.max(r1,r2));
  //last modify by deeka
  //动态控制精度长度
  n=(r1>=r2)?r1:r2;
  return ((arg1*m-arg2*m)/m).toFixed(n);
}
//给Number类型增加一个add方法，调用起来更加方便。 
Number.prototype.sub = function (arg){ 
return accSub(this,arg); 
}

//除法函数，用来得到精确的除法结果 
//说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。 
//调用：accDiv(arg1,arg2) 
//返回值：arg1除以arg2的精确结果 
function accDiv(arg1,arg2){ 
var t1=0,t2=0,r1,r2; 
try{t1=arg1.toString().split(".")[1].length}catch(e){} 
try{t2=arg2.toString().split(".")[1].length}catch(e){} 
with(Math){ 
r1=Number(arg1.toString().replace(".","")) 
r2=Number(arg2.toString().replace(".","")) 
return (r1/r2)*pow(10,t2-t1); 
} 
} 
//给Number类型增加一个div方法，调用起来更加方便。 
Number.prototype.div = function (arg){ 
return accDiv(this, arg); 
} 

//乘法函数，用来得到精确的乘法结果 
//说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。 
//调用：accMul(arg1,arg2) 
//返回值：arg1乘以arg2的精确结果 
function accMul(arg1,arg2) 
{ 
var m=0,s1=arg1.toString(),s2=arg2.toString(); 
try{m+=s1.split(".")[1].length}catch(e){} 
try{m+=s2.split(".")[1].length}catch(e){} 
return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m) 
} 
//给Number类型增加一个mul方法，调用起来更加方便。 
Number.prototype.mul = function (arg){ 
return accMul(arg, this); 
} 


//切换商家
function changeCompany(btn){
	var id = $(btn).data('id');
	$.ajax({
		url:'${baseUrl}/shop/changeCompanyAjax.jspx',
		type:'post',
		async:false,
		data:{selComId:id},
		dataType:'json',
		success:function(response){
			if(response.success){
				window.location = '${baseUrl}/shop/index.jspx';
			}
		},
		error:function(response){
			alert("网络繁忙，请稍后重试！");
			return false;
		}
	});
}

</script>
</head>
<body>
<!--[if lte IE 7]>
    <div id="errorie"><div>您还在使用老掉牙的IE，正常使用系统前请升级您的浏览器到 IE8以上版本 <a target="_blank" href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-8-worldwide-languages">点击升级</a>&nbsp;&nbsp;强烈建议您更改换浏览器：<a href="http://down.tech.sina.com.cn/content/40975.html" target="_blank">谷歌 Chrome</a></div></div>
<![endif]-->
<div id="bjui-window">
    <header id="bjui-header">
        <div class="bjui-navbar-header">
            <button type="button" class="bjui-navbar-toggle btn-default" data-toggle="collapse" data-target="#bjui-navbar-collapse">
                <i class="fa fa-bars"></i>
            </button>
            <a class="bjui-navbar-logo" href="javascript:;"><img src="${baseImgPath }/logo.jpg"></a>
        </div>
        <nav id="bjui-navbar-collapse">
            <ul class="bjui-navbar-right">
                <li class="datetime"><div><span id="bjui-date"></span> <span id="bjui-clock"></span></div></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-cog"></span> 我的账户</a>
                    <ul class="dropdown-menu" role="menu">
                    	<li><a href="javascript:;" data-url="${baseUrl}/shop/changepwd.jspx" data-id="dialog-mask" data-mask="true" data-toggle="dialog" data-width="500" data-height="290">&nbsp;<span class="glyphicon glyphicon-lock"></span> 修改密码&nbsp;</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:if test="${not empty companyVo.name }">当前：${companyVo.name }</c:if><span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                    	<c:forEach items="${companyList }" var="company">
                    		<li onclick="changeCompany(this)" data-id="${company.id }" data-name="${company.name }" class="company" data-toggle="doajax"><a href="javascript:;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${company.name }</a></li>
                    	</c:forEach>
                    </ul>
                </li>
                <li><a href="javascript:;" class="red" data-url="${baseUrl}/shop/logout.jspx"  data-toggle="doajax" data-callback="logout_callback" class="red">&nbsp;<span class="glyphicon glyphicon-off"></span> 注销登陆</a></li>
            </ul>
        </nav>
        <div id="bjui-hnav" style="display:none">
            <button type="button" class="btn-default bjui-hnav-more-left" title="导航菜单左移"><i class="fa fa-angle-double-left"></i></button>
            <div id="bjui-hnav-navbar-box">
                <ul id="bjui-hnav-navbar">
                    <li class="active"><a href="javascript:;" data-toggle="slidebar">常用功能</a>
                        <div class="items hide" data-noinit="true">
                            <ul class="menu-items" data-tit="销售管理" data-faicon="file-text">
		                        <li><a href="${baseUrl}/shop/companyDemandList.jspx" data-options="{id:'companyDemandList', faicon:''}">客户求购管理</a></li>
                              	<li><a href="${baseUrl}/shop/goodsList.jspx" data-options="{id:'goodsList', faicon:''}">商品管理</a></li>
                                <li><a href="${baseUrl}/shop/orderList.jspx" data-options="{id:'orderList', faicon:''}">订单管理</a></li>
                                <li><a href="${baseUrl}/shop/shopAdPicList.jspx" data-options="{id:'shopAdPicList', faicon:''}">广告管理</a></li>
                                <li><a href="${baseUrl}/shop/memberManagerList.jspx" data-options="{id:'memberManagerList', faicon:''}">客户管理</a></li>
                                <%--
                                	<li><a href="${baseUrl}/shop/priceTemplateList.jspx" data-options="{id:'priceTemplateList', faicon:''}">价格模板管理</a></li>
                            	 --%>
                            </ul>
                            
                            <ul class="menu-items" data-tit="资料管理" data-faicon="cogs">
                                <li><a href="${baseUrl}/shop/shopInfoManager.jspx" data-options="{id:'shopInfoManager', faicon:''}">商家信息</a></li>
                                <li><a href="${baseUrl}/shop/userInfoManagerList.jspx" data-options="{id:'userInfoManagerList', faicon:''}">个人信息</a></li>
                            </ul>
                            <ul class="menu-items" data-tit="账户管理" data-faicon="credit-card">
                                <li><a href="${baseUrl}/shop/userWallet.jspx" data-options="{id:'userWallet', faicon:''}">电子钱包</a></li>
                                <li><a href="${baseUrl}/shop/withdrawCashApplyList.jspx" data-options="{id:'withdrawCashApplyList', faicon:''}">提现记录</a></li>
                            </ul>
                            
                            <c:forEach var="item" items="${list}">
                            <c:if test="${item.cateLevel == 1 }">
                            	<ul class="menu-items" data-tit="${item.name }" data-faicon="cogs">
                                	<c:forEach var="iitem" items="${list}">
                                	<c:if test="${iitem.supId == item.id }">
                                		<li><a href="${baseUrl}/${iitem.page}" data-options="{id:'${iitem.id }', faicon:''}">${iitem.name }</a></li>
                                	</c:if>
                                	</c:forEach>
                            	</ul>
                            </c:if>
                            </c:forEach>
                        </div>
                    </li>
                </ul>
            </div>
            <button type="button" class="btn-default bjui-hnav-more-right" title="导航菜单右移"><i class="fa fa-angle-double-right"></i></button>
        </div>
    </header>
    <div id="bjui-container">
    	<div id="bjui-leftside">
            <div id="bjui-sidebar">
                <div class="panel-group panel-main" data-toggle="accordion" id="bjui-accordionmenu">
                </div>
            </div>
        </div>
        <div id="bjui-navtab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                    	<li data-url="./manageIndex"><a href="javascript:;" ><span>管理首页</span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>
            <div class="navtab-panel tabsPageContent">
                <div class="navtabPage unitBox">
                    <div class="bjui-pageContent" style="background:#FFF;">
                        Loading...
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<footer id="bjui-footer"></footer>-->
</div>
</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ taglib prefix="s" uri="/struts-tags" %> --%>
<%-- <%@ taglib uri="http://lol.redScarf.org/lol/tags" prefix="lol"%> --%>
<jsp:include page="/WEB-INF/jsp/common/domain.jsp"></jsp:include>
<script type="text/javascript">
</script>
<div class="bjui-pageContent">
	<style type="text/css">
		.col-md-3{ margin-bottom:30px;}
		.panel-stat3{ border-radius:6px; padding:30px 20px; position:relative; overflow:hidden;}
		.panel-stat3 p{ font-size:16px;}
		.panel-stat3 h2{ font-size:40px; margin:0;}
		.panel-stat3 .glyphicon{ font-size:80px; opacity:0.3; position:absolute; top:30px; right:20px;}
		.alert-dismissible .close{ position:relative; top:-2px; color:#f00;}
		.alert-dismissible .close span{ font-size:21px;}
	</style>
    <h1 class="text-center" style="padding:50px 0">欢迎来到XXXX管理后台</h1>
     <div class="clearfix" style="padding:100px 50px;">
    	<div class="col-md-3">
    		<a href="./orderList.jspx?bdate=${currentTime }&edate=${currentTime}" data-toggle="navtab" data-id="orderList" data-title="销售订单">
	    		<div class="panel-stat3 btn-danger">
	                <p>当天订单数量</p>
	                <h2>${todayOrderNum }</h2>
	                <span class="glyphicon glyphicon-time pull-right"></span>
	            </div>
	        </a>
        	  
        </div>
    	<!-- <div class="col-md-3">
        	<div class="panel-stat3 btn-info">
                <p>本月销量</p>
                <h2>9999</h2>
                <span class="glyphicon glyphicon-calendar pull-right"></span>
            </div>
        </div> -->
    	<div class="col-md-3">
    		<a href="./userWallet.jspx" data-toggle="navtab" data-id="userWallet" data-title="电子钱包">
	        	<div class="panel-stat3 btn-warning">
	                <p>账户余额</p>
	                <h2><lol:df number="${cashAmount }" how="2"/></h2>
	                <span class="glyphicon glyphicon-credit-card pull-right"></span>
	            </div>
	        </a>
        </div>
    </div>
    <%-- <div class="clearfix" style="padding:0 65px;">
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <span class="glyphicon glyphicon-exclamation-sign h4"></span>
            <span class="h4">这里放平台推送给商家的信息。。。</span>
        </div>
    </div> --%> 
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <script type="text/javascript" src="/js/common/jquery/jquery-1.9.1.js" language="javascript"></script>
    <script type="text/javascript" src="/plugins/layer/mobile/layer.js" language="javascript"></script>
    <link rel="stylesheet" type="text/css" href="../css/mybase.css">
    <style>
        .opt_div ul li{height:40px;text-align: left;margin-left: 5px;line-height: 40px;border-bottom: 1px solid #dddddd;list-style-type:none;}
        .opt_div li>a{display:inline-block;margin-left: 10px;text-decoration: none;}
    </style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div class="opt_div">
    <table>
        <tr>
            <th width="20%">密码：</th>
            <td width="20%"><input type="password" id="password" name="password" value="" /></td>
        </tr>
        <tr>
            <th width="20%">确认密码：</th>
            <td width="20%"><input type="password" id="password2" name="password2" value="" /></td>
        </tr>
    </table>
</div>
<div id="logInfo">
</div>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
//    $(function() {
//        loadPageData(0);
//        $("ul li").click(function(){
//            var data=$(this).attr('data');
//            loadPageData(data);
//        });
//    });
//    //加载数据
//    function loadPageData(logType){
//        $('#logInfo').load('/member/toMemberPage.html',{logType:logType});
//    }

</script>


</html>

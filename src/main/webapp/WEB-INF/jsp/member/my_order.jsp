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
        .opt_div li{height:40px;text-align: left;margin-left: 5px;line-height: 40px;border-bottom: 1px solid #dddddd;}
        .opt_div li>a{display:inline-block;margin-left: 10px;text-decoration: none;}
        body,table{
            font-size:12px;
        }
        table{
            table-layout:fixed;
            empty-cells:show;
            border-collapse: collapse;
            margin:5px;
        }
        td{
            height:30px;
        }
        h1,h2,h3{
            font-size:12px;
            margin:0;
            padding:0;
        }
        .table{
            border:1px solid #cad9ea;
            color:#666;
        }
        .table th {
            background-repeat:repeat-x;
            height:30px;
        }
        .table td,.table th{
            border:1px solid #cad9ea;
            padding:0 1em 0;
        }
        .table tr.alter{
            background-color:#f5fafe;
        }
    </style>
</head>

<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div class="opt_div">
    <table>
        <tr>
            <th width="20%">名称</th>
            <th width="20%">金额</th>
            <th width="15%">方向</th>
            <th width="20%">状态</th>
            <th width="20%">手续费</th>
            <th width="20%">收益率</th>
            <th width="20%">收益</th>
        </tr>
        <c:forEach items="${orders}" var="order" varStatus="status">
            <tr>
                <td>${order.productName}</td>
                <td><fmt:formatNumber value="${order.buyAmount}" pattern="0.00" /></td>
                <td>
                    <c:if test="${order.buyGoing ==1}">买涨</c:if>
                    <c:if test="${order.buyGoing ==2}">买跌</c:if>
                </td>
                <td>
                    <c:if test="${order.orderStatus ==1}">待支付</c:if>
                    <c:if test="${order.orderStatus ==2}">已支付</c:if>
                    <c:if test="${order.orderStatus ==3}">持仓中</c:if>
                    <c:if test="${order.orderStatus ==4}">止盈</c:if>
                    <c:if test="${order.orderStatus ==5}">止损</c:if>
                </td>
                <td><fmt:formatNumber value="${order.feeAmount}" pattern="0.00" /></td>
                <td>${order.revenueModelCode.substring(1)}%</td>
                <td><fmt:formatNumber value="${order.revenueAmount}" pattern="0.00" /></td>
            </tr>
        </c:forEach>
    </table>
</div>


<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>

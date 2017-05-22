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
    <!-- 引入 ECharts 文件 -->
    <script type="text/javascript" src="/js/common/echarts/echarts.min.js" language="javascript"></script>
    <link rel="stylesheet" type="text/css" href="/css/mybase.css">
    <link rel="stylesheet" type="text/css" href="/css/stock.css">
    <style>
    </style>
</head>

<body>
<!--用户状态栏-->
<div class="index_top">
    <div class="user_info">
        <img src="/images/l.jpg">
        <%--<span>&nbsp;ID：8002</span>--%>
    </div>
    <div class="leftD account_info">
        <p>个人账户:0元</p>
    </div>
    <div class="cz leftD">
        <a class="up_btn" href="./chongzhi/chongzhi.jsp" id="chongzhi">充值</a>&nbsp;&nbsp;<a class="down_btn" id="tixian">提现</a>
    </div>
</div>
<!--产品列表-->
<div style="height:48px;overflow: visible;">
    <table  style="width: 100%;">
        <tr>
            <td height="40" class="sel_pro ch_pro">
                <b>晶体蜡</b><br/>
                <b>2346.56</b>
            </td>
            <td class="sel_pro ">
                <b>焦炭</b><br/>
                <b>2346.56</b>
            </td>
            <td class="sel_pro ">
                <b>乙烯</b><br/>
                <b>2346.56</b>
            </td>
        </tr>
    </table>
</div>
<!--走势图展示位置-->
<div>
    <div id="lineView" class="kImg">
        <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
        <div id="main_m" style="width:100%;height:98%;overflow: visible;"></div>
    </div>
</div>
<div style="height:40px;text-align: center;">
    <a class='sel_btn ch_cls' data='0'>分时线</a>
    <a class='sel_btn' data='1' >1分钟</a>
    <a class='sel_btn' data='5' >5分钟</a>
    <a class='sel_btn' data='15' >15分钟</a>
</div>
<div style="text-align: center;">
    <a class='up_btn buy btnBigSize' data=0>订货</a>
    <a class='down_btn buy btnBigSize' data=1 >回购</a>
</div >

<!--弹出层显示位置-->
<div id="createOrderDiv" style="display: none;">
    <div>
    <form id="createOrderForm" action="" method="post" >
        <input id="buyPrice" name="buyPrice" type="hidden" value="8530.23"/>
        <input id="productName" name="productName" type="hidden" value="晶体蜡"/>
        <input id="productId" name="productId" type="hidden" value="1"/>
        <input id="revenueModelCode" name="revenueModelCode" type="hidden" value="R_87.5"/>
        <input id="buyAmount" name="buyAmount" type="hidden" value="100.00"/>
        <input id="buyGoing" name="buyGoing" type="hidden" value="1"/>
        <input id="unionid" name="unionid" type="hidden" value="oCxYvw6cYVcMZaZhLsDS-xxZE9G4"/>
<div class="pay_title">晶体蜡（当前价格：8530）</div>
        <table>
            <tr>
                <td colspan="3"><p>结算时间</p></td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="selectDiv pay_money_opt">
                    <span class="currentCss1">
                        <p class="zf">15点</p>
                        <p class="syl">收益87.5%</p>
                    </span>
                    <span>
                        <p class="zf">30点</p>
                        <p class="syl">收益90%</p>
                    </span>
                    <span>
                       <p class="zf">60点</p>
                        <p class="syl">收益92%</p>
                    </span>
                    </div>
                </td>
            </tr>
        </table>
        <div>投资金额</div>
        <div class="selectDiv pay_money_div">
            <span class="currentCss2">100</span>
            <span>200</span>
            <span>500</span>
            <span>1000</span>
            <span>2000</span>
        </div>
        <table>
            <tr>
                <td>可用余额：0.00元</td>
                <td>预计收益：0.00元</td>
            </tr>
        </table>
    </form>
    </div>
</div>
<jsp:include page="./common/bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main_m'));
    var categoryData = new Array();
    var values = new Array();

    // 初始 option
    option = {
//        title: {
//            text: '异步数据加载示例'
//        },
        tooltip : {
            trigger: 'axis',
            showDelay: 20,             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
            hideDelay: 100,            // 隐藏延迟，单位ms
            transitionDuration : 0.4,  // 动画变换时间，单位s
            backgroundColor: 'rgba(0,0,0,0.7)',     // 提示背景颜色，默认为透明度为0.7的黑色
            borderColor: '#333',       // 提示边框颜色
            borderRadius: 4,           // 提示边框圆角，单位px，默认为4
            borderWidth: 0,            // 提示边框线宽，单位px，默认为0（无边框）
            padding: 5,                // 提示内边距，单位px，默认各方向内边距为5，
                                       // 接受数组分别设定上右下左边距，同css
            position: function (p) {
                // 位置回调
                return [p[0] + 10, p[1] - 10];
            },
            formatter:function (params) {
                var seriesType=params[0].seriesType;
                var res = params[0].name;
                if(seriesType == 'line'){
                    res += '<br/>  数值 : ' + params[0].value;
                }
                if(seriesType == 'candlestick'){
                    res += '<br/>  开盘 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
                    res += '<br/>  收盘 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
                }
                return res;
            }
        },
        xAxis: {
            type: 'category',
            data : categoryData,
            scale: true,
            boundaryGap :true,
            axisLine: {onZero: false},
            splitLine: {show: false},
            splitNumber: 20,
            min: 'dataMin',
            max: 'dataMax'
        },
        yAxis: {
            scale: true,
            splitArea: {
                show: true
            }
        },
        series: [
            {
                name: '分时线',
                type: 'line',
                data: values
            },
            {
                name: 'k线',
                type: 'candlestick',
                data: [ ]
            }
        ]
    };

    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    toLoadView(0);
    $(function () {

        $("#chongzhi").click(function () {
            alert("充值按钮");
        });

        $("#tixian").click(function () {
            alert("提现按钮");
        });

        $(".sel_btn").click(function(){
            var data=$(this).attr('data');
            $(this).addClass('ch_cls');
            $(this).siblings().removeClass('ch_cls');
            toLoadView(data);
        });

        /*下单*/
        $(".buy").click(function(){
            var data=$(this).attr('data');
            openDialog();
        });

//        $("").on("click",function () {
//            alert(1);
//            $(".pay_money_div>span").removeClass("currentPayMoney");
//            $(this).addClass("currentPayMoney");
//        });


        $(document).on("click",".pay_money_opt>span",function(){
            $(".pay_money_opt>span").removeClass("currentCss1");
            $(this).addClass("currentCss1");
        });

        $(document).on("click",".pay_money_div>span",function(){
            $(".pay_money_div>span").removeClass("currentCss2");
            $(this).addClass("currentCss2");
        });
    });

    function toLoadView(lineType) {
        var lineType=lineType;
        var type;
        $.ajax({
            type: "POST",
            url:"/stock/toGetInitData.json",
            data:{lineType:lineType},
            dataType: "json",
            error: function(){
                alert('获取数据失败！');
            },
            success: function(obj) {
                if(obj != ''&& obj.length!=0){
                    var data=obj.data;
                    for(var i=0;i<data.length;i++){
                        if(lineType==0){
                            values.push(data[i].price);
                            categoryData.push(data[i].dataTime);
                            //values.shift();
                            //categoryData.shift();
                            myChart.setOption({
                                xAxis: {
                                    data: categoryData
                                },
                                series: [
                                    {
                                        name:'分时线',
                                        data: values
                                    },
                                    {
                                        name:'k线',
                                        data: []
                                    }
                                ]
                            });

                        }else {
                            type='candlestick';
                            // 数据意义：开盘(open)，收盘(close)，最低(lowest)，最高(highest)
                            values.push([data[i].openingPrice,data[i].lastClosingPrice,data[i].maxPrice,data[i].minPrice]);
                            categoryData.push(data[i].dataTime);

                            myChart.setOption({
                                xAxis: {
                                    data: categoryData
                                },
                                series: [
                                    {
                                        name:'分时线',
                                        data: []
                                    },
                                    {
                                        name:'k线',
                                        data: values
                                    }
                                ]
                            });
                        }
                    }
                }else {
                    //信息框
                    layer.open({
                        content: obj.msg
                        ,btn: '我知道了'
                    });
                }
            }
        });

    }

    /*
     js由毫秒数得到年月日
     使用： (new Date(data[i].creationTime)).Format("yyyy-MM-dd hh:mm:ss.S")
     */
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    //补0操作
    function getzf(num){
        if(parseInt(num) < 10){
            num = '0'+num;
        }
        return num;
    }

    //layer弹出层
    function openDialog() {
        layer.open({
            type: 1,
            anim: 'scale',
            btn: ['下单', '取消'],
            shade: 'background-color: rgba(0,0,0,.3)',//遮罩层
            fix: false,
            move: false,//拖拽
            offset: 'auto',
            content: $('#createOrderDiv').html(),//这里content是一个DOM
            style: 'width:80%;',
            yes:function(index){
                toCreateStockOrder();
                layer.close(index);
            },
            no:function(index){
            }
        });
    }

    function toCreateStockOrder() {
        var _url='/stock/toCreateStockOrder.html';
        $.ajax({
            type: "POST",
            url:_url,
            data:$('#createOrderForm').serialize(),
            dataType: "json",
            error: function(){
                alert('获取数据失败！');
            },
            success: function(data) {
                if(data.status){
                    //信息框
                    layer.open({
                        content: '下单成功！'
                        ,btn: '我知道了'
                    });
                }else {
                    layer.open({
                        content: '下单失败！'
                        ,btn: '我知道了'
                    });
                }
            }
        });
    }


</script>
</html>

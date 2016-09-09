<%@page import="org.apache.ibatis.annotations.Case"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="pack.business.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.admin.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="chartMgr" class="pack.business.ChartMgr"/>


<%
	int Jan = chartMgr.Jen();
	int Feb = chartMgr.Feb();
	int Mar = chartMgr.Mar();
	int Apr = chartMgr.Apr();
	int May = chartMgr.May();
	int Jun = chartMgr.Jun();
	int Jul = chartMgr.Jul();
	int Aug = chartMgr.Aug();
	int Sep = chartMgr.Sep();
	int Oct = chartMgr.Oct();
	int Nov = chartMgr.Nov();
	int Dec = chartMgr.Dec();

	//System.out.println("Sep은 9월: " + chartMgr.Sep());
%>

<!DOCTYPE html>
<html>
<head>
    <base href="http://demos.telerik.com/kendo-ui/line-charts/index">
    <style>html { font-size: 14px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link rel="stylesheet" href="//kendo.cdn.telerik.com/2016.2.714/styles/kendo.common.min.css" />
    <link rel="stylesheet" href="//kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.min.css" />
    <link rel="stylesheet" href="//kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.mobile.min.css" />

    <script src="//kendo.cdn.telerik.com/2016.2.714/js/jquery.min.js"></script>
    <script src="//kendo.cdn.telerik.com/2016.2.714/js/kendo.all.min.js"></script>
</head>
<body>
<div id="example">
    <div class="demo-section k-content wide">
        <div id="chart"></div>
    </div>
    <script>
    
        function createChart() {
            $("#chart").kendoChart({
                title: {
                    text: "매출 현황"
                },
                legend: {
                    position: "bottom"
                },
                chartArea: {
                    background: ""
                },
                seriesDefaults: {
                    type: "column",
                    style: "smooth"
                },
                series: [{ //값 조정
                    name: "월별매출",
                    color: "blue",
                    data: [ <%=Jan%>, <%=Feb%>, <%=Mar%>, 
                    		<%=Apr%>, <%=May%>, <%=Jun%>, 
                    		<%=Jul%>, <%=Aug%>, <%=Sep%>, 
                    		<%=Oct%>, <%=Nov%>, <%=Dec%>
                    ]
                }],
                
                valueAxis: { // y축
                    labels: {
                        format: "{0}원"
                    },
                    line: {
                        visible: false
                    },
                    axisCrossingValue: -5
                },
                categoryAxis: { // x축 조정
                    categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    majorGridLines: {
                    	
                        visible: false
                    },
                    labels: {
                        rotation: "auto"
                    }
                },
                tooltip: {
                    visible: true,
                    format: "{0}%",
                    template: "#= series.name #: #= value #"
                }
            });
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>
</div>


</body>
</html>


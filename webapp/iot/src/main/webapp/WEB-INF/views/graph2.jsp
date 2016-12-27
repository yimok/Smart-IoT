<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <!-- EXTERNAL LIBS-->
    <script
            src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous"></script>
    <script src="https://www.google.com/jsapi"></script>

    <!-- EXAMPLE SCRIPT -->
    <script>

        function roop()
        {
            location.href="/cow/list";
        }
        setInterval("roop()",2000);


        // onload callback
        function drawChart() {



            // JSONP request


            var jsonData =  ${cow}
            var data = new google.visualization.DataTable();

            data.addColumn('datetime', 'Time');
            data.addColumn('number', 'Temp');
            data.addColumn('number', 'Hum');
            data.addColumn('number', 'avg');

            $.each(jsonData, function (i, row) {

                var strarr = row.RI.split('-');
                var temp = strarr[2].substring(0,4) + '-'+ strarr[2].substring(4,6)+ '-' + strarr[2].substring(6,8) + " " + strarr[2].substring(8,10)+":"+strarr[2].substring(10,12)+ ":"+ strarr[2].substring(12,14);



                data.addRow([

                    (new Date(temp)),
                    parseFloat(row.con.substring(9,11)),
                    parseFloat(row.con.substring(12,14)),
                    parseFloat(28)
                ]);
            });


            var options = {
                series: {
                    2: {lineDashStyle: [4, 4]}
                },
                colors: ['red', 'blue', 'black', 'green', 'yellow', 'gray']
            };


            var chart = new google.visualization.LineChart($('#chart').get(0));

            chart.draw(data, options,{
                title: 'Temp , Hum'
            });


        }

        function drawChart2() {



            // JSONP request


            var jsonData =  ${cow}
            var data = new google.visualization.DataTable();

            data.addColumn('datetime', 'Time');
            data.addColumn('number', 'Temp');
            data.addColumn('number', 'Hum');
            data.addColumn('number', 'avg');

            $.each(jsonData, function (i, row) {

                var strarr = row.RI.split('-');
                var temp = strarr[2].substring(0,4) + '-'+ strarr[2].substring(4,6)+ '-' + strarr[2].substring(6,8) + " " + strarr[2].substring(8,10)+":"+strarr[2].substring(10,12)+ ":"+ strarr[2].substring(12,14);



                data.addRow([

                    (new Date(temp)),
                    parseFloat(row.con.substring(9,11)),
                    parseFloat(row.con.substring(12,14)),
                    parseFloat(28)
                ]);
            });


            var options = {
                series: {
                    2: {lineDashStyle: [4, 4]}
                },
                colors: ['red', 'blue', 'black', 'green', 'yellow', 'gray']
            };


            var chart2 = new google.visualization.LineChart($('#chart2').get(0));

            chart2.draw(data, {
                title: 'Wimp Weather Station'
            });


        }


        // load chart lib
        google.load('visualization', '1', {
            packages: ['corechart']
        });

        // call drawChart once google charts is loaded
        google.setOnLoadCallback(drawChart);
        google.setOnLoadCallback(drawChart2);

    </script>




</head>
<body>
<div id="chart"style="height: 300px; width:100%;"></div>
<div id="chart2" style="height: 300px; width:100%;"></div>
</body>
</html>
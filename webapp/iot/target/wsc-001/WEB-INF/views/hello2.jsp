<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>


    <title>Data monitoring</title>


    <script
            src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
            crossorigin="anonymous"></script>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <!-- Custom styles for this template -->
   <style>
       /*
 * Base structure
 */

       /* Move down content because we have a fixed navbar that is 50px tall */
       body {
           padding-top: 50px;
       }


       /*
        * Global add-ons
        */

       .sub-header {
           padding-bottom: 10px;
           border-bottom: 1px solid #D8D8D8;
       }

       /*
        * Top navigation
        * Hide default border to remove 1px line.
        */
       .navbar-fixed-top {
           border: 0;
       }

       /*
        * Sidebar
        */

       /* Hide for mobile, show later */
       .sidebar {
           display: none;
       }
       @media (min-width: 768px) {
           .sidebar {
               position: fixed;
               top: 51px;
               bottom: 0;
               left: 0;
               z-index: 1000;
               display: block;
               padding: 20px;
               overflow-x: hidden;
               overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
               background-color: #f5f5f5;
               border-right: 1px solid #eee;
           }
       }

       /* Sidebar navigation */
       .nav-sidebar {
           margin-right: -21px; /* 20px padding + 1px border */
           margin-bottom: 20px;
           margin-left: -20px;
       }
       .nav-sidebar > li > a {
           padding-right: 20px;
           padding-left: 20px;
       }
       .nav-sidebar > .active > a,
       .nav-sidebar > .active > a:hover,
       .nav-sidebar > .active > a:focus {
           color: #fff;
           background-color: #428bca;
       }


       /*
        * Main content
        */

       .main {
           padding: 20px;
       }
       @media (min-width: 768px) {
           .main {
               padding-right: 40px;
               padding-left: 40px;
           }
       }
       .main .page-header {
           margin-top: 0;
       }


       /*
        * Placeholder dashboard ideas
        */

       .placeholders {
           margin-bottom: 30px;
           text-align: center;
       }
       .placeholders h4 {
           margin-bottom: 0;
       }
       .placeholder {
           margin-bottom: 20px;
       }
       .placeholder img {
           display: inline-block;
           border-radius: 50%;
       }


   </style>

    <script src="https://www.google.com/jsapi"></script>

    <!-- EXAMPLE SCRIPT -->
    <script>




        // onload callback
        function drawChart() {



            // JSONP request


            var jsonData =  ${cow}
            var data = new google.visualization.DataTable();

            data.addColumn('datetime', 'Time');
            data.addColumn('number', 'CowTemp');
            data.addColumn('number', 'Temp');
            data.addColumn('number', 'CowTempAvg');
            data.addColumn('number', 'TempAvg');

            $.each(jsonData, function (i, row) {

                var strarr = row.RI.split('-');
                var temp = strarr[2].substring(0,4) + '-'+ strarr[2].substring(4,6)+ '-' + strarr[2].substring(6,8) + " " + strarr[2].substring(8,10)+":"+strarr[2].substring(10,12)+ ":"+ strarr[2].substring(12,14);



                data.addRow([

                    (new Date(temp)),
                    parseFloat(row.con.substring(9,14)),
                    parseFloat(row.con.substring(15,20)),
                    parseFloat(${cowtempavg}),
                    parseFloat(${tempavg})
                ]);
            });


            var options = {
                series: {
                    2: {lineDashStyle: [2, 2]},
                    3: {lineDashStyle: [2, 2]}
                },
                colors: ['red', 'blue', 'black', 'green', 'yellow', 'gray']
            };


            var chart = new google.visualization.LineChart($('#chart').get(0));

            chart.draw(data, options,{
                title: 'Cow1'
            });


        }

        function drawChart2() {



            // JSONP request


            var jsonData =  ${cow}
            var data = new google.visualization.DataTable();


            data.addColumn('datetime', 'Time');
            data.addColumn('number', 'WalkingCount');


            $.each(jsonData, function (i, row) {

                var strarr = row.RI.split('-');
                var temp = strarr[2].substring(0,4) + '-'+ strarr[2].substring(4,6)+ '-' + strarr[2].substring(6,8) + " " + strarr[2].substring(8,10)+":"+strarr[2].substring(10,12)+ ":"+ strarr[2].substring(12,14);



                if( parseInt(parseInt(row.con.substring(21,row.con.length)))>0 ){

                    sumtemp = parseInt(row.con.substring(21,row.con.length))

                    data.addRow([

                        (new Date(temp)),
                        sumtemp
                    ]);
                }
            });


            var options = {
                series: {
                    2: {lineDashStyle: [2, 2]},
                    3: {lineDashStyle: [2, 2]}
                },
                colors: ['red', 'blue', 'black', 'green', 'yellow', 'gray']
            };


            var chart2 = new google.visualization.LineChart($('#chart2').get(0));

            chart2.draw(data, options, {
                title: ' '
            });


        }


        function drawChart3() {



            // JSONP request


            var jsonData =  ${cow2}
            var data = new google.visualization.DataTable();


            data.addColumn('datetime', 'Time');
            data.addColumn('number', 'CowTemp');
            data.addColumn('number', 'Temp');
            data.addColumn('number', 'CowTempAvg');
            data.addColumn('number', 'TempAvg');

            $.each(jsonData, function (i, row) {

                var strarr = row.RI.split('-');
                var temp = strarr[2].substring(0,4) + '-'+ strarr[2].substring(4,6)+ '-' + strarr[2].substring(6,8) + " " + strarr[2].substring(8,10)+":"+strarr[2].substring(10,12)+ ":"+ strarr[2].substring(12,14);



                data.addRow([

                    (new Date(temp)),
                    parseFloat(row.con.substring(9,14)),
                    parseFloat(row.con.substring(15,20)),
                    parseFloat(${cowtempavg}),
                    parseFloat(${tempavg})
                ]);
            });


            var options = {
                series: {
                    2: {lineDashStyle: [2, 2]},
                    3: {lineDashStyle: [2, 2]}
                },
                colors: ['red', 'blue', 'black', 'green', 'yellow', 'gray']
            };


            var chart3 = new google.visualization.LineChart($('#chart3').get(0));

            chart3.draw(data, options, {
                title: 'Cow2 '
            });


        }


        function drawChart4() {



            // JSONP request


            var jsonData =  ${cow2}
            var data = new google.visualization.DataTable();
            data.addColumn('datetime', 'Time');
            data.addColumn('number', 'WalkingCount');

            $.each(jsonData, function (i, row) {

                var strarr = row.RI.split('-');
                var temp = strarr[2].substring(0,4) + '-'+ strarr[2].substring(4,6)+ '-' + strarr[2].substring(6,8) + " " + strarr[2].substring(8,10)+":"+strarr[2].substring(10,12)+ ":"+ strarr[2].substring(12,14);



                if( parseInt(parseInt(row.con.substring(21,row.con.length)))>0 ){

                    sumtemp = parseInt(row.con.substring(21,row.con.length))

                    data.addRow([

                        (new Date(temp)),
                        sumtemp
                    ]);
                }
            });

            var options = {
                series: {
                    2: {lineDashStyle: [2, 2]},
                    3: {lineDashStyle: [2, 2]}
                },
                colors: ['red', 'blue', 'black', 'green', 'yellow', 'gray']
            };


            var chart4 = new google.visualization.LineChart($('#chart4').get(0));

            chart4.draw(data, options, {
                title: ' '
            });


        }


        // load chart lib
        google.load('visualization', '1', {
            packages: ['corechart']
        });

        // call drawChart once google charts is loaded
        google.setOnLoadCallback(drawChart);
        google.setOnLoadCallback(drawChart2);
        google.setOnLoadCallback(drawChart3);
        google.setOnLoadCallback(drawChart4);
    </script>


</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Data monitoring</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">

            </ul>

        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">

                <li><a href="/cow/01list">소1</a></li>
                <li><a href="/cow/02list">소2</a></li>
                <li class="active"><a href="#">전체 통계 <span class="sr-only">(current)</span></a></li>
            </ul>

        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


            <h2 class="sub-header">온도/활동량</h2>
            <div class="table-responsive">
                <table class="table table-striped" border ="1" bordercolor = "#D8D8D8">
                    <thead>
                    <tr>
                        <td>

                            <h3>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Cow-01</h3>
                        <div id="chart"style="height: 300px; width:650px;"></div>
                        <div id="chart2" style="height: 300px; width:650px;"></div>
                        </td>
                        <td>

                            <h3>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;Cow-02</h3>
                            <div id="chart3"style="height: 300px; width:650px;"></div>
                            <div id="chart4" style="height: 300px; width:650px;"></div>
                        </td>
                    </tr>

                    </thead>
                    <tbody>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


</body>
</html>

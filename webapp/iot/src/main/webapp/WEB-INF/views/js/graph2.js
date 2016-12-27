window.onload = function () {

    var dps = []; // dataPoints

    var chart = new CanvasJS.Chart("chartContainer",{
        title :{
            text: "Live Random Data"
        },
        data: [{
            type: "line",
            dataPoints: dps
        }]
    });

    var chart2 = new CanvasJS.Chart("chartContainer2",{
        title :{
            text: "Live Random Data"
        },
        data: [{
            type: "line",
            dataPoints: dps
        }]
    });


    var xVal = 0;
    var yVal = 100;
    var updateInterval = 200;
    var dataLength = 500; // number of dataPoints visible at any point

    var updateChart = function (count) {
        count = count || 1;
        // count is number of times loop runs to generate random dataPoints.

        for (var j = 0; j < count; j++) {
            yVal = yVal +  Math.round(5 + Math.random() *(-5-5));
            dps.push({
                x: xVal,
                y: yVal
            });
            xVal++;
        };

        if (dps.length > dataLength)
        {
            dps.shift();
        }

        chart.render();
   //     chart2.render();

    };


    var updateChart2 = function (count) {
        count = count || 1;
        // count is number of times loop runs to generate random dataPoints.

        for (var j = 0; j < count; j++) {
            yVal = yVal +  Math.round(5 + Math.random() *(-5-5));
            dps.push({
                x: xVal,
                y: yVal
            });
            xVal++;
        };

        if (dps.length > dataLength)
        {
            dps.shift();
        }

         chart2.render();

    };



    // generates first set of dataPoints
    updateChart(dataLength);
    updateChart2(dataLength);
    // update chart after specified time.
    setInterval(function(){updateChart()}, updateInterval);
    setInterval(function(){updateChart2()}, 50);
}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #c1,#c2,#c3,#c4,#c5 {
        height:400px;
        border: 2px solid lightgray;
    }
</style>

<script>
    let dashboard = {
        init:()=>{
            dashboard.display2();
            dashboard.getdata1();
            dashboard.getdata3();
            dashboard.getdata4();
        },
        getdata1: () => {
            $.ajax({
                url:'/dashboard01',
                success: (result) => {
                    dashboard.display1(result)
                }
            });
        },
        getdata3:()=>{
            $.ajax({
                url:'/dashboard03',
                success: (result) => {
                    dashboard.display3(result)
                }
            });
        },
        getdata4:()=>{
            $.ajax({
                url:'/dashboard04',
                success: (result) => {
                    dashboard.display4(result)
                }
            });
        },
        getdata5:()=>{},
        display1:(result)=>{
            // Data retrieved from https://fas.org/issues/nuclear-weapons/status-world-nuclear-forces/
            Highcharts.chart('c1', {
                chart: {
                    type: 'area'
                },
                accessibility: {
                    description: 'USA vs MAHANHUR'
                },
                title: {
                    text: 'US and MAHAN nuclear stockpiles'
                },
                xAxis: {
                    allowDecimals: false,
                    labels: {
                        formatter: function () {
                            return this.value; // clean, unformatted number for year
                        }
                    },
                    accessibility: {
                        rangeDescription: 'Range: 1940 to 2017.'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Nuclear weapon states'
                    },
                    labels: {
                        formatter: function () {
                            return this.value / 1000 + 'k';
                        }
                    }
                },
                tooltip: {
                    pointFormat: '{series.name} had stockpiled <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
                },
                plotOptions: {
                    area: {
                        pointStart: 1940,
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: [{
                    name: 'USA',
                    data: [
                        null, null, null, null, null, 2, 9, 13, 50, 170, 299, 438, 841,
                        1169, 1703, 2422, 3692, 5543, 7345, 12298, 18638, 22229, 25540,
                        28133, 29463, 31139, 31175, 31255, 29561, 27552, 26008, 25830,
                        26516, 27835, 28537, 27519, 25914, 25542, 24418, 24138, 24104,
                        23208, 22886, 23305, 23459, 23368, 23317, 23575, 23205, 22217,
                        21392, 19008, 13708, 11511, 10979, 10904, 11011, 10903, 10732,
                        10685, 10577, 10526, 10457, 10027, 8570, 8360, 7853, 5709, 5273,
                        5113, 5066, 4897, 4881, 4804, 4717, 4571, 4018, 3822, 3785, 3805,
                        3750, 3708, 3708
                    ]
                }, {
                    name: 'MAHANHUR',
                    data: result
                }]
            });

        },
        display2:()=>{
            function getNow() {
                var now = new Date();

                return {
                    hours: now.getHours() + now.getMinutes() / 60,
                    minutes: now.getMinutes() * 12 / 60 + now.getSeconds() * 12 / 3600,
                    seconds: now.getSeconds() * 12 / 60
                };
            }

            /**
             * Pad numbers
             */
            function pad(number, length) {
                // Create an array of the remaining length + 1 and join it with 0's
                return new Array((length || 2) + 1 - String(number).length).join(0) + number;
            }

            var now = getNow();

// Create the chart
            Highcharts.chart('c2', {

                    chart: {
                        type: 'gauge',
                        plotBackgroundColor: null,
                        plotBackgroundImage: null,
                        plotBorderWidth: 0,
                        plotShadow: false,
                        height: '80%'
                    },

                    credits: {
                        enabled: false
                    },
                    pane: {
                        background: [{
                            // default background
                        }, {
                            // reflex for supported browsers
                            backgroundColor: Highcharts.svg ? {
                                radialGradient: {
                                    cx: 0.5,
                                    cy: -0.4,
                                    r: 1.9
                                },
                                stops: [
                                    [0.5, 'rgba(255, 255, 255, 0.2)'],
                                    [0.5, 'rgba(200, 200, 200, 0.2)']
                                ]
                            } : null
                        }]
                    },

                    yAxis: {
                        labels: {
                            distance: -20
                        },
                        min: 0,
                        max: 12,
                        lineWidth: 0,
                        showFirstLabel: false,

                        minorTickInterval: 'auto',
                        minorTickWidth: 1,
                        minorTickLength: 5,
                        minorTickPosition: 'inside',
                        minorGridLineWidth: 0,
                        minorTickColor: '#666',

                        tickInterval: 1,
                        tickWidth: 2,
                        tickPosition: 'inside',
                        tickLength: 10,
                        tickColor: '#666',
                        title: {
                            text: 'Powered by<br/>Highcharts',
                            style: {
                                color: '#BBB',
                                fontWeight: 'normal',
                                fontSize: '8px',
                                lineHeight: '10px'
                            },
                            y: 10
                        }
                    },

                    tooltip: {
                        formatter: function () {
                            return this.series.chart.tooltipText;
                        }
                    },

                    series: [{
                        data: [{
                            id: 'hour',
                            y: now.hours,
                            dial: {
                                radius: '60%',
                                baseWidth: 4,
                                baseLength: '95%',
                                rearLength: 0
                            }
                        }, {
                            id: 'minute',
                            y: now.minutes,
                            dial: {
                                baseLength: '95%',
                                rearLength: 0
                            }
                        }, {
                            id: 'second',
                            y: now.seconds,
                            dial: {
                                radius: '100%',
                                baseWidth: 1,
                                rearLength: '20%'
                            }
                        }],
                        animation: false,
                        dataLabels: {
                            enabled: false
                        }
                    }]
                },

// Move
                function (chart) {
                    setInterval(function () {

                        now = getNow();

                        if (chart.axes) { // not destroyed
                            var hour = chart.get('hour'),
                                minute = chart.get('minute'),
                                second = chart.get('second'),
                                // run animation unless we're wrapping around from 59 to 0
                                animation = now.seconds === 0 ?
                                    false : {
                                        easing: 'easeOutBounce'
                                    };

                            // Cache the tooltip text
                            chart.tooltipText =
                                pad(Math.floor(now.hours), 2) + ':' +
                                pad(Math.floor(now.minutes * 5), 2) + ':' +
                                pad(now.seconds * 5, 2);


                            hour.update(now.hours, true, animation);
                            minute.update(now.minutes, true, animation);
                            second.update(now.seconds, true, animation);
                        }

                    }, 1000);

                });

            /**
             * Easing function from https://github.com/danro/easing-js/blob/master/easing.js
             */
            Math.easeOutBounce = function (pos) {
                if ((pos) < (1 / 2.75)) {
                    return (7.5625 * pos * pos);
                }
                if (pos < (2 / 2.75)) {
                    return (7.5625 * (pos -= (1.5 / 2.75)) * pos + 0.75);
                }
                if (pos < (2.5 / 2.75)) {
                    return (7.5625 * (pos -= (2.25 / 2.75)) * pos + 0.9375);
                }
                return (7.5625 * (pos -= (2.625 / 2.75)) * pos + 0.984375);
            };
        },
        display3:(result)=>{
            Highcharts.chart('c3', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Browser market shares in March, 2022',
                    align: 'left'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true
                    }
                },
                series: [{
                    name: 'Brands',
                    colorByPoint: true,
                    data: result
                }]
            });
        },
        display4:(result)=>{
            Highcharts.chart('c4', {
                chart: {
                    type: 'packedbubble',
                    height: '100%'
                },
                title: {
                    text: 'Carbon emissions around the world (2014)',
                    align: 'left'
                },
                tooltip: {
                    useHTML: true,
                    pointFormat: '<b>{point.name}:</b> {point.value}m CO<sub>2</sub>'
                },
                plotOptions: {
                    packedbubble: {
                        minSize: '30%',
                        maxSize: '120%',
                        zMin: 0,
                        zMax: 1000,
                        layoutAlgorithm: {
                            splitSeries: false,
                            gravitationalConstant: 0.02
                        },
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}',
                            filter: {
                                property: 'y',
                                operator: '>',
                                value: 250
                            },
                            style: {
                                color: 'black',
                                textOutline: 'none',
                                fontWeight: 'normal'
                            }
                        }
                    }
                },
                series: result
            });

        },
        display5:(result)=>{}
    }

    $( ()=> {
        dashboard.init();
    })
</script>


<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>
    <div class="row">
        <div class="col-sm-5" id="c1">c1</div>
        <div class="col-sm-3" id="c2">c2</div>
        <div class="col-sm-4" id="c3">c3</div>
    </div>
    <div class="row">
        <div class="col-sm-4" id="c4">c4</div>
        <div class="col-sm-8" id="c5">c5</div>
    </div>

</div>
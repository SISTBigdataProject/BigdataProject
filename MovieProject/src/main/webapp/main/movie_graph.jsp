<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://www.cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<meta charset="UTF-8">
<title>Morris.js Responsive Charts Example + Bootstrap</title>
<style type="text/css">
.morris-hover {
	position: absolute;
	z-index: 1000;
}

.morris-hover.morris-default-style {
	border-radius: 10px;
	padding: 6px;
	color: #666;
	background: rgba(255, 255, 255, 0.8);
	border: solid 2px rgba(230, 230, 230, 0.8);
	font-family: sans-serif;
	font-size: 12px;
	text-align: center;
	font-color: #000;
}

.morris-hover.morris-default-style .morris-hover-row-label {
	font-weight: bold;
	margin: 0.25em 0;
}

.morris-hover.morris-default-style .morris-hover-point {
	white-space: nowrap;
	margin: 0.1em 0;
}

svg {
	width: 100%;
}
</style>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
		  areaChart();
		
		  $(window).resize(function() {
		    window.areaChart.redraw();
		  });
		});
		
		
		function areaChart() {
		  window.areaChart = Morris.Area({
		    element: 'area-chart',
		    data: [
		    	 <%=request.getAttribute("graph") %> 
		    ],
		    xkey: ['y'],
		    ykeys: ['x'],
		    labels: ['count'],
		    lineColors: ['#ffaa00'],
		    lineWidth: '3px',
		   /*  pointFillColors: ['#ffffff'], */
		    resize: true,
		    redraw: true,
		    fillOpacity:'0.5'
		  });
		  }
	</script>
	<div class="container">
		<div class="row">
			<h2>평점 그래프</h2>
			<div id="area-chart"></div>
		</div>
	</div>
</body>
</html>
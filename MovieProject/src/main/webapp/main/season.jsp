<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>영화 연구소</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- JS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<!-- Search bar -->

<!-- Font -->
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

<!-- morris.js Graph -->
<link rel="stylesheet" href="https://www.cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<style>

#area-chart,
#line-chart,
#bar-chart,
#stacked,
#pie-chart{
  min-height: 250px;
}

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

.gcard {
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
    width: 100%;
    margin-top: 10px;
    margin-bottom: 15px;
    background-color: #fff;
    min-height: 300px;
}

/* .mcard a{
	position: absolute;
    height: 100%;
    width: 100%;
    z-index: 1;
	text-decoration: none;
}

.mcard #title
{
	height: 30px;
}
 */

</style>
</head>
<body style="background-color: #e5e5e5;">
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="hero-image" style="background-image:url('../img/spring.jpg');">
		  <div class="hero-text">
		    <h1 style="font-size:50px; text-shadow: 2px 2px #00
			</div>0;">네이버 영화 리뷰 데이터 분석</h1>
		    <p>첫번째, 3월, 4월, 5월에 작성된 리뷰 기준</p>
		  </div>
	</div>
	<div class="container" style="background-color: #e5e5e5;">
		<div class="row">
			<div class="col-sm-2">
			</div>
			<div class="col-sm-8">	
				<label class="label label-success">많이 언급된 단어 리스트</label>
				<div id="wordSpace"></div>
				<script src="https://d3js.org/d3.v3.min.js"></script>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<label class="label label-success">Area Chart</label>
      			<div class="gcard" id="area-chart"></div>
			</div>
			<div class="col-sm-4">
				<label class="label label-success">Line Chart</label>
      			<div class="gcard" id="line-chart"></div>
			</div>
			<div class="col-sm-4">
				<label class="label label-success">Bar Chart</label>
      			<div class="gcard" id="bar-chart"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<label class="label label-success">Bar stacked</label>
      			<div class="gcard" id="stacked" ></div>
			</div>
			<div class="col-sm-4">
				<label class="label label-success">Pie Chart</label>
      			<div class="gcard" id="pie-chart"></div>
			</div>
			<div class="col-sm-4">
			</div>
		</div>
	
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
	var data = [
	      { y: '2014', a: 50, b: 90},
	      { y: '2015', a: 65,  b: 75},
	      { y: '2016', a: 50,  b: 50},
	      { y: '2017', a: 75,  b: 60},
	      { y: '2018', a: 80,  b: 65},
	      { y: '2019', a: 90,  b: 70},
	      { y: '2020', a: 100, b: 75},
	      { y: '2021', a: 115, b: 75},
	      { y: '2022', a: 120, b: 85},
	      { y: '2023', a: 145, b: 85},
	      { y: '2024', a: 160, b: 95}
	    ],
	    config = {
	      data: data,
	      xkey: 'y',
	      ykeys: ['a', 'b'],
	      labels: ['Total Income', 'Total Outcome'],
	      fillOpacity: 0.6,
	      hideHover: 'auto',
	      behaveLikeLine: true,
	      resize: true,
	      pointFillColors:['#ffffff'],
	      pointStrokeColors: ['black'],
	      lineColors:['gray','red']
	  };
	
	config.element = 'area-chart';
	Morris.Area(config);
	config.element = 'line-chart';
	Morris.Line(config);
	config.element = 'bar-chart';
	Morris.Bar(config);
	config.element = 'stacked';
	config.stacked = true;
	Morris.Bar(config);
	Morris.Donut({
	  element: 'pie-chart',
	  data: [
	    {label: "Friends", value: 30},
	    {label: "Allies", value: 15},
	    {label: "Enemies", value: 45},
	    {label: "Neutral", value: 10}
	  ]
	});
	</script>
	
	
	<!-- 워드 클라우드 -->
	<script>
	// Word cloud layout by Jason Davies, https://www.jasondavies.com/word-cloud/
	// Algorithm due to Jonathan Feinberg, http://static.mrfeinberg.com/bv_ch03.pdf
	(function() {
	  function cloud() {
	    var size = [256, 256],
	        text = cloudText,
	        font = cloudFont,
	        fontSize = cloudFontSize,
	        fontStyle = cloudFontNormal,
	        fontWeight = cloudFontNormal,
	        rotate = cloudRotate,
	        padding = cloudPadding,
	        spiral = archimedeanSpiral,
	        words = [],
	        timeInterval = Infinity,
	        event = d3.dispatch("word", "end"),
	        timer = null,
	        cloud = {};

	    cloud.start = function() {
	      var board = zeroArray((size[0] >> 5) * size[1]),
	          bounds = null,
	          n = words.length,
	          i = -1,
	          tags = [],
	          data = words.map(function(d, i) {
	            d.text = text.call(this, d, i);
	            d.font = font.call(this, d, i);
	            d.style = fontStyle.call(this, d, i);
	            d.weight = fontWeight.call(this, d, i);
	            d.rotate = rotate.call(this, d, i);
	            d.size = ~~fontSize.call(this, d, i);
	            d.padding = padding.call(this, d, i);
	            return d;
	          }).sort(function(a, b) { return b.size - a.size; });

	      if (timer) clearInterval(timer);
	      timer = setInterval(step, 0);
	      step();

	      return cloud;

	      function step() {
	        var start = +new Date,
	            d;
	        while (+new Date - start < timeInterval && ++i < n && timer) {
	          d = data[i];
	          d.x = (size[0] * (Math.random() + .5)) >> 1;
	          d.y = (size[1] * (Math.random() + .5)) >> 1;
	          cloudSprite(d, data, i);
	          if (d.hasText && place(board, d, bounds)) {
	            tags.push(d);
	            event.word(d);
	            if (bounds) cloudBounds(bounds, d);
	            else bounds = [{x: d.x + d.x0, y: d.y + d.y0}, {x: d.x + d.x1, y: d.y + d.y1}];
	            // Temporary hack
	            d.x -= size[0] >> 1;
	            d.y -= size[1] >> 1;
	          }
	        }
	        if (i >= n) {
	          cloud.stop();
	          event.end(tags, bounds);
	        }
	      }
	    }

	    cloud.stop = function() {
	      if (timer) {
	        clearInterval(timer);
	        timer = null;
	      }
	      return cloud;
	    };

	    cloud.timeInterval = function(x) {
	      if (!arguments.length) return timeInterval;
	      timeInterval = x == null ? Infinity : x;
	      return cloud;
	    };

	    function place(board, tag, bounds) {
	      var perimeter = [{x: 0, y: 0}, {x: size[0], y: size[1]}],
	          startX = tag.x,
	          startY = tag.y,
	          maxDelta = Math.sqrt(size[0] * size[0] + size[1] * size[1]),
	          s = spiral(size),
	          dt = Math.random() < .5 ? 1 : -1,
	          t = -dt,
	          dxdy,
	          dx,
	          dy;

	      while (dxdy = s(t += dt)) {
	        dx = ~~dxdy[0];
	        dy = ~~dxdy[1];

	        if (Math.min(dx, dy) > maxDelta) break;

	        tag.x = startX + dx;
	        tag.y = startY + dy;

	        if (tag.x + tag.x0 < 0 || tag.y + tag.y0 < 0 ||
	            tag.x + tag.x1 > size[0] || tag.y + tag.y1 > size[1]) continue;
	        // TODO only check for collisions within current bounds.
	        if (!bounds || !cloudCollide(tag, board, size[0])) {
	          if (!bounds || collideRects(tag, bounds)) {
	            var sprite = tag.sprite,
	                w = tag.width >> 5,
	                sw = size[0] >> 5,
	                lx = tag.x - (w << 4),
	                sx = lx & 0x7f,
	                msx = 32 - sx,
	                h = tag.y1 - tag.y0,
	                x = (tag.y + tag.y0) * sw + (lx >> 5),
	                last;
	            for (var j = 0; j < h; j++) {
	              last = 0;
	              for (var i = 0; i <= w; i++) {
	                board[x + i] |= (last << msx) | (i < w ? (last = sprite[j * w + i]) >>> sx : 0);
	              }
	              x += sw;
	            }
	            delete tag.sprite;
	            return true;
	          }
	        }
	      }
	      return false;
	    }

	    cloud.words = function(x) {
	      if (!arguments.length) return words;
	      words = x;
	      return cloud;
	    };

	    cloud.size = function(x) {
	      if (!arguments.length) return size;
	      size = [+x[0], +x[1]];
	      return cloud;
	    };

	    cloud.font = function(x) {
	      if (!arguments.length) return font;
	      font = d3.functor(x);
	      return cloud;
	    };

	    cloud.fontStyle = function(x) {
	      if (!arguments.length) return fontStyle;
	      fontStyle = d3.functor(x);
	      return cloud;
	    };

	    cloud.fontWeight = function(x) {
	      if (!arguments.length) return fontWeight;
	      fontWeight = d3.functor(x);
	      return cloud;
	    };

	    cloud.rotate = function(x) {
	      if (!arguments.length) return rotate;
	      rotate = d3.functor(x);
	      return cloud;
	    };

	    cloud.text = function(x) {
	      if (!arguments.length) return text;
	      text = d3.functor(x);
	      return cloud;
	    };

	    cloud.spiral = function(x) {
	      if (!arguments.length) return spiral;
	      spiral = spirals[x + ""] || x;
	      return cloud;
	    };

	    cloud.fontSize = function(x) {
	      if (!arguments.length) return fontSize;
	      fontSize = d3.functor(x);
	      return cloud;
	    };

	    cloud.padding = function(x) {
	      if (!arguments.length) return padding;
	      padding = d3.functor(x);
	      return cloud;
	    };

	    return d3.rebind(cloud, event, "on");
	  }

	  function cloudText(d) {
	    return d.text;
	  }

	  function cloudFont() {
	    return "serif";
	  }

	  function cloudFontNormal() {
	    return "normal";
	  }

	  function cloudFontSize(d) {
	    return Math.sqrt(d.value);
	  }

	  function cloudRotate() {
	    return (~~(Math.random() * 6) - 3) * 30;
	  }

	  function cloudPadding() {
	    return 1;
	  }

	  // Fetches a monochrome sprite bitmap for the specified text.
	  // Load in batches for speed.
	  function cloudSprite(d, data, di) {
	    if (d.sprite) return;
	    c.clearRect(0, 0, (cw << 5) / ratio, ch / ratio);
	    var x = 0,
	        y = 0,
	        maxh = 0,
	        n = data.length;
	    --di;
	    while (++di < n) {
	      d = data[di];
	      c.save();
	      c.font = d.style + " " + d.weight + " " + ~~((d.size + 1) / ratio) + "px " + d.font;
	      var w = c.measureText(d.text + "m").width * ratio,
	          h = d.size << 1;
	      if (d.rotate) {
	        var sr = Math.sin(d.rotate * cloudRadians),
	            cr = Math.cos(d.rotate * cloudRadians),
	            wcr = w * cr,
	            wsr = w * sr,
	            hcr = h * cr,
	            hsr = h * sr;
	        w = (Math.max(Math.abs(wcr + hsr), Math.abs(wcr - hsr)) + 0x1f) >> 5 << 5;
	        h = ~~Math.max(Math.abs(wsr + hcr), Math.abs(wsr - hcr));
	      } else {
	        w = (w + 0x1f) >> 5 << 5;
	      }
	      if (h > maxh) maxh = h;
	      if (x + w >= (cw << 5)) {
	        x = 0;
	        y += maxh;
	        maxh = 0;
	      }
	      if (y + h >= ch) break;
	      c.translate((x + (w >> 1)) / ratio, (y + (h >> 1)) / ratio);
	      if (d.rotate) c.rotate(d.rotate * cloudRadians);
	      c.fillText(d.text, 0, 0);
	      if (d.padding) c.lineWidth = 2 * d.padding, c.strokeText(d.text, 0, 0);
	      c.restore();
	      d.width = w;
	      d.height = h;
	      d.xoff = x;
	      d.yoff = y;
	      d.x1 = w >> 1;
	      d.y1 = h >> 1;
	      d.x0 = -d.x1;
	      d.y0 = -d.y1;
	      d.hasText = true;
	      x += w;
	    }
	    var pixels = c.getImageData(0, 0, (cw << 5) / ratio, ch / ratio).data,
	        sprite = [];
	    while (--di >= 0) {
	      d = data[di];
	      if (!d.hasText) continue;
	      var w = d.width,
	          w32 = w >> 5,
	          h = d.y1 - d.y0;
	      // Zero the buffer
	      for (var i = 0; i < h * w32; i++) sprite[i] = 0;
	      x = d.xoff;
	      if (x == null) return;
	      y = d.yoff;
	      var seen = 0,
	          seenRow = -1;
	      for (var j = 0; j < h; j++) {
	        for (var i = 0; i < w; i++) {
	          var k = w32 * j + (i >> 5),
	              m = pixels[((y + j) * (cw << 5) + (x + i)) << 2] ? 1 << (31 - (i % 32)) : 0;
	          sprite[k] |= m;
	          seen |= m;
	        }
	        if (seen) seenRow = j;
	        else {
	          d.y0++;
	          h--;
	          j--;
	          y++;
	        }
	      }
	      d.y1 = d.y0 + seenRow;
	      d.sprite = sprite.slice(0, (d.y1 - d.y0) * w32);
	    }
	  }

	  // Use mask-based collision detection.
	  function cloudCollide(tag, board, sw) {
	    sw >>= 5;
	    var sprite = tag.sprite,
	        w = tag.width >> 5,
	        lx = tag.x - (w << 4),
	        sx = lx & 0x7f,
	        msx = 32 - sx,
	        h = tag.y1 - tag.y0,
	        x = (tag.y + tag.y0) * sw + (lx >> 5),
	        last;
	    for (var j = 0; j < h; j++) {
	      last = 0;
	      for (var i = 0; i <= w; i++) {
	        if (((last << msx) | (i < w ? (last = sprite[j * w + i]) >>> sx : 0))
	            & board[x + i]) return true;
	      }
	      x += sw;
	    }
	    return false;
	  }

	  function cloudBounds(bounds, d) {
	    var b0 = bounds[0],
	        b1 = bounds[1];
	    if (d.x + d.x0 < b0.x) b0.x = d.x + d.x0;
	    if (d.y + d.y0 < b0.y) b0.y = d.y + d.y0;
	    if (d.x + d.x1 > b1.x) b1.x = d.x + d.x1;
	    if (d.y + d.y1 > b1.y) b1.y = d.y + d.y1;
	  }

	  function collideRects(a, b) {
	    return a.x + a.x1 > b[0].x && a.x + a.x0 < b[1].x && a.y + a.y1 > b[0].y && a.y + a.y0 < b[1].y;
	  }

	  function archimedeanSpiral(size) {
	    var e = size[0] / size[1];
	    return function(t) {
	      return [e * (t *= .1) * Math.cos(t), t * Math.sin(t)];
	    };
	  }

	  function rectangularSpiral(size) {
	    var dy = 4,
	        dx = dy * size[0] / size[1],
	        x = 0,
	        y = 0;
	    return function(t) {
	      var sign = t < 0 ? -1 : 1;
	      // See triangular numbers: T_n = n * (n + 1) / 2.
	      switch ((Math.sqrt(1 + 4 * sign * t) - sign) & 3) {
	        case 0:  x += dx; break;
	        case 1:  y += dy; break;
	        case 2:  x -= dx; break;
	        default: y -= dy; break;
	      }
	      return [x, y];
	    };
	  }

	  // TODO reuse arrays?
	  function zeroArray(n) {
	    var a = [],
	        i = -1;
	    while (++i < n) a[i] = 0;
	    return a;
	  }

	  var cloudRadians = Math.PI / 180,
	      cw = 1 << 11 >> 5,
	      ch = 1 << 11,
	      canvas,
	      ratio = 1;

	  if (typeof document !== "undefined") {
	    canvas = document.createElement("canvas");
	    canvas.width = 1;
	    canvas.height = 1;
	    ratio = Math.sqrt(canvas.getContext("2d").getImageData(0, 0, 1, 1).data.length >> 2);
	    canvas.width = (cw << 5) / ratio;
	    canvas.height = ch / ratio;
	  } else {
	    // Attempt to use node-canvas.
	    canvas = new Canvas(cw << 5, ch);
	  }

	  var c = canvas.getContext("2d"),
	      spirals = {
	        archimedean: archimedeanSpiral,
	        rectangular: rectangularSpiral
	      };
	  c.fillStyle = c.strokeStyle = "red";
	  c.textAlign = "center";

	  if (typeof module === "object" && module.exports) module.exports = cloud;
	  else (d3.layout || (d3.layout = {})).cloud = cloud;
	})();

	var frequency_list = [{"text":"study","size":40},{"text":"motion","size":15},{"text":"forces","size":10},{"text":"electricity","size":15},{"text":"movement","size":10},{"text":"relation","size":5},{"text":"things","size":10},{"text":"force","size":5},{"text":"ad","size":5},{"text":"energy","size":85},{"text":"living","size":5},{"text":"nonliving","size":5},{"text":"laws","size":15},{"text":"speed","size":45},{"text":"velocity","size":30},{"text":"define","size":5},{"text":"constraints","size":5},{"text":"universe","size":10},{"text":"physics","size":120},{"text":"describing","size":5},{"text":"matter","size":90},{"text":"physics-the","size":5},{"text":"world","size":10},{"text":"works","size":10},{"text":"science","size":70},{"text":"interactions","size":30},{"text":"studies","size":5},{"text":"properties","size":45},{"text":"nature","size":40},{"text":"branch","size":30},{"text":"concerned","size":25},{"text":"source","size":40},{"text":"google","size":10},{"text":"defintions","size":5},{"text":"two","size":15},{"text":"grouped","size":15},{"text":"traditional","size":15},{"text":"fields","size":15},{"text":"acoustics","size":15},{"text":"optics","size":15},{"text":"mechanics","size":20},{"text":"thermodynamics","size":15},{"text":"electromagnetism","size":15},{"text":"modern","size":15},{"text":"extensions","size":15},{"text":"thefreedictionary","size":15},{"text":"interaction","size":15},{"text":"org","size":25},{"text":"answers","size":5},{"text":"natural","size":15},{"text":"objects","size":5},{"text":"treats","size":10},{"text":"acting","size":5},{"text":"department","size":5},{"text":"gravitation","size":5},{"text":"heat","size":10},{"text":"light","size":10},{"text":"magnetism","size":10},{"text":"modify","size":5},{"text":"general","size":10},{"text":"bodies","size":5},{"text":"philosophy","size":5},{"text":"brainyquote","size":5},{"text":"words","size":5},{"text":"ph","size":5},{"text":"html","size":5},{"text":"lrl","size":5},{"text":"zgzmeylfwuy","size":5},{"text":"subject","size":5},{"text":"distinguished","size":5},{"text":"chemistry","size":5},{"text":"biology","size":5},{"text":"includes","size":5},{"text":"radiation","size":5},{"text":"sound","size":5},{"text":"structure","size":5},{"text":"atoms","size":5},{"text":"including","size":10},{"text":"atomic","size":10},{"text":"nuclear","size":10},{"text":"cryogenics","size":10},{"text":"solid-state","size":10},{"text":"particle","size":10},{"text":"plasma","size":10},{"text":"deals","size":5},{"text":"merriam-webster","size":5},{"text":"dictionary","size":10},{"text":"analysis","size":5},{"text":"conducted","size":5},{"text":"order","size":5},{"text":"understand","size":5},{"text":"behaves","size":5},{"text":"en","size":5},{"text":"wikipedia","size":5},{"text":"wiki","size":5},{"text":"physics-","size":5},{"text":"physical","size":5},{"text":"behaviour","size":5},{"text":"collinsdictionary","size":5},{"text":"english","size":5},{"text":"time","size":35},{"text":"distance","size":35},{"text":"wheels","size":5},{"text":"revelations","size":5},{"text":"minute","size":5},{"text":"acceleration","size":20},{"text":"torque","size":5},{"text":"wheel","size":5},{"text":"rotations","size":5},{"text":"resistance","size":5},{"text":"momentum","size":5},{"text":"measure","size":10},{"text":"direction","size":10},{"text":"car","size":5},{"text":"add","size":5},{"text":"traveled","size":5},{"text":"weight","size":5},{"text":"electrical","size":5},{"text":"power","size":5}];

	    var color = d3.scale.linear()
	            .domain([0,1,2,3,4,5,6,10,15,20,100])
	            .range(["#ddd", "#ccc", "#bbb", "#aaa", "#999", "#888", "#777", "#666", "#555", "#444", "#333", "#222"]);

	    d3.layout.cloud().size([800, 300])
	            .words(frequency_list)
	            .rotate(0)
	            .fontSize(function(d) { return d.size; })
	            .on("end", draw)
	            .start();

	    function draw(words) {
	        d3.select("#wordSpace").append("svg")
	                .attr("width", 850)
	                .attr("height", 350)
	                .attr("class", "wordcloud")
	                .append("g")
	                // without the transform, words words would get cutoff to the left and top, they would appear outside of the SVG area
	                .attr("transform", "translate(320,200)")
	                .selectAll("text")
	                .data(words)
	                .enter().append("text")
	                .style("font-size", function(d) { return d.size + "px"; })
	                .style("fill", function(d, i) { return color(i); })
	                .attr("transform", function(d) {
	                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
	                })
	                .text(function(d) { return d.text; });
	    }
	</script>
</body>
</html>
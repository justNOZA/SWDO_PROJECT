<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<title>${title}</title>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">

		<link rel="stylesheet" href="resources/epub/css/normalize.css">
		<link rel="stylesheet" href="resources/epub/css/main.css">
		<link rel="stylesheet" href="resources/epub/css/popup.css">
		
		<script src="resources/epub/js/libs/jquery.min.js"></script>

		<script src="resources/epub/js/libs/zip.min.js"></script>
        
		<c:if test="${previousLocationCfi != null}">
		<script type="text/javascript">
		if(!confirm('CONTINUE?')){
			$.ajax({
				url : 'deletePrevious'
				, type : 'get'
				, async : false
				, error : function(e){
					console.log(e);
				}
			});
		}
		</script>
		</c:if>
		<script>
			localStorage.clear();
            "use strict";
            document.onreadystatechange = function () {
              if (document.readyState == "complete") {
                window.reader = ePubReader("ebook/${title}.epub", {
                   restore: true
                 });
              }
            };
		</script>
        <!-- Render -->
		<script src="resources/epub/js/epub.js"></script>
        <!-- Reader -->
		<script src="resources/epub/js/reader.js"></script>
		<!-- Full Screen -->
        <script src="resources/epub/js/libs/screenfull.js"></script>
        <!-- Plugins -->
		<script src="resources/epub/js/plugins/search.js"></script>
		
		<style>
		@media print { 
			body.noPrint{ display:none;}
		}
		.backColor { background-color: gray}
		</style>

	</head>
	<body oncontextmenu='return false' ondragstart='return false' class="noPrint">
		<input type="hidden" id="contentsPage">
		<div id="sidebar">
			<div id="panels">
				
				<a id="show-Toc" class="show_view icon-list-1 active" data-view="Toc">TOC</a>
				<a id="show-Bookmarks" class="show_view icon-bookmark" data-view="Bookmarks">Bookmarks</a>
			</div>
			<div id="tocView" class="view">
			</div>
			<div id="bookmarksView" class="view">
				<ul id="bookmarks"></ul>
			</div>
		</div>
		<div id="main">
			<div id="titlebar">
				<div id="opener">
					<a id="slider" class="icon-menu">Menu</a>
				</div>
				<div id="metainfo">
					<span id="book-title"></span>
					<span id="title-seperator">&nbsp;&nbsp;–&nbsp;&nbsp;</span>
					<span id="chapter-title"></span>
				</div>
				<div id="title-controls">
					<div id="audioBar"></div>
						<div id="stopAuto"></div>
						<a id="search_text" class="show_view icon-search">S</a>
						<a id="tts">T</a>
						<a id="bookmark" class="icon-bookmark-empty">Bookmark</a>
						<a id="setting" class="icon-cog">Settings</a>
						<a id="fullscreen" class="icon-resize-full">Fullscreen</a>
				</div>
			</div>
			<div id="divider"></div>
			<div id="prev" class="arrow">‹</div>
			<div id="viewer"></div>
			<div id="next" class="arrow">›</div>

			<div id="loader"><img src="resources/epub/img/loader.gif"></div>
		</div>
		<div class="modal md-effect-1" id="settings-modal">
			<div class="md-content">
				<h3>Settings</h3>
				<div>
					<p>DARK MODE</p>
					<input type="checkbox" id="change">
					<p>AUTO MODE</p>
					<div id="autoBox">
					<input type="checkbox" id="auto">
					</div>
					<div id="settingAuto"></div>
				</div>
				<div class="closer icon-cancel-circled">
				</div>
			</div>
		</div>
      	<div class="overlay"></div>
<script type="text/javascript">
		$(function(){
			$('#tts').on('click',textToSpeech);
			$('.arrow').on('click',deleteTTS);
			$(window).on('resize',iframeBody);
			$('#search_text').on('click',openWindow);
			$('#auto').on('click', formChange);
      		$('#change').on('click',changeMode);
		});
		
		setTimeout(iframeBody, 100);
		function iframeBody(){
			setTimeout(function(){
				$('iframe').contents().find('body').attr("oncontextmenu", 'return false');
				$('iframe').contents().find('body').attr("ondragstart", 'return false');		
				$('iframe').contents().find('body').attr("onselectstart", 'return false');	
			},400);
		}
		function textToSpeech(){
			var index = $('#contentsPage').val();
			$.ajax({
				url : 'textToSpeech'
				, type : 'post'
				, data : {index : index}
				, dataType : 'text'
				, success : function(e){
					var audio = "<audio autoplay src='audio/"+e+"'></audio>"
					$('#audioBar').html(audio);
				}
			});
		}
		function deleteTTS(){
			$('#audioBar').html('');
		}
		function openWindow(){
			//수정할 필요가 있음
			window.open('https://dict.naver.com/', 'search', 'width=500, height=500, left=500, top=200');
		}
		var a;
		var continueC;
		function changeMode(){
			$('#change').off('click');
			$('#change').on('click', original);
			a = $('iframe').contents().find('head').html();
			var b = a + '<style> .wordColor {color : white} </style>';
			continueC = setInterval(function(){
				$('iframe').contents().find('head').html(b);
				$('iframe').contents().find('p').each(function(index, item){
					$(item).addClass('wordColor');
				});
			}, 1000);
				
			$('iframe').contents().find('p').each(function(index, item){
				$(item).addClass('wordColor');
			});
			$('#main').css('background-color','gray');
		}
		function original(){
			$('#change').off('click');
			$('#change').on('click', changeMode);
			clearInterval(continueC);
			$('iframe').contents().find('head').html(a);
			$('#main').css('background-color',"");
		}
		function formChange(){
			$('#auto').off('click');
			$('#auto').on('click', autoOff);
			var htmlCode = '<input type="radio" id="timeSet1" name="time" value="60">1 minutes | <input type="radio" id="timeSet2" name="time" value="180">3 minutes |<input type="radio" id="timeSet3" name="time" value="300"> 5 minutes';
			$('#settingAuto').html(htmlCode);
				
			$('#timeSet1').on('click', timeCheck);
			$('#timeSet2').on('click', timeCheck2);
			$('#timeSet3').on('click', timeCheck3);
			var htmlCode2 = '<a id="stop">S</a>';
			$('#stopAuto').html(htmlCode2);
			$('#stop').on('click', autoOff);
		}
		function autoOff(){
			$('#auto').off('click');
			clearInterval(interval);
			$('#settingAuto').html("");
			$('#stopAuto').html("");
			$('#autoBox').html('<input type="checkbox" id="auto">');
			$('#auto').on('click', formChange);	
		}
		var interval;
		function timeCheck(){
			var time = $('#timeSet1').val();
			interval = setInterval(function(){
				$('#next').click();
			}, time*1000);
		}
		function timeCheck2(){
			var time = $('#timeSet2').val();
			interval = setInterval(function(){
				$('#next').click();
			}, time*1000);
		}
		function timeCheck3(){
			var time = $('#timeSet3').val();
			interval = setInterval(function(){
				$('#next').click();
			},time*1000);
		}
</script>	
	</body>
</html>

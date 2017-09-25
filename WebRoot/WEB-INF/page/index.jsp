<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/zdnet/page/bootstrap/css/bootstrap.min.css" />
<meta charset="UTF-8" />
	<title>仲恺豆瓣</title>
	<link rel="stylesheet" type="text/css" href="css/nav.css"/>
	<link rel="stylesheet" type="text/css" href="css/carousel.css"/>
	<link rel="stylesheet" type="text/css" href="css/star.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<style type="text/css">
    .fix-nav{  
        position: fixed;  
        z-index: 9999px;
        width:100%;  
        top:-60px;  
        -webkit-transition: top .5s;  
        -moz-transition: top .5s;  
        -o-transition: top .5s;  
        transition: top .5s;  
        -webkit-box-shadow: 0 2px 2px rgba(0,0,0,.1);  
        -moz-box-shadow: 0 2px 2px rgba(0,0,0,.1);  
        box-shadow: 0 2px 2px rgba(0,0,0,.1);  
    }  
    .fix-nav-appear{top:0;}  
	</style>
	
	<style>

    </style>
    <script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script>
    <script src="js/carousel.js"></script>
	<script type="text/javascript">
	window.onload=(function onit1(){	//载入电影等的评分星级
		for(var i=1;i<=24;i++){
			var v = document.getElementById("score"+i).innerHTML;
			var wid = v*12;
			document.getElementById("over"+i).style.width=wid+"px";
		}
	})
	</script>
	<script type="text/javascript">  
    $(function(){  //当鼠标向上滑动时导航栏出现
        scrollfix();  
    });  
    function scrollfix(){  
        var fnav = $('#header'),   
        t = fnav.offset().top,   
        h = fnav.outerHeight(),  
        winTop1=0,  
        winWidth=$(window).width(),  
        holder=jQuery('<div>');  
        $(window).on('scroll',function(){  
            var winTop2 = $(window).scrollTop();  
            holder.css('height',h);  
            //开始浮动，不过不显示  
            if(winTop2>t && winWidth>980){  
                holder.show().insertBefore(fnav);  
                fnav.addClass('fix-nav');  
            }else{  
                holder.hide();  
                fnav.removeClass('fix-nav');  
            }  
            //判断鼠标向上滚动，显示出来  
            if(winTop2>winTop1 && winWidth>980){  
                fnav.removeClass('fix-nav-appear');  
            }else if(winTop2<winTop1){  
                fnav.addClass('fix-nav-appear');  
            }  
            winTop1 = $(window).scrollTop();  
        })  
    }  
    </script>
</head>

<body>
	
	<!-- <form action="queryItem.do" method="get">
			<input type="text" name="condition"><input type="submit" value="搜索">
		</form>
	 -->

	<div id="main">
	<div id="header" class="nav-header"><!--1287px-->
		<a href="index.do" target="_blank"><img src="img/标题.gif"/></a>
		<!-- <div class="nav-search">
			<input type="text" name="" id="" value="" placeholder="请输入"/>
		</div>
		 -->
		<div class="nav-option">
			<section class="color-10" style="background-color: white;margin-top: 6px;">
				<nav class="cl-effect-10">
					<a href="index.do" data-hover="首页"><span>首页</span></a>
					<a href="showAllBooks.do?page=1"data-hover="读书"><span>读书</span></a>
					<a href="showAllFilms.do?page=1"data-hover="电影"><span>电影</span></a>
					<a href="showAllMusics.do?page=1"data-hover="音乐"><span>音乐</span></a>
					<a href="showAllActivities.do?page=1"data-hover="活动"><span>课外活动</span></a>
					<a href="userInfo.do"data-hover="我"><span>${user.unickname }</span></a>
					<a href="logout.do"data-hover="注销"><span>注销</span></a>
					
				</nav>
			</section>
		</div>
	</div>
	<div id="content">
		<div id="carousel">
			<div class="win">
			    <div class="box">
			        <div class="color1" style="left:0"><img src="img/1.jpg"/></div>
			        <div class="color2"><img src="img/2.jpg"/></div>
			        <div class="color3">page3</div>
			        <div class="color4">page4</div>
			        <div class="color5">page5</div>
			    </div>
			    <div class="leftB">&lt;</div>
			    <div class="rightB">&gt;</div>
			    <div class="test">
			    	<div class="title">
				        <a href="javascript:;" style="color:#fff">1</a>
				        <a href="javascript:;">2</a>
				        <a href="javascript:;">3</a>
				        <a href="javascript:;">4</a>
				        <a href="javascript:;">5</a>
			        <div class="float"></div>
			    </div>
			    </div>
			    
			</div>
		</div>
		<div id="book">
			<div class="book-content">
				<div class="kindtitle">
					<p><a href="showAllBooks.do?page=1">读书</a></p>
				</div>
				<div class="bookinfo">
					<ul>
						<c:forEach items="${books }" var="book" varStatus="stat">
							<li>
								<div class="bookpic">
									<a href="infoBook.do?bid=${book.bid }"><img src="bookpics/${book.bpicaddr }"/></a>
								</div>
								<div class="booktitle">
									<a href="infoBook.do?bid=${book.bid }">${book.bname }</a>
								</div>
								<div class="bookstar">
									<span class="star">评分：</span>
									<div id="bg${stat.count}" class="bg">
										<span id="score${stat.count }" class="score"><fmt:formatNumber value="${book.avgstar }" pattern=".0"/></span>
										<div id="over${stat.count }" class="over"></div>
									</div>
								</div>
								
								<div class="bookbtn">
									<a href="infoBook.do?bid=${book.bid }">详细信息</a>
								</div>
							</li>
						</c:forEach>
						
					</ul>
				</div>
				<div class="goodbook">
					<p>精品书籍 · · · · · · (<a href="" class="more">更多</a>)</p>
					<ul>
						<c:forEach items="${creamBooks}" var="book" varStatus="s">
							<li>${s.count }.&nbsp;<a href="infoBook.do?bid=${book.bid }" class="more-bookname">${book.bname }</a></li><hr/>
						</c:forEach>
					</ul>
				</div>
			</div>
			
		</div>
		<div id="movie">
			<div class="movie-content">
				<div class="kindtitle">
					<p><a href="showAllFilms.do?page=1">电影</a></p>
				</div>
				<div class="movieinfo">
					<ul>
						<c:forEach items="${films }" var="film" varStatus="stat">
							<li>
								<div class="moviepic">
									<a href="infoFilm.do?fid=${film.fid }"><img src="filmpics/${film.fpicaddr }"/></a>
								</div>
								<div class="movietitle">
									<a href="infoFilm.do?fid=${film.fid }">${film.fname }</a>
								</div>
								<div class="moviestar">
									<span class="star">评分：</span>
									<div id="bg${stat.count+8 }" class="bg">
										<span id="score${stat.count+8 }" class="score"><fmt:formatNumber value="${film.avgstar }" pattern=".0"/></span>
										<div id="over${stat.count+8 }" class="over"></div>
									</div>
								</div>
								<div class="moviebtn">
									<a href="infoFilm.do?fid=${film.fid }">详细信息</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="goodmovie">
					<p>精品电影 · · · · · · (<a href="" class="more">更多</a>)</p>
					<ul>
						<c:forEach items="${creamFilms}" var="film" varStatus="s">
							<li>${s.count }.&nbsp;<a  href="infoFilm.do?fid=${film.fid }"class="more-moviename">${film.fname }</a></li><hr />
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div id="music">
			<div class="music-content">
				<div class="kindtitle">
					<p><a href="showAllMusics.do?page=1">音乐</a></p>
				</div>
				<div class="musicinfo">
					<ul>
						<c:forEach items="${musics }" var="music" varStatus="stat">
							<li>
								<div class="musicpic">
									<a href="infoMusic.do?mid=${music.mid }"><img src="musicpics/${music.mpicaddr }"/></a>
								</div>
								<div class="musictitle">
									<a href="infoMusic.do?mid=${music.mid }">${music.mname }</a>
								</div>
								<div class="musicstar">
									<span class="star">评分：</span>
									<div id="bg${stat.count+16 }" class="bg">
										<span id="score${stat.count+16 }" class="score"><fmt:formatNumber value="${music.avgstar }" pattern=".0"/></span>
										<div id="over${stat.count+16 }" class="over"></div>
									</div>
								</div>
								<div class="moviebtn">
									<a href="infoMusic.do?mid=${music.mid }">详细信息</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="goodmusic">
					<p>精品电影 · · · · · · (<a href="" class="more">更多</a>)</p>
					<ul>
						<c:forEach items="${creamMusics}" var="music">
						<li>1.&nbsp;<a href="infoMusic.do?mid=${music.mid }" class="more-musicname">${music.mname }</a></li><hr />
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!--<div id="outdoor">
			
		</div>-->
	</div>
	<div id="foot">
		<p>欢迎使用仲恺豆瓣！仲恺豆瓣是综合娱乐网站。仲恺豆瓣：2017.05.10-</p>
		<p>特别鸣谢：仲恺农业工程学院白云校区9504</p>
		<p>开发者：仲恺农业工程学院 谢仲东 袁尚文</p>
	</div>
	</div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="/zdnet/page/js/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8" />
<title>仲豆-电影列表</title>
<!--<link rel="stylesheet" type="text/css" href="css/bookiInfo.css"/>-->
<link rel="stylesheet" type="text/css" href="css/page_generic.css" />
<link rel="stylesheet" type="text/css" href="css/showAllMovie.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#totalpage").html(Math.ceil(parseInt($("#count").html()) / 5));
		if (parseInt($("#page").val()) >= parseInt($("#count").html()) / 5) {
			$("#nextpage").attr("disabled", "disabled");
		}
		if (parseInt($("#page").val()) == 1) {
			$("#lastpage").attr("disabled", "disabled");
		}
		$("#nextpage").click(
				function() {
					location.replace("showAllFilms.do?page="
							+ (parseInt($("#page").val()) + 1));
				});
		$("#lastpage").click(
				function() {
					location.replace("showAllFilms.do?page="
							+ (parseInt($("#page").val()) - 1));
				});
		$("#jumppage").click(
				function() {
					if (isNaN((parseInt($("#page").val())))
							|| (parseInt($("#page").val())) <= 0
							|| (parseInt($("#page").val())) >= (parseInt($(
									"#count").html()) / 10) + 1) {
						alert("页数不合法");
						return;
					}
					location.replace("showAllFilms.do?page="
							+ (parseInt($("#page").val())));
				});

	});
</script>

</head>

<body>
	<div id="navbar">
		<div class="header-top">
			<ul>
				<li><a href="index.do">首页</a></li>
				<li><a href="showAllBooks.do?page=1">读书</a></li>
				<li><a href="showAllFilms.do?page=1">电影</a></li>
				<li><a href="showAllMusics.do?page=1">音乐</a></li>
				<li><a href="showAllActivities.do?page=1">户外活动</a></li>
				<li><a href="userInfo.do">${user.unickname }</a></li>
				<li><a href="logout.do">注销</a></li>
			</ul>
		</div>
		<div class="header-bottom">
			<div class="header-title" >
				<p><a href="#" target="_blank" style="color: #2277AA;">仲豆电影</a></p>
			</div>
			<span class="movie-intro">在仲豆电影中，共为您展示<span class="movie-num">&nbsp;<span id="count">${count }</span>&nbsp;</span>部电影，您可以按照兴趣选择查看与收藏电影。</span>
		</div>
	</div>
	<div id="main">
		<div class="movie-content">
			<c:forEach items="${allFilms }" var="film">
				<table border="0" cellspacing="" cellpadding="" class="table-movie">
					<tr>
						<td rowspan="5" colspan="2" class="table-pic"><a href="infoFilm.do?fid=${film.fid }" target="_blank"><img  src="filmpics/${film.fpicaddr }"/></a></td>
						<td class="table-normal"><a href="infoFilm.do?fid=${film.fid }" class="movie-name">${film.fname }</a></td>
					</tr>
					<tr>
						<td class="table-normal">导演：${film.fauthor }</td>
					</tr>
					<tr>
						<td class="table-normal">主要演员：${film.factor }</td>
					</tr>
					<tr>
						<td class="table-normal">评分：<fmt:formatNumber value="${film.avgstar }" pattern=".0"/></td>
					</tr>
					<tr>
						<td class="table-intro"><p>简介：${film.fintroduction }</p></td>
					</tr>
				</table>
			</c:forEach>
			
			<div class="page">
				<button type="button" id="lastpage">
					上一页
				</button>
				<button type="button" id="nextpage">
					下一页
				</button>
				第 <input style="width: 30px;margin-left: 0%;padding:0 5px;display: inline-block;"
					type="text" id="page" value="${page }" />/ <span id="totalpage"></span>页
				<button type="button" id="jumppage">
					跳转
				</button>
			</div>
		</div>
		<div class="new-movie-good">
			<p>精品电影：</p>
			<ul>
				<c:forEach items="${creamFilms }" var="film" varStatus="s">
					<li>${s.count }.&nbsp;<a href="infoFilm.do?fid=${film.fid }" class="more-moviename">${film.fname}</a></li><hr />
				</c:forEach>
			</ul>
		</div>
		
	</div>
</body>
</html>

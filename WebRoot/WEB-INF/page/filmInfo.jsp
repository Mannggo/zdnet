<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  		<meta charset="UTF-8" />
	<title>电影信息-${filmItem.fname}</title>
	<link rel="stylesheet" type="text/css" href="css/page_generic.css"/>
	<link rel="stylesheet" type="text/css" href="css/star.css"/>
	<link rel="stylesheet" type="text/css" href="css/Info.css"/>
	<script type="text/javascript">
	window.onload=(function onit1(){	//载入电影等的评分星级
			var v = document.getElementById("score").innerHTML;
			var wid = v*12;
			document.getElementById("over").style.width=wid+"px";
	})
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
			<div class="header-title">
				<p><a href="#" target="_blank" style="color: #2277AA;">仲豆电影</a></p>
			</div>
			<span class="intro">在仲豆电影中，共为您展示<span class="book-num">&nbsp;200&nbsp;</span>部电影，您可以按照兴趣选择查看与收藏电影。</span>
		</div>
	</div>
	<div id="main">
		<div class="title">
			<h1><span>${filmItem.fname}</span></h1>
		</div>
		<div class="table-left">
			<table class="basic" border="0" cellspacing="" cellpadding="">
			<tr>
				<td colspan="2" rowspan="4" class="pic"><img src="filmpics/${filmItem.fpicaddr }"/></td>
				<td class="basic-info">导演：${filmItem.fauthor }</td>
			</tr>
			<tr>
				<td class="basic-info">主要演员：${filmItem.factor }</td>
			</tr>
			<tr>
				<td class="basic-info">上映日期：${filmItem.frunDate.year+1900 }年${filmItem.frunDate.month+1}月${filmItem.frunDate.date }日</td>
			</tr>
			<tr>
				 <c:if test="${iscollection }">
			    	<td class="basic-info">已收藏</td>
			    </c:if>
			    <c:if test="${!iscollection }">
			    	<td class="basic-info"><a href="collectFilm.do?fid=${filmItem.fid }">加入收藏</a></td>
			    </c:if>
			</tr>
		</table>
		</div>
		<div class="table-right">
			<table border="0" cellspacing="" cellpadding="">
				<tr>
					<td>仲豆评分：</td>
				</tr>
				<tr>
					<td rowspan="2"><span class="score-display"><fmt:formatNumber value="${filmItem.avgstar }" pattern=".0"/></span></td>
					<td>
						<div id="bg" class="bg" style="margin-left: 0px;">
							<span id="score" class="score"><fmt:formatNumber value="${filmItem.avgstar }" pattern=".0"/></span>
							<div id="over" class="over"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="people">共有<span class="people-num">${filmItem.count }</span>人为本电影评价</td>
				</tr>		
			</table>
		</div>
		<div id="intro">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简介：${filmItem.fintroduction }</p>
		</div>
		<div id="comment-area">
			 <c:forEach items="${comment}" var="comment" varStatus="status">
				<div class="comment">
    				<img src="userpics/${comment.upicaddr }" class="img"/>
    				&nbsp;&nbsp;${comment.unickname }(${comment.fcstar }分)：<span class="grey" >${comment.fccontent }。</span>
				</div>
    		</c:forEach>
			
		</div>
		
	</div>
	<form id="addcomment" action="addFilmComment.do">
		<input type="text" name="fid" id="bid" value="${filmItem.fid }" class="bid"/>
		<textarea rows="5" cols="50" name="fccontent" placeholder="输入你的评论"></textarea><br>
		
		<div class="addscore">
			<span>评分：</span>
			<input type="radio" name="fcstar" value="1">1
			<input type="radio" name="fcstar" value="2">2
			<input type="radio" name="fcstar" value="3" checked>3
			<input type="radio" name="fcstar" value="4">4
			<input type="radio" name="fcstar" value="5">5
			<br />
		</div>
		<input type="submit" value="提交评论" class="submit">
    	
	</form>
  </body>
</html>

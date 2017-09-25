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
	<title>书籍信息-${bookItem.bname}</title>
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
				<p><a href="#" target="_blank">仲豆读书</a></p>
			</div>
			<span class="intro">在仲豆读书中，共为您展示<span class="book-num">&nbsp;200&nbsp;</span>本书，您可以按照兴趣选择查看与收藏书籍。</span>
		</div>
	</div>
	<div id="main">
		<div class="title">
			<h1><span>${bookItem.bname}</span></h1>
		</div>
		<div class="table-left">
			<table class="basic" border="0" cellspacing="" cellpadding="">
			<tr>
				<td colspan="2" rowspan="4" class="pic"><img src="bookpics/${bookItem.bpicaddr }"/></td>
				<td class="basic-info">作者：${bookItem.bauthor }</td>
			</tr>
			<tr>
				<td class="basic-info">出版社：${bookItem.bpublisher }</td>
			</tr>
			<tr>
				<td class="basic-info">出版日期：${bookItem.bpublishDate.year+1900 }年${bookItem.bpublishDate.month+1}月${bookItem.bpublishDate.date }日</td>
			</tr>
			<tr>
				<c:if test="${iscollection }">
			    	<td class="basic-info">已收藏</td>
			    </c:if>
			    <c:if test="${!iscollection }">
			    	<td class="basic-info"><a href="collectBook.do?bid=${bookItem.bid }">加入收藏</a></td>
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
					<td rowspan="2"><span class="score-display"><fmt:formatNumber value="${bookItem.avgstar }" pattern=".0"/></span></td>
					<td>
						<div id="bg" class="bg" style="margin-left: 0px;">
							<span id="score" class="score"><fmt:formatNumber value="${bookItem.avgstar }" pattern=".0"/></span>
							<div id="over" class="over"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="people">共有<span class="people-num">${bookItem.count }</span>人为本书评价</td>
				</tr>		
			</table>
		</div>
		<div id="intro">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简介：${bookItem.bintroduction }</p>
		</div>
		<div id="comment-area">
                               <!-- 评论区-->
            <c:forEach items="${comment}" var="comment" varStatus="status">
				<div class="comment">
					<img src="userpics/${comment.upicaddr }" class="img"/>
    				&nbsp;&nbsp;${comment.unickname }(${comment.bcstar }分)：<span class="grey" >${comment.bccontent }。</span>
				</div>
    		</c:forEach>
			
		</div>
		
	</div>
	<form id="addcomment" action="addBookComment.do">
		<input type="text" name="bid" id="bid" value="${bookItem.bid }" class="bid"/>
		<textarea rows="5" cols="50" name="bccontent" placeholder="输入你的评论"></textarea><br>
		
		<div class="addscore">
			<span>评分：</span>
			<input type="radio" name="bcstar" value="1">1
			<input type="radio" name="bcstar" value="2">2
			<input type="radio" name="bcstar" value="3" checked>3
			<input type="radio" name="bcstar" value="4">4
			<input type="radio" name="bcstar" value="5">5
			<br />
		</div>
		<input type="submit" value="提交评论" class="submit">
    	
	</form>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	
  </head>
  
  <body>
  	<div>
	  	<a href="index.do">首页</a>
		<a href="showAllBooks.do?page=1">读书</a>
		<a href="showAllFilms.do?page=1">电影</a>
		<a href="showAllMusics.do?page=1">音乐</a>
		<a href="showAllActivities.do?page=1">课外活动</a>
		<a href="userInfo.do">${user.unickname }</a>
		<a href="logout.do">注销</a>
	</div>
	查询结果：<hr>
 	<div id="collectionInfo">
	    1.图书<br>
	    <c:forEach items="${queryBooks }" var="book">
	    	<div>
	    		${book.bname }--><a href="infoBook.do?bid=${book.bid }">详情</a>
	    	</div>
	    </c:forEach>
	    2.电影<br>
	    <c:forEach items="${queryFilms }" var="film">
	    	<div>
	    		${film.fname }--><a href="infoFilm.do?fid=${film.fid }">详情</a>
	    	</div>
	    </c:forEach>
	    3.音乐<br>
	    <c:forEach items="${queryMusics }" var="music">
	    	<div>
	    		${music.mname }--><a href="infoMusic.do?mid=${music.mid }">详情</a>
	    	</div>
	    </c:forEach>
	    
 	</div>
 	
 	
  </body>
  
</html>

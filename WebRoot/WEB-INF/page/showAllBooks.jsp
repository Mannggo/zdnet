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
<title>仲豆-书籍列表</title>
<link rel="stylesheet" type="text/css" href="css/showAllBook.css" />
<link rel="stylesheet" type="text/css" href="css/page_generic.css" />
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
					location.replace("showAllBooks.do?page="
							+ (parseInt($("#page").val()) + 1));
				});
		$("#lastpage").click(
				function() {
					location.replace("showAllBooks.do?page="
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
					location.replace("showAllBooks.do?page="
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
			<div class="header-title">
				<p><a href="#" target="_blank">仲豆读书</a></p>
			</div>
			<span class="book-intro">在仲豆读书中，共为您展示<span class="book-num">&nbsp;<span id="count">${count }</span>&nbsp;</span>本书，您可以按照兴趣选择查看与收藏书籍。</span>
		</div>
	</div>
	<div id="main">
		<div class="book-content">
			<c:forEach items="${allBooks }" var="book">
				<table border="0" cellspacing="" cellpadding="" class="table-book">
					<tr>
						<td rowspan="5" colspan="2" class="table-pic"><a href="infoBook.do?bid=${book.bid }" target="_blank"><img src="bookpics/${book.bpicaddr }"/></a></td>
						<td class="table-normal"><a href="infoBook.do?bid=${book.bid }" class="book-name">${book.bname }</a></td>
					</tr>
					<tr>
						<td class="table-normal">作者：${book.bauthor }</td>
					</tr>
					<tr>
						<td class="table-normal">出版社：${book.bpublisher }</td>
					</tr>
					<tr>
						<td class="table-normal">评分：<fmt:formatNumber value="${book.avgstar }" pattern=".0"/></td>
					</tr>
					<tr>
						<td class="table-intro"><p>简介：${book.bintroduction }</p></td>
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
		<div class="new-book-good">
			<p>精品书籍：</p>
			<ul>
				<c:forEach items="${creamBooks }" var="book" varStatus="s">
					<li>${s.count }.&nbsp;<a href="infoBook.do?bid=${book.bid }" class="more-bookname">《${ book.bname}》</a></li><hr />
				</c:forEach>
				
			</ul>
		</div>
		
	</div>

</body>
</html>

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
	<title>仲豆-户外活动列表</title>
	<link rel="stylesheet" type="text/css" href="css/page_generic.css"/>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		#main{
			width: 80%;
			margin:20px 10%;
			border-left: 1px solid darkgray;
			border-right: 1px solid darkgray;
			border-bottom: 1px solid darkgray;
			height: 1050px;
		}
		.addAct{
			width: 80%;
			margin:20px 30px;
			border-bottom: 1px solid darkgray;
			background-color: white;
		}
		.addAct a{
			text-decoration: none;
			display: block;
			width: 80px;
			height: 20px;
			text-align: center;
			font-size: 16px;
			background-color: #2277AA;
			padding: 10px 0;
			color: white;
			border-radius: 5px;
		}
		.addAct a:hover{
			background-color: #3398d7;
		}
		.act-intro{
			width: 800px;
			font-size: 14px;
			color: #000000;
			font-weight: normal;
			display: inline-block;
			float: left;
			position: absolute;
			padding: 28px 30px 0 280px;
			font-family: "微软雅黑";
			opacity: 0.8;
		}
		.Act{
			font-size:10pt;
			width: 80%;
			height: 200px;
			margin: 20px 50px;
			background-color: #ffffff;
			border-bottom: 1px solid darkgray;
		}
		.actName{
			font-size: 18px;
			color:#ff3d64;
			font-weight:bolder;
			font-family: "微软雅黑";
			line-height:60px;
		}
		.Act a{
			text-decoration: none;
			color: #2277AA;
			font-size: 16px;
			font-family: "微软雅黑";
		}
		.Act a:hover{
			background-color: #2277AA;
			color: white;
		}
		.page{
			width: 220px;
			height: 50px;
			font-size: 14px;
			color: #000000;
			margin-left: 30px;
		}
	</style>
<script type="text/javascript">
	$(function() {
		$("#totalpage").html(Math.ceil(parseInt($("#count").html()) / 4));
		if (parseInt($("#page").val()) >= parseInt($("#count").html()) / 4) {
			$("#nextpage").attr("disabled", "disabled");
		}
		if (parseInt($("#page").val()) == 1) {
			$("#lastpage").attr("disabled", "disabled");
		}
		$("#nextpage").click(
				function() {
					location.replace("showAllActivities.do?page="
							+ (parseInt($("#page").val()) + 1));
				});
		$("#lastpage").click(
				function() {
					location.replace("showAllActivities.do?page="
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
					location.replace("showAllActivities.do?page="
							+ (parseInt($("#page").val())));
				});

	});
</script>
<style type="text/css">
	.item{
  		height:240px;
  		width:160px;
  	}

</style>
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
				<p><a href="#" target="_blank" style="color: #ff3d64;width: 500px;">仲豆活动</a></p>
			</div>
			<span class="act-intro">在仲豆活动中，总共有<span id="count">${count }</span>个活动信息。</span>
		</div>
	</div>
	<div id="main">
			<div class="addAct">
				<a href="insertAct.do">发起活动</a><br>
			</div>
			<c:forEach items="${allActs }" var="act">
				<div class="Act">
					<span class="actName">${act.aname }</span><br>
					活动日期：${act.aholdDate }<br>
					组织单位：${act.aunit }<br>
					活动地点：${act.aholdPlace }<br>
					活动人数限制：${act.apersonlimit }<br>
					<a href="infoAct.do?aid=${act.aid }"><br>
					活动详情
					</a><br>
				</div>
			</c:forEach>
			<div class="page">
				<button type="button" id="lastpage">
					上一页
				</button>
				<button type="button" id="nextpage">
					下一页
				</button>
				第
				<input
					style="width: 30px;margin-left: 0%;padding:0 5px;display: inline-block;"
					type="text" id="page" value="${page }" />/
				<span id="totalpage"></span>页
				<button type="button" id="jumppage">
					跳转
				</button>
			</div>
	</div>
</body>
</html>

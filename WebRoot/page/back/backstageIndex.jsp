<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A layout example with a side menu that hides on mobile, just like the Pure website.">
<title>后台管理主页</title>

<link rel="stylesheet" href="/zdnet/page/css/layouts/side-menu.css">
<link rel="stylesheet" type="text/css" href="/zdnet/page/css/pure-min.css" />
<!--<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>-->
<script src="/zdnet/page/bootstrap/js/bootstrap.min.js"></script>
<script src="/zdnet/page/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function fn(obj) {
		if (obj.id == "showAllFilms") {
			document.getElementById("iframe").src = "/zdnet/showAllFilms.action?page=1";
		} else if (obj.id == "insertFilm") {
			document.getElementById("iframe").src = "insertFilm.html"
		} else if (obj.id == "selectFilm") {
			document.getElementById("iframe").src = "selectFilm.jsp"
		}else if (obj.id == "showAllMusics") {
			document.getElementById("iframe").src = "/zdnet/showAllMusics.action?page=1";
		} else if (obj.id == "insertMusic") {
			document.getElementById("iframe").src = "insertMusic.html"
		} else if (obj.id == "selectMusic") {
			document.getElementById("iframe").src = "selectMusic.jsp"
		}else if (obj.id == "showAllBooks") {
			document.getElementById("iframe").src = "/zdnet/showAllBooks.action?page=1";
		} else if (obj.id == "insertBook") {
			document.getElementById("iframe").src = "insertBook.html"
		} else if (obj.id == "selectBook") {
			document.getElementById("iframe").src = "selectBook.jsp"
		}else if(obj.id == "showAllActivities"){
			document.getElementById("iframe").src = "/zdnet/showAllActivities.action?page=1";
		}else if(obj.id == "checkActivities"){
			document.getElementById("iframe").src = "/zdnet/checkActivities.action";
		}else if(obj.id == "setting"){
			document.getElementById("iframe").src = "/zdnet/showAllAdmins.action";
	
		}else if(obj.id == "logout"){
			location.replace("/zdnet/adminLogout.action");
		}
	}
</script>

<style type="text/css">
	.pure-menu-item {
		font-size: 14px;
	}
	
	.pure-menu-link {
		cursor: pointer;
	}
	
	iframe {
		margin-left: 80px;
		
	}
	
	.heading {
		width: 100%;
		height: 50px;
		background: #272727;
		margin-top: 0;
		/*position: relative;*/
	}
	
	.heading p {
		position: absolute;
		top: 6px;
		margin-left: 15px;
		color: darkgray;
		cursor: pointer;
		height:20px;
	}
	
	.menu-heading {
		width: 200px;
		height: 40px;
		background: #272727;
		font-size: 16px;
		display: inline-block;
		color:;
	}
	
	ul, li {
		display: block;
		list-style-type: none;
		cursor: pointer;
	}
	
	.pure-menu-list li {
		display: none;
		padding: 5px;
		background: #272727;
		color: white;
		list-style-type: none;
		height: 20px;
		font-size: 14px;
		padding-left: 30px;
	}
	
	li:hover {
		background-color: #5b5b5b;
		color: #e0e0e0;
	}
	
	b {
		display: inline;
	}
	
	.pure-menu-item a:hover {
		background: #3c3c3c;
	}
	
	#iframe {
		top: 0;
		bottom: 0;
		width: 93%;
		height: 92%;
		overflow: hidden;
		
	}
</style>
</head>
<body>
	<div class="heading">
		<a href=""><img src="/zdnet/page/img/header.svg"
			style="width: 50px;height: 50px;margin-left: 30px;" /></a>
		<p class="menu-heading">后台管理</p>
	</div>

	<div id="layout">

		<div id="menu">

			<div class="pure-menu">
				<ul class="pure-menu-list">
					<span class="pure-menu-item"><a class="pure-menu-link"
						style="color: #E0E0E0;">读书栏目</a></span>
					<li id="insertBook" onclick="fn(this)">添加图书</li>
					<li id="showAllBooks" onclick="fn(this)">显示所有图书</li>
					<li id="selectBook" onclick="fn(this)">查询图书</li>
				</ul> 
				<ul class="pure-menu-list">
					<span class="pure-menu-item"><a class="pure-menu-link"
						style="color: #E0E0E0;">音乐栏目</a></span>
					<li id="insertMusic" onclick="fn(this)">添加音乐</li>
					<li id="showAllMusics" onclick="fn(this)">显示所有音乐</li>
					<li id="selectMusic" onclick="fn(this)">查询音乐</li>
				</ul>
				<ul class="pure-menu-list">
					<span class="pure-menu-item"><a class="pure-menu-link"
						style="color: #E0E0E0;">电影栏目</a></span>
					<li id="insertFilm" onclick="fn(this)">添加电影</li>
					<li id="showAllFilms" onclick="fn(this)">显示所有电影</li>
					<li id="selectFilm" onclick="fn(this)">查询电影</li>
				</ul>
				<ul class="pure-menu-list">
					<span class="pure-menu-item"><a class="pure-menu-link"
						style="color: #E0E0E0;">户外活动</a></span>
					<li onclick="fn(this)" id="checkActivities">审核户外活动</li>
					<li onclick="fn(this)" id="showAllActivities">显示所有户外活动</li>
					
				</ul>
				<c:if test="${admin.aisroot == 1 }">
					<ul class="pure-menu-list">
							<span style="color: #E0E0E0;" class="pure-menu-item"><a
								class="pure-menu-link" id="setting" onclick="fn(this)">管理选项</a></span>
					</ul>
				</c:if>
				<span class="pure-menu-item"><a class="pure-menu-link" id="logout" onclick="fn(this)">注销</a></span>

			</div>
		</div>
		<iframe id="iframe" src="home.jsp" frameborder="0"> </iframe>
	</div>

	<!--<script src="js/ui.js"></script>-->
	<script type="text/javascript">
		$(function() {
			$('span').click(function() {
				if ($(this).siblings('li').hasClass('on')) {
					$(this).siblings('li').slideUp(250).removeClass('on');
					//                  $(this).children('b').text('+');  
				} else {
					$(this).siblings('li').slideDown(250).addClass('on');
					//                  $(this).children('b').text('=');  
				}
			});
		});
		$.ajax({
			type : "get",
			url : "",
			async : true
		});
	</script>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="UTF-8" />
	<title>活动信息</title>
	<script type="text/javascript" src="/zdnet/page/js/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/page_generic.css"/>
	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
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
		#main{
			width: 80%;
			height: 450px;
			margin: 20px 10%;
			border: 1px solid darkgray;
			border-top: none;
		}
		#main table{
			margin-left: 30px;
			font-size: 14px;
			color: #000000;
			font-family: "微软雅黑";
			word-wrap: break-word;
		}
		#main td:first-child{
			width: 140px;
			height: 30px;
		}
		#main td:last-child{
			width: 400px;
			height: 30px;
		}
		.aIntro{
			word-wrap: break-word;
		}
		#join{
			/*border: none;*/
			margin-top: 20px;
			margin-left: 30px;
			border: 1px solid #2277AA;
			width: 100px;
			height: 26px;
			background-color: #2277AA;
			color: white;
			cursor: pointer;
			font-family: "微软雅黑";
			font-size: 14px;
			border-radius: 3px;
		}
		#join:hover{
			background-color: #3398d7;
		}
	</style>
	<script type="text/javascript">
  		$(function(){
  			if($("#checkStatus").html() == "false"){
  				$("#join").attr("disabled","disabled");
  				$("#join").html("你已报过名");
  				$("#joina").attr("href","");
  			}
  			else if(parseInt($("#quota").html()) <=0){
  				$("#join").attr("disabled","disabled");
  				$("#join").html("已无名额");
  				$("#joina").attr("href","");
  			}
  			
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
				<p><a href="#" target="_blank" style="color: #ff3d64;width: 500px;">仲豆活动</a></p>
			</div>
			<span class="act-intro">在仲豆活动中，总共有<span id="count">${count }</span>个活动信息。</span>
		</div>
	</div>
	<div id="main">
		<table border="0" cellspacing="" cellpadding="">
			<tr>
				<td> 活动名：</td>
				<td>${actItem.aname}</td>
			</tr>
			<tr>
				<td>组织单位：</td>
				<td>${actItem.aunit }</td>
			</tr>
			<tr>
				<td>活动日期：</td>
				<td>${actItem.aholdDate }</td>
			</tr>
			<tr>
				<td>活动地点：</td>
				<td>${actItem.aholdPlace }</td>
			</tr>
			<tr>
				<td>活动人数：</td>
				<td><span id="personlimit">${actItem.apersonlimit }</span></td>
			</tr>
			<tr>
				<td>剩余名额：</td>
				<td><font color="green"><span id="quota">${actItem.apersonlimit-totalOfJoin }<span></font></td>
			</tr>
			<tr>
				<td>报名截止日期：</td>
				<td>${actItem.adeadline.year+1900 }年${actItem.adeadline.month+1}月${actItem.adeadline.date }日</td>
			</tr>
			<tr>
				<td>具体描述：</td>
				<td><p class="aIntro">${actItem.aintroduction }年号是中国封建王朝用来纪年的一种名号（亦可以作为表示年份）。</p></td>
			</tr>
		</table>
		<span id="checkStatus" style="display:none">${checkStatus }</span>
 		<a id="joina" href="joinAct.do?aid=${actItem.aid }"><button id="join">我要报名 </button></a>
	</div>
</body>
  </body>
</html>

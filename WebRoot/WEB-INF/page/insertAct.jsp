<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<meta charset="UTF-8" />
	<title>insertAct</title>
	<link rel="stylesheet" type="text/css" href="css/page_generic.css"/>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
		$(function(){
			$("#submit").click(function(){
			if(confirm("确定发起此活动？")){
				$.ajax({
					cache:true,
					type:"POST",
					url:"insertAct.do",
					data:$("#actForm").serialize(),
					success:function(data){
						$("#actForm").hide();
						$("#msg").show();
					}
				});
			
			}
		})	
		})
	</script>
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
			height: 400px;
			margin: 20px 10%;
			border: 1px solid darkgray;
			border-top: none;
		}
		.aintroduction{
			position: absolute;
			margin-top: 5px;
			
		}
		#actForm{
			margin: 20px 0 0 30px;
		}
		#actForm td{
			height: 30px;
		}
		#actForm td input{
			width: 150px;
			height: 25px;
			font-size: 14px;
			border-radius: 3px;
			border: 1px solid darkgray;
		}
		#actForm td input:hover{
			border: 1px solid gray;
		}
		#actForm td input:focus{
			box-shadow: 0px 0px 8px  gray;
		}
		#actForm textarea{
			margin-left: 115px;
			margin-top: 5px;
			border: 1px solid darkgray;
			border-radius: 5px;
		}
		#actForm textarea:hover{
			border: 1px solid gray;
		}
		#actForm textarea:focus{
			box-shadow: 0px 0px 8px  gray;
		}
		.insertAct{
			width: 80px;
			height: 30px;
			text-align: center;
			font-size: 12px;
			background-color: #2277AA;
			padding: 0px 0;
			color: white;
			border: 1px solid #2277AA;
			border-radius: 5px;
			cursor: pointer;
			margin:20px 0 0 115px;
		}
		.insertAct:hover{
			background-color: #3398d7;
		}
		#msg{
			display: none;
			font-size: 16px;
			color: #000000;
			font-family: "微软雅黑";
			margin-left: 50px;
		}
		#msg a{
			text-decoration: none;
			display: block;
			width: 100px;
			height: 20px;
			text-align: center;
			font-size: 14px;
			background-color: #2277AA;
			padding: 6px 0;
			color: white;
			border-radius: 5px;
			margin-top: 10px;
			margin-left: 50px;
		}
		#msg a:hover{
			background-color: #3398d7;
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
		<form action="insertAct.do" method="post" id="actForm">
			<table border="0" cellspacing="" cellpadding="">
				<tr>
					<td>活动名：</td>
					<td><input type="text" name="aname" value=""></td>
				</tr>
				<tr>
					<td>举办时间：</td>
					<td><input type="text" name="holdDate" value=""></td>
				</tr>
				<tr>
					<td>举办地点：</td>
					<td><input type="text" name="aholdplace" value=""></td>
				</tr>
				<tr>
					<td>举办单位：</td>
					<td><input type="text" name="aunit" value=""></td>
				</tr>
				<tr>
					<td>人数限制：</td>
					<td><input type="text" name="apersonlimit" value=""></td>
				</tr>
				<tr>
					<td>截止日期：</td>
					<td><input type="text" name="deadline" value=""></td>
				</tr>
				
			</table>
			<p class="aintroduction">详细介绍：</p>
			<textarea rows="4"  cols="40" name="aintroduction"></textarea><br />
			<input id="submit"type="button" value="发起活动" class="insertAct"/>
		</form>
		<span id="msg">活动已提交审核，一天内请注意邮箱查收审核信息。<br /><a href="showAllActivities.do?page=1">返回活动列表</a></span>
	</div>
  </body>
</html>

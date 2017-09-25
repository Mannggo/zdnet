<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <meta charset="UTF-8" />
	<title>仲豆-个人中心</title>
	<link rel="stylesheet" href="css/page_generic.css" />
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/userInfo.css"/>
	<script type="text/javascript">  
		var result=document.getElementById("result");  
		var file=document.getElementById("upic");  
  
		//判断浏览器是否支持FileReader接口  
		if(typeof FileReader == 'undefined'){  
		    result.InnerHTML="<p>你的浏览器不支持FileReader接口！</p>";  
		    //使选择控件不可操作  
		    file.setAttribute("disabled","disabled");  
		}  
  
		function readAsDataURL(){  
		    //检验是否为图像文件  
		    var file = document.getElementById("upic").files[0];  
		    if(!/image\/\w+/.test(file.type)){  
		//      alert("不是图片格式");  
		        return false;  
 		   }  
 		    var reader = new FileReader();  
 		   //将文件以Data URL形式读入页面  
 		    reader.readAsDataURL(file);  
		    reader.onload=function(e){  
		        var result=document.getElementById("result");  
		        //显示文件  
		        result.innerHTML='<img src="' + this.result +'" alt="" />';  
		    }  
		}
	</script>
	<script type="text/javascript">
  		$(function(){
  			$("#changeName").click(function(){
  				$("#newname").show();
  				$("#oldname").hide();
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
			<div class="header-titleU">
				<p><a href="#" target="_blank" style="color: #ff336e;">个人中心</a></p>
			</div>
		</div>
	</div>
	<div id="main">
		<div id="content">
			<img src="userpics/${user.upicaddr }" class="img"/>
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin: 120px 0 0 20px;background-color: #009797;border: none;">修改头像</button>
			<div class="myInfo">
				<p>我的信息</p>
				<div id="oldname">
					昵称：<span style="width: 130px;display:inline-block;border: none;">${user.unickname}</span>
					<button id="changeName" class="btn btn-primary" style="background-color: #009797;border: none;">修改</button><br />
					<span>e-mail：</span>${user.uemail} <br />
					<span>加入仲豆的时间：${user.uentereddate.year+1900 }年${user.uentereddate.month+1}月${user.uentereddate.date }日</span>
				</div>
				<form action="changeName.do" method="post" id="newname">
					<input type="text" name="newname" value="${user.unickname }" />
					<input type="submit" class="btn btn-primary" value="提交"/>
				</form>
			</div>
			<div id="collectionInfo">
				<p>我的收藏</p>
				<b >图书</b><br>
			    <c:forEach items="${myBooks }" var="book">
			    	<div>
			    		<span style="width:200px;float:left">《${book.bname }》</span>
			    		<a href="infoBook.do?bid=${book.bid }">详情</a>
			    	</div>
			    </c:forEach>
			    <b>电影</b><br>
			    <c:forEach items="${myFilms }" var="film">
			    	<div>
			    		<span style="width:200px;float:left">${film.fname }</span>
			    		<a href="infoFilm.do?fid=${film.fid }">详情</a>
			    	</div>
			    </c:forEach>
			    <b>音乐</b><br>
			    <c:forEach items="${myMusics }" var="music">
			    	<div>
			    		<span style="width:200px;float:left">${music.mname }</span>
			    		<a href="infoMusic.do?mid=${music.mid }">详情</a>
			    	</div>
			    </c:forEach>
			</div>
			<div id="joinActs">
				<p>我参与的活动</p>
				<c:forEach items="${joinActs }" var="act">
		    		<div>
		    			<span style="width:200px;float:left">${act.aname }</span>
		    			<a href="infoAct.do?aid=${act.aid }">详情</a>
		    		</div>
		    	
		    	</c:forEach>
			</div>
			<div id="myAct">
				<p>我发起的活动</p>
				<c:forEach items="${myActs}" var ="act">
					<div>
			    		<span style="width:200px;float:left">${act.aname }(
			    		<c:if test="${act.aispass==1 }">
			    			<font color="green">已通过审核</font>
			    		</c:if>
			    		<c:if test="${act.aispass==0 }">
			    			<font color="red">等待审核</font>
			    		</c:if>
			    		)</span><a href="infoAct.do?aid=${act.aid }">详情</a>
			    	</div>
		    	</c:forEach>
			</div>
		</div>
	</div>
	

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							修改头像
						</h4>
					</div>
					<form action="changePic.do" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<div id="result" name="result"><img src="" /></div> 
							<input type="file" name="upic" id="upic" onchange="readAsDataURL()">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="submit" class="btn btn-primary" style="background-color: #009797;border: none;">
								提交更改
							</button>
						</div>
					</form>
					
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
  </body>
  
</html>

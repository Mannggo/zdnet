<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<script type="text/javascript" src="page/js/jquery-3.2.1.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="/zdnet/page/bootstrap/css/bootstrap.min.css"/>
  	<link rel="stylesheet" type="text/css" href="/zdnet/page/css/info.css"/>
  	<script type="text/javascript" src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
  	<script type="text/javascript">
  		function go(to){
  			if(to == "selectFilm")
  				location.replace("/zdnet/page/back/selectFilm.jsp");
  			else
  				location.replace("/zdnet/showAllFilms.action?page=1");
  			
  		}
  		
//inputImg	
var result=document.getElementById("result");  
var file=document.getElementById("fpic");  
  
if(typeof FileReader == 'undefined'){  
    result.InnerHTML="<p>你的浏览器不支持FileReader接口！</p>";  
    file.setAttribute("disabled","disabled");  
}  
  
function readAsDataURL(){  
    var file = document.getElementById("fpic").files[0];  
    if(!/image\/\w+/.test(file.type)){   
        return false;  
    }  
    var reader = new FileReader();  
    reader.readAsDataURL(file);  
    reader.onload=function(e){  
        var result=document.getElementById("result");  
        result.innerHTML='<img src="' + this.result +'" alt="" />';  
    }  
} 
  	</script>
  	
  	<style type="text/css">
  		.form-group input{
  			display: inline-block;
			margin-left: 15%;
			width: 400px;
  		}
  		.geshi{
  			margin-left:15%;
  		}
  		.thumbnail img{
  			max-width:280px;
  			height:300px;
  		}
  	</style>
	</head>
  
  <body>
    <body>
    <div class="panel panel-primary" style="margin-top:20px;margin-right:10px;">
  	<div class="panel-heading">
  		电影详情-《${filmitem.fname }》
  	</div>
  	<div class="panel-body">
  		<div class="page-header">
  			<h1>《${filmitem.fname }》&nbsp; <small>${filmitem.fauthor }</small></h1>
		</div>
  			<img class="filmimg" src="/zdnet/filmpics/${filmitem.fpicaddr }">
			<div class="infomation">
				<span>编号：${filmitem.fid }</span>
				<span>
					<c:if test="${filmitem.fiscream ==1 }">
						<span class="label label-success">精品</span>&nbsp;<a href="/zdnet/cancelFilmCream.action?fid=${filmitem.fid }&pageprop=${pageprop }"> 取消精品</a>
					</c:if>&nbsp;
					<c:if test="${filmitem.fiscream ==0 }"><a href="/zdnet/setFilmCream.action?fid=${filmitem.fid }&pageprop=${pageprop }">设为精品</a></c:if>
				</span><br><br>
				<span>电影名：${filmitem.fname }</span><br><br>
				<span>导演：${filmitem.fauthor }</span><br><br>
				<span>主要演员：${filmitem.factor }</span><br><br>
				<span>上映日期：${filmitem.frunDate.year+1900 }年${filmitem.frunDate.month+1}月${filmitem.frunDate.date }日</span><br><br>
				<span>录入系统时间：${filmitem.fenteredDate.year+1900 }年${filmitem.fenteredDate.month+1 }月${filmitem.fenteredDate.date }日</span><br><br>
				<span>描述：${filmitem.fintroduction }</span>
			</div>
		
  	</div>
    <div class="panel-footer" align="right">
    	<p>
		  <a href="javascript:void(0)" class="btn btn-primary" data-toggle="modal" data-target="#Modal">修改</a>
		  <button type="button" onclick="go('${pageprop }');" class="btn btn-default">返回</button>
		</p>
    </div>
    </div>
<div class="modal fade" id="Modal">  
    <div class="modal-dialog" style="width: 60%;">  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">  
                    <span aria-hidden="true">×</span>  
                </button>  
                <h4 class="modal-title" id="myModalLabel">修改内容</h4>  
            </div>     
<form onsubmit="" action="/zdnet/updateFilm.action" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <span class="geshi">&nbsp;</span><label>电影编号：</label><br />
    <input type="text" class="form-control" name="fid" id="fid"
    	style="width: 400px;margin-left: 15%;display: inline-block;" value="${filmitem.fid }" disabled><span id="fnameEmp"></span>
    	<input type="text" class="form-control" name="fid" id="fid"
    	style="width: 400px;margin-left: 15%;display: none;" value="${filmitem.fid }" ><span id="fnameEmp"></span>
  </div>
    <div class="form-group">
    <span class="geshi">&nbsp;</span><label>电影：</label><br />
    <input type="text" class="form-control" name="fname" id="bname" onblur="checkFilmName()"
    	style="width: 400px;margin-left: 15%;display: inline-block;" value="${filmitem.fname }"><span id="fnameEmp"></span>
  </div>
  <div class="form-group">
    <span class="geshi">&nbsp;</span><label>上传电影封面：</label><br />
  	<input type="file" name="fpic" id="fpic" onchange="readAsDataURL(),checkFile()" onblur=""><span id="fileErr"></span>
		<div class="col" style="margin-left: 15%;margin-top: 20px;width:300px;text-align:center;">
			<a href="#" class="thumbnail" >
				<div id="result" name="result" ><img src="/zdnet/filmpics/${filmitem.fpicaddr }"/></div>
			</a>
		</div>
  </div>
  <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>作者：</label><br />
  	<input type="text" class="form-control" id="fauthor" name="bauthor"
    	onblur="checkFilmAuthor()" style="width: 400px;display: inline-block;" value="${filmitem.fauthor }"><span id="fauthorEmp"></span>
  </div>
    <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>主要演员：</label><br />
    <input type="text" class="form-control" id="factor" name="factor"
    	onblur="checkRunDate()" style="width: 400px;display: inline-block;" value="${filmitem.factor }"><span id="frundateEmp"></span>
  </div>
  <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>上映日期：</label><br />
    <input type="text" class="form-control" id="rundate" name="rundate"
    	onblur="checkRunDate()" style="width: 400px;display: inline-block;" value="${filmitem.frunDate.toLocaleString() }"><span id="frundateEmp"></span>
  </div>
  <div class="introdution">
  	<span class="geshi">&nbsp;</span><label for="">描述：</label><br />
  	<textarea id="bintroduction" name="fintroduction" rows="4" cols="" class="form-control" 
  	onblur="checkFilmIntrodution()" style="width:70%;margin-left: 15%;display: inline-block;" >${filmitem.fintroduction }</textarea>
  	<span id="fintrodutionEmp"></span>

  </div>
<!--
	到这里为止
-->
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
                <input type="submit" class="btn btn-primary" value="提交" ></input>  
            </div>  
        </div>  
    </div>  
</div>  	
</form>
  </body>
  </div>
</html>

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
  			if(to == "selectMusic")
  				location.replace("/zdnet/page/back/selectMusic.jsp");
  			else
  				location.replace("/zdnet/showAllMusics.action?page=1");
  			
  		}
  		
//inputImg	
var result=document.getElementById("result");  
var file=document.getElementById("mpic");  
  
if(typeof FileReader == 'undefined'){  
    result.InnerHTML="<p>你的浏览器不支持FileReader接口！</p>";  
    file.setAttribute("disabled","disabled");  
}  
  
function readAsDataURL(){  
    var file = document.getElementById("mpic").files[0];  
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
  		音乐-《${musicitem.mname }》
  	</div>
  	<div class="panel-body">
  		<div class="page-header">
  			<h1>《${musicitem.mname }》&nbsp; <small>${musicitem.msinger }</small></h1>
		</div>
  			<img class="musicimg" src="/zdnet/musicpics/${musicitem.mpicaddr }">
			<div class="infomation">
				<span>编号：${musicitem.mid }</span>
				<span>
					<c:if test="${musicitem.miscream ==1 }">
						<span class="label label-success">精品</span>&nbsp;<a href="/zdnet/cancelMusicCream.action?mid=${musicitem.mid }&pageprop=${pageprop }"> 取消精品</a>
					</c:if>&nbsp;
					<c:if test="${musicitem.miscream ==0 }"><a href="/zdnet/setMusicCream.action?mid=${musicitem.mid }&pageprop=${pageprop }">设为精品</a></c:if>
				</span><br><br>
				<span>歌曲名：${musicitem.mname }</span><br><br>
				<span>作词者：${musicitem.mauthor }</span><br><br>
				<span>演唱者：${musicitem.msinger }</span><br><br>
				<span>发行日期：${musicitem.mrunDate.year+1900 }年${musicitem.mrunDate.month+1}月${musicitem.mrunDate.date }日</span><br><br>
				<span>录入系统时间：${musicitem.menteredDate.year+1900 }年${musicitem.menteredDate.month+1 }月${musicitem.menteredDate.date }日</span><br><br>
				<span><audio style="width:600px"controls="controls"src="/zdnet/musicfiles/${musicitem.mfileaddr }">
					您的浏览器不支持播放。
				</audio></span>
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
<form onsubmit="" action="/zdnet/updateMusic.action" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <span class="geshi">&nbsp;</span><label>音乐编号：</label><br />
    <input type="text" class="form-control" name="mid" id="mid"
    	style="width: 400px;margin-left: 15%;display: inline-block;" value="${musicitem.mid }" disabled><span id="fnameEmp"></span>
    	<input type="text" class="form-control" name="mid" id="mid"
    	style="width: 400px;margin-left: 15%;display: none;" value="${musicitem.mid }" ><span id="fnameEmp"></span>
  </div>
    <div class="form-group">
    <span class="geshi">&nbsp;</span><label>音乐名：</label><br />
    <input type="text" class="form-control" name="mname" id="mname" onblur="checkMusicName()"
    	style="width: 400px;margin-left: 15%;display: inline-block;" value="${musicitem.mname }"><span id="fnameEmp"></span>
  </div>
  <div class="form-group">
    <span class="geshi">&nbsp;</span><label>上传音乐封面：</label><br />
  	<input type="file" name="mpic" id="mpic" onchange="readAsDataURL(),checkFile()" onblur=""><span id="fileErr"></span>
		<div class="col" style="margin-left: 15%;margin-top: 20px;width:300px;text-align:center;">
			<a href="#" class="thumbnail" >
				<div id="result" name="result" ><img src="/zdnet/musicpics/${musicitem.mpicaddr }"/></div>
			</a>
		</div>
  </div>
  <div class="form-group">
    		<span class="geshi">&nbsp;</span><label>上传音乐文件：</label><br />
  			<input type="file" name="mfile" id="mfile" value="" onchange="checkMusicFile()"
  			style="margin-left: 15%;margin-top: 20px;display: inline-block;"/>
  			<span id="mfileErr"></span>
  		</div>
  <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>作词：</label><br />
  	<input type="text" class="form-control" id="mauthor" name="mauthor"
    	onblur="checkFilmAuthor()" style="width: 400px;display: inline-block;" value="${musicitem.mauthor }"><span id="fauthorEmp"></span>
  </div>
    <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>演唱：</label><br />
    <input type="text" class="form-control" id="msinger" name="msinger"
    	onblur="checkRunDate()" style="width: 400px;display: inline-block;" value="${musicitem.msinger }"><span id="frundateEmp"></span>
  </div>
  <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>发行日期：</label><br />
    <input type="text" class="form-control" id="rundate" name="rundate"
    	onblur="checkRunDate()" style="width: 400px;display: inline-block;" value="${musicitem.mrunDate.toLocaleString() }"><span id="frundateEmp"></span>
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

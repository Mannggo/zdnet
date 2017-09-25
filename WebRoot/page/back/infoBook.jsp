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
  			if(to == "selectBook")
  				location.replace("/zdnet/page/back/selectBook.jsp");
  			else
  				location.replace("/zdnet/showAllBooks.action?page=1");
  			
  		}
  		
//inputImg	
var result=document.getElementById("result");  
var file=document.getElementById("bpic");  
  
if(typeof FileReader == 'undefined'){  
    result.InnerHTML="<p>你的浏览器不支持FileReader接口！</p>";  
    file.setAttribute("disabled","disabled");  
}  
  
function readAsDataURL(){  
    var file = document.getElementById("bpic").files[0];  
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
  		书目详情-《${bookitem.bname }》
  	</div>
  	<div class="panel-body">
  		<div class="page-header">
  			<h1>《${bookitem.bname }》&nbsp; <small>${bookitem.bauthor }</small></h1>
		</div>
  			<img class="bookimg" src="/zdnet/bookpics/${bookitem.bpicaddr }">
			<div class="infomation">
				<span>编号：${bookitem.bid }</span>
				<span>
					<c:if test="${bookitem.biscream ==1 }">
						<span class="label label-success">精品</span>&nbsp;<a href="/zdnet/cancelBookCream.action?bid=${bookitem.bid }&pageprop=${pageprop }"> 取消精品</a>
					</c:if>&nbsp;
					<c:if test="${bookitem.biscream ==0 }"><a href="/zdnet/setBookCream.action?bid=${bookitem.bid }&pageprop=${pageprop }">设为精品</a></c:if>
				</span><br><br>
				<span>书名：${bookitem.bname }</span><br><br>
				<span>作者：${bookitem.bauthor }</span><br><br>
				<span>出版社：${bookitem.bpublisher }</span><br><br>
				<span>出版日期：${bookitem.bpublishDate.year+1900 }年${bookitem.bpublishDate.month+1}月${bookitem.bpublishDate.date }日</span><br><br>
				<span>录入系统时间：${bookitem.benteredDate.year+1900 }年${bookitem.benteredDate.month+1 }月${bookitem.benteredDate.date }日</span><br><br>
				<span>描述：${bookitem.bintroduction }</span>
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
<form onsubmit="" action="/zdnet/updateBook.action" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <span class="geshi">&nbsp;</span><label>图书编号：</label><br />
    <input type="text" class="form-control" name="bid" id="bid"
    	style="width: 400px;margin-left: 15%;display: inline-block;" value="${bookitem.bid }" disabled><span id="fnameEmp">
    </span>
     <input type="text" class="form-control" name="bid" id="bid"
    	style="width: 400px;margin-left: 15%;display: none;" value="${bookitem.bid }"><span id="fnameEmp">
  	</div>
    <div class="form-group">
    <span class="geshi">&nbsp;</span><label>书名：</label><br />
    <input type="text" class="form-control" name="bname" id="bname" onblur="checkBookName()"
    	style="width: 400px;margin-left: 15%;display: inline-block;" value="${bookitem.bname }"><span id="fnameEmp"></span>
  </div>
  <div class="form-group">
    <span class="geshi">&nbsp;</span><label>上传图书封面：</label><br />
  	<input type="file" name="bpic" id="bpic" onchange="readAsDataURL(),checkFile()" onblur=""><span id="fileErr"></span>
		<div class="col" style="margin-left: 15%;margin-top: 20px;width:300px;text-align:center;">
			<a href="#" class="thumbnail" >
				<div id="result" name="result" ><img src="/zdnet/bookpics/${bookitem.bpicaddr }"/></div>
			</a>
		</div>
  </div>
  <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>作者：</label><br />
  	<input type="text" class="form-control" id="bauthor" name="bauthor"
    	onblur="checkFilmAuthor()" style="width: 400px;display: inline-block;" value="${bookitem.bauthor }"><span id="fauthorEmp"></span>
  </div>
    <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>出版社：</label><br />
    <input type="text" class="form-control" id="bpublisher" name="bpublisher"
    	onblur="checkRunDate()" style="width: 400px;display: inline-block;" value="${bookitem.bpublisher }"><span id="frundateEmp"></span>
  </div>
  <div class="form-group">
  	<span class="geshi">&nbsp;</span><label>出版日期：</label><br />
    <input type="text" class="form-control" id="bpublishdate" name="publishdate"
    	onblur="checkRunDate()" style="width: 400px;display: inline-block;" value="${bookitem.bpublishDate.toLocaleString() }"><span id="frundateEmp"></span>
  </div>
  <div class="introdution">
  	<span class="geshi">&nbsp;</span><label for="">描述：</label><br />
  	<textarea id="bintroduction" name="bintroduction" rows="4" cols="" class="form-control" 
  	onblur="checkFilmIntrodution()" style="width:70%;margin-left: 15%;display: inline-block;" >${bookitem.bintroduction }</textarea>
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

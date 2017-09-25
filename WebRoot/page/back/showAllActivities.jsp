<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'showAllActivities.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="/zdnet/page/bootstrap/css/bootstrap.min.css"/>
   	<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
   	<script type="text/javascript">
   		function ondelete(aid){
   			if(confirm("确定要删除该条目？")){
	   			location.replace("/zdnet/delActivity.action?aid="+aid);
   			
   			}
   		}
   		$(function(){
   			$("#totalpage").html(Math.ceil(parseInt($("#count").html())/20));
   			if(parseInt($("#page").val())>=parseInt($("#count").html())/20){
   					$("#nextpage").attr("disabled","disabled");
   			}
   			if(parseInt($("#page").val())==1){
   					$("#lastpage").attr("disabled","disabled");
   			}
   			$("#nextpage").click(function(){
   				
   				location.replace("showAllActivities.action?page="+(parseInt($("#page").val())+1));
   			});
   			$("#lastpage").click(function(){
   				location.replace("showAllActivities.action?page="+(parseInt($("#page").val())-1));
   			});
   			$("#jumppage").click(function(){
   				if(isNaN((parseInt($("#page").val()))) ||(parseInt($("#page").val()))<=0 || (parseInt($("#page").val())) >= (parseInt($("#count").html())/20)+1){
   					alert("页数不合法");
   					return;
   				}
   				location.replace("showAllActivities.action?page="+(parseInt($("#page").val())));
   			});
   			
   		});
   	</script>
	<style type="text/css">
		body{
			text-align:center;
			margin:0;
		}
		table{
			width:70%;
			table-layout: fixed;
		}
		
		td,th{
			max-width: 10%;
			font-size:10pt;
			text-align:center;
			white-space:nowrap;
			overflow:hidden;
			text-overflow: ellipsis;
		}
		a{
			height:30px;
		}
	</style>
  </head>
  
  <body>
  	
  	<div class="panel panel-primary" style="margin-top:20px;margin-right:10px;">
  	<div class="panel-heading">所有活动，总记录数:<span id="count">${count }</span></div>
  	<table class="table table-hover " >
  		<tr>
  			<th>编号</th>
  			<th>活动名称</th>
  			<th>发起者账户</th>
  			<th>人数限制</th>
  			<th>活动时间</th>
  			<th>活动地点</th>
  			<th>活动描述</th>
  			<th>审核情况</th>
  			<th>操作</th>
  		</tr>
	    <c:forEach items="${allActs }" var="act">
	    	<tr>
	  			<td>${act.aid }</td>
	  			<td>${act.aname }</td>
	  			<td>${act.uemail }</td>
	  			<td>${act.apersonlimit }</td>
	  			<td>${act.aholdDate.toLocaleString() }</td>
	  			<td>${act.aholdPlace }</td>
	  			<td style="width:40px">${act.aintroduction }</td>
	  			<td>${act.aispass == 1?'<font color="green">已通过</font>':'<font color="red">未审核</font>' }</td>
	  			<td>
	  				<a href="#" onclick="ondelete(${act.aid })"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>删除</a>
	  			</td>
  			</tr>
	    </c:forEach>
    </table>
    <br>
    <div  class="panel-footer">
    <button type="button" id="lastpage"  class="btn btn-default btn-lg"><span class="glyphicon glyphicon-chevron-left"></span></button>
    <button type="button" id="nextpage"  class="btn btn-default btn-lg"><span class="glyphicon glyphicon-chevron-right"></span></button>
        第<input class="form-control" style="width: 30px;margin-left: 0%;padding:0 5px;display: inline-block;" type="text" id="page"  value="${page }" />/<span id="totalpage"></span>页
    <button type="button"  id="jumppage"  class="btn btn-default btn-lg"><span class="glyphicon glyphicon-circle-arrow-right"></span></button>
    </div>
    </div>
  </body>
</html>

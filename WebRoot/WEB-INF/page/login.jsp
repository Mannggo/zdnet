<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>仲恺豆瓣-登录</title>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#sendidcode").click(function(){
        			if($("#uemail").val() == ""){
        				$("#sendidcode").attr("disabled","true");
        				$("#sendidcode").val("邮箱地址未填");
        				setTimeout(function(){
	        				$("#sendidcode").removeAttr("disabled");
        					$("#sendidcode").val("发送验证码");
        				},900);
        				return;
        			}
        			var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        			if(!myreg.test($("#uemail").val())){
        				$("#sendidcode").attr("disabled","true");
        				$("#sendidcode").val("邮箱格式错误");
        				setTimeout(function(){
	        				$("#sendidcode").removeAttr("disabled");
        					$("#sendidcode").val("发送验证码");
        				},900);
        				return;
        			}
                    $("#sendidcode").attr("value","正在发送");
                    $("#sendidcode").attr("disabled","true");
        			$.ajax({
                    url:"sendIdcode.do",
                    type:"POST",
                    data:"uemail="+$("#uemail").val(),
                    success:function(data){
                    	if(data=="sendsuccess"){
	                        $("#sendspan").hide();
	                        $("#registspan").show();
                    	}else if(data=="hasexist"){
	                        $("#sendidcode").attr("disabled","true");
        					$("#sendidcode").val("邮箱已被注册");
        					setTimeout(function(){
	        					$("#sendidcode").removeAttr("disabled");
        						$("#sendidcode").val("发送验证码");
        					},900);
	                        
                    	}
                    },
                    error:function(){
						alert("error");
                    }
                	});
        		});
        	$("#regist").click(function(){
                    $("#regist").attr("value","正在注册...");
                    $("#regist").attr("disabled","true");
        			$.ajax({
                    url:"regist.do",
                    type:"POST",
                    data:"idcode="+$("#idcode").val()+"&uemail="+$("#uemail").val()+"&upassword="+$("#upassword").val(),
                    success:function(data){
                    	if(data=="insertsuccess"){
	                        $("#registspan").html("<font color='green'>注册成功，三秒后回到登录页面</font>");
                    		setTimeout(function(){
	                        	location.replace("login.do");
        					},3000);
                    	}else if(data=="idcodeerror"){
	                        $("#regist").attr("disabled","true");
        					$("#regist").val("验证码错误");
        					setTimeout(function(){
	        					$("#regist").removeAttr("disabled");
        						$("#regist").val("注册");
        					},900);
	                        
                    	}
                    },
                    error:function(){
						alert("error");
                    }
                	});
        	});
		});
	</script>
	
		<style type="text/css">
		*{
			padding: 0;
			margin: 0;
		}
		body{
			background-color: #fafbfb;
			text-align: center;
		}
		#signin{
			display: inline-block;
			width: 80px;
			height: 30px;
			font-size: 18px;
			text-decoration: none;
			color: black;
			opacity: 0.7;
		}
		#signin:hover{
			opacity: 1.0;
		}
		#login{
			display: inline-block;
			width: 80px;
			height: 30px;
			font-size: 18px;
			text-decoration: none;
			color: black;
			opacity: 0.7;
		}
		#login:hover{
			opacity: 1.0;
		}
		.bottom{
			height: 3px;
			width: 40px;
			background-color:#428c6d ;
			position: absolute;
			margin-left: 172px;
		}
		#header{
			width: 300px;
			height: 40px;
			margin: 20px auto 0;
		}
		input[placeholder]{
			color: darkgray;
			padding-left: 10px;
		}
		.content{
			width: 400px;
			text-align: center;
			margin: 0 auto;
		}
		.content input{
			width: 280px;
			height: 45px;
			font-size: 16px;
			margin-top: 10px;
			border-radius: 5px;
			border: 0.5px solid darkgray;
		}
		#main{
			text-align: center;
			margin-top: 3%;
		}
		.more_header img{
			width: 30%;
			height: 20%;
		}
		form .btn_signin{
			width: 250px;
			height: 40px;
			background-color: #209e85;
			border: none;
			display: block;
			font-size: 14px;
			color: white;
			border-radius: 5px;
			margin: 20px auto;
		}
		form .btn_login{
			width: 250px;
			height: 40px;
			background-color: #209e85;
			border: none;
			display: block;
			margin: 20px auto;
			font-size: 14px;
			color: white;
			border-radius: 5px;
		}
		.tabs{
			width: 300px;
			height: 50px;
		}
		.tabs li{
			list-style-type: none;
			display: inline-block;
		}
		ul.tabs li.active{
			color: #428c6d;
			font-weight: bold;
		}
		p.friend{
			font-size: 18px;
			color: ;
		}
		.btn{
			cursor: pointer;
		}
		.btn:hover{
			background-color: #84c2b7;
		}
		.footer{
			background-color: black;
			opacity: 0.4;
			bottom: 0;
			position: absolute;
			height: 7%;
			width: 100%;
		}
		.footer h2{
			color: white;
			display: inline-block;
		}
		#canvas{
			display: block;
			width:100%;
			height:100%;
			position: absolute;
			z-index: -10;
		}
		.onfocus{
			box-shadow: 0px 0px 10px gray;
		}
		.onblur{
			box-shadow: none;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#login").click(function(){
//				$(".bottom").animate({marginLeft:'150px'},50);
				$(".bottom").animate({marginLeft:'172px'},80);
			});
		});
		$(document).ready(function(){
			$("#signin").click(function(){
//				$(".bottom").animate({marginLeft:'100px'},50);
				$(".bottom").animate({marginLeft:'88px'},80);
			});
		});
		
		$(document).ready(function(){
			$(".content").hide();
			$("ul.tabs li:last-child").addClass("active").show();
			$(".content:last-child").show();
			
			$("ul.tabs li").click(function(){
				$("ul.tabs li").removeClass("active");
				$(this).addClass("active");
				$(".content").hide();
				var activeTab = $(this).find("a").attr("href");
				$(activeTab).show();
				return false;
			});
		});
	</script>
<script type="text/javascript">
	function fo(event){
		document.getElementById(event).className="onfocus";
	}
	function bl(event){
		var e = document.getElementById(event).className="onblur";
	}
</script>
  </head>
  
  <body>
    <div id="main">
	<canvas id="canvas" ></canvas>
	<script src="js/Login.js"></script>
	<div class="more_header" style="text-align: center;">
		<img src="img/标题.gif"/>
		<p class="friend">加入仲恺豆瓣，你将收获快乐！</p>
	</div>
	<div id="header" style="text-align: center;">
		<ul class="tabs">
			<li><a id="signin" href="#tab1">注册</a></li>
			<li class="active"><a id="login" href="#tab2">登录</a></li>
			<div class="bottom"></div>
		</ul>
		
		
		
	</div>
	
	<div id="tab1" class="content">
		<form id="registForm">
			<span id="sendspan">
				<div class="input_email">
					<input type="text" name="uemail" id="uemail" value="" placeholder="邮箱" onfocus="fo(this.id)" onblur="bl(this.id)"/>
				</div>
				<div class="input_password" >
					<input type="password" name="upassword" id="upassword" value="" placeholder="密码" onfocus="fo(this.id)" onblur="bl(this.id)"/>
				</div>
				<input class="btn btn_signin" type="button" id="sendidcode" value="发送验证码" />
			</span>
	    	<span id="registspan" style="display:none">
				<div class="input_password">
					<input type="text" name="idcode" id="idcode" value="" placeholder="输入验证码" />
				</div>
	    		<input class="btn btn_signin" type="button" id="regist" value="注册">
			</span>
		</form>
	</div>
	
    
    
    
	<div id="tab2" class="content">
		<form action="login.do" method="post" id="loginForm">
			<div class="input_email">
				<input type="text" name="uemail" id="email2" value="" placeholder="邮箱" onfocus="fo(this.id)" onblur="bl(this.id)"/>
			</div>
			<div class="input_password">
				<input type="password" name="upassword" id="psw2" value="" placeholder="密码" onfocus="fo(this.id)" onblur="bl(this.id)"/>
			</div>
			<input class="btn btn_login" type="submit" value="登录" />
			<div align="center">
				<span style="color:red;font-size:10pt;" >${msg }</span>
			</div>
		</form>
		
    </form>
	</div>
	
	</div>
  </body>
</html>

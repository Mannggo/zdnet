$(function(){
            var win=$(".win");
            var links=$(".title a");
            var float=$(".float");
            var divs=$(".box div");
            var num1=0;  //当前内容的下标
            var num2=0;
            $(".test").css("display","block");
            win.hover(function(){
                $(".leftB,.rightB").css("display","block");
            },function(){
                $(".leftB,.rightB").css("display","none");
            });
            $(".leftB").click(function(){
                divs.finish();
                float.stop(true);
                var temp=num1;
                num1--;
                if(num1==-1){
                    num1=4;
                }
                divs.eq(num1).css("left",-1030).animate({left:0});
                divs.eq(temp).animate({left:1030});
                links.css("color","#009797");
                float.animate({left:links.eq(num1).position().left})
                links.eq(num1).css("color","#fff");
            });
            $(".rightB").click(function(){
                divs.finish();
                float.stop(true);
                var temp=num1;
                num1++;
                if(num1==5){
                    num1=0;
                }
                divs.eq(num1).css("left",1030).animate({left:0});
                divs.eq(temp).animate({left:-1030});
                links.css("color","#009797");
                float.animate({left:links.eq(num1).position().left})
                links.eq(num1).css("color","#fff");
            });
            links.hover(function(){
                //滑块操作
                divs.finish();
                float.stop(true);
                links.css("color","#009797");
                var that=$(this);
                var lefts=$(this).position().left;
                float.animate({left:lefts},function(){
                    that.css("color","#fff");
                })
                //滑块操作
                //内容变化
                var index=$(this).index(".title a");
                num2=index;
                if(num1==num2){
                    return;
                }else if(num1<num2){
                    divs.eq(num2).css("left",1030).animate({left:0});
                    divs.eq(num1).animate({left:-1030});
                }else if(num1>num2){
                    divs.eq(num2).css("left",-1030).animate({left:0});
                    divs.eq(num1).animate({left:1030});
                }
                num1=num2;
                num2="";
            });
        });
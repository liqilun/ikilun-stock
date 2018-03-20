<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>后台管理</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link type="text/css" rel="stylesheet" href="${staticPath}bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${staticPath}css/bootcss.css" />
<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
<script src="${staticPath}bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	@charset "utf-8";
/* reset */
*{list-style-type:none;}
:focus{outline:0;}
label{cursor:pointer;}
img{vertical-align:middle;}
abbr,acronym{border:0;font-variant:normal}
address,caption,cite,code,dfn,em,th,var,optgroup{font-style:normal;font-weight:normal}
a,img{border:0;}
a,a:visited{color:#5e5e5e; text-decoration:none;}
a:hover{color:#4183C4;text-decoration:underline;}
.clear{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0;}
.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
.clearfix{display:inline-table;}/* Hides from IE-mac \*/
*html .clearfix{height:1%;}
.clearfix{display:block;}/* End hide from IE-mac */
*+html .clearfix{min-height:1%;}
/* shortcut */
.shortcut{position:fixed;top:0;left:0;z-index:9999;width:100%;}
*html,*html body /* 修正IE6振动bug */{background-image:url(about:blank);background-attachment:fixed;}
*html .shortcut{position:absolute;top:expression(eval(document.documentElement.scrollTop));}
.shortcut{height:28px;line-height:28px;font-size:12px;background:#EEEEEE;text-transform:uppercase;box-shadow:1px 0px 2px rgba(0,0,0,0.2);border-bottom:1px solid #DDDDDD;}
.shortcut h1{font-size:14px;font-family:"微软雅黑","宋体";}
.shortcut a,.shortcut h1{padding:0px 10px;letter-spacing:1px;color:#333;text-shadow:0px 1px 1px #fff;display:block;float:left;}
.shortcut a:hover{background:#fff;}
.shortcut span.right{float:right;}
.shortcut span.right a{float:left;display:block;color:#ff6600;font-weight:800;}
.headeline{height:40px;overflow:hidden;}
.adv960x90{width:960px;height:90px;overflow:hidden;border:solid 1px #E6E6E6;margin:0 auto;}
.adv728x90{width:728px;height:90px;overflow:hidden;border:solid 1px #E6E6E6;margin:0 auto;}
	.Form li{font-size:21px;font-weight:300}
	.Form input[type=text],.Form input[type=password],.Form textarea{
		display:inline-block;padding:6px 12px;font-size:18px;font-weight:300;line-height:1.4;color:#221919;background:#fff;border:1px solid #a4a2a2;
		
		box-sizing:border-box;
		-moz-box-sizing:border-box;
		-ms-box-sizing:border-box;
		-webkit-box-sizing:border-box;
		
		border-radius:6px;
		-moz-border-radius:6px;
		-webkit-border-radius:6px;
		
		box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
		-moz-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
		-webkit-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
		
		-webkit-transition:all .08s ease-in-out;
		-moz-transition:all .08s ease-in-out;
	}
	.Form textarea{min-height:90px}
	.Form label{display:inline-block;line-height:1.4em;font-size:18px}
	.Form input[type=text]:focus,.Form input[type=password]:focus,.Form textarea:focus{
		border-color:#006499;
		box-shadow:0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
		-moz-box-shadow:0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
		-webkit-box-shadow:0 1px rgba(34, 25, 25, 0.15) inset, 0 1px rgba(255, 255, 255, 0.8), 0 0 14px rgba(82, 162, 235, 0.35);
	}
	.FancyForm li,.FancyForm li .input{position:relative}
	.FancyForm input[type=text],.FancyForm input[type=password],.FancyForm textarea{
		position:relative;z-index:3;display:block;width:100%;background:transparent;border:1px solid #a4a2a2;
		
		border-radius:6px;
		-moz-border-radius:6px;
		-webkit-border-radius:6px;
		
		box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
		-moz-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
		-webkit-box-shadow:inset 0 1px rgba(34,25,25,.15),0 1px rgba(255,255,255,.8);
		
		-webkit-transition:all .08s ease-in-out;
		-moz-transition:all .08s ease-in-out;
	}
	.FancyForm textarea{min-height:3.95em;line-height:1.3}
	.FancyForm label{
		position:absolute;z-index:2;top:7px;left:13px;display:block;color:#BCBCBC;cursor:text;
		
		-moz-user-select:none;
		-webkit-user-select:none;
		
		-moz-transition:all .16s ease-in-out;
		-webkit-transition:all .16s ease-in-out;
	}
	.FancyForm .fff{
		position:absolute;z-index:1;top:0;right:0;left:3px;bottom:0;background-color:#fff;
		
		border-radius:8px;
		-moz-border-radius:8px;
		-webkit-border-radius:8px;
	}
	.FancyForm input[type=text]:focus+label,.FancyForm input[type=password]:focus+label,.FancyForm textarea:focus+label{opacity:.5;filter:alpha(opacity="50");}
	.FancyForm .val label{left:-9999px;opacity:0!important;filter:alpha(opacity="0")!important;}
	/* Button base */
	.Button{
		position:relative;
		display:inline-block;
		padding:.45em .825em .45em;
		text-align:center;
		line-height:1em; 
		border:1px solid transparent;
		cursor:pointer; 
		 
		border-radius:.3em; 
		-moz-border-radius:.3em; 
		-webkit-border-radius:.3em; 
		
		-moz-transition-property:color, -moz-box-shadow, text-shadow; 
		-moz-transition-duration:.05s; 
		-moz-transition-timing-function:ease-in-out; 
		-webkit-transition-property:color, -webkit-box-shadow, text-shadow; 
		-webkit-transition-duration:.05s; 
		-webkit-transition-timing-function:ease-in-out; 
		
		box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35); 
		-moz-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35); 
		-webkit-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35);
	}
	
	.Button:hover {text-decoration:none;}
	.Button strong {position:relative; z-index:2;}
	
	.Button{
		display:block;border:1px solid;opacity:1;
		
		border-radius:.3em;
		-moz-border-radius:.3em;
		-webkit-border-radius:.3em;
		
		box-shadow:inset 0 1px rgba(255,255,255,0.35);
		-moz-box-shadow:inset 0 1px rgba(255,255,255,0.35);
		-webkit-box-shadow:inset 0 1px rgba(255,255,255,0.35);
		
		-moz-transition-property:opacity;
		-moz-transition-duration:0.5s;
		-moz-transition-timing-function:ease-in-out;
		-webkit-transition-property:opacity;
		-webkit-transition-duration:0.5s;
		-webkit-transition-timing-function:ease-in-out;
	}
	
	.Button:hover span{
		-moz-transition-property:opacity;
		-moz-transition-duration:0.05s;
		-moz-transition-timing-function:linear;
		-webkit-transition-property:opacity;
		-webkit-transition-duration:0.05s;
		-webkit-transition-timing-function:linear;
	}
	.Button:active span{
		-moz-transition:none;
		-webkit-transition:none;
	}
	
	/* Red Button */
	.RedButton{color:#fcf9f9; text-shadow:0 -1px rgba(34,25,25,0.5);}
	.RedButton:hover {color:#fff; text-shadow:0 -1px rgba(34,25,25,0.3);}
	.RedButton:active {color:#f2f0f0; text-shadow:0 -1px rgba(34,25,25,0.6);}
	
	.RedButton{
		border-color:#015E91;
		background-color:#3693D5;
		background:-moz-linear-gradient(center top , #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
		background:-o-linear-gradient(top left, #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
		background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#54B1EB), to(#47A0E0), color-stop(.5,#419FE1),color-stop(.5,#3683D5));
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#54B1EB', endColorstr='#3683D5');
	}
	
	.RedButton:hover{
		border-color:#0366AD;
		background-color:#3EA1D6;
		background:-moz-linear-gradient(center top, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
		background:-o-linear-gradient(top left, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
		background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#5EB4EA), to(#61A1EE), color-stop(.5,#59A5EB),color-stop(.5,#3691E6));
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5EB4EA', endColorstr='#3691E6');
	}
	
	.RedButton:active{
		border-color:#013B6A;
		background-color:#3089C8;
		background:-moz-linear-gradient(center top, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
		background:-o-linear-gradient(top left, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
		background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#4B9CDD), to(#4189D5), color-stop(.5,#3D8BD3),color-stop(.5,#3093C8));
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4B9CDD', endColorstr='#3093C8');
	}
	
	.RedButton.Button18:hover{
		box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
		-moz-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
		-webkit-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
	}
	.RedButton.Button18:active{
		box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
		-moz-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
		-webkit-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);	
	}
	/* login */
	.login .stext{padding:6px 12px;width:380px;border:1px solid #a4a2a2;}
	
	/* tag */
	.default-tag a,.default-tag a span,.plus-tag a,.plus-tag a em,.plus-tag-add a{background:url(${staticPath}images/tagbg.png) no-repeat;}
	.tagbtn a{color:#333333;display:block;float:left;height:22px;line-height:22px;overflow:hidden;margin:0 10px 10px 0;padding:0 10px 0 5px;white-space:nowrap;}
	/* default-tag */
	.default-tag{padding:16px 0 0 0;}
	.default-tag a{background-position:100% 0;}
	.default-tag a:hover{background-position:100% -22px;}
	.default-tag a span{padding:0 0 0 11px;background-position:0 -60px;}
	.default-tag a:hover span{background-position:0 -98px;}
	.default-tag a.selected{opacity:0.6;filter:alpha(opacity=60);}
	.default-tag a.selected:hover{background-position:100% 0;cursor:default;}
	.default-tag a.selected:hover span{background-position:0 -60px;}
	/* plus-tag */
	.plus-tag{padding:0 0 10px 0;}
	.plus-tag a{background-position:100% -22px;}
	.plus-tag a span{float:left;}
	.plus-tag a em{display:block;float:left;margin:5px 0 0 8px;width:13px;height:13px;overflow:hidden;background-position:-165px -100px;cursor:pointer;}
	.plus-tag a:hover em{background-position:-168px -64px;}
	/* plus-tag-add */
	.plus-tag-add li{height:56px;position:relative;}
	.plus-tag-add li .label{position:absolute;left:-110px;top:7px;display:block;}
	.plus-tag-add button{float:left;}
	.plus-tag-add a{float:left;margin:12px 0 0 20px;display:inline;font-size:18px;background-position:-289px -59px;padding:0 0 0 16px;}
	.plus-tag-add a.plus{background-position:-289px -96px;}
	.demo{width:450px;margin:40px auto;position:relative;}
</style>
</head>
<body>
<body><#assign isCoachNav='Y'/>
<#include "../nav.ftl">
<div class="container">
		<div id="customerList" class="tab-pane fade in active">
			<div class="col-md-12">
				<div class="modal-body">
					<div class="demo">
						<div class="plus-tag tagbtn clearfix" id="myTags" style="display: block;">
							<#list labelList as label>
								<a title="${label.name}" href="javascript:delLabel(${label.id});"><span>${label.name}</span><em></em></a>
							</#list>
						</div>
						<div class="plus-tag tagbtn clearfix" id="myTags"></div>
						<div class="plus-tag-add">
							<form id="" action="" class="login">
								<ul class="Form FancyForm">
									<li>
										<input id="label" name="label" type="text" class="stext" maxlength="8" style="width: 280px;" placeholder="输入标签"/>
									</li>
									<li>
										<button type="button" class="Button RedButton Button18" style="font-size:18px;" onclick="addLabel()">添加标签</button>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<script type="text/javascript">
function addLabel(){
	var reqUrl= '${gymUserPath}admin/coach/addLabel';
	jQuery.post(reqUrl, {'name':$('#label').val(),'coachId':'${coachId}'},function(result){
		if(result.success){
			window.location.reload();
		}else {
			alert('保存失败：'+result.msg);
		}
	});
}
function delLabel(id){
	var reqUrl= '${gymUserPath}admin/coach/delLabel';
	jQuery.post(reqUrl, {'id':id},function(result){
		window.location.reload();
	});
}
</script>
</body>
</html>
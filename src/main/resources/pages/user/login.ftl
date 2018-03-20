<html>
<head>
<title>鲸健身-管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="${staticPath}bootstrap/css/bootstrap.min.css" />
<style type="text/css">
	.Center-Container {  
	  position: relative;  
	}  
	.Absolute-Center {  
	  height: 70%;  
	  overflow: auto;  
	  margin: auto;  
	  position: absolute;  
	  top: 0; left: 0; bottom: 0; right: 0;  
	}
</style>
</head>
<body style="background-color: #f2f9fd;">
	<div class="container Absolute-Center">
		<div class="row text-left">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
				    	<span class="glyphicon glyphicon-th-large">&nbsp;</span>登录后台管理系统
				  	</div>
				  	<div class="panel-body">
				  		<form class="form-horizontal" role="form" id="dbform" action="#">
							<div class="form-group">
						   		<label for="loginname" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-8">
								   <input type="text" class="form-control" id="username" name="username" placeholder="请输入名字">
								</div>
							</div>
							<div class="form-group">
						   		<label for="password" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
								<div class="col-sm-8">
								   <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
								</div>
							</div>
							<div class="form-group">
						   		<label for="password" class="col-sm-2 control-label" onclick="">验&nbsp;证&nbsp;码</label>
								<div class="col-sm-8">
								    <input type="text" class="form-control" id="codeimg" name="codeimg" style="width: 120px;">
								    <img src="${userPath}captcha-image" id="captchaImage" onclick="getCaptchaImg()"/>
								</div>
							</div>
							<div class="form-group">
								 <div class="col-sm-offset-2 col-sm-2">
								   <button type="button" id="loginBtn" class="btn btn-info" onclick="login()"><span class="glyphicon glyphicon-user"></span>登录</button>
								</div>
						   </div>
						</form>
				  	</div>
				  	<div class="panel-footer text-right"><span class="glyphicon glyphicon-th-large"></span></div>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
</body>
<script src="${staticPath}jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript">
function login(){
	$('#loginBtn').attr("disabled",true); 
	jQuery.post("${userPath}loginValidate", $("#dbform").serializeArray(),function(result){
		if(result.success){
			document.location.href='${userPath}admin/main';
		}else {
			alert(result.msg);
			$('#loginBtn').attr("disabled",false); 
			$('#codeimg').val(''); 
			getCaptchaImg();
		}
	});
}
function getCaptchaImg(){
	$('#captchaImage').attr('src','${userPath}captcha-image?r='+Math.random());
}
</script>
</html>
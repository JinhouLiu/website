<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript"  src="./resources/plugin/jquery-1.11.3.min.js"></script>
<script type="text/javascript"  src="./resources/plugin/jqueryUI/jquery-ui.min.js"></script>
<link rel="stylesheet" href="./resources/plugin/jqueryUI/jquery-ui.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Jquery Ajax Demo</title>
<script type="text/javascript">

function madeAjaxCall(){
	$.ajax({
		type: "post",
		url: "http://localhost:8080/website/user/add.action",
		cache: false,				
		data:'userName=' + $("#userName").val() + "&userPwd=" + $("#userPwd").val() + "&userEmail=" + $("#userEmail").val(),
		success: function(response){
			$('#result').html("");
			var obj = JSON.parse(response);
			$('#result').html("UserName:- " + obj.userName +"</br>UserPwd:- " + obj.userPwd  + "</br>UserEmail:- " + obj.userEmail);
		},
		error: function(){						
			alert('Error while request..');
		}
	});
}

//检查账户名是否可用
function checkAccount(){
	var flag = true;
	var account = $("#account").val();	
	jQuery.ajax( {
        type : "post",
        url : "http://localhost:8080/website/user/checkAccount.action",
        dataType : "json",
        data: {"account":account},
        success : function(data) {        	
           if(data.count > 0){
        	   
        	   alert("this number  is  exist,please input again");  
        	   flag = false;        	  
           }
           
        },
        error: function(){						
			alert('Error while request..');
		}
      });
	return flag;
}

$(function(){           
    $('#kaptchaImage').click(function () {//生成验证码  
     $(this).hide().attr('src', '/website/captcha-image.action?' + Math.floor(Math.random()*100) ).fadeIn(); })      
          });


function checkSecurityCode(){
	var flag = true;
	var verifyCode=$("input[name=kaptcha]").val();
	
	jQuery.ajax( {
        type : "get",
        url : "http://localhost:8080/website/checkSecurityCode.action",
        dataType : "json",
        data: {"verifyCode":verifyCode},
        success : function(data) {        	
           
        }
      });
	return flag;
}
</script>
</head>
<body>
 <div>
	<form  id="userform" name="userForm" method="post">		
		    <tr>
				账户名:
				<td><input type="text" name="account" id="account"></td>
			</tr>
			<br/>		
			<tr>
				密码:
				<td><input type="text" name="password"  id="password" ></td>
			</tr>
			<br/>
				<tr>			 
        <label>验证码：        
       <input name="kaptcha" type="text" id="kaptcha" maxlength="4" class="chknumber_input" />               
       </label>  
        <img src="/website/captcha-image.action" width="55" height="20" id="kaptchaImage"  style="margin-bottom: -3px"/>			
	   </tr>
	     <br/>					
			<tr>
				<td colspan="2" align="center">
				        <input type="button" value="Ajax Submit" onclick="checkAccount();">
				</td>
			</tr>		
	</form>
</div>
</body>
</html>
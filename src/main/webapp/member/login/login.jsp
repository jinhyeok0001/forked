<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 화면</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@exampledev/new.css">
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>  
      body{
            font-family: 'Georgia', serif;
               background-image: url('/image/background.png');
               background-position: center;
               background-size:100% 100%;
               display: flex;
               height : 100vh;
               justify-content: center;
             align-items: center;
            }
      nav{
               background-color: #323232;
            
            }
       .footer {
            width: 100%;
            background-color: #323232;
            postion:fixed; 
            bottom:0; 
            height: 150px;            
        }
        .leftfooter{
           color : white;
           font-weight : bold;
           margin-top: 20px;
        }
        .rightfooter {
           display: flex;
           align-items: center;       
       }
         .footerbox {
           width: 1000px;
           height: 100%;
           margin: auto;
           display: flex;
           justify-content: space-between;
           align-items: center;    
       }

        .iconbox {
            display: flex;
            align-items: center;
        }

        .iconbox a {
            margin: 0 10px;
            font-size: 50px;
            color: white;
        }
       .coinbox {
           display: flex;
           align-items: center;
           margin-left: 20px;
       }
        .coinbox img {
            width: 120px;
            height: 100px;
            margin-left : 20px;
        }      


        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 60px;
            border-radius: 10px;
            text-align: center;
            justify-content: center;
            align-items: center;           
            max-width: 400px;
            width: 100%;            
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin:0 auto;
            position : absolute;
        }
        .container h1 {
            text-decoration: none !important; 
            color:white !important;            
        }
        
        a {
		    text-decoration: none !important;
		}
        .container input {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background: #333;
            color: white;
        }
        .container button {
            width: 80%;
            padding: 10px;
            background-color: #e50914;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        .container button:hover {
            background-color: #b20710;
        }
        .container a {
            color: #aaa;
            text-decoration: none;
            font-size: 12px;
            margin-top: 10px;
        }
        .container a:hover {
            text-decoration: underline;
        }
        .social-login {
            margin-top: 20px;
            margin-bottom: 10px;
        }
        .social-login a{
         width: 40px;
            margin: 0 10px;
        }        
        .social-login img {
            width: 40px;
            margin: 0 10px;
            cursor: pointer;
        }
        
         #error-message {
            color: red;
            display: none;
            margin: 10px 0;
        }       
    </style>
</head>
<body>

    <div class="container">
        <h1>Retro Stars 로그인</h1>
        <form id="login-form">
            <input type="text" name="id" id="id" placeholder="아이디" required>
            <input type="password" name="pw" id="password" placeholder="비밀번호" required>
            <span id="error-message">아이디 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.</span>
            <button type="submit">로그인</button>
        </form>
        <a href="/member/login/findId.jsp">아이디를 잊어버리셨나요?</a> |
        <a href="/member/login/findPw.jsp">비밀번호를 잊어버리셨나요?</a>
        <div class="social-login">
            <img src="/image/google_login.png" alt="Google">
            <a href="javaScript:kakaoLogin()"><img src="/image/kakao_login.png" alt="Kakao"></a>
            <img src="/image/naver_login.png" alt="Line">
        </div>
        <a href="/member/register/registerStart.jsp" class="register-link">계정이 없나요? 새로운 계정을 생성해주세요.</a>
    </div>

    

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
       function kakaoLogin() {
           Kakao.Auth.login({
               success: function (response) {
                   Kakao.API.request({
                       url: '/v2/user/me',
                       success: function (response) {
                    	   alert(JSON.stringify(response));
                    	   console.log(JSON.stringify(response));
                     sendUserInfoToServer(response);
                       },
                       fail: function (error) {
                           alert(JSON.stringify(error))
                       },
                   })
               },
               fail: function (error) {
                   alert(JSON.stringify(error))
               },
           })
       }
       
       function sendUserInfoToServer(userData){
    	  
    	  
          $.ajax({
             type:"post",
             url:"/kakaoLogin.member",
             data: {
                id:userData.id,
                name:userData.kakao_account.name,
                nickname: userData.properties.nickname,
                email:userData.kakao_account.email,
                birthYear:userData.kakao_account.birthyear,
                birthDay:userData.kakao_account.birthday,
                gender:userData.kakao_account.gender
             }             
          }).done(function(data){
               window.location.href = "/index.jsp";
          }).fail(function(jqXHR, textStatus, errorThrown) {
               console.error("카카오 로그인 중 오류 발생 :", textStatus, errorThrown);
               alert("로그인 중 오류가 발생했습니다. 다시 시도해 주세요.");
           });
          
       }
       
       $(document).ready(function () {
           $('#login-form').on('submit', function (event) {
               event.preventDefault(); 

               let userId = $('#id').val();
               let userPw = $('#password').val();

               $.ajax({
                   url: '/login.member',
                   type: 'POST',
                   dataType: 'json',
                   data: {
                       id: userId,
                       pw: userPw
                   }
               }).done(function (response) {
                   console.log(response); 
                   if (response.success) {
                       window.location.href = '/index.jsp';
                   } else {
                       $('#error-message').show().text(response.message);
                   }
               }).fail(function (jqXHR, textStatus, errorThrown) {
                   console.error('Error:', textStatus, errorThrown);
                   $('#error-message').show().text('로그인 중 오류가 발생했습니다. 다시 시도해 주세요.');
               });
           });

           Kakao.init('4b9bccad837f62946166c2a78ed8b481');
       });
                   
 
   </script>
</body>
</html>
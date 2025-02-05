<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
     <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css"
        integrity="sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">
<style>
		body{
            background-image: url('/image/background.png');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            color:white;
		}

    .thisboard {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        border-radius: 10px;
        background-color: #323232;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        
    }

    .detailtitle {
        display: grid;
        grid-template-columns: auto 1fr auto auto auto;
        gap: 10px;
        align-items: center;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        font-weight: bold;
        font-size: 18px;
        color: white;
    }

    .detailtitle > div {
        padding: 10px;
    }

    .detailcontent {
        padding: 20px;
        font-size: 16px;
        line-height: 1.6;
        border-bottom: 1px solid #ddd;
        color: white;
    }

    .detailbtn{
    	padding: 20px;
    	display:flex;
    	gap:10px;

    }
    #back{
    	background-color: #323232;
    	color: white;
    	border: 1px solid white;
    	border-radius: 10px;
    	font-weight: bold;
    }
    #back:hover{
    	background-color:white;
    	padding: 10px;
		border: none;
		color: #323232;
		
		
    }
    #delete,
    #edit,
    #complete,
    #cancel
    {
        padding: 10px;
		border: none;
		color: white;
		font-weight: bold;
		border-radius: 10px;
		background-color:#6c757d;
    }
          /* footer */
    .footer {
    	position: fixed;
    	bottom: 0;
        width: 100%;
        height: 120px;
        background-color: #323232;
    }

    .leftfooter {
        color: white;
        font-weight: bold;
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
        margin-left: 20px;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">ICON</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게임
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">game1</a></li>
                            <li><a class="dropdown-item" href="#">game2</a></li>
                            <li><a class="dropdown-item" href="#">game3</a></li>
                            <li><a class="dropdown-item" href="#">game4</a></li>
                            <li><a class="dropdown-item" href="#">game5</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <button class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            게시판
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="#">자유게시판</a></li>
                            <li><a class="dropdown-item" href="#">공략게시판</a></li>
                            <li><a class="dropdown-item" href="#">QA게시판</a></li>
                            <li><a class="dropdown-item" href="#">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="#">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">마이페이지</a>
                    </li>
                    <li calss="nav-item">
                        <a class="nav-link" href="/member/login/login.jsp">로그인</a>
                    </li>

                    <i class="fa-solid fa-user"></i>

                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-user"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="thisboard">
    	<div class="detailtitle">
    		<div>${dto.nBoardSeq }</div>
    		<div class="ntitle" contenteditable="false">${dto.nBoardTitle }</div>
    		<div>관리자</div>
    		<div><fmt:formatDate value="${dto.nBoardDate}" pattern="yyyy-MM-dd" /></div>
<%--     		<div>${dto.nBoardView }</div> --%>
    	</div>
    	<div class="detailcontent" contenteditable="false">
    		${dto.nBoardContent }
    	</div>
    	<div class="detailbtn">
			<input type="button" value="뒤로가기" id="back">
			<input type="button" value="삭제" id="delete" data-nboard-seq="${dto.nBoardSeq}">
			<input type="button" value="수정" id="edit">
    	    
    	    <form action="/update.nboard">
    			<input type="hidden" name="seq" value="${dto.nBoardSeq}">
    			<input type="hidden" name="title" id="hidden_title" value="${dto.nBoardTitle }">
    			<input type="hidden" name="post" id="hidden_post" value="${dto.nBoardContent }">
    			<input type="submit" id="complete" style="display:none" value="완료">
    			<input type="button" id="cancel" style="display:none" value="취소">
    		</form>
    	</div>

    </div>
    <script>
    	// 뒤로 가기 버튼 클릭 시
    	$("#back").on("click",function(){
    		location.href="/list.nboard";
    	});
    	
    	// 삭제 버튼 클릭 시
    	$("#delete").on("click",function(){
    		let nboardseq = $(this).data("nboard-seq");
    		
    		let result = confirm("정말 삭제하시겠습니까?");
    		
    		if(result) {
    			location.href = "/boardOut.nboard?nBoardSeq="+nboardseq;
    		}
    	});
    	
 	
    	let post = $(".detailcontent");
    	let title = $(".ntitle");
    	
    	// 수정 버튼 클릭 시
    	$("#edit").on("click",function(){
    
    		$("#edit").hide();
    		$("#complete").show();
    		$("#cancel").show();
    		$("#delete").hide();
    		
    		post.attr("contenteditable",true);
    		title.attr("contenteditable",true);
    		
    	});
    	// 완료 버튼 클릭 시
    	$("#complete").on("click",function(){
    		$("#hidden_title").val($(".ntitle").text().trim());
    		$("#hidden_post").val($(".detailcontent").text().trim());
    		$("#edit").show();
    		$("#complete").hide();
    		$("#cancel").hide();
    		
    	});
    	// 취소 버튼 클릭 시
    	$("#cancel").on("click",function(){
    		location.href="/detail.nboard?nBoardSeq=${dto.nBoardSeq}";
    	});
    	
    </script>
    
     <div class="footer">
        <div class="footerbox">
            <div class="leftfooter">
                <p>회사명: 팀별빛</p>
                <p>전화: 02-1234-5678</p>
                <p>이메일: info@example.com</p>
            </div>
            <div class="rightfooter">
                <div class="iconbox">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
                <div class="coinbox">
                    <img src="/image/coin.png" alt="">
                </div>
            </div>
        </div>
    </div>
</body>
</html>
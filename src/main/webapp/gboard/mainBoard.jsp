<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${game.gameTitle}- Steam</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
body {
	font-family: 'Georgia', serif;
	background-image: url('/image/background.png');
	background-position: center;
	background-size: 100% 100%;
	color: white;
	flex-direction: column;
	min-height: 100vh;
}

nav {
	background-color: #323232;
}

    .footer {
        height: 150px;
        margin-top: 160px;
        border-top: 1px solid #e0e2ec;
        background-color: #323232;
        display: flex;
        justify-content: center;
        align-items: center;
        position : relative;
        bottom : 0;
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
	margin-left: 20px;
}

.container {
	margin: 20px auto;
	width: 90%;
	flex-grow: 1;
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

.nav-menu {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 5px;
}

.bookmark-menu {
	display: flex;
	justify-content: center;
	gap: 10px;
	padding: 10px 0;
	margin-bottom: -30px;
	position: relative;
	top: -40px;
}

.bookmark-item {
	padding: 10px 20px;
	background-color: #b86ded;
	color: white;
	border: 1px solid #3a4b58;
	border-radius: 5px 5px 0 0;
	cursor: pointer;
	position: relative;
	display: flex;
	align-items: center;
	height: 50px;
}

.bookmark-item:hover, .bookmark-item.active {
	background-color: #6fa720;
	border-color: #6fa720;
}

.bookmark-item::before {
	content: '';
	width: 100%;
	height: 20px;
	background-color: #b86ded;
	position: absolute;
	bottom: -20px;
	left: 0;
	clip-path: polygon(50% 100%, 0 0, 100% 0);
}

.bookmark-item:hover::before, .bookmark-item.active::before {
	background-color: #6fa720;
}

.community-button {
	background-color: #2a475e;
	color: #c7d5e0;
	border: 1px solid #3a4b58;
	border-radius: 5px;
	padding: 5px 10px;
	text-decoration: none;
	height: 50px;
	display: flex;
	align-items: center;
}

.community-button:hover {
	background-color: #3a4b58;
}

.community-button .gameBtn {
	background-color: #6fa720;
}

#gameBtn {
	background-color: #6fa720;
}

.main-content {
	display: flex;
	gap: 20px;
}

.review-content {
	display: flex;
	gap: 20px;
	margin-top: 20px;
}

.media-section {
	flex: 9;
	background-color: #2a475e;
	padding: 20px;
	border: 1px solid #3a4b58;
	border-radius: 5px;
}

.description-section {
	flex: 1;
	background-color: #2a475e;
	padding: 20px;
	border: 1px solid #3a4b58;
	border-radius: 5px;
}

.media-container {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
	background-color: #000;
	margin-bottom: 20px;
}

.media-container iframe, .media-container img, .media-container video {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.media-thumbnails {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.media-thumbnails .thumbnail {
	width: 100px;
	height: 56px;
	cursor: pointer;
	border: 2px solid transparent;
	object-fit: cover;
}

.media-thumbnails .thumbnail.active {
	border-color: #007bff;
}

.buttons {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 20px;
}

.buttons button {
	width: 100px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/index.jsp">ICON</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown"
				aria-controls="navbarNavDarkDropdown" aria-expanded="false"
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
                            <li><a class="dropdown-item" href="/gboard/addGame.jsp">게임 업로드</a></li>
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
                            <li><a class="dropdown-item" href="/list.cboard">커뮤니티게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">자유게시판</a></li>
                            <li><a class="dropdown-item" href="/list.cboard">공략게시판</a></li>
                            <li><a class="dropdown-item" href="/list.qboard">QA게시판</a></li>
                            <li><a class="dropdown-item" href="/list.fboard">FAQ게시판</a></li>
                            <li><a class="dropdown-item" href="/list.nboard">공지게시판</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">랭킹</a>
                    </li>
                   

                </ul>
                <c:choose>
                   <c:when test="${not empty loginId}">
                   <ul class="navbar-nav ms-auto">
				        <li class="nav-item">
				           <a class="nav-link" href="/mypage.member">
				               <img src="${sessionScope.profileUrl}" class="rounded-circle" width="40" height="40" alt="Profile">
				           </a>
				       </li>                  
                      <li class="nav-item">
                           <a class="nav-link" href="/mypage.member">마이페이지</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="/logout.member">로그아웃</a>
                       </li>
                   </ul>                          
                   </c:when>
                   <c:otherwise>
                      <ul class="navbar-nav ms-auto">
                          <li class="nav-item">
                              <a class="nav-link" href="/member/login/login.jsp"><i class="fas fa-user"></i></a>
                          </li>
                      </ul>
                   </c:otherwise>
                </c:choose>


			</div>
		</div>
	</nav>
	<div class="container">
		<div class="nav-menu">
			<div class="bookmark-menu">
				<c:forEach var="gameItem" items="${listGame}">
					<div
						class="bookmark-item ${gameItem.gameSeq == game.gameSeq ? 'active' : ''}"
						data-game-seq="${gameItem.gameSeq}">${gameItem.gameTitle}</div>
				</c:forEach>
			</div>
			<a href="/list.cboard" class="community-button">커뮤니티 허브</a>
		</div>
		<div class="main-content">
			<div class="media-section">
				<div class="media-container" id="media-container">
					<c:choose>
						<c:when test="${not empty videoUrl}">
							<video src="/upload/${videoUrl}" controls autoplay muted loop></video>
						</c:when>
						<c:otherwise>
							<img src="/image/default_image.jpg" alt="Game Image"
								id="main-media">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="media-thumbnails">
					<c:forEach var="image" items="${images}">
						<img src="/upload/${image}" alt="Thumbnail" class="thumbnail"
							data-type="image" data-media="/upload/${image}">
					</c:forEach>
					<c:if test="${not empty videoUrl}">
						<video src="/upload/${videoUrl}" alt="Thumbnail Video"
							class="thumbnail" data-type="video"
							data-media="/upload/${videoUrl}"></video>
					</c:if>
				</div>
			</div>
			<div class="description-section">
				<div class="media-container">
					<img src="/upload/${images.get(1)}" alt="Game Description Image">
				</div>
				<p>${game.gameDesc}</p>
				<p>
					RELEASE DATE:
					<fmt:formatDate value="${game.releaseDate}" pattern="dd MMM, yyyy" />
				</p>
				<p>DEVELOPER: ${game.developer}</p>
				<div class="buttons">
					<button class="btn community-button" id="addGameBookmarkBtn">찜하기</button>
					<button class="btn community-button" id="testSome">팔로우</button>
					<button class="btn community-button gameBtn" id="gameBtn">게임하기</button>
				</div>
			</div>
		</div>
		<div class="review-content">
			<div class="media-section" id="mostLikedReviewSection">가장 평가가 많은 리뷰</div>
			<div class="description-section">
				<p>가장 최근에 게시된 리뷰</p>
				<p>RELEASE DATE: 14 June, 2024</p>
				<p>DEVELOPER: 팀 별빛</p>
				<p>PUBLISHER: 팀 별빛</p>
				<p>게임 장르: 무료 플레이, 픽셀 그래픽, RPG, 인디, 어드벤처</p>
				<div class="buttons">
					<button class="btn community-button">찜하기</button>
					<button class="btn community-button">팔로우</button>
					<button class="btn community-button gameBtn" id="gameBtn">게임하기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footerbox">
			<div class="leftfooter">
				<p>회사명: 팀별빛</p>
				<p>전화: 02-1234-5678</p>
				<p>이메일: info@example.com</p>
			</div>
			<div class="rightfooter">
				<div class="iconbox">
					<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a> <a href="#"><i
						class="fab fa-youtube"></i></a>
				</div>
				<div class="coinbox">
					<img src="/image/coin.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<script>
        $(document).ready(function() {
            $.ajax({
                url: "/mostLiked.review",
                method: "GET",
                dataType: "json",
                data: {
                	gameSeq: ${game.gameSeq}
                }
            }).done(function(data) {
            	console.log(data);
            	alert("ㅋ");
                let mostLikedReviewSection = $('#mostLikedReviewSection');
                let icon = '';

                if (data.reviewLike >= data.reviewDislike && data.reviewLike >= data.reviewFunny) {
                    icon = '<i class="fas fa-thumbs-up"></i>';
                } else if (data.reviewDislike > data.reviewLike && data.reviewDislike >= data.reviewFunny) {
                    icon = '<i class="fas fa-thumbs-down"></i>';
                } else {
                    icon = '<i class="fas fa-laugh"></i>';
                }

              
                mostLikedReviewSection.html(`
                    <div class="review-header">
                        <div class="review-user-info">
                            <img src="/path/to/profile.jpg" class="rounded-circle" width="40" height="40" alt="Profile">
                            <div>${data.userId}test</div>
                          
                            <div>Level 10</div>
                        </div>
                        <div class="review-icon">${icon}</div>
                    </div>
                    <div class="review-date">${data.reviewDate}2024.06.18</div>
                    <div class="review-content">${data.reviewContent}리뷰 테스트</div>
                    <div class="review-helpful">
                        리뷰가 도움이 되었나요?
                        <button class="btn btn-success" onclick="updateReviewLike(${data.reviewSeq}, 'like')"><i class="fas fa-thumbs-up"></i></button>
                        <button class="btn btn-danger" onclick="updateReviewLike(${data.reviewSeq}, 'dislike')"><i class="fas fa-thumbs-down"></i></button>
                        <button class="btn btn-warning" onclick="updateReviewLike(${data.reviewSeq}, 'funny')"><i class="fas fa-laugh"></i></button>
                    </div>
                `);
                
                
            });
            
            $(document).on('click', '.bookmark-item', function() {
                let gameSeq = $(this).data('game-seq');
                window.location.href = "/viewGame.gboard?gameSeq=" + gameSeq;
            });

            $(document).on('click', '.thumbnail', function() {
                $('.thumbnail.active').removeClass('active');
                $(this).addClass('active');

                let mediaContainer = $('#media-container');
                mediaContainer.empty();

                let mediaType = $(this).data('type');
                let mediaSrc = $(this).data('media');

                if (mediaType === 'image') {
                    let img = $('<img>').attr('src', mediaSrc).attr('alt', 'Game Image');
                    mediaContainer.append(img);
                } else if (mediaType === 'video') {
                    let video = $('<video>').attr('src', mediaSrc).attr('controls', true).attr('autoplay', true);
                    mediaContainer.append(video);
                }
            });

            $("#addGameBookmarkBtn").on("click", function() {
                $.ajax({
                    url: "/addGameBookmark.gboard",
                    method: "POST",
                    dataType: "json",
                    data: {
                        gameSeq: ${game.gameSeq}
                    }
                }).done(function(response) {
                    console.log(response);
                    alert("해당 게임 북마크.");
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("에러: " + textStatus, errorThrown);
                    alert("북마크 추가 중 오류가 발생했습니다.");
                });
            });

            $("#testSome").on("click", function(){
                alert("확인");
            });
        });
    </script>
</body>
</html>

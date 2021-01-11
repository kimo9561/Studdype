<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>

<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="./resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
<link rel="stylesheet" href="./resources/assets/css/animate.css">
<link rel="stylesheet" href="./resources/assets/css/normalize.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/assets/css/responsive.css">
<link rel="stylesheet"
	href="./resources/css/community/header&footer.css">
<link rel="stylesheet" href="./resources/css/community/leftnavi.css">
<link rel="stylesheet" href="./resources/css/community/mainsection.css">
<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
<script src="./resources/assets/js/popper.min.js"></script>
<script src="./resources/assets/js/bootstrap.min.js"></script>
<script src="./resources/assets/js/owl.carousel.min.js"></script>
<script src="./resources/assets/js/modal-video.js"></script>
<script src="./resources/assets/js/main.js"></script>

<style type="text/css">
.main-section {
	width:72%;
}

h3 {
	color:#6f42c1;
}

h2 {
	color:#6f42c1;
	position:relative;
	left:35%;
}

#main-section-top {
	display: block;
	position: relative;
	width: 100%;
	height:600px;
}

#register-section {
	display:inline-block;
}

#no-list {
	position:relative;
	width:20%;
	left:40%;
	margin-top:2%;
	opacity:0.8;
}

#no-list-comment {
	position:relative;
	width:50%;
	left:25%;
	margin-top:1%;
	text-align:center;
	font-weight:bolder;
	font-size:25px;
	opacity:0.8;
}

.book-info {
	position:relative;
	display:inline-block;
	width:15%;
	margin:1%;
	left:1.5%;
	border:5px solid #f9f9f0;
	border-radius:10px;
	cursor:pointer;
	background:#f6f5f0;
	box-shadow:9px 9px 16px rgba(189, 189, 189, 0.6), -9px -9px 16px rgba(255, 255, 255, 0.5);
}

.book-info-top {
	position:relative;
	display:inline-block;
	/* float:left; */
	width:98%;
	margin:1%;
	height:250px;
}

.book-info-top img {
	height:250px;
}

.book-info-bottom {
	position:relative;
	/* display:inline-block; */
	display:none;
	width:98%;
	margin:1%;
	border-top:1px solid black;
}

table {
	border-collapse: separate;
	border-spacing: 0 15px;
}

/* 화살표 css */
#left-allow {
	position:relative;
	float:left;
	width:3%;
	height:5px;
}

#right-allow {
	position:relative;
	float:right;
	width:3%;
	height:5px;
}

.allow {
	margin:8% 1% 0% 1%;
}

.allow img {
	cursor:pointer;
	opacity:0.7;
}

.thisBook {
	transition: 0.7s ease all;
	border:4px solid #6f42c1;
	opacity:0.7;
}

.append {
	position:relative;
	left:23%;
	width:30%;
	height:560px;
	opacity:1;
	z-index:2;
}

.append .book-info-bottom {
	display:inline-block;
}

.append img{
	height:400px;
}

.append .book-info-top {
	height:400px;
}

.append:hover {
	opacity:0.2;
}

#detailBook {
	display:inline-block;
	position:relative;
	float:left;
	top:40%;
	left:44%;
	width:10%;
	height:30px;
	text-align:center;
	font-weight:bolder;
	z-index:1;
	border:3px solid black;
	border-radius:10px;
}
/* ************************************************************ */
</style>
<script type="text/javascript">
	
	$(function() {	
		// 전달받은 도서 리스트 6번째부터 숨기기
		$(".book-info:gt(5)").hide();
		
		// 왼쪽 페이징 클릭 이벤트
		$("#left-allow").click(function() {
			$("#register-section .book-info:eq(5)").show();
			$("#register-section .book-info:first").insertAfter("#register-section .book-info:last");
			$("#register-section .book-info:gt(4)").hide();
		});
		
		// 오른쪽 페이징 클릭 이벤트
		$("#right-allow").click(function() {
			$("#register-section .book-info:last").show();
			$("#register-section .book-info:last").insertBefore("#register-section .book-info:first");
			$("#register-section .book-info:gt(4)").hide();
		});
		
		// 도서 리스트 중 해당 도서 클릭 이벤트
		$(".book-info").click(function() {
			$("#main-section-top").children().eq(1).remove();
			$(".thisBook").removeClass("thisBook");
			$(this).addClass("thisBook");
			var appendBook = $(this).clone();
			appendBook.appendTo("#main-section-top");
			appendBook.addClass("append");
			$(".append .book-info-bottom").css("display", "inline-block");
		});
		
		// 등록 여부 
		if($("#isMain").children().eq(1)) {
			$("#isMain").children().first().remove();
		}
		
		$(document).on("click", ".append",  function() {
			var b_no = $(".append").children().first().val();
			//alert(b_no+"난 append");
			location.href="bookDetailform.do?b_no"+b_no;
		});

	});
	
</script>
</head>
<body>
	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>

	
	<!-- 메인 섹션----------------------------------------------------------------------------- -->
	<div class="main-section">
	<h3>스터디 도서 검색</h3>
		<!--메인 상단 세션 --------------------------------------------------------------------- -->
		<div id="main-section-top">
			<div id="detailBook">
				<span>자세히 보기</span>
			</div>
			<c:choose>
				<c:when test="${empty list }">
					<div id="no-list">
						<img src="https://image.freepik.com/free-vector/red-prohibited-sign_1284-42862.jpg">
					</div>
					<div id="no-list-comment">
						<p>등록된 도서가 없습니다.</p>
					</div>
				</c:when>
			</c:choose>
			<div id="isMain">
				<h2>스터디 대표도서가 없습니다.</h2>
				<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
					<c:if test="${list.get(i).getBook_ismain() eq 'Y' }">
						<div class="book-info thisBook append">
							<input type="hidden" name="b_no" value="${list.get(i).getB_no() }">
							<div class="book-info-top">
								<c:choose>
									<c:when test="${list.get(i).getBook_img() eq 'noImage'}">
										<img src="./resources/assets/img/icon_photoUpload.png">
									</c:when>
									<c:otherwise>
										<img src="${list.get(i).getBook_img() }" />
									</c:otherwise>
								</c:choose>
							</div>
							<div class="book-info-bottom">
								<table>
									<tr>
										<th>제목&nbsp;</th>
										<th>${list.get(i).getB_title() }</th>
									</tr>
									<tr>
										<th>작성자&nbsp;</th>
										<th>${writerMap.get(list.get(i).getB_writer()).getMem_id() }(${writerMap.get(list.get(i).getB_writer()).getMem_name() })</th>
										<th style="color:#6f42c1;">&nbsp;대표도서</th>
									</tr>
								</table>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!-- 메인 상단 영역 종료 ----------------------------------------------------------------------------------------- -->
		
		<!-- 리스트 영역 시작 ------------------------------------------------------------------------------------------------- -->
		<div id="register-section">
			<div class="allow" id="left-allow"><img src="./resources/img/left-allow.png"></div>
			<div class="allow" id="right-allow"><img src="./resources/img/right-allow.png"></div>
				<c:forEach var="i" begin="0" end="${list.size()-1 }" step="1">
					<div class="book-info">
						<input type="hidden" name="b_no" value="${list.get(i).getB_no() }">
						<div class="book-info-top">
							<c:choose>
								<c:when test="${list.get(i).getBook_img() eq 'noImage'}">
									<img src="./resources/assets/img/icon_photoUpload.png">
								</c:when>
								<c:otherwise>
									<img src="${list.get(i).getBook_img() }" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="book-info-bottom">
						<table>
							<tr>
								<th>제목&nbsp;</th>
								<th>${list.get(i).getB_title() }</th>
							</tr>
							<tr>
								<th>작성자&nbsp;</th>
								<th>${writerMap.get(list.get(i).getB_writer()).getMem_id() }(${writerMap.get(list.get(i).getB_writer()).getMem_name() })</th>
								<c:if test="${list.get(i).getBook_ismain() eq 'Y' }">
								<th style="color:#6f42c1;">&nbsp;대표도서</th>
								</c:if>
							</tr>
						</table>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 리스트 영역 종료 ------------------------------------------------------------------------------------------------- -->
	</div>
	<!-- 메인 섹션 종료 --------------------------------------------------------------------------------------------- -->

	<jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
</body>
</html>
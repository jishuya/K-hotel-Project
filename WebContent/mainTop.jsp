<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewpoint" content="width=device-width, initial-scale=1.0">
	<link href="css/mainTop.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
	<title>K-hotel</title>
	<!-- FontAwesome링크 -->
	<script src="https://kit.fontawesome.com/97581e0329.js" crossorigin="anonymous"></script>
	
	</head> 
	<body>
		<nav class="navbar">
			<div class="navbar_logo">
			<a href="#"><img src="images/main/logo3.png" width="100">	
</a>
			</div>
			<!-- 메뉴바 안에 메뉴들이 리스트화 되어있어서 아무의미 없는div보다 ul을 사용 -->
			<ul class="navbar_menu">
				<li><a href="#">About Us</a>
					<ul class="navbar_submenu">
						<li><a href="./aboutUs/khotel.html">K-Hotel</a></li>
						<% System.out.println("mainTop");%>
						<li><a href="./e_01.html">Location</a></li>
					</ul>
				</li>
				<li><a href="lifeStyle/outdoorPool.html">Rooms</a>
					<ul class="navbar_submenu">
						<li><a href="./rooms/gold.html">Gold</a></li>
						<li><a href="./rooms/silver.html">Silver</a></li>
						<li><a href="./rooms/bronze.html">Bronze</a></li>
					</ul>
				</li>
				<li><a href="lifeStyle/outdoorPool.html">Dining</a>
					<ul class="navbar_submenu">
						<li><a href="#">Restaurant</a></li>
						<li><a href="#">Lounge & Bar</a></li>
						<li><a href="#">Bakery</a></li>
					</ul>
				</li>
				<li><a href="lifeStyle/outdoorPool.html">Life Style</a>
					<ul class="navbar_submenu">
						<li><a href="#">Outdoor Pool</a></li>
						<li><a href="#">SPA</a></li>
						<li><a href="#">Fitness</a></li>
						<li><a href="#">Garden</a></li>
						<li><a href="#">Shopping</a></li>
					</ul>
				</li>
				<li><a href="reservation/reservation.html">Reservation</a>
					<ul class="navbar_submenu">
						<li><a href="./reservation/d_01.jsp">R/V Status</a></li>
						<li><a href="./reservation/d_02.jsp">Reservation</a></li>
						<li><a href="./admin/adm_allview.jsp">Administration</a></li>
						<li><a href="./admin/adm_logout.jsp">Logout</a></li>
					</ul>
				</li>	
				<li><a href="notice/notice.html">Notice</a>
					<ul class="navbar_submenu">
						<li><a href="./notice/pagination.jsp">Notice</a></li>
						<li><a href="./board/pagination.jsp">Review</a></li>
					</ul>
				</li>
			</ul>
			
	<!-- ==================== navbar_icons Area ============================ -->
			
			<ul class="navbar_icons">
				<li><i class="fab fa-facebook-square"></i></li>
				<li><i class="fab fa-twitter-square"></i></li>
			</ul>
			
			<a href="#" class="navbar_toogleBtn">
				<i class="fas fa-bars"></i>
			</a>
		</nav>
		<script type="text/javascript" src="js/mainTop.js"></script>
	</body>
</html>
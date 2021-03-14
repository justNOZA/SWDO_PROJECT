<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/signupSignin.js"></script>
<script type="text/javascript" src="resources/js/signin_up.js"></script>
<link href="resources/css/header.css" rel="stylesheet" />

<style type="text/css">
* {box-sizing: border-box;}
body {
	font-family: Verdana, sans-serif;
	height: 627.200;
	width: 1503.200;}

/* ---------------------------------검색리스트 css에욤------------------------------------------ */

/*디브 박스*/
.bookList{margin: 1px auto;}
/*테이블 영역*/
/*번호*/
.col1{width: 60px;} 
/*사진*/
.col2{width: 150px; height: 200px;}
/*제목*/
.row1col3{width: 600px; height: 40px;}
/*저자*/
.row1col4{width: 150px; height: 40px;}
/*가격*/
.row2col3{width: 600px; height: 40px;}
/*출판사*/
.row1col4{width: 150px; height: 40px;}
/*설명 */
.row3col3{width: 600px; height: 40px;} 
/*구분선*/
.line{border-bottom:3px; border-bottom-style:solid; border-bottom-color: #007fff;}
/*버튼*/
.buyButton{text-align: right; width: 200px;}
.presentButton{text-align: right;}
.cartButton{text-align: right;}
.imgtable {
	width: 150;
}

.cart-btn {
  line-height: 18px;
  padding: 10px 22px;
}

.btn-default {
  background: #007fff none repeat scroll 0 0;
  border: 1px solid #007fff;
  border-radius: 20px;
  color: #ffffff;
  height: 40px;
  padding: 0 22px;
  transition: all 0.3s ease 0s;
  font-size: 16px;
  font-weight: 500;
  text-transform: uppercase;
  padding-bottom: 11px;
  padding-top: 11px;
  text-decoration: none;
}
.btn-default:hover {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: 1px solid #007fff;
  color: #007fff;
}
.row1col3 a {
	color: #333;
	transition: all 0.3s ease 0s;
	text-decoration: none;
}
.row1col3 a:hover {
	color: #007fff;
}

.bookList{
  position: relative;
  margin: auto;
  top:200;
  z-index: 1;
}
.bookinfo {
	width: 1000px;
}
.ebookinfo {
	background-color: #f2f7ff;
}
</style>


</head>
<body>

<!-- ///////////////////////////////////헤더임///////////////////////////////////////// -->
<div class="header" id="header">
	<div class="headerIn">
		<h1 style="left: 40;"><a href="./"><img alt="" src="resources/img/archivelogo22.png" height="100"></a></h1>
			<form id="search" action="searchList" method="get">
				<table class="searchbar">
				<tr>
					<th width="130px">
						<div class="custom-select" style="width:130px; ">
							<select size="1" name="detail">
								<option value="total">total</option>
								<option value="title">title</option>
								<option value="author">author</option>
								<option value="publisher">publisher</option>
							</select>
						</div>
					</th>
					<th>
						<input type="text" id="bookName" name="bookName" placeholder="search.."></th>
					<th class="searchbtn1">
						<a style="margin:0 5 0 5" href="javascript:searchBook()"><img alt="" src="resources/img/iconfinder_11_Search_106236.png" width="20"></a>		
					</th>
				</tr>
				</table>
			</form>
	
		<!-- sign in , sign up , menu-->
			<table class="navbar" style="width: 1050px"><tr><td style="width: 802px;">
			<ul class="menu">
				<li><a href="groupList">community</a></li>
				<li><a href="recommend">recommend</a></li>
				<c:if test="${loginId != null }">
				<li><a href="book_reply">review</a></li>
				</c:if>
			</ul>
			</td><td>
				<c:if test="${loginId == null }">
					<nav id="main-nav" class="main-nav" style="margin-right: 0px;width: 200;">
						<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="signinup">
								<li style="margin-left: 0px;">
									<a href="#0" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="cd-signin">Sign in</a>
								</li>
							</ul>
						</td><td style="width: 93px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="signinup">
								<li style="margin-left: 0px;">
									<a href="#0" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="cd-signup">Sign up</a>
								</li>
							</ul>
						</td></tr></table>
					</nav>
				</c:if>
				<c:if test="${loginId != null }">
					<nav class="main-nav2" style="margin-right: 0px;width: 200;float: right;">
						<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="userBar">
								<li style="margin-left: 0px;">
									<a href="logout" style="width:102; margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-logout">Log out</a>
								</li>
							</ul>
						</td><td style="width: 93px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="userBar">
								<li style="margin-left: 0px;">
									<a href="my-account" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-lib" >Account</a>
								</li>
							</ul>
						</td></tr></table>
					</nav>
				</c:if>
			</td></tr></table>		
<!-- //////////////sign up sign in 버튼 눌렀을때 모달 창///////////// -->
	
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0" class="selected" id="switcherSignin">Sign in</a></li>
				<li><a href="#0" class="selected" id="switcherSignup">New account</a></li>
			</ul>
			<div id="cd-login"> <!-- log in form -->
				<form class="cd-form"action="login" method="post" onsubmit="return checkSignin()">
					<p class="fieldset">
						<label class="image-replace" for="signin-id">ID</label>
						<input class="full-width has-padding has-border" id="signin-id" type="text" placeholder="ID" name="id">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="Password" name="password">
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="Login">
					</p>
				</form>
				

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<form class="cd-form" action="join" method="post" onsubmit="return checkSignUp()">
					<p class="fieldset">
						<label class="image-replace" for="signup-username">Username</label>
						<input class="full-width has-padding has-border" id="signup-username" name="name" type="text" placeholder="Username">
						<span class="cd-error-message" >Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signup-nickname">Nickname</label>
						<input class="full-width has-padding has-border" id="signup-nickname" type="text" name="nickname" placeholder="Nick name">
						<div id="error2"></div>
						<span class="cd-error-message" >Error message here!</span>
					</p>
					
					<p class="fieldset">
						<label class="image-replace" for="signup-id">ID</label>
						<input class="full-width has-padding has-border" id="signup-id" name="id" type="text" placeholder="ID">
						<div id="error"></div>
						<span class="cd-error-message" >Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password" name="password" type="password"  placeholder="Password">
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>
					<p class="fieldset">
						<label class="image-replace" for="signup-password">Password_Check</label>
						<input class="full-width has-padding has-border" id="signup-password2" type="password"  placeholder="Password">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signup-nickname">Email</label>
						<input class="full-width has-padding has-border" id="signup-email" name="email" type="email" placeholder="email">
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<label class="image-replace" for="signup-gender">Gender</label>
						FEMALE <input type="radio" value="1" name="gender" checked> &nbsp; MALE<input type="radio" name="gender" value="0">
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<label class="image-replace" for="signup-birth">BirthDay</label>
						BIRTHDAY
						<input type="date" name="birthday" id="birth">
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Create account">
					</p>
				</form>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->
	<!-- sign in , sign up 끝 -->
	</div>
</div>
<!-- ///////////////////////////////////헤더끝///////////////////////////////////////// -->
<!-- /////////////////////////////////////검색 옵션 부분 js////////////////////////////////////////////////// -->
<script src="resources/js/searchOption.js"></script>
<!-- /////////////////////////////////////검색 옵션 부분 js////////////////////////////////////////////////// -->




<!-- ////////////////////////////책 리스트/////////////////////////////////// -->
<div align="center" class="bookList ebookinfo">
	<table align="center" class="bookinfo ebookinfo2">
		<c:if test="${ebook!=null}">
			<c:forEach var = "i" items="${ebook}" varStatus="var">
			<!-- 윗 공간 여백 주기 -->
			<tr><td colspan="6"><p><br></p></td></tr>
			
			<!-- 행1 -->
			<tr>
				<td rowspan="3" class="col1" align="center"><!-- 열1: 번호 -->
				</td>
				<td rowspan="3" class="col2" width="150"><!-- 열2: 사진 -->
					<c:if test="${i.booknum != 7 }">
					<img src="resources/epub/ebookfile/cover/${i.booknum }.png" style="width: 150;">
					</c:if>
					<c:if test="${i.booknum == 7 }">
					<img src="resources/epub/ebookfile/cover/${i.booknum }.jpg" style="width: 150;">
					</c:if>
				</td>
				<td rowspan="3" width="20"><!-- 공백입니다 -->
					<pre>&nbsp;&nbsp;&nbsp;</pre>
				</td>
				<td class="row1col3"><!-- 열4: 제목 -->
					<a href="ebookInfo?bookNum=${i.booknum}"><p class="bookTitle" style="font-size: 20px"><b>${i.title}</b></p></a>		
				</td>
				<c:if test="${loginId != null }">
				<td rowspan="3" height="232"><!-- 열5: 구매 -->
					<table>
					<tr><td><!-- 공백 --></td></tr>
					<tr><td class="buyButton" height="70">
					<a class="cart-btn btn-default" href="buyBook?booknum=${i.booknum }"><i class="flaticon-shop"></i>BUY</a>
					</td></tr>
					<tr><td class="cartButton" height="70">
					<a class="cart-btn btn-default"  href="javascript:wantBook('${i.booknum }')"><i class="flaticon-shop">WISH</i></a>
					</td></tr>
					<tr><td><!-- 공백 --></td></tr>
					</table>
				</td>
				</c:if>
			</tr>
			<!-- 행2 -->
			<tr>
				<td class="row2col3"><!-- 열3: 가격 -->
					<p><b>Price <br></b>1 week $2.00 &nbsp;| 2 weeks $4.00 &nbsp;| 1 month $6.00</p>
				</td>

				<%--<td id="presentButton"><!-- 열5: 선물 -->
					<a class="cart-btn btn-default" href=""><i class="flaticon-shop"></i>선물하기</a>
				</td> --%>
			</tr>
			<!-- 행3 -->
			<tr>
				<td class="row3col3"><!-- 열3-4: 책 설명 -->
					<p>${i.author }<br>${i.publisher}</p>
				</td>
			</tr>
			<!-- 행4 : 구분선 -->
			<tr>
				<td colspan="5" class="line"></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	<c:if test="${ebook==null || ebook.size() == 0}">
			<div style="height: 60px; text-align: center;" align="center"><br><p>No matching Ebook found </p></div>
	</c:if>
</div>
<!-- ///////////////////////////////////////////일반 검색 목록 -->
<div align="center" class="bookList">
	<table align="center" class="bookinfo">
		<c:if test="${data!=null && data.size() > 0}">
			<c:forEach var = "i" items="${data}" varStatus="var">
			<!-- 윗 공간 여백 주기 -->
			<tr><td colspan="6"><p><br></p></td></tr>
			
			<!-- 행1 -->
			<tr>
				<td rowspan="3" class="col1" align="center"><!-- 열1: 번호 -->
					<p>${var.count}</p>
				</td>
				<td rowspan="3" class="col2 imgtable" style="width: 150;"><!-- 열2: 사진 -->
					<!-- 사진이 없는 책일 경우 -->
						<c:if test="${i.image == null}">
							<img alt="" src="resources/img/blankimg.png" width="150"> <!-- 또는 아카이브 로고 넣기 -->
						</c:if>
						<!-- 사진이 있는 책일 경우 -->
						<c:if test="${i.image != null}">
						<img src="${i.image}" width="150" onerror="this.src='resources/img/blankimg.png'">
						</c:if>
				</td>
				<td rowspan="3" width="20"><!-- 공백입니다 -->
					<pre>&nbsp;&nbsp;&nbsp;</pre>
				</td>
				<td class="row1col3"><!-- 열4: 제목 -->
					<a href="bookInfo?isbn=${i.isbn}"><p class="bookTitle" style="font-size: 20px"><b>${i.title}</b></p></a>		
				</td>

			</tr>
			<!-- 행2 -->
			<tr>
				<td class="row2col3"><!-- 열3: 가격 -->
					<p><b>Price &nbsp;</b>${i.price}&#8361;</p>
				</td>

				<%--<td id="presentButton"><!-- 열5: 선물 -->
					<a class="cart-btn btn-default" href=""><i class="flaticon-shop"></i>선물하기</a>
				</td> --%>
			</tr>
			<!-- 행3 -->
			<tr>
				<td class="row3col3"><!-- 열3-4: 책 설명 -->
					<p>${i.description}</p>
				</td>
			</tr>
			<!-- 행4 : 구분선 -->
			<tr>
				<td colspan="5" class="line"></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	<c:if test="${data == null || data.size() == 0}">
			<div style="height: 60px; text-align: center;" align="center"><br><p>No matching book found</p></div>
	</c:if>
</div>
<script type="text/javascript">
function wantBook(num){
	$.ajax({
		url : 'wantBook?booknum='+num
		, type : 'get'
		, dataType : 'text'
		, success : function(e){
			if( e == 'fail'){
				alert('This book already exists in the LIBRARY.');
			}
			else{
				alert('be added to the LIBRARY');
			}
		}
	})
}
</script>


</body>
</html>

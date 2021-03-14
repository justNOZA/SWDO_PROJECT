<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<html>
<head>
<title>ebookinformation</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/signupSignin.js"></script>
<script type="text/javascript" src="resources/js/signin_up.js"></script>
<link href="resources/css/header.css" rel="stylesheet" />


<style type="text/css">
* {
	box-sizing: border-box;
	margin: auto;	
}
body {
	font-family: Verdana, sans-serif;
	height: 627.200;
	width: 1503.200;}

/* ---------------페이지에 버튼 있는 경우 사용하고 없으면 지우면 됩니다.------------------ */
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
/* ---------------페이지에 버튼 있는 경우 사용하고 없으면 지우면 됩니다.------------------ */

/* --------------------------------책 이미지, 가격, 이북 유무, 구매버튼 등등------------------------------------ */
.availability > span {
  background: #007fff none repeat scroll 0 0;
  border: 1px solid #a89999;
  color: #ffffff;
  display: inline-block;
  font-weight: 600;
  margin-bottom: 20px;
  padding: 3px 12px;
}
.single-product-price > h2 {
  display: inline-block;
  margin-bottom: 40px;
  padding: 11px 0;
  position: relative;
}
.single-product-price > h2::after {
  background: #F0F0F0 none repeat scroll 0 0;
  content: "";
  height: 2px;
  left: 0;
  position: absolute;
  top: 0;
  width: 100%;
}
.single-product-price > h2::before {
  background: #F0F0F0 none repeat scroll 0 0;
  bottom: 0;
  content: "";
  height: 2px;
  position: absolute;
  width: 100%;
}
.product-attributes span a {
  display: inline-block;
  margin-top: 5px;
  text-decoration: none;
}
.col-sm-7 {
   float: left;
}
.col-sm-5 {
   float: right;
}

/* --------------------------------책 이미지, 가격, 이북 유무, 구매버튼 등등------------------------------------ */


/* --------------------------------서평, 책소개, 지도 탭입니다------------------------------- */
/*
 CSS for the main interaction
*/
.tabset > input[type="radio"] {
  position: absolute;
  left: -200vw;
}

.tabset .tab-panel {
  display: none;
}

.tabset > input:first-child:checked ~ .tab-panels > .tab-panel:first-child,
.tabset > input:nth-child(3):checked ~ .tab-panels > .tab-panel:nth-child(2),
.tabset > input:nth-child(5):checked ~ .tab-panels > .tab-panel:nth-child(3),
.tabset > input:nth-child(7):checked ~ .tab-panels > .tab-panel:nth-child(4),
.tabset > input:nth-child(9):checked ~ .tab-panels > .tab-panel:nth-child(5),
.tabset > input:nth-child(11):checked ~ .tab-panels > .tab-panel:nth-child(6) {
  display: block;
}

/*
 Styling
*/

.tabset > label {
  position: relative;
  display: inline-block;
  padding: 15px 15px 25px;
  border: 1px solid transparent;
  border-bottom: 0;
  cursor: pointer;
  font-weight: 600;
}

.tabset > label::after {
  content: "";
  position: absolute;
  left: 15px;
  bottom: 10px;
  width: 22px;
  height: 4px;
  background: #8d8d8d;
}

.tabset > label:hover,
.tabset > input:focus + label {
  color: #06c;
}

.tabset > label:hover::after,
.tabset > input:focus + label::after,
.tabset > input:checked + label::after {
  background: #06c;
}

.tabset > input:checked + label {
  border-color: #ccc;
  border-bottom: 1px solid #fff;
  margin-bottom: -1px;
}

.tab-panel {
  padding: 30px 0;
  border-top: 1px solid #ccc;
}

.all {
  padding: 30px;
}

/* --------------------------------서평, 책소개, 지도 탭입니다------------------------------- */
.header .searchbar a {
   color: #aaa;
   font-weight: 700;
   margin: 0 15px 0 15px;
   font-size: 1.4em;
}

textarea.reply_content {
  width: 400px;
  border: 2px solid #007fff;
  border-radius: 4px;
  font-size: 16px;
  background-color: white;
  padding: 6px 20px 6px 30px;
}


</style>


</head>
<body>


<!-- ///////////////////////////////////헤더임///////////////////////////////////////// -->
<div class="header" id="header">
	<div class="headerIn">
		<h1 style="left: 0px;width: 266px;"><a href="./" style="margin-left: 40px;"><img alt="" src="resources/img/archivelogo22.png" height="100"></a></h1>
         <form id="search" action="searchList" method="get" style="margin-bottom: 16px;">
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




<!-- Single Product Area Start -->
<div class="single-product-area section-padding" style="position: relative;top:200;">
<div class="container">
	<div class="row">
		<table><tr><td class="bookcover" width="500">
		<div class="col-md-6 col-sm-7">
			<div class="single-product-image-inner">
            	<!-- 책 사진 or 표지 넣는 곳 -->
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="one">
						<a class="venobox" href="resources/epub/ebookfile/cover/${ebook.booknum }.png" data-gall="gallery" title="">
						<!-- 사진 크기, 위치 지정 -->
							<c:if test="${ebook.booknum != 7 }">
							<img src="resources/epub/ebookfile/cover/${ebook.booknum }.png" alt="">
							</c:if>
							<c:if test="${ebook.booknum == 7 }">
							<img src="resources/epub/ebookfile/cover/${ebook.booknum }.jpg" alt="">
							</c:if>
						</a>
					</div>
				</div>
			</div>
		</div>
		</td><td>
		<div class="col-md-6 col-sm-5">
			<!-- 책 제목 -->
			<h2>${ebook.title }</h2>
			<!-- 가격 -->
			<div class="single-product-price">
				<h2 style="margin-bottom: 20px;"><b>Price &nbsp; </b></h2><br>
				<h3>1 week $2.00 &nbsp;| 2 week $4.00 &nbsp;| 1 month $6.00</h3>
			</div>
			<!--책 정보 -->
			<p style="color: #878787">AUTHOR 	| ${ebook.author}<br>PUBLISHER	| ${ebook.publisher}</p>
			<p style="color: hsl(0, 100%, 75%)"> POINT :${totalPoint}</p>
			<div class="product-attributes clearfix">
			<c:if test="${loginId != null }">
            <span>
               <a class="cart-btn btn-default" href="buyBook?booknum=${ebook.booknum }">
                  <i class="flaticon-shop"></i>
                  PAYMENT
               </a>
            </span><p></p>
            <span>
               <a class="cart-btn btn-default" href="javascript:wantBook('${ebook.booknum }')">
                  <i class="flaticon-shop"></i>
                  WANT
               </a>
            </span>
            </c:if>
         </div>
		</div>
		</td></tr></table>
	</div>
</div>
<div class="all">
<div class="tabset">
  <!-- Tab 1 -->
  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
  <label for="tab1">REVIEW LIST</label>
  <!-- Tab 2 -->
  <input type="radio" name="tabset" id="tab2" aria-controls="rauchbier">
  <label for="tab2">WIRTE REVIEW</label>
  
  <div class="tab-panels">
    <section id="marzen" class="tab-panel">
      <h2>LIST</h2><br>
      <c:choose>
      <c:when test="${book_reply.size() != 0 }">
      <table style="margin-left: 0px">
      <c:forEach var="list" items="${book_reply}">
      		<tr>
      			<td colspan="2" style="text-align: left; width: 200px; font-size: 17px; font-weight: lighter; color : Gray"><b>${list.nickname }</b></td>
      			<td style="text-align: right; width: 50px; font-size: 17px; font-weight: lighter;"> <b>POINT</b></td>
      			<td style="text-align: right; width: 50px; font-size: 17px; font-weight: lighter; color : #007fff"> ${list.point }</td>
      			<td width="700"><!-- 공백 --></td>
      		</tr>
      		<tr>
      			<td colspan="5" style="text-align: left;" width="1000"><p style="font-size: 20px">${list.content}</p></td>
      		</tr>
      		<tr><td colspan="5" height="30" style="border-top-style: solid; border-top-color: #76BBFF"></td></tr>
      </c:forEach>
      </table>
      	</c:when>
      	<c:otherwise>
      	<p>There's no written review yet.</p>
		</c:otherwise>
      	</c:choose>
	</section>
	<section id="rauchbier" class="tab-panel">
		<p><strong>REVIEW</strong></p>
			 POINT :	<select name="point" id="review_point">
						<option value="1"> 1 </option>
						<option value="2"> 2 </option>
						<option value="3"> 3 </option>
						<option value="4"> 4 </option>
						<option value="5" selected="selected"> 5 </option>
					</select><br><br>
			REVIEW :<br>	<textarea rows="10" cols="100" name="content" id="content" class="reply_content"></textarea><br><br>
			<c:if test="${loginId != null }">
			<a class="cart-btn btn-default" href="javascript:submitForm()">
				<i class="flaticon-shop"></i> write</a>
			</c:if>
    </section>
  </div>  
</div>
</div>
</div>


<!-- Single Product Area End -->
<script type="text/javascript">
function submitForm(){
	var content = $('#content').val();
	if(content.length < 5){
		alert('Please leave a longer review.');
		content.focus();
		content.select();
		return false;
	}
	var title = '${realTitle}';
	var publisher = '${ebook.publisher}';
	var point = $('#review_point').val();
	$.ajax({
		url : 'reply_ajax_book'
		, type : 'post'
		, data : {content : content, title : title, publisher : publisher, point : point}
		, success : function(){
			alert('YOU left a book review.');
			location.href="";
		}
	});
}

function wantBook(num){
	$.ajax({
		url : 'wantBook?booknum='+num
		, type : 'get'
		, dataType : 'text'
		, success : function(e){
			if(e == 'fail'){
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
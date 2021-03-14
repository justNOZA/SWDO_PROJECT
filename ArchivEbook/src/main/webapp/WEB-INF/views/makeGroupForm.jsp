<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/signupSignin.js"></script>
<script type="text/javascript" src="resources/js/signin_up.js"></script>
<link href="resources/css/header.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style type="text/css">
* {box-sizing: border-box;}
body {
	font-family: Verdana, sans-serif;
	height: 627.200;
	width: 1503.200;}


.header .searchbar a {
	color: #aaa;
	font-weight: 700;
	margin: 0 15px 0 15px;
	font-size: 1.4em;
}

/* -------------------------------그룹피드임ㅁ미당-------------------------------- */
/* ----------------------------글쓰기 폼 css끝------------------------------- */
* {
  outline:none;
	border:none;
	margin:0px;
	padding:0px;
}

#paper {
	color:#333;
	font-size:20px;
}
#margin {
	margin-left:12px;
	margin-bottom:20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none; 
}
#text {
	overflow:hidden;
	background-color:#FFF;
	color:#33333;
	font-weight:normal;
	font-size:18px;
	resize:none;
	padding: 30 30 30 30;
	background-color: #f6f6f6;
}
#replytext {
	overflow:hidden;
	background-color:#FFF;
	color:#33333;
	font-weight:normal;
	font-size:13px;
	resize:none;
	padding: 10 10 10 10;
	background-color: #f6f6f6;
}
#title {
	background-color:transparent;
	border-bottom:3px solid #f6f6f6;
	border-top:none;
	border-left:none;
	border-right:none;
	color:#33333;
	font-size:20px;
	height:28px;
	font-weight:bold;
	width:320px;
}

#wrapper {
	width:800;
	height:auto;
	margin-left:auto;
    margin-right: 0px;
	margin-top:24px;
	margin-bottom:100px;
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
  float: right;
  margin-top: 10px;
}
.btn-default:hover {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: 1px solid #007fff;
  color: #007fff;
  
}
/* ----------------------------글쓰기 폼 css끝------------------------------- */

.feedall {
  position: relative;
  max-width: 800px;
  margin: auto;
  top:200;
  z-index: 1;
}

.item {
  display: flex;
  max-width: 1000px;
  margin: 0 auto;
}
/* -------------------------------그룹피드임ㅁ미당-------------------------------- */

/* 그룹 글에 댓글 등등 보여주기욤 */

.reDel {
	text-align: right;
	width: 20;
}

.boardDel {
	text-align: right;
	width: 20;
}

.boardUpdate {
	text-align: right;
	width: 20;
}

.writedate {
	text-align: right;
	font-size: 12px;
	width: 100;
}

#flip {
  padding: 5px;
  text-align: center;
  background-color: #007fff;
  color: white;
}
#panel {
  padding: 5px;
  text-align: center;
  background-color: #f6f6f6;
  display: none;
}

textarea.group_intro {
  width: 400px;
  border: 2px solid #007fff;
  border-radius: 4px;
  font-size: 16px;
  background-color: white;
  padding: 6px 20px 6px 30px;
}

.ub-logout {
  width: 102px;
}
.ub-ullogout {
  width: 102px;
}
#search {
  margin-bottom: 16;
}
</style>


</head>
<body>



<!-- ///////////////////////////////////헤더임///////////////////////////////////////// -->
<div class="header" id="header">
	<div class="headerIn">
		<h1 style="left: 40;height: 100;width: 266px;height: 100px;">
      <a href="./" style="margin-left: 40px;"><img alt="" src="resources/img/archivelogo22.png" height="100"></a></h1>
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
						<a style="margin:0 5 0 5;margin-left: 5px;margin-right: 5px;" href="javascript:searchBook()"><img alt="" src="resources/img/iconfinder_11_Search_106236.png" width="20"></a>		
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
					<nav class="main-nav2" style="margin-right: 0px;width: 200;float: right;width: 200px;">
						<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="userBar ub-ullogout">
								<li style="margin-left: 0px;">
									<a href="logout" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-logout">Log out</a>
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



<!-- ///////////////////////////////////////////검색js///////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////////검색js///////////////////////////////////////////////// -->




<!-- ///////////////////////////////////////////피드임!!!!!!/////////////////////////////////////////////// -->
<div>
<div style="padding-top : 200px;width: 1000px;margin-left: 250px;margin-right: 250px;">
	<h2>MAKEGROUPS</h2>
	<form method="post" action="makeGroup" id="makeGroup_form">
		<table>
			<tr>
				<td>GROUP NAME</td>
				<td><input type="text" name="groupname" id="groupname"><br>
					<br></td>
			</tr>
			<tr>
				<td>GROUP INTRODUCE</td>
				<td><textarea class="group_intro" name="groupintroduce" id="groupintroduce"></textarea><br>
					<br></td>
			</tr>
			<tr>
				<td colspan="2" class="center">
				<div style="margin: 30px; text-align: center;">
					<a class="cart-btn btn-default" href="javascript:make_group()">
					<i class="flaticon-shop"></i>
						MAKE
					</a>
   				 </div>
				<!-- <input type="button" id="makeGroup" value="생성"> --></td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	<script type="text/javascript">
	function make_group(){
		var gn = $('#groupname').val();
		var gi = $('#groupintroduce').val();
		if(gn.length < 1){
			alert('GROUP NAME PLEASE');
			return;
		}
		if(gi.length < 10){
			alert('Please enter a longer group introduction.');
			return;
		}
		$('#makeGroup_form').submit();
	}
	</script>
</body>
</html>
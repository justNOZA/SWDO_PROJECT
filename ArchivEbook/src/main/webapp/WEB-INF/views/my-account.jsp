<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<html>
<head>
<title>bookinformation</title>
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
  color: #007fff;
}

.tabset > label:hover::after,
.tabset > input:focus + label::after,
.tabset > input:checked + label::after {
  background: #007fff;
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

.header .searchbar a {
   color: #aaa;
   font-weight: 700;
   margin: 0 15px 0 15px;
   font-size: 1.4em;
}

textarea.reply_content, input.update_form {
  width: 400px;
  border: 2px solid #007fff;
  border-radius: 4px;
  font-size: 16px;
  background-color: white;
  padding: 6px 20px 6px 30px;
}
/*---------------------------------------------------------------------------------*/
.m-flip{
	overflow: hidden;
	cursor: pointer;
	
}
.m-flip_item{
	display: block;
	position: relative;
	top: 0;
	transition: top .2s ease-out 0s;
	&:nth-child(1){
		color: #666;
	}
}
.groupEnter{
	text-decoration: none;
	color: gray;
}
/* -----------------이거는 그룹 들어가는 버튼------------------ */


/* ---------------------------------검색리스트 css에욤------------------------------------------ */
/*디브 박스*/
.groupList{margin: 1px auto;}
/*책 제목 크기*/


.line{border-bottom:3px; border-bottom-style:solid; border-bottom-color: #007fff;}


.groupList{
  position: relative;
  margin: auto;
  top:200;
  z-index: 1;
}
.groupinfo {
	width: 1000px;
}

.groupjoin-btn {
  line-height: 18px;
  padding: 10px 22px;
}

.groupTable{
	background-color: #56aaff;
	color: white;
}

.pageButton:visited{
	color : black;
	text-decoration: none;
}
.pageButton:link{
	color : black;
	text-decoration: none;
}
.buttonPage_Make{
	margin : 30px;
}
.cart-btn {
  line-height: 18px;
  padding: 10px 22px;
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

.lib {
	text-align: center;
	width: 1000;
}
</style>
<script type="text/javascript">
$(function(){
	$('#tab2').on('click', formGroup);	
});

function formGroup(){
(function($){
    $.fn.flip = function(options){
		var options = $.extend({
			targetClass: '.m-flip_item'
		}, options);
		
        return this.each(function(){
	        console.log(this);
			var $this = $(this),
				$target = $this.find(options.targetClass);
			
			$this
				.on({
					'init.flip': function(){
						var targetFirst_height = $target.eq(0).height();
						
						$this
							.data('height', targetFirst_height)
							.css({ height: targetFirst_height });
					},
					'mouseenter.flip': function(){
						$target.css({ top: -$this.data('height') + 'px' });
					},
					'mouseleave.flip': function(){
						$target.css({ top: 0 + 'px' });
					}
				})
				.trigger('init.flip');
		});
    };
}(jQuery));

$(function(){
	$('.js-flip').flip();
});
}

</script>

</head>
<body>

<!-- ///////////////////////////////////헤더임///////////////////////////////////////// -->
<div class="header" id="header">
	<div class="headerIn">
		<h1 style="left: 40;"><a href="./"><img alt="" src="resources/img/archivelogo22.png" height="100"></a></h1>
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




<!-- Single Product Area Start -->
<div class="single-product-area section-padding" style="position: relative;top:200;">
<div class="all" style="width: 1060px;padding: 30">
<div class="tabset">
  <!-- Tab 1 -->
  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
  <label for="tab1">USER INFO</label>
  <!-- Tab 2 -->
  <input type="radio" name="tabset" id="tab2" aria-controls="getReply">
  <label for="tab2">USER GROUP</label>
  <!-- Tab 3 -->
  <input type="radio" name="tabset" id="tab3" aria-controls="rauchbier">
  <label for="tab3">USER REVIEW</label>
  <!-- Tab 4 -->
  <input type="radio" name="tabset" id="tab4" aria-controls="dunkles">
  <label for="tab4">EXPIRED BOOKS</label>
  <!-- Tab 5 -->
  <input type="radio" name="tabset" id="tab5" aria-controls="presents">
  <label for="tab5">READABLE</label>
  <!-- Tab 6 -->
  <input type="radio" name="tabset" id="tab6" aria-controls="future">
  <label for="tab6">WISH LIST</label>
  
	<div class="tab-panels">
		<section id="marzen" class="tab-panel">
			<form action="update" method="post" id="updateForm">
				<table>
					<tr><td>ID</td><td>
						<input  id="update-id" name="id" type="text" readonly value="${user_vo.id }">
					</td></tr>
					<tr>
						<td> user_name</td><td>
						<input id="update-username" name="name" type="text" value="${user_vo.name }">
					</td></tr>
					<tr>
						<td> Nick-name</td>
						<td>
						<input  id="update_nick" name="nickname" type="text" readonly value="${user_vo.nickname }">
					</tr>
					<tr><td>PASSWORD</td><td>
						<input class="update_form" id="update-password" name="password" type="password"  placeholder="Password">
					</p>
					</td></tr>
					<tr><td>CHECK</td><td>
						<input class="update_form" id="update-password2" type="password"  placeholder="Password">
					</td></tr>
					<tr><td>Email</td><td>
						<input class="update_form" id="update-email" name="email" value="${user_vo.email }" type="email" placeholder="email">
					</td>
					<tr><td>Birth</td><td>
						<input  name="birthday" value="${user_vo.birthday }" type="text" readonly>
					</td>
					<tr><td>GENDER</td><td><c:if test="${user_vo.gender == 0 }">MALE</c:if><c:if test="${user_vo.gender == 1 }">FEMALE</c:if>
					<input type="hidden" value="${user_vo.gender}" name="gender" > 
					</td>
					<tr><td colspan="2" style="text-align: center;">
						<div style="margin: 30px">
			 				<a class="cart-btn btn-default" href="javascript:check_update()">
                 			 <i class="flaticon-shop"></i>
                 				Update account
               				</a>
               			</div>
					</td></tr></table>
				</form>
		</section>
		<section id="getReply" class="tab-panel">
		<table align="center" class="groupinfo">
			<!-- 윗 공간 여백 주기 -->
			<tr><td colspan="4"><p><br></p></td></tr>
			<tr height="60" class="groupTable">
				<td align="center"><p><b>GROUP</b></p></td>
				<td align="center" colspan="2"><p><b>INFO</b></p></td>
			</tr>
			<!-- 행1 -->
			<c:forEach var="list" items="${group_list_user}">
			<tr height="50">
				<td rowspan="2" align="center" width="200"><!-- 열1: 그룹이름 -->
				<a href="groupBoard?groupnum=${list.groupnum}" class="groupEnter" >
				<div id="app">
					<p class="m-flip js-flip" style="font-size: 30px;">
						<span class="m-flip_item">${list.groupname}</span>
						<span class="m-flip_item">ENTER</span>
					</p>
				</div>
				</a>
				</td>
				<td rowspan="2"><!-- 공백 -->&nbsp;&nbsp;</td>
				<td><!-- 열2: 그룹소개 -->
				<p style="font-size: 18px">${list.groupintroduce}</p>
				</td>
			</tr>
			<tr height="50">
				<td height="50"><!-- 열2: 그룹장 id -->
				<p style="color: #666"><b>Master &nbsp; </b>
					<c:if test="${list.group_master == 1}">
						${list.nickname }
					</c:if>
					<c:if test="${list.group_master != 1}">
						<c:forEach var="i" items="${group_master}">
							<c:if test="${list.groupname == i.groupname }">
								${i.nickname}
							</c:if>
						</c:forEach>
					</c:if>
				</p>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="line"></td>
			</tr>
			</c:forEach>
	</table>
		</section>
		<section id="rauchbier" class="tab-panel">
		<c:choose>
			<c:when test="${reply_list_user != null && reply_list_user.size() != 0}">
				<div>
					<table>
						<tr style="background-color: #56aaff; color: white;">
							<th width="150" align="center">TITLE</th><th>REVIEW</th><th width="100">POINT</th><th width="100">DATE</th>
						</tr>
						<c:forEach items="${reply_list_user}" var="list">
							<tr>
								<td align="center">
									${list.title}
								</td>
								<td>
									${list.content }
								</td>
								<td align="center">
									${list.point }
								</td>
								<td align="center">
									${list.inputdate}
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			<div class="buttonPage_Make" style="text-align: center">
				<a class="pageButton" href="my-account?page=${navi2.currentPage - navi2.pagePerGroup}&check_navi2=1"><img alt="" src="resources/img/pageback2.png" height="10"></a>&nbsp;&nbsp;
				<a class="pageButton" href="my-account?page=${navi2.currentPage - 1}&check_navi2=1"><img alt="" src="resources/img/pageback.png" height="10"></a>&nbsp;&nbsp;
				<c:forEach begin="${navi2.startPageGroup }" end="${navi2.endPageGroup }" var="i">
					<c:if test="${navi2.currentPage == i}"></c:if>
						<a class="pageButton" href="my-account?page=${i}&check_navi2=1">${i}</a> &nbsp;
					<c:if test="${navi2.currentPage == i}"></c:if>
				</c:forEach>
					<a class="pageButton" href="my-account?page=${navi2.currentPage + 1}&check_navi2=1"><img alt="" src="resources/img/pagenext.png" height="10"></a>&nbsp;&nbsp;
					<a class="pageButton" href="my-account?page=${navi2.currentPage + navi2.pagePerGroup}&check_navi2=1"><img alt="" src="resources/img/pagenext2.png" height="10"></a>
			</div>
			</c:when>
			<c:otherwise>
			YOU didn't write anything.
			<div style="margin: 30px">
			 	<a class="cart-btn btn-default" href="book_reply">
                	 <i class="flaticon-shop"></i>
					Would you like to go make a book review?
               	</a>
             </div>
			</c:otherwise>
			</c:choose>
	    </section>
		<section id="dunkles" class="tab-panel">
		<c:if test="${user_past.size() > 0}">
			<table class="lib">				
			<c:forEach begin="0" end="${user_past.size()-1}" var="i" step="3">
				<tr>
				<c:forEach begin="${i}" end="${i+2}" var="j">
				<c:if test="${j <=  user_past.size()-1}"><td width="300">
				<a href="buyBook?booknum=${user_past[j].booknum}">
				<c:if test="${user_past[j].booknum != 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${user_past[j].booknum}.png" width="120px"><br>
				</c:if>
				<c:if test="${user_past[j].booknum == 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${user_past[j].booknum}.jpg" width="120px"><br>
				</c:if>
				</a>
				<p><b>${user_past[j].title }</b></p>
				<p style="color: gray;">${user_past[j].author}</p>
				<p style="color: gray;"><b>Rented Date</b> ${user_past[j].inputdate}</p></td></c:if>
				</c:forEach>
				</tr>
				<tr>
					<td colspan="3">
					<img alt="" src="resources/img/libgr.png" width="1000" height="60">
					</td>
				</tr>
				<tr>
					<td colspan="3" height="30">
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
    	</section>
		<section id="presents" class="tab-panel">
		<c:if test="${user_present.size() > 0}">
		<table class="lib">		
			<c:forEach var="i" begin="0" end="${user_present.size()-1}" step="3">
         <tr>
         <c:forEach begin="${i}" end="${i+2}" var="j"><c:if test="${j <=  user_present.size()-1}"><td width="300">
            <c:if test="${user_present[j].booknum != 7 }">
               <a href="javascript:view(${j})">
               <img alt="" src="resources/epub/ebookfile/cover/${user_present[j].booknum}.png" width="120px"></a><br>
            </c:if>
            <c:if test="${user_present[j].booknum == 7 }">
               <a href="javascript:view(${j})">
               <img alt="" src="resources/epub/ebookfile/cover/${user_present[j].booknum}.jpg" width="120px"></a><br>
            </c:if>
               <p><b>${user_present[j].title}</b></p>
               <p style="color: gray;">${user_present[j].author}</p>
               <p style="color: gray;"><b>Rented date</b> ${user_present[j].inputdate}</p>
               <input type="hidden" id="booknum${j}" value="${user_present[j].booknum}"></td></c:if>
         </c:forEach></tr>
         <tr>
			<td colspan="3">
				<img alt="" src="resources/img/libgr.png" width="1000" height="60">	
			</td>
		</tr>
		<tr>
			<td colspan="3" height="30">
			</td>
		</tr>
         </c:forEach>
		</table>
		</c:if>
    	</section>
		<section id="future" class="tab-panel">
		<c:if test="${user_want.size() > 0}">
		<table class="lib">
			<c:forEach begin="0" end="${user_want.size()-1}" var="i" step="3">
			<tr>
			<c:forEach begin="${i}" end="${i+2}" var="j"><c:if test="${j <=  user_want.size()-1}"><td width="300">
				<a href="buyBook?booknum=${user_want[j].booknum}">
					<c:if test="${user_want[j].booknum != 7 }">
						<img alt="" src="resources/epub/ebookfile/cover/${user_want[j].booknum}.png" width="120px"><br>
					</c:if>
					<c:if test="${user_want[j].booknum == 7 }">
						<img alt="" src="resources/epub/ebookfile/cover/${user_want[j].booknum}.jpg" width="120px"><br>
					</c:if>
				</a>
				<p><b>${user_want[j].title }</b></p>
				<p style="color: gray;">${user_want[j].author}</p>
				</td></c:if>
				</c:forEach></tr>
         <tr>
			<td colspan="3">
				<img alt="" src="resources/img/libgr.png" width="1000" height="60">
			</td>
		</tr>
		<tr>
			<td colspan="3" height="30">
			</td>
		</tr>
			</c:forEach>
		</table>
		</c:if>
    	</section>
	</div>  
</div>
</div>
</div>

<script type="text/javascript">
function view(num){
	var id = '#booknum'+num;
	var addressNum = $(id).val();
	var address = 'view?num='+addressNum; 
	window.open("about:blank").location.href = address;
}
$(function(){
	var num = '${check_navi2}'
	if(num != null && num == 1){
		$('#tab3').click();
	}
})

</script>
<script type="text/javascript" src="resources/js/signin_up.js"></script>
</body>
</html>
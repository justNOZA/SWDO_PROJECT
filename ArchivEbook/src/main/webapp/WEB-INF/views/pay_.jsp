<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>${type}</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
* {box-sizing: border-box;}
body {
	font-family: Verdana, sans-serif;
	height: 627.200;
	width: 1503.200;}
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
</style>
</head>
<body>
<h1 align="center">$ ${price }.00</h1>
<br><br><br><br><br>
<table align="center" class="bookinfo">
<tr>
<td id="buyButton" >
<a class="cart-btn btn-default" href="javascript:okayCall()"><i class="flaticon-shop"></i>PAYMENT</a></td>
</tr>
<tr><td ><p><br></p></td></tr>
<tr>
<td id="cartButton">
<a class="cart-btn btn-default" href="javascript:cancel()"><i class="flaticon-shop"></i>CANCEL</a></td>
</tr>
</table>
<script type="text/javascript">
function okayCall(){
	var price;
	var pr = '${price}';
	switch(pr){
		case '2' : price = 7; break;
		case '4' : price = 14; break;
		case '6' : price = 30; break;
	}
	var type = '${type}';
	$.ajax({
		url : "payment"
		, type : 'post'
		, data : {type : type, price : price}
		, success : function(){
			alert('Proceed to the Member Account page.');
			opener.location.href="my-account";
			self.close();
		}
	});
}

function cancel(){
	self.close();
}
</script>
</body>
</html>
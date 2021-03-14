function searchBook(){
	var bookName = document.getElementById('bookName');
	
	if(bookName.value.length < 1){
		alert('Please enter the contents you want to search.'); 
		return;
	}
	
	$('#search').submit();
}

function checkSignin(){
	var id = $('#signin-id').val();
	var pw = $('#signin-password').val();
	if(id.v.length < 1){
		alert('Please enter a letter.');
		return false;
	}
	if(pw.length < 1){
		alert('Please enter your password.');
		return false;
	}
	return true;
}
$(function(){
	$("#signin-id").bind("keyup",function(){
		 re = /[~!@\#$%^&*\()\-=+_']/gi; 
		 var temp=$("#signin-id").val();
		 if(re.test(temp)){
			alert('You have entered special characters entered.');
			$('#signin-id').val('');
			
		 }
	});
	$("#signin-password").bind("keyup",function(){
		 re = /[~!\%^&*\()\-=+_']/gi; 
		 var temp=$("#signin-password").val();
		 if(re.test(temp)){
			alert('You have entered special characters except @,#,$.');
			$('#signin-password').val('');
		 }
	});
	$("#signup-username").bind("keyup",function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var temp=$("#signup-username").val();
		if(re.test(temp)){
			alert('You have entered special characters entered.');
			$('#signup-username').val('');
		}
	});
	$("#signup-nickname").bind("keyup",function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var temp=$("#signup-nickname").val();
		if(re.test(temp)){
			alert('You have entered special characters entered.');
			$('#signup-nickname').val('');
		}
	});
	$("#signup-id").bind("keyup",function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var temp=$("#signup-id").val();
		if(re.test(temp)){
			alert('You have entered special characters entered.');
			$('#signup-id').val('');
		}
	});
	$("#signup-password").bind("keyup",function(){
		re = /[~!\%^&*\()\-=+_']/gi; 
		var temp=$("#signup-password").val();
		if(re.test(temp)){
			alert('You have entered special characters except @,#,$.');
			$('#signup-password').val('');
		}
	});
	$('#signup-id').on('keyup', checkId);
	$("#signup-nickname").on('keyup', checkNick);
});
function checkSignUp(){
	var name = $("#signup-username").val();
	var nick = $("#signup-nickname").val();
	var id = $('#signup-id').val();
	var pw = $("#signup-password").val();
	var pw2 = $("#signup-password2").val();
	var birth = $("#birth").val();
	
	

	if(name.length < 1){
		alert('name please');
		return false;
	}
	else if(name.length > 15){
		alert('check name please');
		return false;
	}
	if(id_check + nick_check != 4){
		alert('Please check the duplicates.');
		return false;
	}
	if(pw.length < 6 || pw.length > 20){
		alert('Passwords must be 6 characters long or less than 20 characters long.');
		return false;
	}
	if(pw != pw2){
		alert("Password doesn't match.");
		return false;
	}
	if(birth == ''){
		alert('Please check your birthday.');
		return false;
	}
	return true;
}
var id_check;
var nick_check;
function checkId(){
	var id = $('#signup-id').val();
	if(id.length < 1){
		$('#error').html('');
		return;
	}
	if(id.length > 15){
		alert('ID is too long.');
		$('#error').html('');
		id_check = 1;
		return;
	}
	$.ajax({
		url : 'checkID'
		, type : 'get'
		, data : {id : $('#signup-id').val()}
		, success : function(e){
			console.log(e);
			if(e != 0){
				$('#error').html('<h5 style="color : red">*ID duplication</h5>');
				id_check = 1;
			}
			else{
				$('#error').html('');
				id_check = 2;
			}
		}
	});
}
function checkNick(){
	var id = $('#signup-nickname').val();
	if(id.length < 1){
		$('#error2').html('');
		return;
	}
	if(id.length > 7){
		alert('NICKNAME is too long.');
		$('#error2').html('');
		nick_check = 1;
		return;
	}
	$.ajax({
		url : 'checkNICK'
		, type : 'get'
		, data : {nick : $('#signup-nickname').val()}
		, success : function(e){
			if(e != 0){
				$('#error2').html('<h5 style="color : red">* NICK duplication</h5>');
				nick_check = 1;
			}
			else{
				$('#error2').html('');
				nick_check = 2;
			}
		}
	});
}

function check_update(){
	var name = $("#update-username").val();
	var pw = $("#update-password").val();
	var pw2 = $("#update-password2").val();
	
	if(name.length < 1){
		alert('name please');
		return;
	}
	else if(name.length > 15){
		alert('check name please');
		return;
	}
	if(pw.length > 1 && pw.length < 6 || pw.length > 20){
		alert('Passwords must be 6 characters long or less than 20 characters long.');
		return;
	}
	if(pw != pw2){
		alert("Password doesn't match.");
		return;
	}
	$('#updateForm').submit();
}
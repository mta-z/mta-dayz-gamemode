var floodTimer = false;
function login(){
	if (!floodTimer){
	var login = document.getElementById("login").value;
	var pass = document.getElementById("pass").value;
	mta.triggerEvent("loginAccount",login,pass);
	floodTimer =true;
	setTimeout(function(){floodTimer =false},3000);
	}
}

function register(){
	if (!floodTimer){
	var login = document.getElementById("login").value;
	var pass = document.getElementById("pass").value;
	mta.triggerEvent("registerAccount",login,pass);
	floodTimer =true;
	setTimeout(function(){floodTimer =false},3000);
	}
}

function showError(errorText){
	var error = document.getElementById("error");
	error.style.display="block";
	error.innerHTML=errorText;
	
	setTimeout(function(){ error.style.display="none"; },10000);
}

function loadAccount(login,pass){
	document.getElementById("login").value=login;
	document.getElementById("pass").value=pass;
	
}
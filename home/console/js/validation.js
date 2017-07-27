

function Trim(x) {
	return x.replace(/^\s+|\s+$/gm, '');
}

function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}

function checkAccountListData(formName) {

	var form = document.getElementById(formName);
	var formname = form.name;
	var errMsg = '';
	var accountV = form.accountList.value;
	var spl = accountV.split(",");
	 reg = /^[^\s]+@[^\s]+\.[^\s]{2,3}$/;
	

	if (formname == "formSignUp") {

		if (Trim(form.inputEmail.value) == '') {
			errMsg += "Please enter a valid E-mail !!\n";
			
		} else {
			
			if (!reg.test(Trim(form.inputEmail.value))) {
				errMsg += "Wrong E-mail format !!\n";
			} 
		}
		
		
		for ( var key in spl) {
			// alert(spl[key]);
			if (Trim(form.inputEmail.value) == spl[key]) {
				errMsg += "The E-mail account '" + spl[key]
						+ "' has been used, please change it !!";
			}
		}
	} else {
		
	}

	if (errMsg == '') {

		if (formname == "formSignUp") {
			document.getElementById('btnA').style.display = "block";
			document.getElementById('btnV').style.display = "none";
		}

		return true;
	}
	alert(errMsg);
	return false;
}


function post(path, params, method) {
	method = method || "post";
alert(123456);
	var form = document.createElement("form");
	form.setAttribute("method", method);
	form.setAttribute("action", path);

	for ( var key in params) {
		if (params.hasOwnProperty(key)) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);

			form.appendChild(hiddenField);
		}
	}

	document.body.appendChild(form);
	form.submit();
}

function checkLoginData(formName){
	
	var form = document.getElementById(formName);
	var account = form.inputEmail.value;
	var pw = form.inputPassword.value;
	var errMsg = '';

	
	if (Trim(account) == '')
		errMsg += "E-mail account is required !!\n";
	
	if (Trim(pw) == '')
		errMsg += "Password is required !!\n";

	if (errMsg == '') {
		
		var loginData = account + "\n" + pw;
		
		
		
		
		post('pLogin.jsp',{loginToken : loginData});
		return true;
	}
	
	alert(errMsg);
	return false;
}










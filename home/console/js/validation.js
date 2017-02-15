$.getScript('/more2/console/js/blowfish.js', function()
{

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

function checkLoginData(formName){
	var form = document.getElementById(formName);
	var errMsg = '';
	var encrEmail = '';
	var encrPassword = '';
	re = /\W/;
	
	if (Trim(form.inputEmail.value) == '')
		errMsg += "E-mail account is required !!\n";
	
	if (Trim(form.inputPassword.value) == '')
		errMsg += "Password is required !!\n";
	
	
	if (errMsg == '') {
		
		
		form.submit();
		return true;
	}
	alert(errMsg);
	return false;
}







});

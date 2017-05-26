function Trim(x) {
		return x.replace(/^\s+|\s+$/gm, '');
	}

	function formSubmit(formName) {
		var form = document.getElementById(formName);
		form.submit();
	}

	/** Check APP Registration Data & Icon Type * */
	var checkIconType = false;

	function validateAppIcon(file) {
		var ext = file.split(".");
		ext = ext[ext.length - 1].toLowerCase();
		var arrayExtensions = [ "jpg", "png" ];

		if (arrayExtensions.lastIndexOf(ext) == -1) {
			checkIconType = false;
		} else {
			checkIconType = true;
		}
	}

	function checkAppRegiData(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;
		var IconCheck = form.inputIcon.value;
		var errMsg = '';
		re = /\W/;
		reg = /^[^\s]+@[^\s]+\.[^\s]{2,3}$/;

		if (Trim(form.app_name.value) == '')
			errMsg += "Please enter an application name !!\n";
		else {
			if (form.app_name.value.length > 20)
				errMsg += "Application name must be less than 20 characters !!\n";
		}

		if (IconCheck != '' && checkIconType == false)
			errMsg += 'Wrong image type !!\n';

		if (Trim(form.user_name.value) == '')
			errMsg += "Organization field is required !!\n";

		if (Trim(form.user_email.value) == '')
			errMsg += "E-mail field is required !!\n";
		else {
			if (!reg.test(Trim(form.user_email.value))) {
				errMsg += "Wrong E-mail format !!\n";
			}
		}

		if (Trim(form.user_phone.value) == '')
			errMsg += "Phone field is required !!\n";

		if (errMsg == '') {
			form.submit();
			return true;
		}
		alert(errMsg);
		return false;
	}


	/*** app list ***/ 
	
function showAppInfo(aName, aId, sOrgan, sEmail, sPhone, os, aCate, aIcon) {
	document.getElementById("InfoAppName").innerHTML = aName;
	document.getElementById("InfoAppId").innerHTML = aId;
	document.getElementById("InfoOrganization").innerHTML = sOrgan;
	document.getElementById("InfoEmail").innerHTML = sEmail;
	document.getElementById("InfoPhone").innerHTML = sPhone;
	document.getElementById("InfoAppCate").innerHTML = aCate;
	document.getElementById("app_id").value = aId;
	var icon = document.getElementById("InfoAppIcon");
	icon.src = "/more" + aIcon;
	
	if (os == "android")
		{
		document.getElementById("iconApple").style.display = "none";
		document.getElementById("iconAndroid").style.display = "block";
		}
	if (os == "ios")
		{
		document.getElementById("iconAndroid").style.display = "none";
		document.getElementById("iconApple").style.display = "block";
		}
	
	//edit app info
	document.getElementById("app_name").value = aName;
	document.getElementById("app_os").value = os;
	document.getElementById("app_category").value = aCate;
	document.getElementById("user_name").value = sOrgan;
	document.getElementById("user_email").value = sEmail;
	document.getElementById("user_phone").value = sPhone;
	//delete app confirm
	document.getElementById("DeleteAppConfirm").innerHTML = aName;
}


function checkAppInfoEdit(formName){
	var form = document.getElementById(formName);
	var formname = form.name;
	var IconCheck = form.app_icon.value;
	var errMsg = '';
	re = /\W/;
	reg = /^[^\s]+@[^\s]+\.[^\s]{2,3}$/;

	if (Trim(form.app_name.value) == '')
		errMsg += "Please enter an application name !!\n";
	else {
		if (form.app_name.value.length > 20)
			errMsg += "Application name must be less than 20 characters !!\n";
	}

	if (IconCheck != '' && checkIconType == false)
		errMsg += 'Wrong image type !!\n';

	if (Trim(form.user_name.value) == '')
		errMsg += "Organization field is required !!\n";

	if (Trim(form.user_email.value) == '')
		errMsg += "E-mail field is required !!\n";
	else {
		if (!reg.test(Trim(form.user_email.value))) {
			errMsg += "Wrong E-mail format !!\n";
		}
	}

	if (Trim(form.user_phone.value) == '')
		errMsg += "Phone field is required !!\n";

	if (errMsg == '') {
		form.submit();
		return true;
	}
	alert(errMsg);
	return false;
}










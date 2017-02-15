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
	re = /\W/;

	if (formname == "formAddGroup") {
		if (Trim(form.account.value) == '')
			errMsg += "Please enter a login account !!\n";
		else {
			if (re.test(Trim(form.account.value))) {
				errMsg += "Login account must contain only alphanumeric characters !!\n";
			} else {
				if (form.account.value.length > 20)
					errMsg += "Login account must be less than 20 characters !!\n";
			}
		}
		for ( var key in spl) {
			// alert(spl[key]);
			if (Trim(form.account.value) == spl[key]) {
				errMsg += "The login account '" + spl[key]
						+ "' has been used, please change it !!";
			}
		}
	}

	if (formname == "formEditGroup") {
		if (Trim(form.GroupEditAccount.value) == '')
			errMsg += "Please enter a login account !!\n";
		else {
			if (re.test(Trim(form.GroupEditAccount.value))) {
				errMsg += "Login account must contain only alphanumeric characters !!\n";
			} else {
				if (form.GroupEditAccount.value.length > 20)
					errMsg += "Login account must be less than 20 characters !!\n";
			}
		}
		var oAccount = Trim(form.originalAccount.value);
		for ( var key in spl) {
			// alert(spl[key]);
			if (Trim(form.GroupEditAccount.value) == spl[key]
					&& Trim(form.GroupEditAccount.value) != oAccount) {
				errMsg += "The login account '" + spl[key]
						+ "' has been used, please change it !!";
			}
		}
	}

	if (errMsg == '') {

		if (formname == "formAddGroup") {
			document.getElementById('btnA').style.display = "block";
			document.getElementById('btnV').style.display = "none";
		}

		if (formname == "formEditGroup") {
			document.getElementById('btnA2').style.display = "block";
			document.getElementById('btnV2').style.display = "none";
		}

		return true;
	}
	alert(errMsg);
	return false;
}

function checkGroupAddData(formName) {
	var form = document.getElementById(formName);
	var btnA = document.getElementById("btnA");
	var errMsg = '';
	re = /\W/;

	if (Trim(form.group_name.value) == '')
		errMsg += "Please enter a group name !!\n";
	else {
		if (form.group_name.value.length > 20)
			errMsg += "Group name must be less than 20 characters !!\n";
	}

	if (Trim(form.account.value) == '')
		errMsg += "Please enter a login account !!\n";
	else {
		if (re.test(Trim(form.account.value))) {
			errMsg += "Login account must contain only alphanumeric characters !!\n";
		} else {
			if (form.account.value.length > 20)
				errMsg += "Login account must be less than 20 characters !!\n";
		}
	}

	if (Trim(form.password.value) == '')
		errMsg += "Please enter a password !!\n";
	else {
		if (re.test(Trim(form.password.value))) {
			errMsg += "Password must contain only alphanumeric characters !!\n";
		} else {
			if (form.password.value.length > 20)
				errMsg += "Password must be less than 20 characters !!\n";
		}
	}

	if (document.getElementById("btnA").style.display == "none")
		errMsg += "Please verify your login account !!\n";

	if (errMsg == '') {
		form.submit();
		return true;
	}
	alert(errMsg);
	return false;
}

function checkGroupEditData(formName) {
	var form = document.getElementById(formName);
	var btnA2 = document.getElementById("btnA2");
	var errMsg = '';
	re = /\W/;

	if (Trim(form.GroupEditAccount.value) == '')
		errMsg += "Please enter a login account !!\n";
	else {
		if (re.test(Trim(form.GroupEditAccount.value))) {
			errMsg += "Login account must contain only alphanumeric characters !!\n";
		} else {
			if (form.GroupEditAccount.value.length > 20)
				errMsg += "Login account must be less than 20 characters !!\n";
		}
	}

	if (Trim(form.GroupEditPassword.value) == '')
		errMsg += "Please enter a password !!\n";
	else {
		if (re.test(Trim(form.GroupEditPassword.value))) {
			errMsg += "Password must contain only alphanumeric characters !!\n";
		} else {
			if (form.GroupEditPassword.value.length > 20)
				errMsg += "Password must be less than 20 characters !!\n";
		}
	}

	if (document.getElementById("btnA2").style.display == "none")
		errMsg += "Please verify your login account !!\n";

	if (errMsg == '') {
		form.submit();
		return true;
	}
	alert(errMsg);
	return false;
}


/** Check Content Type * */
var checkContentType = false;

function validateContent(file) {
	var ext = file.split(".");
	ext = ext[ext.length - 1].toLowerCase();
	var arrayExtensions = [ "jpg", "png", "bmp", "gif", "doc", "docx", "ppt",
			"pptx", "xls", "xlsx", "txt", "pdf" ];

	if (arrayExtensions.lastIndexOf(ext) == -1) {
		checkContentType = false;
	} else {
		checkContentType = true;
	}
}

function checkContentAddData(formName) {

	var form = document.getElementById(formName);
	var errMsg = '';
	var fileCheck = form.inputContent;

	if (Trim(form.alias.value) == '')
		errMsg += "Please enter an alias !!\n";

	if (fileCheck.value == '')
		errMsg += "Please select a file !!\n";
	else {
		if (checkContentType == false)
			errMsg += "Wrong extension type !!\n";
	}

	if (errMsg == '') {
		form.submit();
		return true;
	}
	alert(errMsg);
	return false;
}

/** Check APK & Icon Type * */
var checkAPKType = false;
var checkIconType = false;

function validateAPK(file) {
	var ext = file.split(".");
	ext = ext[ext.length - 1].toLowerCase();
	var arrayExtension = [ "apk" ];

	if (arrayExtension.lastIndexOf(ext) == -1) {
		checkAPKType = false;
	} else {
		checkAPKType = true;
	}
}

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

function checkAPKAddData(formName) {
	var form = document.getElementById(formName);
	var errMsg = '';
	var APKCheck = form.inputAPK;
	var IconCheck = form.inputIcon.value;
	
	if (Trim(form.app_name.value) == '')
		errMsg += "Please enter your app name !!\n";

	if (IconCheck != '' && checkIconType == false)
		errMsg += 'Wrong image type !!\n';
	
	if (APKCheck.value == '')
		errMsg += "Please select an APK file !!\n";
	else {
		if (checkAPKType == false)
			errMsg += "File input must be an APK file !!\n";
	}

	if (errMsg == '') {
		form.submit();
		return true;
	}
	alert(errMsg);
	return false;
}

/** test * */
/*
 * function getExtension(filename) { var parts = filename.split('.'); return
 * parts[parts.length - 1]; }
 * 
 * function isImage(filename) { var ext = getExtension(filename); switch
 * (ext.toLowerCase()) { case 'jpg': case 'gif': case 'bmp': case 'png': return
 * true; } return false; }
 * 
 * function isText(filename) { var ext = getExtension(filename); switch
 * (ext.toLowerCase()) { case 'doc': case 'docx': case 'ppt': case 'pptx': case
 * 'xls': case 'xlsx': case 'txt': case 'pdf':
 * 
 * return true; } return false; }
 * 
 * $(function() { $('#formUploadContent') .submit( function() { function
 * failValidation(msg) { alert(msg); // just an alert for now but you can //
 * spice this up later return false; }
 * 
 * var file = $('#file'); var imageChosen = $('#type-1').is(':checked'); if
 * (imageChosen && !isImage(file.val())) { return failValidation('Please select
 * a valid file'); } else if (!imageChosen && !isText(file.val())) { return
 * failValidation('Please select a valid file.'); } // success at this point //
 * indicate success with alert for now alert('Valid file! Here is where you
 * would return true to allow the form to submit normally.'); return true; //
 * prevent form submitting anyway - // remove this in your environment });
 * 
 * });
 */
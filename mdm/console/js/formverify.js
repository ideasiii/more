


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



function showBtnV(formName) {
	var form = document.getElementById(formName);
	var formname = form.name;

	if (formname == "formEditGroup") {
		document.getElementById("btnA2").style.display = "none";
		document.getElementById("btnV2").style.display = "block";
	}

	if (formname == "formAddGroup") {
		document.getElementById("btnA").style.display = "none";
		document.getElementById("btnV").style.display = "block";
	}
}

//	function changeBtn() {
//		var form = document.getElementById(formName);
//		document.getElementById("btnV").style.display = "none";
//		document.getElementById("btnA").style.display = "block";	}

function showGN(gName, gId, gAccount, gPw, gMax) {
	//alert(gId);
	document.getElementById("GroupDeleteConfirm").innerHTML = gName;
	document.getElementById("GroupEditName").innerHTML = gName;
	document.getElementById("CMGroupName").innerHTML = gName;
	document.getElementById("AMGroupName").innerHTML = gName;
	var form = document.getElementById("formDeleteGroup");
	form.group_id.value = gId;
	var form = document.getElementById("formEditGroup");
	form.group_id.value = gId;
	var form = document.getElementById("formUploadContent");
	form.group_id.value = gId;
	var form = document.getElementById("formUploadApp");
	form.group_id.value = gId;
	document.getElementById("GroupEditAccount").value = gAccount;
	document.getElementById("originalAccount").value = gAccount;
	document.getElementById("GroupEditPassword").value = gPw;
	document.getElementById("GroupEditMaximum").value = gMax;

}

function showContentGN(gName, gId, uEmail)
{
	var form = document.getElementById("FormHomeShowContent");
	form.group_id.value = gId;
	form.group_name.value = gName;
	form.user_email.value = uEmail;
	form.submit();
}
	
function showAppGN(gName, gId, uEmail)
{
	var form = document.getElementById("FormHomeShowApp");
	form.group_id.value = gId;
	form.group_name.value = gName;
	form.user_email.value = uEmail;
	form.submit();
}

function getContentFN(cFN, gId, cAlias)
{
	var form = document.getElementById("formDeleteContent");
	form.file_name.value = cFN;
	document.getElementById("DeleteContentName").innerHTML = cAlias;
}

function getAppFN(aFN, gId, appName)
{
	var form = document.getElementById("formDeleteApp");
	form.apk_file_name.value = aFN;
	document.getElementById("DeleteAppName").innerHTML = appName;
}
function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}

function checkControllerId(item, act) {
	var form = document.getElementById('formControllerJob');
	
	form.control_id.value = item;
	form.action.value = act;

	form.submit();

}

//Screen Lock on
function checkScreenLockInput(item, act){
	var form = document.getElementById('formScreenLock');
	
	form.control_id.value = item;
	form.action.value = act;

	form.submit();
	
}
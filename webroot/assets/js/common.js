/**
 * 
 */

var bttn = { "text": "", "count": 0, "href": "", "onclick": ""};

	
function validateEmail(email) {

	var filter = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	var msg = null;
    
    if (!filter.test(email)) {
    	
    	msg = "Please enter valid email address";
    }
    
    return msg;
}

function validatePassword (input) {
	
	var regex = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	var msg = null;
	
	if (regex.test(input) == false) {
		msg = 'Please enter valid password.,Password must contains one digit from 0-9,One lowercase characters,One uppercase characters,One special symbols in the list "@#$%\",At least 6 characters and maximum of 20';
    } 

    return msg;
}

function getErrorMessage (req, supportEmail) {
	
	var msg = null;
	if (req.status == 0) {
		msg = "Status: " + req.status + ", Message: Please check your internet connection.";
    } else if (req.status == 404) {
    	msg = "Status: "+ req.status + ", Message: Requested URL not found. Please reach to "+supportEmail;
    } else if (req.status == 500) {
    	msg = "Status:" + req.status + ", Message: Internel Server Error. Please reach to " + supportEmail;
    } else if (req.status == 400) {     
    	msg = "Status: " + req.status + ", Message: Bad Request. Please reach to " + supportEmail;
    } else {
    	msg = "Status: " + req.status + ", Message: Unknown error - Please reach to " + supportEmail + " \n " +req.responseText;
    }
	
	return msg;
}

function getURLParam(param) {
	
	try {
		
		//var queryString = window.location.search;
		//var urlParams = new URLSearchParams(queryString);
		
		//return (urlParams) ? urlParams.get(param) : null;
		
		var results = new RegExp('[\?&]' + param + '=([^&#]*)').exec(window.location.href);
	    if (results == null){
	    	
	       return "";
	    }
	    else {
	    	
	       return decodeURI(results[1]) || 0;
	    }
	} catch(e) {
		
		console.log("Failed to get parameter ${param} from URL due to: " + e.message);
	}
}

function encodeTxt(input) {
	
	return (input) ? btoa(input) : null;
}

function decodeTxt(input) {
	
	return (input) ? atob(input) : null;
}

function getBttnClassName(appType) {

	switch(appType) {
	case "HeapHero":
		return "heap-submit-bttn";
	case "fastThread":
		return "ft-submit-bttn";
	default:
		return "btn-submit";
	}
}
function getConfirmationModalBtn(appType, bttn) {
	var btnClass = getBttnClassName(appType);
	if((bttn.count < 2)) {
		
		return "<div class=\"col-md-6 col-md-offset-3 col-sm-12 col-xs-12 text-center\">" +
					"<a type=\"submit\" class=\""+btnClass+" btn-effect\" id=\"common_modal_btn\">"+bttn.text+"</a>" +
				"</div>";
						
	} else {
		
		return  "<div class=\"col-md-4 col-md-offset-2 col-sm-6 col-xs-12 mob-m-b-20\">" +
					"<button type=\"submit\" class=\"btn-submit btn-effect\" id=\"modal_yes_btn\">Yes, go ahead!</button>" +
				"</div>" +
				"<div class=\"col-md-4 col-sm-6 col-xs-12\">" +
					"<button type=\"submit\" class=\"btn-submit btn-effect\" id=\"modal_no_btn\" data-dismiss=\"modal\">No, I am good!</button>" +
				"</div>";
	}
}

function buildModal(title, content, bttnObj, appType) {
	
	$("#common_modal_title").empty();
	$("#common_content").empty();
	$("#common_footer_btn").empty();
	
	var bttns = getConfirmationModalBtn(appType, bttnObj);
	
	// Appending title in the modal. If title is not there then appending default title
	var titleMsg = (title) ? title : "Confirmation Message";
	 $("#common_modal_title").text(titleMsg);
	 
	// Appending the mmodal body
	$("#common_content").html(content);
	
	// Appending the buttons in the footer
	if(bttnObj.count < 2) {
		// If we want to display only one button in the modal
		$("#common_footer_btn").append(bttns);
		if (bttnObj.href) {
			
			 $("#common_modal_btn").attr("href", bttnObj.href)
		} else {
			
			 $("#common_modal_btn").attr("data-dismiss", "modal");
		}
	} else {
		// If we want to display two buttons in the modal
		$("#common_footer_btn").append(bttns);
		if((bttnObj.onclick)) {
			$("#modal_yes_btn").attr("onclick", bttnObj.onclick);
		}
		
		var noBtn = (appType.toLowerCase() === "gceasy") ? "modal-no-btn" : "ft-modal-no-btn";
		
		$("#modal_no_btn").addClass(noBtn);
	}
	
	document.getElementById('open_common_modal').click();
}

/*
 * This function is used to detect whether the given string contains HTML syntax or not
 * */
function isHTML(str) {
	
	if(str) {
		return /<\/?[a-z][\s\S]*>/i.test(str);
	}
	
	return false;
}

function getCaptchaScale(screen) {
	
	var scale = 1.35;

    if(screen < 270) {
    	scale = 0.75;
    }
    
    if(screen > 270 && screen < 405) {
    	scale = 1;
    }
    
    if(screen > 405 && screen < 992) {
    	scale = 1.27;
    }
    
    if(screen > 991 && screen < 1200) {
    	scale = 1.22;
    }
    
    if(screen > 1199) {
    	scale = 1.35;
    }
    
    return scale;
}

/**
 * This function is used to build the container for the error message
 * */
function buildErrorContainer() {
	
	var error = "<div class=\"row equal-col-height error-msg txt-left m-r-0 m-l-0\" id=\"\">" +
					"<div class=\"col-md-1 col-sm-1 col-xs-1 img-container\">" +
						"<i class=\"fa fa-times-circle font-20\" aria-hidden=\"true\"></i>" +
					"</div>" +
					"<div class=\"col-md-11 col-sm-11 col-xs-11\">" +
						"<span class=\"\"></span>" +
					"</div>" +
				"</div>";
	
	return error;
}

/**
 * This function is used to show validation errors or general error
 * messages on the screen
 * 
 * */
function showError(arr) {
	
	for(var index in arr) {
		
		var id = arr[index].id;
		var message = arr[index].message;
		var fieldName = arr[index].fieldName;
		
		if($("#" + id + "_err_msg").length > 0) {
			
			// 1. Build the container for error message
			$("#" + id + "_err_msg").html(buildErrorContainer());
			
			// 2. Remove display-none from the DIV
			$("#" + id + "_err_msg").removeClass("display-none");
			
			// 3. Add error message in the error container
			$("#" + id + "_err_msg span").html(message);
			
			/*// Name filed
			if(fieldName === "name") {
				
				$("#" + id + "_err_msg span").html(message);
			}
			
			// Email field
			if(fieldName === "email") {
				
				$("#" + id + "_err_msg span").html(message);
			}
			
			// Password field
			if(fieldName === "password") {
				
				$("#" + id + "_err_msg span").html(message);
			}
			
			// Company Name field
			if(fieldName === "companyName") {
				
				$("#" + id + "_err_msg span").html(message);
			}
			
			// Common Message
			if(fieldName === "commonMsg") {
				
				$("#" + id + "_err_msg span").html(message);
			}*/
		}
		
		// 4. Add red border line to the input fields
		if($("#" + id).length > 0) {
			$("#" + id).addClass("error-input-border");
		}
	}
}

/**
 * This function is used to hide error messages on the screen
 * 
 * */
function hideError(eleIds) {
	
	for(var i=0; i<=eleIds.length; i++) {
		
		if($("#" + eleIds[i] + "_err_msg").length > 0) {
			$("#" + eleIds[i] + "_err_msg").addClass("display-none");
		}
		
		if($("#" + eleIds[i]).length > 0) {
			$("#" + eleIds[i]).removeClass("error-input-border");
		}
	}
}

/**
 * This function is used to remove the red border line from the multiple input
 * 
 * */
/*function removeErrorBorderLine() {
	
	var elements = document.querySelectorAll('.error-input-border');
	
	for (var i = 0; i < elements.length; i++) {
		elements[i].classList.remove("error-input-border");
	}
}*/

/**
 * This function is used to removed all validation messages present on the current page
 * 
 * */
function removeAllErrors() {
	
	// Removing all validation messages
	$(".error-msg").parent().each(function() {    
	    $("#" + this.id).addClass("display-none");
	});
	
	// Removing red border from all fields present on the current page
	$(".error-input-border").each(function() {    
	    $("#" + this.id).removeClass("error-input-border");
	});
	
	/*var elements = document.querySelectorAll('.error-input-border');
	
	for (var i = 0; i < elements.length; i++) {
		elements[i].classList.remove("error-input-border");
	}*/
}

function isEmpty(str) {
	
	return str === null || str === undefined || str.match(/^ *$/) !== null;
}

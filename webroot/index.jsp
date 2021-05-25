
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file = "buggyapp-header.jsp" %>
</head>
<body>
<div id="page" class="page-other">
<%@ include file = "buggyapp-menu.jsp" %>

<div id="buggyapp-page">
	<div id="buggyapp-content" class ="padding-150 mob-padding-0">
		<div class ="row">
			<div class ="col-md-12">
				<h1 class ="txt-center margin-30 mob-m-30">BuggyApp - Chaos Engineering</h1>
				<p class="text-center m-t-15">BuggyApp can simulate various performance problems like Memory Leak, OutOfMemoryError, CPU spike, thread leak </br>StackOverflowError, deadlock, unresponsiveness and so on</p>
			</div>
		</div>
		<div class="flex-c margin-6 column-grid" id="chartRow">
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18">OutOfMemoryError</h2>
	       		<div class="tools-box">
		       		<img class="w-100" src="assets/images/outofmemoryerror.png" alt="OutOfMemoryError">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content">To generate java.lang.OutOfMemoryError</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "oom_start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_OOM', 'true');">
						       start
					</a>
					<a class = "buugyapp-btn display-none" id = "oom_stop" type="button" onclick="buggyApp('PROBLEM_OOM', 'false');">
						       stop
					</a>
				</div>
	  		</div>
	       <div class="box box-33-d box-100-t box-100-m mob-padding-0">
	       		<h2 class = "txt-center margin-18">Memory Leak</h2>
	          	<div class="tools-box">
		          	<img class="w-100" src="assets/images/memoryleak.png" alt="Memory Leak">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To simulate a slow memory leak in application</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "memory_leak_start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_MEMORY', 'true');">
						       start
					</a>
					<a class = "buugyapp-btn display-none" id = "memory_leak_stop" type="button" onclick="buggyApp('PROBLEM_MEMORY', 'false');">
						       stop
					</a>
				</div>
   			</div>
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18">CPU spike</h2>
	  			<div class="tools-box">
		   		 	<img class="w-100" src="assets/images/cpuspike.png" alt="CPU spike">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To make CPU consumption to go up to 80 – 90%</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "cpu-start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_CPU', 'true');">
						       start
					</a>
					<a class = "buugyapp-btn display-none" id = "cpu-stop" type="button" onclick="buggyApp('PROBLEM_CPU', 'false');">
						       stop
					</a>
				</div>
			</div>
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18">Thread Leak</h2>
	  			<div class="tools-box">
		   		 	<img class="w-100" src="assets/images/threadleak.png" alt="Thread Leak">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To keep spawning new threads repeatedly</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "threadleak-start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_THREADLEAK', 'true');">
						       start
					</a>
					<a class = "buugyapp-btn display-none" id = "threadleak-stop" type="button" onclick="buggyApp('PROBLEM_THREADLEAK', 'false');">
						       stop
					</a>
				</div>
			</div>
		</div>
		<div class="flex-c margin-6 column-grid" id="chartRow">
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18">Deadlock</h2>
			  	<div class="tools-box">
				   	<img class="w-100" src="assets/images/deadlock.png" alt="Deadlock">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To simulate deadlock between two threads</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "deadlock-start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_DEADLOCK', 'true');">
						start
					</a>
					<a class = "buugyapp-btn display-none" id = "deadlock-stop" type="button" onclick="buggyApp('PROBLEM_DEADLOCK', 'false');">
						stop
					</a>
				</div>
			</div>
			
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18"> Stackoverflow Error</h2>
	  			<div class="tools-box">
		   		 	<img class="w-100" src="assets/images/stackoverflow.png" alt="Stackoverflow Error">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To simulate thread StackOverflowError</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "stackoverflow-start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_STACKOVERFLOW', 'true');">
						      start
					</a>
					<a class = "buugyapp-btn display-none" id = "stackoverflow-stop" type="button" onclick="buggyApp('PROBLEM_STACKOVERFLOW', 'false');">
						      stop
					</a>
				</div>
			</div>
			
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18"> Blocked Threads</h2>
	  			<div class="tools-box">
		   		 	<img class="w-100" src="assets/images/Blockedthread.png" alt="Blocked Threads">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To put multiple threads in BLOCKED state</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "blockedthread-start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_BLOCKED', 'true');">
						       start
					</a>
					<a class = "buugyapp-btn display-none" id = "blockedthread-stop" type="button" onclick="buggyApp('PROBLEM_BLOCKED', 'false');">
						       stop
					</a>
				</div>
			</div>
			
			<div class="box box-33-d box-100-t box-100-m mob-padding-0">
				<h2 class = "txt-center margin-18"> Heavy I/O</h2>
	  			<div class="tools-box">
		   		 	<img class="w-100" src="assets/images/heavyio.png" alt="Heavy I/O">
				</div>
				<div class="tools-box-content buggyapp-tool-content mob-ee-tool-content">
					<p class="box-content"> To simulate heavy I/O activity in application</p>
				</div>
				<div class="start-btn api-start-button">
					<a class = "buugyapp-btn" id = "io-start" type="button" style="margin: 20px;" onclick="buggyApp('PROBLEM_IO', 'true');">
						       start
					</a>
					<a class = "buugyapp-btn display-none" id = "io-stop" type="button" onclick="buggyApp('PROBLEM_IO', 'false');">
						       stop
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@include file="confirmation-modal.jsp" %>
<!-- start-footer -->
<%@ include file = "buggyapp-footer.jsp" %>
</div>
<!-- end-footer -->

<script id="jquery" type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
<script>
document.getElementById("year").innerHTML = new Date().getFullYear();

function buggyApp(buggyAppType, flag) {
	
	try {
		
		if(flag == "true"){
			startButton(buggyAppType);
		} else {
			stopButton(buggyAppType);
		}
		$.ajax({
			
 			type: "POST",
 			url : "./launch-buggyapp",
 		    data: {
 		    	
 		    	"buggyAppType": buggyAppType,
 		    	"flag":flag
 		    },
 		    success: function(response) {
 		    	
 		    	var btn = { "text": "Close", "count": 1, "onclick":"", "href": ""};
 		    	buildModal(response.title, response.description, btn, null);
 		    },
 		   	error: function (err) {
 		   		
 			   console.log("Error while launching app - " + getErrorMessage(err));
 		   	}
 		    
 		});
	} catch(e) {
		
		console.log("Failed to launching app - " + JSON.stringify(e));
	}
}

function startButton(buggyAppType){
	
	switch(buggyAppType) {
	
	  case "PROBLEM_OOM":
		  
		  	$("#oom_start").removeClass("display-unset");
			$("#oom_start").addClass("display-none");
			$("#oom_stop").removeClass("display-none");
			$("#oom_stop").addClass("display-unset");
	    	break;
	    
		case "PROBLEM_MEMORY":
			$("#memory_leak_start").removeClass("display-unset");
			$("#memory_leak_start").addClass("display-none");
			$("#memory_leak_stop").removeClass("display-none");
			$("#memory_leak_stop").addClass("display-unset");
			break;
			
		case "PROBLEM_CPU":
			$("#cpu-start").removeClass("display-unset");
			$("#cpu-start").addClass("display-none");
			$("#cpu-stop").removeClass("display-none");
			$("#cpu-stop").addClass("display-unset");
			break;
			
		case "PROBLEM_THREADLEAK":
			$("#threadleak-start").removeClass("display-unset");
			$("#threadleak-start").addClass("display-none");
			$("#threadleak-stop").removeClass("display-none");
			$("#threadleak-stop").addClass("display-unset");
			break;

		case "PROBLEM_BLOCKED":
			$("#blockedthread-start").removeClass("display-unset");
			$("#blockedthread-start").addClass("display-none");
			$("#blockedthread-stop").removeClass("display-none");
			$("#blockedthread-stop").addClass("display-unset");
			break;

		case "PROBLEM_DEADLOCK":
			$("#deadlock-start").removeClass("display-unset");
			$("#deadlock-start").addClass("display-none");
			$("#deadlock-stop").removeClass("display-none");
			$("#deadlock-stop").addClass("display-unset");
			break;

		case "PROBLEM_STACKOVERFLOW":
			$("#stackoverflow-start").removeClass("display-unset");
			$("#stackoverflow-start").addClass("display-none");
			$("#stackoverflow-stop").removeClass("display-none");
			$("#stackoverflow-stop").addClass("display-unset");
			break;
			
		case "PROBLEM_IO":
			$("#io-start").removeClass("display-unset");
			$("#io-start").addClass("display-none");
			$("#io-stop").removeClass("display-none");
			$("#io-stop").addClass("display-unset");
			break;				
		}
	}
	
	
function stopButton(buggyAppType){
	
	switch(buggyAppType) {
	
	  case "PROBLEM_OOM":
		  
		  	  $("#oom_stop").removeClass("display-unset");
			  $("#oom_stop").addClass("display-none");
			  $("#oom_start").removeClass("display-none");
			  $("#oom_start").addClass("display-unset");
	
	    break;
		case "PROBLEM_MEMORY":
				$("#memory_leak_stop").removeClass("display-unset");
				$("#memory_leak_stop").addClass("display-none");
				$("#memory_leak_start").removeClass("display-none");
				$("#memory_leak_start").addClass("display-unset")
			break;
			
		case "PROBLEM_CPU":
				$("#cpu-stop").removeClass("display-unset");
				$("#cpu-stop").addClass("display-none");
				$("#cpu-start").removeClass("display-none");
				$("#cpu-start").addClass("display-unset");
			break;
			
		case "PROBLEM_THREADLEAK":
				$("#threadleak-stop").removeClass("display-unset");
				$("#threadleak-stop").addClass("display-none");
				$("#threadleak-start").removeClass("display-none");
				$("#threadleak-start").addClass("display-unset");
			break;

		case "PROBLEM_BLOCKED":
				$("#blockedthread-stop").removeClass("display-unset");
				$("#blockedthread-stop").addClass("display-none");
				$("#blockedthread-start").removeClass("display-none")
				$("#blockedthread-start").addClass("display-unset");
			break;

		case "PROBLEM_DEADLOCK":
				$("#deadlock-stop").removeClass("display-unset");
				$("#deadlock-stop").addClass("display-none");
				$("#deadlock-start").removeClass("display-none")
				$("#deadlock-start").addClass("display-unset");
			break;

		case "PROBLEM_STACKOVERFLOW":
				$("#stackoverflow-stop").removeClass("display-unset");
				$("#stackoverflow-stop").addClass("display-none");
				$("#stackoverflow-start").removeClass("display-none");
				$("#stackoverflow-start").addClass("display-unset");
			break;
			
		case "PROBLEM_IO":
				$("#io-stop").removeClass("display-unset");
				$("#io-stop").addClass("display-none");
				$("#io-start").removeClass("display-none");
				$("#io-start").addClass("display-unset");
			break;				
		}
	}
</script>
</body>
</html>
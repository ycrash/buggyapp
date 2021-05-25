<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buggy-App</title>
<link rel="icon" href="assets/images/BuggyAppFavicon.png">
</head>
<body>

Buggy App is a simple java application that simulates different performance problems like Memory Leak, OutOfMemoryError, CPU spike, thread leak, StackOverflowError, deadlock, unresponsiveness,<br><br>

 Using this application, you can simulate various performance problems in your environment. Here are a few use cases where Buggy App can be used: <br><br>

a. You can configure and launch Buggy App to consume high memory on the same server where your application is running. You can study under this circumstance whether your application's SLA (Service Level Agreement) is impacted.<br><br>

b. You can configure and launch Buggy App in a docker container to consume high CPU and see whether other containers on the same host are impacted or not.<br><br>

c. If you are building performance tools or monitoring tools, you can simulate various performance degradations using Buggy App and see whether your tools address those performance probelms. (Infact we developed this BuggyApp to validate our root cause analysis tool yCrash behaviour.)<br><br>

<h2> Download </h2>

You can download<br><br>

1. Buggy App from <a href ="https://tier1app.com/dist/buggyapp/buggyApp.jar">this location</a><br><br>

2. Source code (if it's of interest) from <a href="https://tier1app.com/dist/buggyapp/buggyApp-src.zip">this location</a><br><br>

To run Buggy App, you will need <a href="https://www.oracle.com/in/java/technologies/javase/javase-jdk8-downloads.html">Java 8</a> or above version installed.<br><br>

<h2>Performance Problems</h2>
 
Here are the performance problems that you can simulate through Buggy App:

<h3>1. OutOfMemoryError: Java heap space</h3>
 To generate 'java.lang.OutOfMemoryError: Java heap space' launch Buggy App with following arguments:

<pre>java -Xmx512m -jar buggyApp.jar PROBLEM_OOM</pre>

<h3>2. Memory Leak</h3>
 If you would like to simulate a memory leak without experiencing OutOfMemoryError, then launch Buggy App with the following arguments. 

 <pre>java -jar buggyApp.jar PROBLEM_MEMORY</pre>
 When you launch the Buggy App with these arguments, 80% - 90% of the allocated memory will be consumed. But it will not result in OutOfMemoryError.

<h3>3. CPU spike</h3>
 If you would like the CPU consumption to go up to 80 - 90% then launch the Buggy App with following arguments:

<pre> java -jar buggyApp.jar PROBLEM_CPU</pre>
<h3>4. Thread Leak</h3>
 If you would like the application to keep slowly spawning new threads, then launch the Buggy App with the following arguments.

<pre>java -jar buggyApp.jar PROBLEM_THREADLEAK</pre>
When you launch the Buggy App with these arguments eventually  'java.lang.OutOfMemoryError: Unable to create new native thread' will be generated.

<h3>5. Deadlock</h3>
 If you would like the application to experience Deadlock, then launch the Buggy App with the following arguments.

 <pre>java -jar buggyApp.jar PROBLEM_DEADLOCK</pre>
<h3>6. Stackoverflow Error</h3>
 If you would like the application to experience 'java.lang.StackOverflowError', then launch the Buggy App with the following arguments.

 <pre>java -jar buggyApp.jar PROBLEM_STACKOVERFLOW</pre>
<h3>7. Blocked Threads</h3>
 If you would like to put multiple threads in BLOCKED state, then launch the Buggy App with the following arguments.

<pre> java -jar buggyApp.jar PROBLEM_BLOCKED</pre>
<h3>8. Heavy I/O</h3>
 If you would like to simulate heavy I/O activity, then launch the Buggy App with the following arguments.

 <pre>java -jar buggyApp.jar PROBLEM_IO</pre>
When you launch buggyApp with this argument, application will create 5 unique files by name: fileIO-1.txt, fileIO-2.txt, fileIO-3.txt, fileIO-4.txt, fileIO-5.txt. Then 20 lines of contents will be written in to this file and read back again and again infinietly. It will cause heavy I/O activity on the host.
</body>
</html>
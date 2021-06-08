# How to Run BuggyApp in Web #

1. Make sure java8 and above version is installed on the machine.

2. In the current folder you will find the script to launch Buggyapp. Based on your Operating System, invoke appropriate launch script.

Windows: c:\workspace\buggyapp\launch.bat
Unix/Linux: /opt/workspace/buggyapp/launch.sh

3. BuggyApp can be accessed from your browser in the URL http://localhost:9010/

# How to Run BuggyApp in Command line #

1. Make sure Java 8 and above version is installed on your machine.

2. In the current folder you will find buggyApp.jar file.

3. To simulate CPU spike, invoke buggyappApp.jar with following arguments:
	java -jar buggyApp.jar PROBLEM_CPU
	
Note: To simulate different types of performance problems please refer below link:
https://blog.ycrash.io/2020/10/26/buggy-app-simulate-performance-problems/
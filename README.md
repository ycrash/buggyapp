# BuggyApp Quickstart Guide

[![BuggyApp](https://buggyapp.ycrash.io/assets/buggyapp-index/images/BuggyAppLogo.png)](https://buggyapp.ycrash.io)

BuggyApp is an opensource chaos engineering program that can simulate various performance problems like Memory Leak, OutOfMemoryError, CPU spike, thread leak StackOverflowError, deadlock, unresponsiveness.

## How to build buggyApp locally?

### Pre-requisite:

- [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) or later version
- Apache ant

You can clone the buggyApp repository and build the project on your machine.

```
SSH: git clone git@github.com:ycrash/buggyapp.git
HTTP: git clone https://github.com/ycrash/buggyapp.git
```

Go to the directory where you have cloned buggyapp. Let's say you have cloned the buggyApp project in ```/opt/worskpace``` directory. 

```
cd  /opt/workspace/buggyapp
```

Run the below commands to clean the old build and generate new build:

```
ant clean

ant dist-ee
```

After executing ```ant dist-ee``` command, you will see ```dist``` directory in buggyapp project. The built code will be present inside ```dist/enterpise``` directory in zip format. The zip file contains JAR as well as WAR files.

If you only want to build a JAR file then run the below command:

```
ant dist-cmd
```

## How to run buggyApp locally?

#### a) Run buggyApp as a  web application

1. Download latest buggyapp from [here](https://tier1app.com/dist/buggyapp/buggyapp-latest.zip).

2. Unzip the same to a folder say (i.e. /opt/buggyapp).

3. You will find launch file in the folder once you unzip the file. Based on your Operating System, invoke an appropriate launch script:

```
Windows: c:\workspace\buggyapp\launch.bat

Unix: /opt/workspace/buggyapp/launch.sh
```

You should be able to access buggyApp at <http://localhost:9010>

> *Tip: You can change the port in launch file.*


#### b) Run buggyApp from command line

1. Download latest buggyapp from [here](https://tier1app.com/dist/buggyapp/buggyapp-latest.zip).

2. Unzip the same to a folder say (i.e. /opt/buggyapp).

3. You will find ```buggyApp.jar``` in the folder once you unzip the file. Run the following command to simulate CPU spike:

```
java -jar buggyApp.jar PROBLEM_CPU
```

> *Tip: For more performance problem simulation, [refer here.](https://blog.ycrash.io/2020/10/26/buggy-app-simulate-performance-problems/)*

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[Apache license 2.0](https://www.apache.org/licenses/LICENSE-2.0)
# buggyapp

## Setup

1. You can download the latest built code from [here](https://tier1app.com/dist/buggyapp/buggyapp-latest.zip).

      OR

2. You can clone the buggyApp repository and build the project on your machine.

```
SSH: git clone git@github.com:ycrash/buggyapp.git
HTTP: git clone https://github.com/ycrash/buggyapp.git
```

## How to build buggyApp locally?

### Pre-requisite:

- Java 8 or later version
- Apache ant


Go to the directory where you have cloned buggyapp. Let's say you have cloned the buggyApp project in ```/opt/worskpace``` directory. 

```
cd  /opt/workspace/buggyapp
```

Run the below commands to clean the old build and generate new build

```
ant clean

ant dist-ee
```

After executing ```ant dist-ee``` command, you will see ```dist``` directory in buggyapp project. The built code will be present inside ```dist/enterpise``` directory in zip format. The zip file contains JAR as well as WAR files.

If you only want to build a JAR file then run the below command

```
ant dist-cmd
```

## How to run buggyApp locally?

#### Run buggyApp web application

You will find launch file in the folder once you unzip the file. Run the launch file as shown below

```
Windows: c:\workspace\buggyapp\launch.bat

Unix: /opt/workspace/buggyapp/launch.sh
```

You should be able to access buggyApp at <http://localhost:9010>

> *Tip: You can change the port in launch file.*


#### Run buggyApp from command line

You will find ```buggyApp.jar``` in the folder once you unzip the file. Run the following commad to simulate CPU spike

```
java -jar buggyApp.jar PROBLEM_CPU
```

Here are few more arguments that you can pass in the above command to simulate different type of performance problems.

1. To generate **java.lang.OutOfMemoryError: Java heap space** run the buggyApp.jar with following arguments:

    ```
    java -Xmx512m -jar buggyApp.jar PROBLEM_OOM
    ```

2. If you would like to simulate a **memory leak** without experiencing OutOfMemoryError, then run the buggyApp.jar with following arguments:

   ```
    java -jar buggyApp.jar PROBLEM_MEMORY
   ```
3. If you would like the **CPU consumption** to go up to 80 – 90% then run the buggyApp.jar with following arguments:

   ```
    java -jar buggyApp.jar PROBLEM_CPU
   ```
4. If you would like the application to keep slowly **spawning** new threads, then run the buggyApp.jar with following arguments:

   ```
   java -jar buggyApp.jar PROBLEM_THREADLEAK
   ```
   
5. If you would like the application to experience **Deadlock**, then run the buggyApp.jar with following arguments:

   ```
    java -jar buggyApp.jar PROBLEM_DEADLOCK
   ```
6. If you would like the application to experience **java.lang.StackOverflowError**, then run the buggyApp.jar with following arguments:

   ```
    java -jar buggyApp.jar PROBLEM_STACKOVERFLOW
   ```
7. If you would like to put multiple threads in **BLOCKED** state, then run the buggyApp.jar with following arguments:

   ```
    java -jar buggyApp.jar PROBLEM_BLOCKED
   ```
8. If you would like to simulate heavy **I/O activity**, then run the buggyApp.jar with following arguments:

   ```
    java -jar buggyApp.jar PROBLEM_IO
   ```

> *Note: When you run buggyApp.jar with this argument, application will create 5 unique files by name: fileIO-1.txt, fileIO-2.txt, fileIO-3.txt, fileIO-4.txt, fileIO-5.txt. Then 20 lines of contents will be written in to this file and read back again and again infinietly. It will cause heavy **I/O activity** on the host.*


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[Apache license 2.0](https://www.apache.org/licenses/LICENSE-2.0)
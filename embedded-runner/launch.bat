set "CURRENT_DIR=%cd%"
set "BUGGYAPP_HOME=%CURRENT_DIR%"
java -Xmx2g -DlogDir="%BUGGYAPP_HOME%" -DuploadDir="%BUGGYAPP_HOME%" -jar webapp-runner.jar --port 9010 buggyapp.war
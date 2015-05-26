@echo off 
rem ##############设置延迟环境变量扩充，即感叹号间的值不会因跳出循环而为空值。################
setlocal enabledelayedexpansion 

rem ###############java命令######################
set JAVA=%JAVA_HOME%\bin\java.exe 

rem ###############jvm参数######################
set OPTS=-Xms512M -Xmx512M -Xss128k -XX:+AggressiveOpts -XX:+UseParallelGC -XX:NewSize=64M 

rem ###############agent启动类参数######################
set agentServerMain=com.fengdi.fds.ecommerce.main.EcommerceServer
rem ###############agent服务参数######################
set OPTS=%OPTS% -DlogPath=../logs
set OPTS=%OPTS% -Dconf.config=../confifg/config.properties

echo JAVA: %JAVA% 
echo CLASSPATH: %CP% 
echo OPTS: %OPTS%
java %OPTS%  -cp "../lib/*;../conf" %agentServerMain% 
PAUSE
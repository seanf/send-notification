echo 'Installing 7zip'
choco install -y 7zip.commandline

echo 'Installing Java JDK'
choco install -y jdk8

echo 'Installing .NET Framework (needed by Growl)'
choco install -y dotnet3.5

echo 'Installing Growl for Windows'
choco install -y Growl

echo 'Installing Wget'
choco install -y wget

echo 'Installing Notifu'
wget -O %TEMP%\notifu.zip http://www.paralint.com/projects/notifu/dl/notifu-1.7.zip --no-check-certificate
if exist c:\notifu rd /s /q c:\notifu
mkdir c:\notifu
7za x %TEMP%\notifu.zip -oc:\notifu -r
setx PATH "%PATH%;c:\notifu"

echo 'Installing Toaster'
wget -O %TEMP%\toaster.zip https://github.com/nels-o/toaster/archive/master.zip --no-check-certificate
if exist c:\toaster rd /s /q c:\toaster
mkdir c:\toaster
7za x %TEMP%\toaster.zip -oc:\toaster -r
setx PATH "%PATH%;c:\toaster\toaster-master\toast\bin\Release"

echo 'Installing Snarl'
wget -O %TEMP%\melon.exe http://sourceforge.net/projects/snarlwin/files/Goodies/setup-minimal.exe/download --no-check-certificate
%TEMP%\melon.exe /S
wget -O %TEMP%\snarl.exe http://sourceforge.net/projects/snarlwin/files/latest/download?source=files --no-check-certificate

if NOT %ERRORLEVEL% == 0 exit /B %ERRORLEVEL%
%TEMP%\snarl.exe /S
if %ERRORLEVEL% == 1223 exit /B 0

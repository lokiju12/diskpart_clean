@echo off
title 파티션 삭제 도구
echo.
echo 경고 : 주의!
echo. 
echo 디스크 파티션이 초기화 되고 모든 데이터가 삭제됩니다.
echo.
echo ENTER 키를 입력하면 파티션 삭제를 시작합니다.
echo.
pause>nul
cls

echo.
echo 경고 : 주의!
echo. 
echo 디스크 파티션이 초기화 되고 모든 데이터가 삭제됩니다.
echo.
echo 삭제 대상 디스크의 범위를 입력 하세요.
echo.
set /p start_disk=첫번째 디스크: 
echo.
set /p end_disk=마지막 디스크: 
echo.
echo 정말 삭제하시려면 ENTER 키를 입력하세요
echo.
pause>nul



rem online_disk
for /l %%i in (%start_disk%,1,%end_disk%) do (
    cls
    echo.
	echo.DISK ONLINE
	echo.
	echo DISK NO : %%i
    echo sel disk %%i >> online_disk.txt
    echo online disk >> online_disk.txt
    diskpart /s online_disk.txt
    del online_disk.txt
)

rem Clear_Disk
for /l %%i in (%start_disk%,1,%end_disk%) do (
    cls
    echo.
	echo.DISK CLEAR
	echo.
    echo DISK NO : %%i
    echo sel disk %%i >> Clear_Disk.txt
    echo clean >> Clear_Disk.txt
    echo create part pri >> Clear_Disk.txt
    echo assign >> Clear_Disk.txt
    echo format fs=ntfs quick label="Clear_Disk" >> Clear_Disk.txt
    diskpart /s Clear_Disk.txt
    del Clear_Disk.txt
)

rem black magic 강제종료
taskkill /f /im blackmagic.exe

rem black magic 재실행
"C:\Program Files (x86)\SMS\BlackMagic.exe"


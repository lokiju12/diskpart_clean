@echo off

rem online_disk
for /l %%i in (3,1,10) do (
    echo.
	echo.DISK ONLINE
	echo.
	echo DISK NO : %%i
    echo sel disk %%i >> online_disk.txt
    echo online disk >> online_disk.txt
    diskpart /s online_disk.txt
    del online_disk.txt
    cls
)

rem Clear_Disk
for /l %%i in (3,1,10) do (
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
    cls
)

rem black magic 강제종료
taskkill /f /im blackmagic.exe

rem black magic 재실행
"C:\Program Files (x86)\SMS\BlackMagic.exe"


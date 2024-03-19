@echo off

rem online_disk
for /l %%i in (3,1,10) do (
    echo 선택한 디스크 번호: %%i
    echo sel disk %%i >> online_disk.txt
    echo online disk >> online_disk.txt
    diskpart /s online_disk.txt
    del online_disk.txt
)

rem clean_disk
for /l %%i in (3,1,10) do (
    echo 선택한 디스크 번호: %%i
    echo sel disk %%i >> clean_disk.txt
    echo clean >> clean_disk.txt
    echo create part pri >> clean_disk.txt
    echo assign >> clean_disk.txt
    echo format fs=ntfs quick label="디스크초기화" >> clean_disk.txt
    diskpart /s clean_disk.txt
    del clean_disk.txt
)



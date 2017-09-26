
@echo off
rem -------------------------------------
if not "%~1"=="p" start /min cmd.exe /c %0 p&exit
rem -------------------------------------
cd /d "%~dp0"
set "TOPDIR=%cd%"
title "%~n0"
rem -------------------------------------
if "x%PGM_ROOTDIR%" == "x"  set "  PGM_ROOTDIR=D:/pgm"
if "x%WBK_ROOTDIR%" == "x"  set "WBK_ROOTDIR=D:/wbk"
if "x%PGMBAK_ROOTDIR%" == "x"  set "  PGMBAK_ROOTDIR=E:/pgm"
rem -------------------------------------

rem -------------------------------------
: setlocal enabledelayedexpansion
rem -------------------------------------
setlocal enabledelayedexpansion
rem -------------------------------------


:----------------------------------------
set "ORIGIN_PATH=%PATH%"
set "MINI_PATH=C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem"
set "PATH=%MINI_PATH%"
:----------------------------------------


set "MINICONDA_BIT=x64"
set "MINICONDA_VER=2"
call "!WBK_ROOTDIR!/etc/skel/tpl.tools.env.Miniconda.bat"

call "!WBK_ROOTDIR!/etc/skel/tpl.tools.env.GTK2-bundle.bat"

call "!WBK_ROOTDIR!/etc/skel/tpl.tools.env.msvs.bat"
call "!WBK_ROOTDIR!/etc/skel/tpl.tools.env.msvs.fix.bat"

set "QHULL_ROOTDIR=!PGMBAK_ROOTDIR!/DEV/unorganized/qhull/2015.2"
set "PATH=!QHULL_ROOTDIR!/bin;!PATH!"
rem -------------------------------------
echo [debug] [Action] Start.
:     Action Start
rem -------------------------------------

rem set "https_proxy=http://127.0.0.1:49783/"
rem set "http_proxy=http://127.0.0.1:49783/"

rem conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
rem conda config --set show_channel_urls yes


SET DISTUTILS_USE_SDK=1
SET MSSdk=1
rem python setup.py  install

pip install -e .

goto :eof_with_pause

cmd
rem call conda install tkinter

:eof_with_pause
pause
:eof_with_info
exit

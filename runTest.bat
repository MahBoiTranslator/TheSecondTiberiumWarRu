@echo off

: Сборка проекта
call zBuild.bat
timeout /t 5 > nul

: Копирование файлов в папку _Test
mkdir _Test
xcopy /h /y /c /r /s Build\ _Test\

: Задержка необходима для того, чтобы файлы успели скопироваться
timeout /t 3 > nul

: Запуск клиента
cd _Test
start "" "The Second Tiberium War.exe"

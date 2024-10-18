@echo off
chcp 65001 > nul
set mixfolder=Build\Resources\Translations\ru\MIX
set defaultfolder=Build\Resources\Translations\en\MIX

echo Delete build cache...
rmdir /q /s Build > nul 2> nul
mkdir Build

echo Copy files...
xcopy Source\* Build\* /e /y

mkdir %defaultfolder%

for /f "tokens=*" %%f in ('dir "%mixfolder%\" /a:d /b') do (
	echo Compiling %%f.mix...
	Tools\ccmix.exe --create --lmd --game=ts --dir "%mixfolder%\%%f" --mix "%mixfolder%\%%f.mix"
	copy "%mixfolder%\%%f.mix" "%defaultfolder%\%%f.mix" 
	rmdir /q /s "%mixfolder%\%%f"
	)

echo Done. Please, check Build folder.

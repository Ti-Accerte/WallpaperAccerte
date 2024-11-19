@echo off

:: URL do wallpaper para download
set "wallpaperUrl=https://raw.githubusercontent.com/Ti-Accerte/WallpaperAccerte/main/Wallpapers/Wallpaper.png"

:: Caminho para salvar o wallpaper
set "picturesPath=%USERPROFILE%\Pictures"
set "localWallpaperPath=%picturesPath%\Wallpaper.jpg"

:: Verifica se a pasta Pictures existe; se não, cria
if not exist "%picturesPath%" (
    mkdir "%picturesPath%"
)

:: Baixa o wallpaper da URL com janela oculta
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%wallpaperUrl%' -OutFile '%localWallpaperPath%' -UseBasicParsing"

:: Configura o papel de parede e força a atualização usando apenas PowerShell
powershell -WindowStyle Hidden -Command ^
    "$path='%localWallpaperPath%';" ^
    "$regPath='HKCU:\Control Panel\Desktop';" ^
    "Set-ItemProperty -Path $regPath -Name Wallpaper -Value $path;" ^
    "Set-ItemProperty -Path $regPath -Name WallpaperStyle -Value 2;" ^
    "RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters"

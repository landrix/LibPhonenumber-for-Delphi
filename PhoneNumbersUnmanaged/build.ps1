# Visual Studio Build Tools 2022 müssen installiert sein
# PowerShell-Skript zum Kompilieren für x64 und x86
$solution = "PhoneNumbersUnmanaged.sln"
$configuration = "Release"

# x64 Build
& "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\msbuild.exe" $solution /p:Configuration=$configuration /p:Platform="x64"

# x86 Build
& "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\msbuild.exe" $solution /p:Configuration=$configuration /p:Platform="x86"
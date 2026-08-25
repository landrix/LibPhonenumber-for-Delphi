# Interop tests

These tests exercise the real Win32 `PhoneNumbersUnmanaged.dll` exports. Run the Release configuration because Win32 Debug stack frames can mask a calling-convention mismatch.

```text
msbuild LibPhonenumberTests.dproj /t:Rebuild /p:Config=Release /p:Platform=Win32
..\Win32\LibPhonenumberTests.exe
```

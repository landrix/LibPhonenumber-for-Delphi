# LibPhonenumber-for-Delphi
Delphi-wrapper for the [C# .NET port](https://github.com/twcclegg/libphonenumber-csharp) of Google's [libphonenumber library](https://github.com/googlei18n/libphonenumber). 

Current version is v9.0.22

The original Apache License 2.0 was preserved.

Support for Delphi 32 bit and 64 bit. Minimum requirement .NET Framework 4.8.0.

## Distributables location via config

If you want to place the distributables in a different directory (instead of next to the EXE), create an application configuration file with the same name as the EXE (including the EXE extension) and add the `.config` extension.

Example: `MyApp.exe.config`

The `probing` element defines subdirectories, relative to the EXE location, that the CLR will search for dependent assemblies. The paths are separated by semicolons.

Expected folder layout (relative to the EXE):

```
MyApp.exe
MyApp.exe.config
LibPhonenumber\
  Win32\
  Win64\
```

Place the distributables in the `LibPhonenumber\Win32` and `LibPhonenumber\Win64` folders according to target architecture.

Use this configuration content:

```
<configuration>
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <probing privatePath="LibPhonenumber\Win32;LibPhonenumber\Win64" />
      <dependentAssembly>
        <assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-6.0.0.0" newVersion="6.0.0.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Memory" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.1.2" newVersion="4.0.1.2" />
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
  <startup>
    <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.8" />
  </startup>
</configuration>

```

## DLL override directory

If the unmanaged DLL is not located next to the EXE, you can override the load directory at runtime by setting the global variable `PhoneNumbersDllOverrideDir` before calling any `TLibPhoneNumber` methods. An empty value uses the EXE directory (default behavior).

Example:

```
PhoneNumbersDllOverrideDir := 'C:\MyApp\LibPhonenumber\Win64\';
```

## Example

```
var parsedNumber : String := TLibPhoneNumber.Parse('01511234567','DE');

var numberIsValid : Boolean := TLibPhoneNumber.IsValidNumber('01511234567','DE');
```

# LibPhonenumber-for-Delphi
Delphi-wrapper for the [C# .NET port](https://github.com/twcclegg/libphonenumber-csharp) of Google's [libphonenumber library](https://github.com/googlei18n/libphonenumber). 

Current version is v8.13.46

The original Apache License 2.0 was preserved.

Support for Delphi 32 bit and 64 bit. Minimum requirement .NET Framework 4.8.0.

## Example

```
var parsedNumber : String := TLibPhoneNumber.Parse('01511234567','DE');

var numberIsValid : Boolean := TLibPhoneNumber.IsValidNumber('01511234567','DE');
```

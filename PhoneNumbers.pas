unit PhoneNumbers;

interface

uses System.Classes,System.SysUtils,System.StrUtils
     ,WinApi.Windows,Vcl.Dialogs,System.UITypes;

type
  TLibPhoneNumber = class
  private type
    TParseFunction = function (phonenumber : WideString; country : WideString; out formatetNumber : WideString) : Boolean; stdcall;
    TIsValidNumberFunction = function (phonenumber : WideString; country : WideString) : Boolean; stdcall;
  private
    dll : HMODULE;
    parseFunction : TParseFunction;
    isValidNumberFunction : TIsValidNumberFunction;
  private const
    DLLNAME = 'PhoneNumbersUnmanaged.dll';
  public
    constructor Create;
    destructor Destroy; override;
    class function Parse(const phonenumber, country : String; E164notation : Boolean = true) : String;
    class function IsValidNumber(const phonenumber, country : String) : Boolean;
  end;


var
  PhoneNumbersDllOverrideDir: String = '';

implementation

uses
  system.ioUtils;

var
  instance : TLibPhoneNumber;

{ TLibPhoneNumber }

constructor TLibPhoneNumber.Create;
var
  lDllFn, lDllDir: String;
begin
  dll := 0;
  parseFunction := nil;
  if PhoneNumbersDllOverrideDir = '' then
    lDllDir:= ExtractFilePath(ParamStr(0))
  else
    lDllDir:= PhoneNumbersDllOverrideDir;
  lDllFn:= TPath.Combine(lDllDir,  DLLNAME);
  if not FileExists(lDllFn) then
  begin
    MessageDlg(Format('"%s" not found.',[DLLNAME])+#10+ExtractFilePath(ParamStr(0)), mtError, [mbOK], 0);
    exit;
  end;
  dll := LoadLibrary(PChar(lDllFn));
  if dll <> 0 then
  begin
    parseFunction := GetProcAddress(dll, 'parse');
    isValidNumberFunction := GetProcAddress(dll, 'isValidNumber');
  end else
    MessageDlg(Format('error loading "%s".',[DLLNAME])+#10+ExtractFilePath(ParamStr(0)), mtError, [mbOK], 0);
end;

destructor TLibPhoneNumber.Destroy;
begin
  if dll <> 0 then
    FreeLibrary(dll);
  dll := 0;
  inherited;
end;

class function TLibPhoneNumber.IsValidNumber(const phonenumber,
  country: String): Boolean;
begin
  Result := false;
  if instance = nil then
    instance := TLibPhoneNumber.Create;
  if not Assigned(instance.isValidNumberFunction) then
    exit;
  Result := instance.isValidNumberFunction(phoneNumber,country);
end;

class function TLibPhoneNumber.Parse(const phonenumber,
  country: String; E164notation : Boolean = true): String;
var
  hstr : WideString;
  splitted: TArray<String>;
  i : Integer;
begin
  Result := '';
  if instance = nil then
    instance := TLibPhoneNumber.Create;
  if not Assigned(instance.parseFunction) then
  begin
    Result := phonenumber;
    exit;
  end;
  if instance.parseFunction(PhoneNumber,country,hstr) then
    Result := hstr;

  if Result = '' then
    exit;

  if E164notation then
  begin
    Result := ReplaceText(Result,' ','');
    exit;
  end;

  splitted := Result.Split([' ']);
  if Length(splitted) < 2 then
    exit;
  for i := Low(splitted) to high(splitted) do
  begin
    if i = Low(splitted) then
      Result :=  splitted[i]
    else
    if i = Low(splitted)+1 then
      Result := Result + ' ('+splitted[i]+')'
    else
      Result := Result + ' '+splitted[i];
  end;
end;

initialization

  instance := nil;

finalization

  if Assigned(instance) then begin  instance.Free; instance := nil; end;

end.


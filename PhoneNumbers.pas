unit PhoneNumbers;

interface

uses System.Classes,System.sysutils,System.AnsiStrings
     ,WinApi.Windows,Vcl.Dialogs,System.UITypes;

type
  TLibPhoneNumber = class
  private type
    TFormatTelNr = function (phonenumber : WideString; country : WideString; out formatetNumber : WideString) : Boolean; stdcall;
  private
    dll : HMODULE;
    FormatTelNrRef : TFormatTelNr;
  private const
    DLLNAME = 'PhoneNumbersUnmanaged.dll';
  public
    constructor Create;
    destructor Destroy; override;
    class function Parse(phonenumber : String; country : String) : String;
  end;

implementation

var
  instance : TLibPhoneNumber;

{ TLibPhoneNumber }

constructor TLibPhoneNumber.Create;
begin
  dll := 0;
  FormatTelNrRef := nil;
  if not FileExists(ExtractFilePath(ParamStr(0))+DLLNAME) then
  begin
    MessageDlg(Format('"%s" not found.',[DLLNAME])+#10+ExtractFilePath(ParamStr(0)), mtError, [mbOK], 0);
    exit;
  end;
  dll := LoadLibrary(PChar(ExtractFilePath(ParamStr(0))+DLLNAME));
  if dll <> 0 then
  begin
    FormatTelNrRef := GetProcAddress(dll, 'FormatTelNr');
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

class function TLibPhoneNumber.Parse(phonenumber,
  country: String): String;
var
  hstr : WideString;
  splitted: TArray<String>;
  i : Integer;
begin
  Result := '';
  if instance = nil then
    instance := TLibPhoneNumber.Create;
  if not Assigned(instance.FormatTelNrRef) then
  begin
    Result := phonenumber;
    exit;
  end;
  if instance.FormatTelNrRef(PhoneNumber,country,hstr) then
    Result := hstr;

  if Result = '' then
    exit;

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


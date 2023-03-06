program LibPhonenumber;

uses
  Vcl.Forms,
  LibPhonenumberUnit in 'LibPhonenumberUnit.pas' {LibPhonenumberForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLibPhonenumberForm, LibPhonenumberForm);
  Application.Run;
end.

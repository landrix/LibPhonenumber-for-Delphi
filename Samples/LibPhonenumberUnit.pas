unit LibPhonenumberUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls
  ,PhoneNumbers;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Edit1Change(Sender: TObject);
begin
  Edit3.Text := TLibPhoneNumber.Parse(Edit1.Text,Edit2.Text,false);
end;

procedure TForm5.Edit4Change(Sender: TObject);
begin
  if TLibPhoneNumber.IsValidNumber(Edit4.Text,Edit5.Text) then
    Label9.Caption := 'yes'
  else
    Label9.Caption := 'no';
end;

end.

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
    procedure Edit1Change(Sender: TObject);
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Edit1Change(Sender: TObject);
begin
  Edit3.Text := TLibPhoneNumber.Parse(Edit1.Text,Edit2.Text,false);
end;

end.

unit cu_profile;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ExtDlgs,mdata;

type

  { TForm4 }

  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;

    procedure BitBtn2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    logopath:String;
  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  //ShowMessage(logopath);
  if ((Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='')) then
     ShowMessage('Err')
     else
       begin //////////////////////////////////////

  try
      with DataModule1 do
        begin
        SQLQuery1.Close;
        SQLQuery1.SQL.Text:='INSERT INTO tpass(_user,_pass,_apps,_logo) '+
                                'VALUES (:_user,:_pass,:_apps,:_logo)';

        SQLQuery1.ParamByName('_user').AsString:=Edit1.Text;
        SQLQuery1.ParamByName('_pass').AsString:=Edit2.Text;
        SQLQuery1.ParamByName('_apps').AsString:=Edit3.Text;
        SQLQuery1.ParamByName('_logo').AsString:=logopath;
        SQLConnector1.Connected:=True;
        SQLTransaction1.Active:=True;
        SQLQuery1.ExecSQL;
        SQLTransaction1.Commit;
        end;
  except
    on e : Exception do
    begin
         ShowMessage(e.Message);
    end;
  end;
   end; ////////////////////////////
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    begin
       logopath := OpenPictureDialog1.FileName;

  end;

   Image1.Picture.LoadFromFile(logopath);
end;

end.


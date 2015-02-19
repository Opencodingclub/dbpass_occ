unit opt;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, ExtendedNotebook, Forms, Controls,
  Graphics, Dialogs, Menus, ValEdit, ComCtrls, PopupNotifier, ExtCtrls, Buttons,
  add,show_info,mdata,cu_profile;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Frame1_1: TFrame1;
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem9: TMenuItem;

    StatusBar1: TStatusBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
     private
    { private declarations }
  public
    { public declarations }
     //procedure get_profile_info(profile : string);

  end;


var
  Form2: TForm2;
   apps_id :string ;

implementation

{$R *.lfm}

{ TForm2 }
procedure get_profile_info(profile : string) ;

begin

  DataModule1.SQLQuery1.Close;
  DataModule1.SQLQuery1.SQL.Text:='SELECT * from tpass where _apps like"'+profile+'" ';
  DataModule1.SQLQuery1.Open;
  DataModule1.SQLQuery1.ExecSQL;
  if (DataModule1.SQLQuery1.RecordCount<>0) then
  begin
      form3.Edit1.Text    :=DataModule1.SQLQuery1.FieldValues['_user'];
      form3.Edit2.Text    :=DataModule1.SQLQuery1.FieldValues['_pass'];
      form3.Label1.Caption:=DataModule1.SQLQuery1.FieldValues['_apps'];
      form3.Caption       :=DataModule1.SQLQuery1.FieldValues['_apps'];
      form3.Image1.Picture.LoadFromFile(DataModule1.SQLQuery1.FieldValues['_logo']);

      Form3.ShowModal;
  end else
  begin
    Form4.Caption:='Add '+profile+' acounnt ';
    Form4.Edit3.Visible:=False; Form4.Label3.Visible:=False;
    Form4.Edit3.Text:= profile;
    Form4.logopath :='img/blue/72px/'+LowerCase(profile)+'.png';
    form4.Image1.Picture.LoadFromFile(Form4.logopath);
    form4.ShowModal;
    //ShowMessage('not');
  end;
end;


procedure TForm2.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm2.MenuItem3Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm2.MenuItem4Click(Sender: TObject);
begin
  Frame1_1.Visible:=True;
end;

procedure TForm2.MenuItem6Click(Sender: TObject);
begin
  Frame1_1.Visible:=False;
end;

procedure TForm2.MenuItem9Click(Sender: TObject);
begin
end;

procedure TForm2.FormCreate(Sender: TObject);

begin

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  apps_id:='facebook';
  get_profile_info(apps_id);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  apps_id:='Google';
  get_profile_info(apps_id);
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  apps_id:='Twitter';
  get_profile_info(apps_id);
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
    apps_id:='Vimeo';
  get_profile_info(apps_id);
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
  apps_id:='Instagram';
  get_profile_info(apps_id);
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
  apps_id:='Linkedin';
  get_profile_info(apps_id);
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm2.Image1Click(Sender: TObject);
begin

end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  Form4.Edit3.Visible:=True; Form4.Label3.Visible:=True;
  Form4.ShowModal;
end;

procedure TForm2.MenuItem11Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.MenuItem15Click(Sender: TObject);
begin

end;

end.


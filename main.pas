unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, dbf, FileUtil, DividerBevel, Forms,
  Controls, Graphics, Dialogs, DBGrids, StdCtrls, ComCtrls, opt;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLite3Connection1AfterConnect(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  user_name: String;
  password : String;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.SQLite3Connection1AfterConnect(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  user_name:= 'root'; // Edit1.Text;
  password := 'root'; //Edit2.Text;
  if ((user_name ='root') and (password ='root'))  then
     begin
       Form2.Show;
       Form1.Hide ;
     end
   else
     ShowMessage('try agin .. '+ user_name) ;

end;

end.


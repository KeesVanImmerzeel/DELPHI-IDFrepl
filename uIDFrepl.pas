unit uIDFrepl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uerror, AVGRIDIO,
  uTabstractESRIgrid, uTSingleESRIgrid, math;

type
  TForm3 = class(TForm)
    Button1: TButton;
    SingleESRIgrid1: TSingleESRIgrid;
    SingleESRIgrid2: TSingleESRIgrid;
    SingleESRIgrid3: TSingleESRIgrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  filename1, filename2, filename3, filename4: string;
  keyvalue, this_keyvalue, iResult, nrows, ncols, i, j: Integer;
  aValue1, aValue3, x, y: Single;
  count: integer;
begin
  {optie := uppercase(paramstr(1));}
  filename1 := paramstr(1); {IDF to replace values in}
  filename2 := paramstr(2); {IDF with values to put in (IDF to replace values in)}
  filename3 := paramstr(3); {IDF that has IDFkey values in some cells (where to replace)}
  keyvalue := StrToInt( paramstr(4) ); {-Only cells where in IDFkey=keyvalue will get a new value}
  WriteToLogFile( 'keyvalue = ' + inttoStr( keyvalue ) );
  filename4 := paramstr(5); {-Output IDF}

  SingleESRIgrid1 := TSingleESRIgrid.InitialiseFromIDFfile( filename1, iResult, self );
  SingleESRIgrid2 := TSingleESRIgrid.InitialiseFromIDFfile( filename2, iResult, self );
  SingleESRIgrid3 := TSingleESRIgrid.InitialiseFromIDFfile( filename3, iResult, self );
  nrows:=SingleESRIgrid1.NRows;
  ncols:=SingleESRIgrid1.NCols;
  WriteToLogFile('IDF files initialised.');

  count := 0;
  for i := 1 to NRows do begin
    for j := 1 to NCols do begin
      SingleESRIgrid1.GetCellCentre( i, j, x, y);
      aValue3 := SingleESRIgrid3.GetValueXY( x, y );
      if aValue3 <> MissingSingle then begin
        this_keyvalue := trunc( aValue3 );
        if this_keyvalue = keyvalue then begin
          SingleESRIgrid1[i,j] := SingleESRIgrid2[i,j];
          {WriteToLogFile( FloatToStr( x ) + ' ' + FloatToStr( y ) );}
          Inc( count );
        end;
      end;
    end;
  end;
  SingleESRIgrid1.ExportToIDFfile( filename4 );

  WriteToLogFile( 'MissingSingle=' + FloatToStr( MissingSingle ) );
  WriteToLogFile( 'Nr of novalues overwritten: ' + inttoStr( count ) );
  {MessageDlg( filename3, mtInformation, [mbOk], 0);}
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
InitialiseLogFile;
  InitialiseGridIO;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
   FinaliseLogFile;
end;

end.

unit color_pixel;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tcolor_pixel }

  Tcolor_pixel = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  color_pixel: Tcolor_pixel;
  rr,gg,bb : byte;
implementation

{$R *.lfm}

{ Tcolor_pixel }

procedure Tcolor_pixel.FormCreate(Sender: TObject);
begin
        Edit1.Text:= inttostr(rr);
        Edit2.Text:= inttostr(rr);
        Edit3.Text:= inttostr(rr);
end;

end.


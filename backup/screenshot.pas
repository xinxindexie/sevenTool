unit screenshot;

{$mode ObjFPC}{$H+}

interface

uses
  windows,Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, color_pixel;

type

  { TForm3 }

  TForm3 = class(TForm)
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);

    // Image1: TImage;

  private
      pt1:TPoint;
      pt2:TPoint;
  public

  end;

var
  Form3: TForm3;
 screen_type:Integer;   // 0: all screenshot  1: area screenshot
 closeForm:Integer;   // 0: open  1: close
 bmp: TBitMap;
implementation

{$R *.lfm}

{ TForm3 }
procedure GetScreen(a:Integer;b:Integer;c:Integer;d:Integer;var bmp: TBitMap);  //截取全屏
var
  DC: HDC;
  MyCanvas: TCanvas;
  MyRect: TRect;
  allRect: TRect;
  Tname:  String;
begin
  sleep(400);
  DC:= GetWindowDC(0);
  MyCanvas:= TCanvas.Create;
  try
    MyCanvas.Handle:= DC;
    MyRect:= Rect(a, b, c, d);
    allRect:= Rect(0, 0, c-a, d-b);
    bmp:= TBitMap.Create;
    bmp.PixelFormat:= pf24bit;
    bmp.Width:= c-a;//MyRect.Right;
    bmp.Height:= d-b;//MyRect.Bottom;
    bmp.Canvas.CopyRect(allRect, MyCanvas, MyRect);
    Tname:= FormatDateTime('yyyymmddhhnnsszzz',now());
    bmp.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen'+Tname+'.bmp');
  finally
    MyCanvas.Handle:= 0;
    MyCanvas.Free;
    releaseDC(0, DC);
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
var
  // bmp: TBitMap;
  datetime: string;
begin
   //// bmp:= TBitMap.Create;
   //if 0=screen_type  then
   //    begin
   //      GetScreen(0,0,Screen.Width, Screen.Height,bmp);
   //      //GetScreen(100,0,200, 100,bmp);
   //      //Form3.Width:=screen.width;
   //      Form3.width:=screen.width;
   //      Form3.height:=screen.height;
   //      Form3.Top := 0;
   //      Form3.Left := 0;
   //      //Form3.BorderStyle := bsNone;
   //      Image1.Left:= 0;
   //      Image1.Top:= 0;
   //      Image1.Height:= Screen.Height;
   //      Image1.Width:= Screen.Width;
   //      Image1.Picture:= TPicture(bmp);
   //      bmp.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen.bmp');
   //    end
   //else if 1=screen_type then
   //    begin
   //       GetScreen(0,0,Screen.Width, Screen.Height,bmp);
   //       Image1.Left:= 0;
   //       Image1.Top:= 0;
   //       Image1.Height:= Screen.Height;
   //       Image1.Width:= Screen.Width;
   //       Image1.Picture:= TPicture(bmp);
   //       Form3.width:=screen.width;
   //       Form3.height:=screen.height;
   //       Form3.Top := 0;
   //       Form3.Left := 0;
   //       Form3.BorderStyle := bsNone;
   //    end
   //else
   //     begin
   //       GetScreen(0,0,Screen.Width, Screen.Height,bmp);
   //       Image1.Left:= 0;
   //       Image1.Top:= 0;
   //       Image1.Height:= Screen.Height;
   //       Image1.Width:= Screen.Width;
   //       Image1.Picture:= TPicture(bmp);
   //       Form3.BorderStyle := bsNone;
   //    end;
   //
   //// bmp.Free;
   //// showMessage(Format('form3 creat: screen_type=%d', [screen_type]));
   //// DateTime:=Time();
   //datetime:= FormatDateTime ('yyyymmddhhmmss', Now);
   //bmp.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen'+datetime+'.bmp');

end;

procedure TForm3.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if  key=27  then     //当你按下enter键时触发该事件
      Form3.close
end;

procedure TForm3.FormShow(Sender: TObject);
var
  // bmp: TBitMap;
  datetime: string;
begin
   // bmp:= TBitMap.Create;
   if 1=screen_type  then
       begin
         GetScreen(0,0,Screen.Width, Screen.Height,bmp);
         //GetScreen(100,0,200, 100,bmp);
         //Form3.Width:=screen.width;
         Form3.width:=screen.width;
         Form3.height:=screen.height;
         Form3.Top := 0;
         Form3.Left := 0;
         //Form3.BorderStyle := bsNone;
         Image1.Left:= 0;
         Image1.Top:= 0;
         Image1.Height:= Screen.Height;
         Image1.Width:= Screen.Width;
         Image1.Picture:= TPicture(bmp);
         bmp.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen.bmp');
       end
   else if 2=screen_type then
       begin
          GetScreen(0,0,Screen.Width, Screen.Height,bmp);
          Image1.Left:= 0;
          Image1.Top:= 0;
          Image1.Height:= Screen.Height;
          Image1.Width:= Screen.Width;
          Image1.Picture:= TPicture(bmp);
          Form3.width:=screen.width;
          Form3.height:=screen.height;
          Form3.Top := 0;
          Form3.Left := 0;
          Form3.BorderStyle := bsNone;
       end
   else if 3=screen_type then
       begin
          GetScreen(0,0,Screen.Width, Screen.Height,bmp);
          Form3.width:=screen.width;
          Form3.height:=screen.height;
          Form3.Top := 0;
          Form3.Left := 0;
          Form3.BorderStyle := bsNone;
          Image1.Left:= 0;
          Image1.Top:= 0;
          Image1.Height:= Screen.Height;
          Image1.Width:= Screen.Width;
          Image1.Picture:= TPicture(bmp);
          // Panel1.Visible := true;

       end
    else if 4=screen_type then
       begin
          GetScreen(0,0,Screen.Width, Screen.Height,bmp);
          Form3.width:=screen.width;
          Form3.height:=screen.height;
          Form3.Top := 0;
          Form3.Left := 0;
          Form3.BorderStyle := bsNone;
          Image1.Left:= 0;
          Image1.Top:= 0;
          Image1.Height:= Screen.Height;
          Image1.Width:= Screen.Width;
          Image1.Picture:= TPicture(bmp);
          // Panel1.Visible := true;

       end
   else
        begin
          //GetScreen(0,0,Screen.Width, Screen.Height,bmp);
          //Image1.Left:= 0;
          //Image1.Top:= 0;
          //Image1.Height:= Screen.Height;
          //Image1.Width:= Screen.Width;
          //Image1.Picture:= TPicture(bmp);
          //Form3.BorderStyle := bsNone;
          // sendmessage(Form3.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
          Form3.close;
       end;

   // bmp.Free;
   // showMessage(Format('form3 creat: screen_type=%d', [screen_type]));
   // DateTime:=Time();
   //datetime:= FormatDateTime ('yyyymmddhhmmss', Now);
   //bmp.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen'+datetime+'.bmp');

end;

procedure TForm3.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// var
  // pt1:TPoint;
begin
  if 2 = screen_type then
      begin
           GetCursorPos(pt1);
      end
  else  if 3 = screen_type then
      begin
           Panel1.Visible := false;
           Panel2.Visible := false;
           Form3.close;
      end
  else  if 4 = screen_type then
      begin
           Panel1.Visible := false;
           Panel2.Visible := false;
           Form3.close;
      end

  // showMessage(Format('pt1: pt1.x=%d,pt1.y=%d', [pt1.x,pt1.y]));
end;

procedure TForm3.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  DC:HDC;
  xx,yy:Integer;
  xx1,yy1:Integer;
  temp : tcolor;
begin
  if 2 = screen_type then
      begin
           GetCursorPos(pt2);
      end
  else if 3 = screen_type then
      begin
          xx:=Mouse.CursorPos.X;
          yy:=Mouse.CursorPos.Y;

          DC:=GetDC(0);
          temp:=GetPixel(DC,xx,yy);
          rr := getRvalue(temp);
          gg := getGValue(temp);
          bb := getBValue(temp);
        //  From4.show;
        Panel1.Visible := true;
        panel1.Top := yy+20;
        panel1.left := xx+20;
        Edit7.Text:= inttostr(rr);
        Edit8.Text:= inttostr(gg);
        Edit9.Text:= inttostr(bb);

          // ShowMessage(Format('Color=%x', [Color]));
      end
  else if 4 = screen_type then
      begin
          xx:=Mouse.CursorPos.X;
          yy:=Mouse.CursorPos.Y;

          DC:=GetDC(0);
          temp:=GetPixel(DC,xx,yy);
          rr := getRvalue(temp);
          gg := getGValue(temp);
          bb := getBValue(temp);
        //  From4.show;
        Panel1.Visible := true;
        panel1.Top := yy+20;
        panel1.left := xx+20;
        Edit7.Text:= inttostr(rr);
        Edit8.Text:= inttostr(gg);
        Edit9.Text:= inttostr(bb);

        xx1 := xx+integer(Trunc(Screen.Width/2));
        yy1 := yy;
        temp:=GetPixel(DC,xx1,yy1);
        rr := getRvalue(temp);
        gg := getGValue(temp);
        bb := getBValue(temp);
        Panel2.Visible := true;
        panel2.Top := yy1+20;
        panel2.left := xx1+20;
        Edit10.Text:= inttostr(rr);
        Edit11.Text:= inttostr(gg);
        Edit12.Text:= inttostr(bb);
          // ShowMessage(Format('Color=%x', [Color]));
      end;
  // showMessage(Format('pt1: pt1.x=%d,pt1.y=%d', [pt1.x,pt1.y]));
  // showMessage(Format('pt1: pt2.x=%d,pt2.y=%d', [pt2.x,pt2.y]));
end;

procedure TForm3.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  // bmp: TBitMap;
  w,h: Integer;
  datetime: string;
begin
  if 1 = screen_type then
      begin
        w := pt2.x - pt1.x;
        h := pt2.y - pt1.y;
        GetScreen(pt1.x, pt1.y, pt2.x, pt2.y,bmp);
        datetime:= FormatDateTime ('yyyymmddhhmmss', Now);
        bmp.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen'+datetime+'.bmp');
        Image1.Left:= pt1.x;
        Image1.Top:= pt1.y;
        Image1.Height:= pt2.y - pt1.y;
        Image1.Width:= pt2.x - pt1.x;
        Image1.Picture:= TPicture(bmp);
        closeForm:=1;
      end;
  // sendmessage(Form3.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中

end;

procedure TForm3.Panel1Click(Sender: TObject);
begin

end;




end.


unit main;
// mian里面只做调度
{$mode objfpc}{$H+}

interface

uses
  windows,Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls,screenshot;

type

  { TForm1}

  TForm1 = class(TForm)
    buttonclickme: TButton;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    FileMenu: TMenuItem;
    getPixelColor: TMenuItem;
    getPixelColor2: TMenuItem;
    regionshot: TMenuItem;
    showImage: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    MenuItem3: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    screenshot: TMenuItem;
    ToolMenu: TMenuItem;
    procedure buttonclickmeClick(Sender: TObject);
    procedure FileMenuClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure getPixelColorClick(Sender: TObject);
    procedure getPixelColor2Click(Sender: TObject);
    procedure regionshotClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure screenshotClick(Sender: TObject);
    procedure showImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure HotKeyDown(var Msg: Tmessage); message WM_HOTKEY;
  public
      // screen_type:Integer;
  end;

var
  Form1: TForm1;
  HotKeyId: Integer;
implementation

{$R *.lfm}

{ TForm1}

procedure TForm1.HotKeyDown(var Msg: Tmessage);
begin
if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = VK_F1) then // 假设热键为ALT+F8
begin
   sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   screen_type := 1;
   Form3.show;
end;
if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = VK_F2) then // 假设热键为ALT+F8
begin
   sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   screen_type := 2;
   Form3.show;
end;
if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = VK_F3) then // 假设热键为ALT+F8
begin
   sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   screen_type := 3;
   Form3.show;
end;
if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = VK_F4) then // 假设热键为ALT+F8
begin
   sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   screen_type := 4;
   Form3.show;
end;
if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = VK_F8) then // 假设热键为ALT+F8
begin
        ShowMessage('F8');
end;
if (Msg.LparamLo = MOD_ALT) AND (Msg.LParamHi = VK_F7) then // 假设热键为ALT+F8
begin
        ShowMessage('F7');
end;
end;

procedure  GetScreen_mouseup(pt1: TPoint);
begin
   GetCursorPos(pt1);
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin

end;

procedure TForm1.screenshotClick(Sender: TObject);
var
  form2:TForm;
begin
  // showmessage('hello world');
  // edit1.Text:=edit1.Text+'p';
  sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   // form1.WindowState :=  wsMaximized;//窗体最大化
   // form1.WindowState :=  wsminimized;//窗体最小化到 任务栏上方
   // form1.WindowState :=  wsnormal;//窗体正常化
   // sleep(400);
   screen_type := 1;
   {form2:=TForm3.Create(Application); //创建窗体
   form2.Show; //显示窗体
   form2.width:=screen.width;
   form2.height:=screen.height;
   form2.Top := 0;
   form2.Left := 0;  }
   Form3.show;
   // form1.WindowState :=  wsnormal;//窗体正常化

   // form2.BorderStyle := bsNone;
   // form1.WindowState :=  wsnormal;
end;

procedure TForm1.showImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //form1.WindowState :=  wsnormal;
end;


procedure TForm1.FileMenuClick(Sender: TObject);
begin

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  UnRegisterHotKey(handle, HotKeyId); //注销HotKey, 释放资源。
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  HotKeyId := GlobalAddAtom('MyHotKey') - $C000;
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, VK_F1); //截全屏
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, VK_F2); //局部截屏
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, VK_F3); //获取像素值
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, VK_F4); //获取对称的像素值
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, VK_F8);
  RegisterHotKey(Handle, hotkeyid, MOD_ALT, VK_F7);
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  DC:HDC;
  xx,yy:Integer;
  rr,gg,bb : byte;
  temp : tcolor;
begin
  //xx:=Mouse.CursorPos.X;
  //yy:=Mouse.CursorPos.Y;
  //
  //DC:=GetDC(0);
  //temp:=GetPixel(DC,xx,yy);
  //rr := getRvalue(temp);
  //gg := getGValue(temp);
  //bb := getBValue(temp);
  //Edit1.Text:= inttostr(rr);
  //Edit2.Text:= inttostr(rr);
  //Edit3.Text:= inttostr(rr);
  // ShowMessage(Format('Color=%x', [Color]));
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.getPixelColorClick(Sender: TObject);
var
  form2:TForm;
begin
  // showmessage('hello world');
  // edit1.Text:=edit1.Text+'p';
  sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   // form1.WindowState :=  wsMaximized;//窗体最大化
   // form1.WindowState :=  wsminimized;//窗体最小化到 任务栏上方
   // form1.WindowState :=  wsnormal;//窗体正常化
   // sleep(400);
   screen_type := 3;
   Form3.show;

   // form1.WindowState :=  wsnormal;

end;

procedure TForm1.getPixelColor2Click(Sender: TObject);
begin
   sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
   // form1.WindowState :=  wsMaximized;//窗体最大化
   // form1.WindowState :=  wsminimized;//窗体最小化到 任务栏上方
   // form1.WindowState :=  wsnormal;//窗体正常化
   // sleep(400);
   screen_type := 4;
   Form3.show;
end;

procedure TForm1.regionshotClick(Sender: TObject);
var
    form2:TForm;

begin
    sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中
    // form1.WindowState :=  wsMaximized;//窗体最大化
    // form1.WindowState :=  wsminimized;//窗体最小化到 任务栏上方
    // form1.WindowState :=  wsnormal;//窗体正常化
    // sleep(400);
    screen_type := 2;
    // showMessage(Format('form3 creat: screen_type=%d', [screen_type]));
    Form3.show;
    // shotImage.OnClick:=GetScreen_mousedown(Sender);
    // GetCursorPos(pt1); {这是获取的相对于屏幕的坐标}
    // pt1 := ScreenToClient(pt1); {转换成本地坐标}
    // ShowMessage(Format('API 函数 GetCursorPos: x=%d; y=%d', [pt1.X, pt1.Y]));

    // GetCursorPos(pt2); {这是获取的相对于屏幕的坐标}
    // pt2 := ScreenToClient(pt2); {转换成本地坐标}
    // ShowMessage(Format('API 函数 GetCursorPos: x=%d; y=%d', [pt2.X, pt2.Y]));

    // form1.WindowState :=  wsnormal;
end;
  
procedure snapscreen(a,b,c,d:Integer);
var
bmpscreen:Tbitmap;
jpegscreen:Tjpegimage;
FullscreenCanvas:TCanvas;
dc:HDC;
sourceRect, destRect: TRect;
begin
try
dc:=getdc(0);
fullscreencanvas:=Tcanvas.Create;
fullscreencanvas.Handle:=dc;
bmpscreen:=Tbitmap.create;
bmpscreen.Width :=c-a;
bmpscreen.Height :=d-b;
sourcerect:=rect(0,0,c-a ,d-b );
destrect:= rect(a,b,c,d);
bmpscreen.Canvas.CopyRect(sourcerect,fullscreenCanvas,destrect);
jpegscreen:=Tjpegimage.Create ;
jpegscreen.Assign (bmpscreen);
jpegscreen.CompressionQuality:=100;
jpegscreen.SaveToFile(ExtractFilePath(ParamStr(0))+'snapscreen.jpg');
FullscreenCanvas.Free;
bmpscreen.Free;
jpegscreen.Free ;
ReleaseDC(0, DC);
except
end;
end;

procedure TForm1.buttonclickmeClick(Sender: TObject);

begin
    // sendmessage(form1.WindowHandle,WM_SYSCOMMAND,SC_ICON,0);//窗体最小化  任务栏中

end;

end.


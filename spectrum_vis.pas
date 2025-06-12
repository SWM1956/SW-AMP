unit spectrum_vis;

{$mode Delphi}

{ Spectrum Visualyzation by Alessandro Cappellozza
  version 0.8 05/2002
  http://digilander.iol.it/Kappe/audioobject
}

interface
  uses Interfaces, LCLIntf, LCLType, Graphics,  CommonTypes, Classes, Math;
  type TSpectrum = Class(TObject)
      public
        VisBuff : TBitmap;
        BackBmp : TBitmap;
        ColWidth : Integer;
        PenColor : TColor;
        UseBkg   : Boolean;
        ifend    : Boolean;
        DrawRes  : Double;
        DrawType : Integer;
        Paused   : Boolean;
     private
     BkgColor : TColor;
        SpecHeight : Integer;
        PeakColor: TColor;
        FrmClear : Boolean;
        PeakFall : Integer;
        LineFall : Integer;
        ShowPeak : Boolean;
        LinePeak : Boolean;
        FFTPeacks  : array [0..128] of Integer;
        FFTFallOff : array [0..128] of Integer;

      public
       Constructor Create (Width, Height : Integer);
       procedure Draw( FFTData : TFFTData; X, Y : Integer);
       procedure SetBackGround (Active : Boolean; BkgCanvas : TGraphic);
       function Bright(Color: TColor; BrightPercent: Byte): TColor;

       property BackColor : TColor read BkgColor write BkgColor;
       property Height : Integer read SpecHeight write SpecHeight;
       property Width  : Integer read ColWidth write ColWidth;
       property Pen  : TColor read PenColor write PenColor;
       property Peak : TColor read PeakColor write PeakColor;
       property Mode : Integer read DrawType write DrawType;
       property Res  : Double read DrawRes write DrawRes;
       property FrameClear : Boolean read FrmClear write FrmClear;
       property PeakFallOff: Integer read PeakFall write PeakFall;
       property LineFallOff: Integer read LineFall write LineFall;
       property DrawPeak   : Boolean read ShowPeak write ShowPeak;
    end;

   var Spectrum : TSpectrum;
    // capt:String='Privet';
implementation
uses
   sw_player;
   function TSpectrum.Bright(Color: TColor; BrightPercent: Byte): TColor;

      var

        r, g, b: Byte;

      begin

        Color := ColorToRGB(Color);

        r := GetRValue(Color);

        g := GetGValue(Color);

        b := GetBValue(Color);



        {muldiv(255-r, BrightPercent,100); - значение цвета в процентах,

        на которое надо увеличить исходный цвет (integer)}



        r := (r-40)+ muldiv(255 - r, BrightPercent, 100);

        g := (g-40)+ muldiv(255 - g, BrightPercent, 100);

        b :=  (b-40)+muldiv(255 - b, BrightPercent, 100);

        result := RGB(r, g, b);

      end;


      Constructor TSpectrum.Create(Width, Height : Integer);

        begin
           VisBuff := TBitmap.Create;
           BackBmp := TBitmap.Create;
           BackBmp.Transparent:=False;
           VisBuff.Transparent:=False;
           VisBuff.Width := Width;
           VisBuff.Height := Height;
           BackBmp.Width := Width;
           BackBmp.Height := Height;

           BkgColor := clInactiveCaption;
       //    BkgColor := clDefault;
           SpecHeight := Height-7;
           PenColor := Bright(clActiveCaption, 40);
           PeakColor := clYellow;
           DrawType := 1;
           DrawRes  := 0.8;
           FrmClear := True;
           UseBkg := true;
           PeakFall := 1;
           LineFall := 4;
           ColWidth := 2;
           ShowPeak := false;
           LinePeak := false;
           ifend    := False;
    //       Stop     := true;
       end;




      procedure TSpectrum.SetBackGround (Active : Boolean; BkgCanvas : TGraphic);
       begin
        UseBkg := Active;
    //    BackBmp.Canvas.Draw(0, 0, BkgCanvas);
       end;

      var
      lgi : Single;
    //  offset:Integer;
      procedure TSpectrum.Draw(FFTData : TFFTData; X, Y : Integer);
         var
        i, YPos : LongInt;
         YTemp, YVal,Ydb: Single;

        ind: integer;
        begin
         ifend:=false;
                 if FrmClear then begin
             VisBuff.Canvas.Lock;
               VisBuff.Canvas.UnLock;

    if UseBkg then
VisBuff.Canvas.CopyRect(Rect(0, 0, VisBuff.Width, VisBuff.Height), BackBmp.Canvas, Rect(0, 0, VisBuff.Width, VisBuff.Height));

                 end;
          VisBuff.Canvas.Pen.Color := PenColor;
          YTemp:=0;
         for i := 1 to 128 do begin
             lgi:=Power(i*DrawRes,1.926);
             ind:=Trunc(lgi)+4;
             if ind<512 then
        YVal :=Abs(FFTData[ind])
             else
               break;
         if paused then YVal:=0;
         if YVal>0 then Ytemp:=YVal;
            Ydb:=20 * log10(Yval);

         Ypos:=Round(98+Ydb);
         if sw_player.mode=stop then
            Ypos:=0;
            if YPos > Height then YPos := SpecHeight;
            if YPos >= FFTPeacks[i] then FFTPeacks[i] := YPos
               else FFTPeacks[i] := FFTPeacks[i] - PeakFall;
            if paused or (sw_player.Mode=stop) then   begin
                   LineFall :=18 ;
              FFTPeacks[i] := FFTFallOff[i]  ;;
            end
            else begin
                   LineFall :=4 ;
            end;
            if YPos >= FFTFallOff[i] then FFTFallOff[i] := YPos
               else FFTFallOff[i] := FFTFallOff[i] - LineFall;
               if (VisBuff.Height - FFTPeacks[i]) > VisBuff.Height then FFTPeacks[i] := 0;
               if (VisBuff.Height - FFTFallOff[i]) > VisBuff.Height then FFTFallOff[i] := 0;
               case DrawType of
                 0 : begin
                      VisBuff.Canvas.MoveTo(X + i, Y + VisBuff.Height);
                     VisBuff.Canvas.LineTo(X + i, Y + VisBuff.Height - FFTFallOff[i]);
                        if ShowPeak then VisBuff.Canvas.Pixels[X + i, Y + VisBuff.Height - FFTPeacks[i]] := Pen;
                     end;
                 1 :  begin
                                //   PeakFall :=1;
                                //     LineFall :=4 ;
                                  if ShowPeak then begin
                                  VisBuff.Canvas.Pen.Color :=  PeakColor;
                                    Form_player.PaintBox1.Canvas.Pen.Color :=  PeakColor;
                                       VisBuff.Canvas.MoveTo(X + i * (ColWidth + 1 )-ColWidth, Y + VisBuff.Height - FFTPeacks[i]);
                                    VisBuff.Canvas.LineTo(X + i * (ColWidth + 1 ), Y + VisBuff.Height - FFTPeacks[i]);
                               end;
           VisBuff.Canvas.Pen.Color := PenColor;
           VisBuff.Canvas.Brush.Color := PenColor;
           VisBuff.Canvas.Rectangle((X + i * (ColWidth + 1 )-ColWidth), Y + VisBuff.Height - FFTFallOff[i], (X + i * (ColWidth +1)) , Y + VisBuff.Height);



                  end;
               end;
           end;


  ifend:=True;
Form_player.PaintBox1Paint(self);
{             if sw_player.mode=stop then  begin
            for i:=0 to 128 do
        FFTFallOff[i]:=0;
           Form_player.PaintBox1Paint(self);
             end; }
end;

 end.



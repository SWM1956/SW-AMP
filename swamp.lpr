program swamp;
{$mode Delphi}

uses
//  {$IFDEF UNIX}{$IFDEF UseCThreads}
 // cthreads,
//  {$ENDIF}{$ENDIF}
    {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  AdvancedSingleInstance, // !!!
  Dialogs,
  Interfaces, // this includes the LCL widgetset
  Forms, unit1, sw_player, Options1, effects, list, Cover, add_url
  { you can add units after this };

{$R *.res}

begin
{   RequireDerivedFormResource := True;
//  Application.MainFormOnTaskbar := True;
   Application.Initialize;
   Application.CreateForm(TForm1, Form1);
     Application.SingleInstanceEnabled := True;
//   Application.CreateForm(TForm_player, Form_player);
//   Application.CreateForm(TOptions_frm, Options_frm);
//  Application.CreateForm(TFrm_effects, Frm_effects);
  Application.Run;   }

  Application.Initialize;

    Application.SingleInstanceEnabled := true;
    Application.SingleInstance.Start;
    if Application.SingleInstance.IsServer then
    begin
        Application.CreateForm(TForm1, Form1);
        Application.Run;
    end;

end.

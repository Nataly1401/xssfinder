program Project;

uses
  Vcl.Forms,
  MidasLib,
  ufMain in 'ufMain.pas' {fMain},
  udmData in 'udmData.pas' {dmData: TDataModule},
  udmReport in 'udmReport.pas' {dmReport: TDataModule},
  ufTaskEditor in 'ufTaskEditor.pas' {fTaskEditor},
  ufProblem in 'ufProblem.pas' {fProblem},
  ufProblemEditor in 'ufProblemEditor.pas' {fProblemEditor},
  uSiteMapCreator in 'uSiteMapCreator.pas',
  uDatabaseObject in 'uDatabaseObject.pas',
  ufExecution in 'ufExecution.pas' {fExecution},
  uSiteNavigator in 'uSiteNavigator.pas',
  ufParamsEditor in 'ufParamsEditor.pas' {fParamsEditor},
  uSiteLogin in 'uSiteLogin.pas',
  uSiteStoredXssFinder in 'uSiteStoredXssFinder.pas',
  uMyWebBrowser in 'uMyWebBrowser.pas',
  uSiteReflectedXssFinder in 'uSiteReflectedXssFinder.pas';

{$R *.res}

begin
    Application.Initialize;
    Application.MainFormOnTaskbar := not True;
    Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TdmReport, dmReport);
  Application.CreateForm(TfTaskEditor, fTaskEditor);
  Application.CreateForm(TfProblem, fProblem);
  Application.CreateForm(TfProblemEditor, fProblemEditor);
  Application.CreateForm(TfExecution, fExecution);
  Application.CreateForm(TfParamsEditor, fParamsEditor);
  Application.Run;

end.

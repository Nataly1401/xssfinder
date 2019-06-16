unit udmReport;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Forms, frxDesgn, Vcl.Controls,
  frxExportRTF, frxExportPDF, frxChBox, frxExportBIFF, frxExportXML,
  frxExportXLS, frxChart;

const
    c_report_directory = 'Reports\';

type
  TdmReport = class(TDataModule)
    frxReport: TfrxReport;
    amReport: TActionManager;
    frxParams: TfrxDBDataset;
    frxRTFExport1: TfrxRTFExport;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxBIFFExport1: TfrxBIFFExport;
    aEdit: TAction;
    frxTask: TfrxDBDataset;
    aReportMain: TAction;
    frxPage: TfrxDBDataset;
    frxPageCheck: TfrxDBDataset;
    frxTaskProblem: TfrxDBDataset;
    procedure aEditExecute(Sender: TObject);
    procedure aReportMainExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ExecuteReport(FileName: string; EditMode: Boolean);
  public
    { Public declarations }
  end;

const c_Dir_Report : String = 'Report';

var
  dmReport: TdmReport;

implementation



{$R *.dfm}

uses udmData;

procedure TdmReport.ExecuteReport(FileName: string; EditMode: Boolean);
begin
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + c_report_directory + FileName, True);
    if EditMode then
    begin
        frxReport.DesignReport;
    end
    else
    begin
        frxReport.PrepareReport;
        frxReport.ShowPreparedReport;
    end;
end;

procedure TdmReport.aEditExecute(Sender: TObject);
begin
    //
end;

procedure TdmReport.aReportMainExecute(Sender: TObject);
begin
    dmData.cdsPage.Refresh;
    dmData.cdsPageCheck.Refresh;
    dmData.cdsTaskProblem.Refresh;
    ExecuteReport('Main.fr3', aEdit.Checked);
end;

end.

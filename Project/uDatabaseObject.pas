unit uDatabaseObject;

interface

uses Classes, SysUtils, DB, ADODB;

type
    /// <summary>
    /// ������� �����, ��� �������� ����������� ������� �������� � ����� ������
    /// </summary>
    TDatabaseObject = class
    private
        /// <summary>
        /// ���������� � ����� ������
        /// </summary>
        FConnection: TADOConnection;
    protected
        /// <summary>
        /// ����� ���������� ����� ������ (�� ������ ����� �������)
        /// </summary>
        function GetTable(TableName: String): TADOTable;
        /// <summary>
        /// ����� ���������� SQL-�������, ���������� ����� ������
        /// </summary>
        function GetQuery(SQL: String): TADOQuery;
        /// <summary>
        /// ����� ���������� SQL-�������
        /// </summary>
        function ExecQuery(SQL: String): Integer;
    public
        /// <summary>
        /// ����������� ������
        /// </summary>
        constructor Create(Connection: TADOConnection);
        /// <summary>
        /// ���������� ������
        /// </summary>
        destructor Destroy; override;
    end;

implementation

constructor TDatabaseObject.Create(Connection: TADOConnection);
begin
    FConnection := Connection;
end;

destructor TDatabaseObject.Destroy;
begin

end;

function TDatabaseObject.GetTable(TableName: String): TADOTable;
begin
    //
    Result := TADOTable.Create(nil);
    try
        //
        Result.Connection := FConnection;
        Result.TableName := TableName;
        Result.Open;
    except
        //
        on E: Exception do
        begin
            //
            Result.Free;
            raise;
        end;
    end;
end;

function TDatabaseObject.GetQuery(SQL: String): TADOQuery;
begin
    Result := TADOQuery.Create(nil);
    try
        Result.Connection := FConnection;
        Result.SQL.Text := SQL;
        Result.Open;
    except
        on E: Exception do
        begin
            Result.Free;
            raise;
        end;
    end;
end;

function TDatabaseObject.ExecQuery(SQL: String): Integer;
var
    Q: TADOQuery;
begin
    Q := TADOQuery.Create(nil);
    try
        Q.Connection := FConnection;
        Q.SQL.Text := SQL;
        Result := Q.ExecSQL;
    finally
        Q.Free;
    end;
end;

end.

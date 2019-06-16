unit uStack;

interface

uses Classes, SysUtils;

const
    c_stack_is_empty = '���� ����';

type
    /// <summary>
    /// �����, ����������� ������ "����"
    /// </summary>
    TStack = class
    private
        /// <summary>
        /// ������, ��� ��������� �����
        /// </summary>
        FStack: TStringList;
    public
        /// <summary>
        /// ����������� ������
        /// </summary>
        constructor Create;
        /// <summary>
        /// ���������� ������
        /// </summary>
        destructor Destroy; override;
        /// <summary>
        /// ����� ���������, ���� �� ����
        /// </summary>
        function Empty: Boolean;
        /// <summary>
        /// ��������� �������� �� �����
        /// </summary>
        procedure Pop;
        /// <summary>
        /// ���������� �������� � ����
        /// </summary>
        procedure Push(Obj: TObject);
        /// <summary>
        /// ������� ������� �����
        /// </summary>
        function Top: TObject;
    end;

implementation

constructor TStack.Create;
begin
    FStack := TStringList.Create;
end;

destructor TStack.Destroy;
begin
    FStack.Free;
end;

function TStack.Empty: Boolean;
begin
    Result := FStack.Count = 0;
end;

procedure TStack.Pop;
begin
    if Empty then
        raise Exception.Create(c_stack_is_empty);
    FStack.Delete(FStack.Count - 1);
end;

procedure TStack.Push(Obj: TObject);
begin
    FStack.AddObject('', Obj);
end;

function TStack.Top: TObject;
begin
    if Empty then
        raise Exception.Create(c_stack_is_empty);
    Result := FStack.Objects[FStack.Count - 1];
end;

end.

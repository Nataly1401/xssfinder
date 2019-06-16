unit uStack;

interface

uses Classes, SysUtils;

const
    c_stack_is_empty = 'Стек пуст';

type
    /// <summary>
    /// Класс, реализующий модель "Стек"
    /// </summary>
    TStack = class
    private
        /// <summary>
        /// Список, для элементов стека
        /// </summary>
        FStack: TStringList;
    public
        /// <summary>
        /// Конструктор класса
        /// </summary>
        constructor Create;
        /// <summary>
        /// Деструктор класса
        /// </summary>
        destructor Destroy; override;
        /// <summary>
        /// Метод проверяет, пуст ли стек
        /// </summary>
        function Empty: Boolean;
        /// <summary>
        /// Извлекает значение из стека
        /// </summary>
        procedure Pop;
        /// <summary>
        /// Записывает значение в стек
        /// </summary>
        procedure Push(Obj: TObject);
        /// <summary>
        /// Верхний элемент стека
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

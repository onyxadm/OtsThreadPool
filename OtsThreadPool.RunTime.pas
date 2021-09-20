unit OtsThreadPool.RunTime;

{
  Projeto.: OtsThreadPool ® - Componente de execução de tarefas utilizando threads
  Data....: 20/09/2021 03:43
  Autor...: Marivaldo Santos
  Empresa.: ONYX Tecnologia em Softwares ®
  Site....: www.onyxsistemas.com
  Licença.: Privada e protegida - © Todos os direitos reservados.
  email...: admin@onyxsistemas.com
  Fones...: 063 98421-4630
  Objetivo: Facilitar o uso do OtsThreadPool em Run-Time.
}

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARNINGS OFF}

interface

uses
  System.SysUtils,
  OtsThreadPool.Util
  {$IFDEF MSWINDOWS}
    ,
  Vcl.Forms
  {$ELSE}
    ,
  FMX.Forms
  {$ENDIF}
    ;

type
  TTaskManagerThread = class(TOtsThreadPool)
  strict private
    class var FInstance: TTaskManagerThread;
  public
    constructor Create();
    constructor CreatePrivate();
    class function GetInstance(): TTaskManagerThread;
    class procedure FreeInstance();
  end;

function TaskManagerThread(): TTaskManagerThread;

implementation

{ TTaskManagerThread }

constructor TTaskManagerThread.Create();
begin
  raise Exception.Create('Utilize o GetInstance');
end;

constructor TTaskManagerThread.CreatePrivate();
begin
  inherited Create(Application);
end;

class function TTaskManagerThread.GetInstance(): TTaskManagerThread;
begin
  if not(Assigned(FInstance)) then
  begin
    FInstance := TTaskManagerThread.CreatePrivate();
  end;

  Result := FInstance;
end;

class procedure TTaskManagerThread.FreeInstance();
begin
  if Assigned(FInstance) then
  begin
    FInstance.Free;
  end;
end;

function TaskManagerThread(): TTaskManagerThread;
begin
  Result := TTaskManagerThread.GetInstance();
end;

end.

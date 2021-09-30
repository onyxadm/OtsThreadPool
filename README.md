# OtsThreadPool
OtsThreadPool :: Execução de tarefas em multi-threads - Delphi


Exemplo de uso:
```pascal
procedure OnExecuteThread(Sender: TObject);
begin
  // Faça algo
end;
```

Declare: **OtsThreadPool.Util**
```pascal
procedure OnTerminateThread(Sender: TObject);
var
  IdTrf: string;
begin
  // Faça algo
  // Recuperando a identificação da tarefa 
  IdTrf := (Sender as TOtsThreadPoolTask).Identity;   
end;
```

Declare: **OtsThreadPool.RunTime**
```pascal
TaskManagerThread().NewTask(  //
    @OnExecuteThread,         // Tarefa a ser executada
    @OnTerminateThread,       // Quando terminar, execute esse método, caso contrário use **nil**
    'Tarefa id 001',          // Identificação da tarefa, pode ser recuperada no **OnTerminateThread**
    True,                     // Remove esta tarefa da lista ao iniciar? Padrão **TRUE**, se for **FALSE**, a tarefa é eterna
    TThreadPriority.tpHighest // Prioridade da Thread
   );

TaskManagerThread().ThreadCount := 1; // Pra iniciar precisa acrescentar o nº. de threads que deseja;
```

Encerrar as tarefas por demanda
```pascal
TaskManagerThread().Clear;
TaskManagerThread().ThreadCount := 0;
```

unit AgendaTAD;

interface

uses
  Tipos, SysUtils, Variants, miListArray;

const
  LIMITE = 10;
  minHORA = '7:00';
  maxHORA = '19:00';

type
  TADAgenda = object
    private
      Agenda: Lista; //Atributo donde se guarda la agenda del dia actual que se agrega a la lista de Agendas; (Clave: Actividad; Valor1: Horario de comienzo)
      ListadoTiempo: Lista; //Clave: Actividad; Valor1: Tiempo de actividad en minutos
      Agendas: Lista; // Lista de Agenda
    public
     procedure setListadoTiempo(LT:Lista);
     function getListadoTiempo():Lista;
     function AgregarActividadAAgenda(Actividad,Horario:string):boolean;
     procedure AgregarAgenda(dia:integer);
     function RecuperarAgenda(dia:integer):Lista;
     function insertarActividadAgenda(Actividad,Tiempo:string;dia:integer):boolean;
     function HoraADouble(T: string): double;
     function FormatearHorario(H:string): string;
     function OrdenarAgenda(A:Lista):Lista;
     function ValidarAgenda(A:Lista):boolean;
     function ValidarHorario(H:string):boolean;
  end;

implementation

{ TADAgenda }

function TADAgenda.getListadoTiempo: Lista;
begin
  result := ListadoTiempo;
end;

procedure TADAgenda.setListadoTiempo(LT:Lista);
begin
  ListadoTiempo := LT;
end;

function TADAgenda.RecuperarAgenda(dia:integer): Lista; //Recupero una agenda usando punteros
var
  X:TipoElemento; L:^Lista;
begin
  X := Agendas.Recuperar(dia);
  L := X.Valor2;
  result := L^;
end;

function TADAgenda.AgregarActividadAAgenda(Actividad, Horario: string): boolean;
var
  X:TipoElemento;
  Valida:Boolean;
  Aux:Lista;
begin
  Valida := True;
  if Agenda.EsVacia then
    Agenda.Crear(Cadena,LIMITE);
  Horario := FormatearHorario(Horario);
  X.Clave := Actividad;
  X.Valor1 := Horario;

  Aux := Agenda; //Validacion usando una variable auxiliar
  Aux.Agregar(X);
  Aux := OrdenarAgenda(Aux);
  if ValidarAgenda(Aux) and ValidarHorario(Horario) then begin
    Agenda.Agregar(X);
    Agenda := OrdenarAgenda(Agenda)
  end
  else
    Valida := False;

  result := Valida;
end;

procedure TADAgenda.AgregarAgenda(dia:integer); //Agrega una agenda a la lista de agendas usando punteros
var
  X: TipoElemento; L: ^Lista;
begin
  if Agendas.EsVacia then
    Agendas.Crear(Numero,LIMITE);
  New(L);
  L^ := Agenda;
  X.Valor2 := L;
  X.Clave := dia;
  Agendas.Agregar(X);
  Agenda.Crear(Cadena,LIMITE);
end;

function TADAgenda.FormatearHorario(H: string): string; // Borra la parte de segundos del string;
var i:integer;
begin
  for i := 0 to 2 do
    H[length(H) - i] := ' ';
  result := trim(H);
end;

function TADAgenda.HoraADouble(T: string): double; //Toma la hora como un Double para hacer los calculos
var
  Horas,Minutos: integer;
  D,M: double;
begin
  T[pos(':', T)] := ',';
  D := T.ToDouble;
  Horas := trunc(D);
  Minutos := round(frac(D) * 100);
  M := Minutos / 60;
  HoraADouble := Horas + M;
end;

function TADAgenda.OrdenarAgenda(A:Lista):Lista; //Bubble sort
var P,Q: PosicionLista; X1,X2: TipoElemento;
begin
  P := A.Comienzo;
  while (P <> NULO) Do begin
    Q := A.Comienzo;

    while (Q <> NULO) Do begin
      X1 := A.Recuperar(Q);

      If A.Siguiente(Q) <> Nulo then begin
        X2 := A.Recuperar(A.Siguiente(Q));
        if HoraADouble(X1.Valor1) > HoraADouble(X2.Valor1) then
          A.Intercambio(Q, A.Siguiente(Q));
      end;

      Q := A.Siguiente(Q);
    end;

    P := A.Siguiente(P);
  end;
  result := A;
end;

function TADAgenda.ValidarAgenda(A:Lista):boolean; //Valida que no tenga actividades superpuestas con el listado de tiempos
var
  X,X1:TipoElemento;
  Q:PosicionLista;
  TiempoActActual: Double;
  Valido: Boolean;
begin
  Valido := True;
  Q := A.Comienzo;

  while (Q <> NULO) and (A.Siguiente(Q) <> NULO) and Valido do begin
    X := A.Recuperar(Q);
    X1 := A.Recuperar(A.Siguiente(Q));
    TiempoActActual := (ListadoTiempo.Recuperar(ListadoTiempo.Buscar(X)).Valor1) / 60;
    if (HoraADouble(X.Valor1) + TiempoActActual) > (HoraADouble(X1.Valor1)) then
      Valido := False;
    Q := A.Siguiente(Q);
  end;

  result := Valido;
end;

function TADAgenda.ValidarHorario(H: string): boolean;
begin
  result := ((HoraADouble(H) >= HoraADouble(minHora)) and (HoraADouble(H) <= HoraADouble(maxHora)));
end;

function TADAgenda.insertarActividadAgenda(Actividad, Tiempo: string;dia:integer):boolean;
begin

end;


end.

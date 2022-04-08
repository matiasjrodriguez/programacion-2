unit TADCampoMinado;

interface

const
  FILAS = 7;
  COLUMNAS = 10;
  nDireccion: Array [1..4,1..2] of integer = ((-1, 0), (0, 1),(1, 0), (0, -1));  //Up,Right,Down,Left
  CharDireccion: Array [1 .. 4] of Char = ('U', 'R', 'D', 'L');

type
  MChars = array[1..FILAS,1..COLUMNAS] of char;
  Mbool = array[1..FILAS,1..COLUMNAS] of boolean;


  Coordenadas = Record
    F:integer;
    C:integer;
  End;

  Celda = Record
    Direccion: char;
    Situacion: char;
  End;

  VCamino =  array of Celda;
  VMinas = array of Coordenadas;

  CampoMinado = Object
    private
      MC: MChars;
      MB: Mbool;
      VC: VCamino;
      VM: VMinas;
    public
      function GetMatrizC: MChars;
      procedure SetMatrizC(M:MChars);
      function UbicarEntrada(i,j:integer):Coordenadas;
      function UbicarSalida(i,j:integer):Coordenadas;
      procedure BuscarCaminoSeguro(i,j:integer;CaminoAux:VCamino;MinasAux:VMinas);
      procedure InicializarMB();
      function getCamino:VCamino;
      function getMinas:VMinas;
      procedure resetVectores();
  End;

implementation


function CampoMinado.getCamino: VCamino;
begin
  result := VC;
end;

function CampoMinado.GetMatrizC: MChars;
begin
  result := MC;
end;

function CampoMinado.getMinas: VMinas;
begin
  result := VM;
end;

procedure CampoMinado.SetMatrizC(M: MChars);
begin
  MC := M;
end;

procedure CampoMinado.InicializarMB();
var
  i: Integer;
  j: Integer;
begin
  for i := 1 to FILAS do
    for j := 1 to COLUMNAS do
      MB[i,j] := False;
end;

procedure CampoMinado.resetVectores;
begin
  setlength(VC,0);
  setlength(VM,0);
end;

function CampoMinado.UbicarEntrada(i,j:integer):Coordenadas;
var
  Pos:Coordenadas;
begin
  if (i=1) and (j=1) and (MC[i,j] <> 'E') then begin //caso base
    Pos.F := -1;
    Pos.C := -1;
    UbicarEntrada := Pos;
  end
  else if MC[i,j] = 'E' then begin  //caso base 2
    Pos.F := i;
    Pos.C := j;
    UbicarEntrada := Pos;
  end
  else begin
    if i = 1 then begin
      dec(j);
      i := FILAS + 1;
    end;
    UbicarEntrada := UbicarEntrada(i-1,j);  //caso recursivo
  end;
end;

function CampoMinado.UbicarSalida(i,j:integer):Coordenadas;
var
  Pos:Coordenadas;
begin
  if (i=1) and (j=1) and (MC[i,j] <> 'D') then begin
    Pos.F := -1;
    Pos.C := -1;
    UbicarSalida := Pos;
  end
  else if MC[i,j] = 'D' then begin
    Pos.F := i;
    Pos.C := j;
    UbicarSalida := Pos;
  end
  else begin
    if i = 1 then begin
      dec(j);
      i := FILAS + 1;
    end;
    UbicarSalida := UbicarSalida(i-1,j);
  end;
end;

procedure CampoMinado.BuscarCaminoSeguro(i,j: integer;CaminoAux:VCamino;MinasAux:VMinas);   // i = filas; j = columnas
var
  k:integer;
begin
  if MC[i,j] = 'D' then begin       //caso base

    if (length(MinasAux) < length(VM)) or (length(VM) = 0) then begin
      VM := MinasAux;
    end;

    VC := CaminoAux;

  end
  else if (i > FILAS) or (j > COLUMNAS) or (i <= 0) or (j <= 0) then
    //pass
  else begin

    for k := 1 to length(nDireccion) do begin
      MB[i,j] := True;

      if MC[i+nDireccion[k][1],j+nDireccion[k][2]] <> 'P' then begin
        setlength(CaminoAux,length(CaminoAux)+1);
        CaminoAux[high(CaminoAux)].Direccion := CharDireccion[k];
        CaminoAux[high(CaminoAux)].Situacion := MC[i+nDireccion[k][1],j+nDireccion[k][2]];

        if MC[i+nDireccion[k][1],j+nDireccion[k][2]] = 'M' then begin
          setlength(MinasAux,length(MinasAux)+1);
          MinasAux[high(MinasAux)].F := i + nDireccion[k][1];
          MinasAux[high(MinasAux)].C := j + nDireccion[k][2];
        end;

        if (MB[i+nDireccion[k][1],j+nDireccion[k][2]] = False) then begin
          BuscarCaminoSeguro(i+nDireccion[k][1],j+nDireccion[k][2],CaminoAux,MinasAux);
        end;

        MB[i,j] := False;        //comienza el Backtracking volviendo todo para atras
        setlength(CaminoAux,length(CaminoAux)-1);

        if MC[i+nDireccion[k][1],j+nDireccion[k][2]] = 'M' then begin
          setlength(MinasAux,length(MinasAux)-1);
        end;

      end;

    end;

  end;
end;

end.

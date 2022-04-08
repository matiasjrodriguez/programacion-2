unit TADCampoMinado;

interface

const
  FILAS = 7;
  COLUMNAS = 10;

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

  CampoMinado = Object
    private
      MC: MChars;
      MB: Mbool;
      VC: VCamino;
    public
      function GetMatrizC: MChars;
      procedure SetMatrizC(M:MChars);
      function UbicarEntrada(i,j:integer):Coordenadas;
      function UbicarSalida(i,j:integer):Coordenadas;
      function BuscarCaminoSeguro(i,j,k:integer):VCamino;
      procedure InicializarMB();
      procedure InicializarVC();
  End;

implementation


function CampoMinado.GetMatrizC: MChars;
begin
  result := MC;
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
      MB[i,j] := True;
end;

procedure CampoMinado.InicializarVC;
var
  I: Integer;
begin
  for I := 1 to length(VC) do begin
    VC[i].Direccion := ' ';
    Vc[i].Situacion := ' ';
  end;
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

function CampoMinado.BuscarCaminoSeguro(i,j,k: integer): VCamino;
var
  derecha, izquierda, arriba, abajo: boolean;
begin

  if MC[i-1,j] = 'D' then begin  //casos base
    VC[k].Situacion := 'D';
    VC[k].Direccion := 'U';
    BuscarCaminoSeguro := VC;
  end else
  if MC[i,j+1] = 'D' then begin
    VC[k].Situacion := 'D';
    VC[k].Direccion := 'R';
    BuscarCaminoSeguro := VC;
  end else
  if MC[i+1,j] = 'D' then begin
    VC[k].Situacion := 'D';
    VC[k].Direccion := 'D';
    BuscarCaminoSeguro := VC;
  end else
  if MC[i,j-1] = 'D' then begin
    VC[k].Situacion := 'D';
    VC[k].Direccion := 'L';
    BuscarCaminoSeguro := VC
  end
  else begin  //casos recursivos

    if (MC[i-1,j] = 'S') and (MB[i-1,j]) and then begin  //Up
      VC[k].Direccion := 'U';
      VC[k].Situacion := 'S';
      MB[i-1,j] := False;
      BuscarCaminoSeguro := BuscarCaminoSeguro(i-1,j,k+1);
    end;
    if (MC[i,j+1] = 'S') and (MB[i,j+1]) then begin  //Right
      VC[k].Direccion := 'R';
      VC[k].Situacion := 'S';
      MB[i,j+1] := False;
      BuscarCaminoSeguro := BuscarCaminoSeguro(i,j+1,k+1);
    end;
    if (MC[i+1,j] = 'S') and (MB[i+1,j]) then begin  //Down
      VC[k].Direccion := 'D';
      VC[k].Situacion := 'S';
      MB[i+1,j] := False;
      BuscarCaminoSeguro := BuscarCaminoSeguro(i+1,j,k+1);
    end;
    if (MC[i,j-1] = 'S') and (MB[i,j-1]) then begin  //Left
      VC[k].Direccion := 'L';
      VC[k].Situacion := 'S';
      MB[i,j-1] := False;
      BuscarCaminoSeguro := BuscarCaminoSeguro(i,j-1,k+1);
    end;


   { if arriba then
      BuscarCaminoSeguro := BuscarCaminoSeguro(i-1,j,k+1);

    if derecha then
      BuscarCaminoSeguro := BuscarCaminoSeguro(i,j+1,k+1);

    if abajo then
      BuscarCaminoSeguro := BuscarCaminoSeguro(i+1,j,k+1);

    if izquierda then
      BuscarCaminoSeguro := BuscarCaminoSeguro(i,j-1,k+1);  }
  end;

end;

end.

unit TADCarbonos;

interface

const
  FILAS = 7;
  COLUMNAS = 13;

type
  MChars = array[1..FILAS,1..COLUMNAS] of char;
  Mbool = array[1..FILAS,1..COLUMNAS] of boolean;

  Carbonos = Object
    private
      MC: MChars;
      MB: MBool;
    public
      procedure setMatrizC(M:MChars);
      function getMatrizC:MChars;
      function CadenaLarga(i,j:integer):Mbool;
      Function ContarCarbonos(M:MChars;i,j:integer):integer;
      Function ValidarCeldas():boolean;
      procedure InicializarMB();
  End;

implementation

{ Carbonos }

function Carbonos.CadenaLarga(i,j: integer): Mbool;
begin
  if (i=1) and (j=1) then begin   // solo para 1,1
    MB[i,j]:= true;
    MC[i,j]:= 'X';
  end;

    if (MC[i,j+1] = 'C') and (MC[i+1, j] = 'C') then     //derecha y abajo
      if (ContarCarbonos(MC,i,j+1)) > (ContarCarbonos(MC,i+1,j)) then begin
        MB[i,j+1]:= true;
        MC[i,j+1]:= 'X';
        CadenaLarga:= CadenaLarga(i,j+1)
      end
      else begin
        MB[i+1,j]:= true;
        MC[i+1,j]:= 'X';
        CadenaLarga:= CadenaLarga(i+1,j);
      end

    else if (MC[i+1,j] = 'C') and (MC[i,j-1] = 'C') then     //abajo e izquierda
      if (ContarCarbonos(MC,i+1,j)) > (ContarCarbonos(MC,i,j-1)) then begin
        MB[i+1,j]:= true;
        MC[i+1,j]:= 'X';
        CadenaLarga:= CadenaLarga(i+1,j)
      end
      else begin
        MB[i,j-1]:= true;
        MC[i,j-1]:= 'X';
        CadenaLarga:= CadenaLarga(i,j-1);
      end

    else if (MC[i,j+1] = 'C') and (MC[i,j-1] = 'C') then     //derecha e izquierda
      if (ContarCarbonos(MC,i,j+1)) > (ContarCarbonos(MC,i,j-1)) then begin
        MB[i,j+1]:= true;
        MC[i,j+1]:= 'X';
        CadenaLarga:= CadenaLarga(i,j+1)
      end
      else begin
        MB[i,j-1]:= true;
        MC[i,j-1]:= 'X';
        CadenaLarga:= CadenaLarga(i,j-1);
      end

    else if (MC[i-1,j] = 'C') and (MC[i+1,j] = 'C') then     //arriba y abajo
      if (ContarCarbonos(MC,i-1,j)) > (ContarCarbonos(MC,i+1,j)) then begin
        MB[i-1,j]:= true;
        MC[i-1,j]:= 'X';
        CadenaLarga:= CadenaLarga(i-1,j)
      end
      else begin
        MB[i+1,j]:= true;
        MC[i+1,j]:= 'X';
        CadenaLarga:= CadenaLarga(i+1,j);
      end

    else if (MC[i-1,j] = 'C') and (MC[i,j-1] = 'C') then     //arriba e izquierda
      if (ContarCarbonos(MC,i-1,j)) > (ContarCarbonos(MC,i,j-1)) then begin
        MB[i-1,j]:= true;
        MC[i-1,j]:= 'X';
        CadenaLarga:= CadenaLarga(i-1,j)
      end
      else begin
        MB[i,j-1]:= true;
        MC[i,j-1]:= 'X';
        CadenaLarga:= CadenaLarga(i,j-1);
      end

    else if (MC[i-1,j] = 'C') and (MC[i,j+1] = 'C') then     //arriba y derecha
      if (ContarCarbonos(MC,i-1,j)) > (ContarCarbonos(MC,i,j+1)) then begin
        MB[i-1,j]:= true;
        MC[i-1,j]:= 'X';
        CadenaLarga:= CadenaLarga(i-1,j)
      end
      else begin
        MB[i,j+1]:= true;
        MC[i,j+1]:= 'X';
        CadenaLarga:= CadenaLarga(i,j+1);
      end

    else if MC[i,j+1] = 'C' then begin  //derecha
      MB[i,j+1]:= true;
      MC[i,j+1]:= 'X';
      CadenaLarga:= CadenaLarga(i,j+1);
    end
    else if MC[i+1,j] = 'C' then begin  //abajo
      MB[i+1,j]:= true;
      MC[i+1,j]:= 'X';
      CadenaLarga:= CadenaLarga(i+1,j);
    end
    else if MC[i,j-1] = 'C' then begin  //izquierda
      MB[i,j-1]:= true;
      MC[i,j-1]:= 'X';
      CadenaLarga:= CadenaLarga(i,j-1);
    end
    else if MC[i-1,j] = 'C' then begin  //arriba
      MB[i-1,j]:= true;
      MC[i-1,j]:= 'X';
      CadenaLarga:= CadenaLarga(i-1,j);
    end
    else
      CadenaLarga:= MB
end;

function Carbonos.ContarCarbonos(M:MChars;i,j: integer): integer;
begin
  if (M[i+1,j] = 'C') then begin
    M[i+1,j] := 'X';
    ContarCarbonos:= ContarCarbonos(M,I+1,J) + 1
  end
  else if (M[i,j+1] = 'C') then begin
    M[i,j+1] := 'X';
    ContarCarbonos:= ContarCarbonos(M,I,J+1) + 1
  end
  else if (M[i-1,j] = 'C') then begin
    M[i-1,j] := 'X';
    ContarCarbonos:= ContarCarbonos(M,I-1,J) + 1
  end
  else if (M[i,j-1] = 'C') then begin
    M[i,j-1] := 'X';
    ContarCarbonos:= ContarCarbonos(M,I,J-1) + 1
  end
  else
    ContarCarbonos:= 1;
end;

function Carbonos.getMatrizC: MChars;
begin
  result := MC;
end;

procedure Carbonos.InicializarMB;
var
  i,j:integer;
begin
  for i := 1 to FILAS do
    for j := 1 to COLUMNAS do
      MB[i,j] := False;
end;

procedure Carbonos.setMatrizC(M: MChars);
begin
  MC := M;
end;

function Carbonos.ValidarCeldas: boolean;
var
  i,j:integer;
begin
  ValidarCeldas:= true;
  for i := 1 to FILAS do
    for j := 1 to COLUMNAS do
      if (MC[i,j] <> 'C') and (MC[i,j] <> '.') then begin
        ValidarCeldas:= false;
        exit
      end;
end;

end.

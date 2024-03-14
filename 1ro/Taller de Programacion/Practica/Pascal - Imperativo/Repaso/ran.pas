program untitled;

Const 
  dimF = 8;

Type 

  rango = 1..dimF;

  oficina = Record
    cod: integer;
    dni: integer;
    valor: real;
  End;

  vector = array [rango] Of oficina;

Procedure leerOficina(Var O: oficina);
Begin
  O.cod := -1 + Random(100);
  If (O.cod <> -1) Then
    Begin
      O.dni := 1000 + Random(1000);
      O.valor := 5000 + Random(5000);
    End;
End;

Procedure cargarVector(Var V:vector; Var dimL: integer);

Var 
  O: oficina;
Begin
  Randomize;
  leerOficina(O);
  While (O.cod<>-1) And (dimL < dimF) Do
    Begin
      dimL := dimL + 1;
      V[dimL] := O;
      leerOficina(O);
    End;
End;

Procedure imprimirVector(V: vector ; dimL: integer);

Var 
  i: rango;
Begin
  For i:= 1 To dimL Do
    Begin
      writeln(' +++++ Propiedad ',i,' +++++ ');
      writeln('Oficina codigo: ',V[i].cod);
      writeln('DNI propietario: ',V[i].dni);
      writeln('Precio de propiedad: ',V[i].valor:4:2);
    End;
End;

Var 
  V: vector;
  dimL: integer;
Begin
  dimL := 0;
  cargarVector(V,dimL);
  imprimirVector(V,dimL);
end.

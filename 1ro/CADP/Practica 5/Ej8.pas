program memoria;
type
    datos = array [1..20] of integer;//40bytes
    punt = ^datos;//4bytes
procedure procesarDatos(v : datos; var v2 : datos);
    var
    i, j : integer;// 4 bytes
    begin
    for i := 1 to 20 do
        v2[21 - i] := v[i];
    end;
var
    vect : datos;//40bytes
    pvect : punt;//3bytes
    i : integer;//2bytes
begin
    for i:= 1 to 20 do begin
        vect[i] := i;
        writeln(vect[i]);
    end;
    new(pvect);//20bytesMD
    for i:= 20 downto 1 do begin
        writeln(pvect^[i]);
        pvect^[i] := 0;
    end;
    procesarDatos(pvect^, vect);
    writeln('fin');
end.
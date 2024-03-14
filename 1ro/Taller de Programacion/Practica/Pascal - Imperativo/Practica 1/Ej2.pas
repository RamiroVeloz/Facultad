{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}

program ej2;

const 
    max = 300;

type
    rango = 1..max;

    oficina = record
        cod:integer;
        dni:integer;
        valor:integer; //aunque lo mejor es un real, lo hago con int para agilizar;
    end;

    vector = array [rango] of oficina;

    procedure cargarOficinas (var v:vector; var diml:rango);
        procedure lecturaDatos (var o:oficina); 
        begin
            write('Codigo de identificacion: ');readln(o.cod);
            if (o.cod <> -1) then begin
                o.dni := random (1000)+1;
                writeln('Dni: ', o.dni); 
                o.valor := random(9999)+1;
                writeln('Valor: ',o.valor); 
            end;
        end;

    var
        o:oficina;
    begin
        diml := 0;
        Randomize();
        lecturaDatos(o);
        while (o.cod <> -1) do begin
            diml := diml + 1;
            v[diml]:= o;
            lecturaDatos(o);
        end;
    end;

    procedure mostrarOficinas (v:vector; diml:integer);
    var
        i:integer;
    begin
        for i:= 1 to diml do begin
            writeln('-----------------------------------');
            writeln();
            write('Codigo: ', v[i].cod, ' | ', 'Dni: ' , v[i].dni , ' | ','Valor: ' ,v[i].valor);
            writeln();
            writeln('-----------------------------------');
        end;
    end;

{
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
}
    procedure ordenadoPorInsercion (var v:vector; diml:rango);
    var
        i,j:rango; actual:oficina;
    begin
        for i:=2 to diml do begin
            actual:= v[i];
            j:=  i-1;
            while (j > 0) and (v[j].cod > actual.cod) do begin
                v[j+1]:= v[j];
                j := j - 1;
            end;
            v[j+1]:= actual;
        end;
    end;

{
    c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}
    procedure ordenadoPorSeleccion (var v:vector; diml:rango);
    var
        i,j,p:rango; item:oficina;
    begin
        for i:=1 to diml-1 do begin
            p:= i;
            for j:= i+1 to diml do 
                if (v[p].cod > v[j].cod) then
                    p:= j;
            item := v[i];
            v[i]:= v[p];
            v[p]:= item;
        end;
    end;

var
    v:vector; diml:rango;
begin
    cargarOficinas(v,diml);
    mostrarOficinas(v,diml);
    writeln();

    {ordenadoPorInsercion(v,diml);
    mostrarOficinas(v,diml);}
    
    writeln();
    ordenadoPorSeleccion(v,diml);
    mostrarOficinas(v,diml);
end.
{
1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
* 
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
* 
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
* 
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
* 
d) Un módulo recursivo que retorne el monto total de las expensas.
}

program ej1;

const 
    dimf = 300;

type 
    rango = 1..dimf;

    oficina = record
        cod:integer;
        dni:integer;
        monto:real;
    end;

    vector = array [rango] of oficina;

    procedure cargaYLectura (var v:vector; var diml:integer);
        procedure lectura (var o:oficina);
        begin
                write('Ingrese el codigo: ');readln(o.cod);
                if (o.cod <> -1) then begin
                    write('Ingrese el dni del propietario: ');readln(o.dni);
                    write('Ingrese el precio: ');readln(o.monto);
                    writeln();
                end;
        end;

    var
        o:oficina;
    begin
            lectura (o);
            if (diml < dimf) and (o.cod <> -1) then begin
                diml := diml +1;
                v[diml]:= o;
                cargaYLectura(v,diml);
            end;
    end;

    procedure mostrarOficinas (v:vector; diml:integer);
    begin
        if (diml > 0) then begin
            writeln('Codigo: ', v[diml].cod, ' | ', 'DNI del propietario: ', v[diml].dni , ' | ', 'Monto: ', v[diml].monto:4:2);
            mostrarOficinas(v,diml-1);
        end;
    end;

    procedure ordenarOficinas (var v:vector; diml:integer);
    var
        i,j:integer; item:oficina;
    begin
        for i:= 2 to diml do begin
            item := v[i];
            j:= i-1;
            while (j > 0) and (v[j].cod < item.cod) do begin
                v[j+1]:= v[j];
                j := j -1;
            end;
            v[j+1] := item;
        end;
    end;

    procedure buscarOficina (v:vector; diml:integer);
        procedure bdOficina (v:vector;  ini,fin,dato:integer; var pos:integer);
        begin
            pos := (ini + fin) Div 2;
            If (ini <= fin ) and (dato <> v[pos].cod)  Then Begin
                If (V[pos].cod > dato) then
                    bdOficina(V, ini, pos-1, dato, pos)
                Else 
                    bdOficina(V, pos+1, fin, dato, pos);
            End
            Else If (V[pos].cod<>dato) Then
                pos := 0;
        end;
    var
        dato,pos:integer;
        ini,fin:integer;
    begin
        ini:=1; fin:=diml; pos := 0;
        write('Ingrese un codigo para buscar: ');readln(dato);
        bdOficina(v,ini,fin,dato,pos);
        writeln('El elemento que busca se encuentra en la posicion ', pos);
    end;

    function totalExpensas (v:vector;diml:integer):real;
    begin
        if (diml > 0) then
            totalExpensas := totalExpensas(v,diml-1) + v[diml].monto
        else
            totalExpensas:= 0;
    end;
    
var
    v:vector;
    diml:integer;
    total:real;
begin
    diml := 0;
    cargaYLectura(v,diml);
    mostrarOficinas(v,diml);
    ordenarOficinas(v,diml);
    writeln();
    mostrarOficinas(v,diml);
    buscarOficina(v,diml);
    total:= totalExpensas(v,diml);
    writeln('El monto total de las oficinas ingresadaes es: ',total:4:2);
end.


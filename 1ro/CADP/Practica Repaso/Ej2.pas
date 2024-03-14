program ej2;

const
    polizas = 6;
    limitestr = 20;
    corte  = 1122;

type
    rangop = 1..polizas;
    str = string[limitestr];

    cliente = record
        cod:integer;
        dni:integer;
        ape: str;
        nom: str;
        pol : rangop;
        basico : real;
    end;

    lista = ^nodo;
    nodo = record
        dato:cliente;
        sig:lista;
    end;

    vector = array [rangop] of real;

    procedure cargaYproceso ();

        procedure lectura (var c:cliente);
        begin
            write('Ingrese el codigo de cliente: ');readln(c.cod);
            write('Ingrese el dni: ');readln(c.dni);
            write('Ingrese el apellido: ');readln(c.ape);
            write('Ingrese el nombre: '); readln(c.nom);
            write('Ingrese el codigo de la poliza contratada: ');readln(c.pol);
            write('Ingrese el monto basico que abona mensualmente: ');readln(c.basico);
        end;

        procedure agregarOrdenado (var l:lista; c:cliente);
        var
            ant,act,nue:lista;
        begin
            new(nue);
            nue^.dato := c;
            nue^.sig:= nil;
            if (l = nil) then
                l := nue
            else begin
                act:= l;
                ant:= l;
                while (act<> nil) and (act^.dato.cod < nue^.dato.cod) do begin
                    ant := act;
                    act:= act^.sig;
                end;
                if (act = ant )then begin
                    nue^.sig := l;
                    l:= nue;
                end
                else begin
                    ant^.sig:= nue;
                    nue^.sig:= act;
                end;
            end;
        end;

        procedure carga (var l:lista);
        var
            c:cliente;
        begin
            l:= nil;
            repeat
                lectura(c);
                agregarOrdenado(l,c);
            until (c.cod = corte);
        end;

        procedure inicializarVector (var v:vector);
        var
            i:integer;
        begin
            for i:= 1 to polizas do
                v[i] := i * 100;
        end;

        procedure mostrarLista (l:lista);
        var
            v:vector;
        begin
            inicializarVector(v);
            while (l <> nil) do begin
                writeln('------------------------');
                writeln('Codigo de cliente: ',l^.dato.cod);
                writeln('DNI: ', l^.dato.dni);
                writeln('Apellido: ', l^.dato.ape);
                writeln('Nombre: ', l^.dato.nom);
                writeln('Poliza contratada: ', l^.dato.pol);
                writeln('Monto basico para abonar + adicional : ', (l^.dato.basico + v[l^.dato.pol]):4:2);
                writeln('------------------------');
                l:= l^.sig;
            end;
        end;

        function descomponer (num:integer):boolean;
        var
            digito: integer;
            cant:integer;
        begin
            cant:= 0;
            while (num <> 0)do begin
                digito := num mod 10;
                if (digito = 9) then
                    cant:= cant + 1;
                num := num div 10;
            end;
            if (cant >= 2) then
                descomponer := true
            else
                descomponer := false;
        end;

        procedure eliminarCliente (var l:lista; codigo :integer);
        var
            act,ant:lista;
            check : boolean;
        begin
            act := l;
            ant:= l;
            check := false;
            while (act <> nil) and (check = false) do begin
                if (act^.dato.cod = codigo) then
                    check := true
                else begin
                    ant:= act;
                    act:= act^.sig;
                end;
            end;
            if (check = true) then begin
                if (act = l) then
                    l:= act^.sig
                else
                    ant^.sig:= act^.sig;
                dispose(act);
            end;
        end;

        procedure recorrerLista(var l:lista);
        var
            codigo:integer;
        begin
            while (l <> nil) do begin
                if (descomponer(l^.dato.dni) = true) then begin
                    writeln ('El cliente ', l^.dato.ape ,' ',l^.dato.nom, ' tiene al menos 2 digitos 9 en su DNI.');
                end;
                l:= l^.sig;
            end;
            write('Ingrese un codigo de cliente que desee eliminar: ');readln(codigo);
            eliminarCliente(l,codigo);
            writeln('El dato fue eliminado con exito.');       
        end;

    var
        l:lista;
    begin
        carga(l);
        mostrarLista(l);
        recorrerLista(l);
        mostrarLista(l);
    end;

begin
    cargaYproceso();
end.



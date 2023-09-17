{
Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.v
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.v
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.v
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}

program prac;

type

    cliente = record
        dni:integer;
        num:integer;
    end;

    lista = ^nodo;
    nodo = record
        dato:cliente;
        sig:lista;
    end;


    procedure cargarLista (var l:lista);
        procedure lectura (var c:cliente; n:integer);
        begin
            write('Ingrese el dni del cliente: ');readln(c.dni);
            if (c.dni <> 0) then
                c.num := n;
        end;

        procedure agregarFinal (var l:lista; c:cliente);
        var
            act,ant,nue:lista;
        begin
            new(nue);
            nue^.dato:= c;
            nue^.sig:=nil;
            if (l = nil) then
                l:= nue
            else begin
                act:= l ; ant:= l;
                while (act <> nil) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;

    var
        c:cliente;
        num:integer;
    begin
        l:= nil;
        num:= 1;
        lectura(c,num);
        while (c.dni <>0) do begin
            agregarFinal (l,c);
            num:=  num+1;
            lectura(c,num);
        end;
    end;


    procedure mostrarLista (l:lista);
    begin
        while (l <> nil) do begin
            writeln('Dni: ', l^.dato.dni);
            writeln('Numero de atencion: ', l^.dato.num);
            l:= l^.sig;
        end;
    end;


    procedure atencionCliente (var l:lista);
        procedure eliminarLista (var l:lista; num:integer);
        var
            act,ant:lista;
            ok:boolean;
        begin
            ok:= false;
            act:=l; ant:=l;
            while (act <> nil) and (ok = false) do begin
                if (l^.dato.num = num) then
                    ok:= true
                else begin
                    ant:= act;
                    act:= act^.sig;
                end;
            end;
            if (ok = true) then begin
                if (l = act) then
                    l:= act^.sig
                else begin
                    ant^.sig:= act^.sig;
                    dispose(act);
            end;
        end;
        end;
    var
        op:char;
        ok:boolean;
    begin
        while (l <> nil) do begin
            writeln('Se atendera al cliente numero', l^.dato.num);
            eliminarLista(l,l^.dato.num);
            writeln('Lista actualizada');
            mostrarLista(l);
            writeln('Atender al siguiente? s/n'):readln(op);
            if (op = 's') then
                l^:= l^.sig
            else
                l:= nil;
    end;

var
    l:lista;
begin
    cargarLista(l);
    mostrarLista(l);
    atencionCliente(l);
    mostrarLista(l);
end.
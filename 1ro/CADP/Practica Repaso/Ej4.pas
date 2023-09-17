{
Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}

program prac;

const  
    semanas = 3;

type
    rango = 1..semanas;
    str = string [20];

    vector = array [rango] of real;

    paciente = record
        nom : str;
        ape : str;
        semanales : vector;
    end;

    lista = ^nodo;
    nodo = record
        dato:paciente;
        sig:lista;
    end;

    procedure inicializarVector(var v:vector);
    var
        i:integer;
    begin
        for i:= 1 to semanas do 
            v[i]:= 0;
    end;

    procedure cargarDatos (var l:lista);
        procedure lectura (var p:paciente);
        var
            i:rango;
        begin
            write('Ingrese el nombre: ');readln(p.nom);
            if (p.nom <> 'zzz') then begin
                //write('Ingrese el apellido: ');readln(p.ape);
                inicializarVector(p.semanales);
                Randomize;
                for i:= 1 to semanas do  begin
                    writeln('Cargando peso de la semana ', i ,'.');p.semanales[i]:= Random(100);
                end;
            end;
        end;

        procedure agregarFinal (var l:lista; p:paciente);
        var
            act,ant,nue:lista;
        begin
            new(nue);
            nue^.dato:= p;
            nue^.sig:= nil;
            if (l = nil) then
                l:= nue
            else begin
                act:=l; ant:= l;
                while (act <> nil) do begin
                    ant:= act;
                    act:= act^.sig;
                end;
                ant^.sig:= nue;
            end;
        end;
    var
        p:paciente;
    begin
        lectura(p);
        while (p.nom<>'zzz') do begin
            agregarFinal (l,p);
            lectura(p);
        end;
    end;

    procedure mostrarLista (l:lista);
    var
        i:integer;
    begin
        while (l<> nil) do begin
            writeln('Nombre: ',l^.dato.nom);
            for i:=1 to semanas do begin
                writeln('Semana: ', i);
                writeln('Peso: ', (l^.dato.semanales[i]):4:2);
            end;
            l:= l^.sig;
        end;
    end;

    {
    a. Para cada embarazada, la semana con mayor aumento de peso.
    b. El aumento de peso total de cada embarazada durante el embarazo.
    }
    procedure procesarLista (l:lista);
        procedure calcularMax (var pesoMax:real; var semMax:integer; peso:real; semana:integer);
        begin
            if (peso > pesoMax) then begin
                pesoMax := peso;
                semMax := semana;
            end;
        end;
    var
        pesoMax,act,total:real;
        semMax:integer;
        i:rango;
    begin
        while (l <> nil) do begin
            act:= 0;
            pesoMax :=0;
            semMax := 0;
            total:= 0;
            for i:= 1 to semanas do begin
                act := l^.dato.semanales[i] - l^.dato.semanales[i+1];
                calcularMax (pesoMax, semMax, act, i);
                if (l^.dato.semanales[i] < l^.dato.semanales[i+1]) then
                    total := l^.dato.semanales[i +1 ] - l^.dato.semanales[i]
                else
                    total:= l^.dato.semanales[i] - l^.dato.semanales[i+1];
                writeln('El aumento de peso total de la semana ', i, ' de la embarazada es: ',total:4:2);
            end;
            writeln('La embarazada ', l^.dato.nom,' tuvo su maor aumento de peso en la semana ', semMax, ' con un aumento total de ', pesoMax:4:2,'kg.');
            l:= l^.sig;
        end;
    end;
var
    l:lista;
begin
    cargarDatos(l);
    mostrarLista(l);
    procesarLista(l);
end.

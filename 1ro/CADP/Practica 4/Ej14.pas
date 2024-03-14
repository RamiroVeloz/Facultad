{
El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.
}
program practica;

const
    proyectos =1000;
    roles = 5;

type
    rangop = 1..proyectos;
    rangor = 1..roles;
    str = string[20];

    participante = record
        cod:integer;
        pais:str;
        nom:str;
        rol:rangor;
        canthoras:integer;
    end;

    vector = array [rangop] of participante;
    contadorMontos = array [rangop] of real;
    contadorArqui = array [rangop] of integer;

    procedure lecturaYCarga (var v:vector; var diml:integer);
        procedure lectura (var p:participante);
        begin
            write('Ingrese el codigo del proyecto: ');readln(p.cod);
            if (p.cod <> -1) then begin
                write('Ingrese el pais: ');readln(p.pais);
                write('Ingrese el nombre del proyecto: ');readln(p.nom);
                write('Ingrese el rol del participante: ');readln(p.rol);
                write('Ingrese la cantidad de horas trabajadas: ');readln(p.canthoras);
            end;
        end;

    var
        p:participante;
    begin
        diml:= 0;
        lectura(p);
        while (p.cod <> -1) do begin
            diml:= diml + 1;
            v[diml]:= p;
            lectura(p);
        end;
    end;

    procedure mostrarVector (v:vector; diml:integer);
    var
        i:integer;
    begin
        for i:= 1 to diml do begin
            writeln('----------------------------------------------');
            writeln('Codigo: ', v[i].cod);
            writeln('Pais: 'v[i].pais);
            writeln('Nombre del proyecto: ',v[i].nom);
            writeln('Rol: ',v[i].rol);
            writeln('Cantidad de horas trabajadas: ',v[i].canthoras);
            writeln('-----------------------------------------------');
        end;
    end;

    procedure inicialiarContadorMontos (var cm:contadorMontos);
    var
        i:integer;
    begin
        for i:=1 to proyectos do
            cm[i]:= 0;
    end;

    procedure inicializarContadorArqui(var ca:contadorArqui);
    var
        i:integer;
    begin
        for i:=1 to proyectos do;
    

    procedure procesarVector (v:vector; diml:integer);
    {
    a) El monto total invertido en desarrolladores con residencia en Argentina.
    b) La cantidad total de horas trabajadas por Administradores de bases de datos.
    c) El código del proyecto con menor monto invertido.
    d) La cantidad de Arquitectos de software de cada proyecto.
    }
    var


var
    diml:integer;
    v:vector;
begin
    lecturaYCarga(v,diml);
    mostrarVector(v,diml);
    
end.
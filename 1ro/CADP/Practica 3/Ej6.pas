{
    6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:

● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.
}

program ej6;


const
    limitestr = 20;

type
    str = string [limitestr];

    info = record
        marca: str;
        linea: str;
        cc:integer;
        vr: real;
        tn: integer;
    end;

    procedure corte ();
        procedure lectura (var i:info);
        begin
            write('Ingrese la linea: '); readln(i.linea);
            write('Ingrese la cantidad de cores: '); readln (i.cc);
            write('Ingrese la velocidad de reloj: '); readln (i.vr);
            write('Ingrese el tamano de los transistores: ');readln(i.tn);
        end;

        procedure cargaYCorte ();
        var
            i:info;
            cant: integer;
            m1,m2:str;
            act:boolean;
            cantpm:integer;
        begin

            cant:= 0;
            cantpm:= 0;
            m1:= '';
            m2:= '';
            write('Ingrese la marca del procesador: ');readln (i.marca);
            while (i.cc > 0) do begin
                act := true;
                while (act = true) and (i.cc > 0) do begin
                    lectura(i);

        end;
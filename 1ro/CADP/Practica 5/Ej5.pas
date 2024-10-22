Program Alocacion_Dinamica;
Type
    TEmpleado = record
        sucursal: char;//1byte
        apellido: string[25];//26bytes
        correoElectrónico: string[40];//41bytes
        sueldo: real;//8bytes
    end;
    //record = 76bytes
    Str50 = string[50];
Var
    alguien: TEmpleado;//76bytes
    PtrEmpleado: ^TEmpleado;//4bytes
Begin
{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
    Readln( alguien.apellido );
    writeln(sizeof(alguien.apellido));//26bytes
{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
    New( PtrEmpleado );
    writeln(sizeof(PtrEmpleado));//76bytes
{¿Cuánta memoria disponible hay ahora? (III)}
    Readln( PtrEmpleado^.sucursal, PtrEmpleado^.apellido );
    writeln(sizeof(PtrEmpleado^.sucursal));//1byte
    writeln(sizeof(PtrEmpleado^.apellido));//26bytes
    Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
    writeln(sizeof(PtrEmpleado^.correoElectrónico));//41bytes
    writeln(sizeof(PtrEmpleado^.sueldo));//8bytes
{¿Cuánta memoria disponible hay ahora? (IV)}
    //76 + 4 = 80 ME
    //76 MD
    //154 bytes
    Dispose( PtrEmpleado );
    //80bytes
{¿Cuánta memoria disponible hay ahora? (V)}
    //400.000 - 80
end.
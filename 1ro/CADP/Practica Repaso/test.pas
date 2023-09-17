Program cuatro;
Type
puntero = ^integer;
Var
p,q:puntero;

Begin
    new (p); 
    p^:= 14;
    writeln (p^);
    q:=p; 
    q^:= q^*10;
    writeln(p^); 
    writeln(q^); 
    q:=nil;
    writeln(p^);
    writeln(q^);     
End.

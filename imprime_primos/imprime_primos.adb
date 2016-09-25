with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure IMPRIME_PRIMOS is
    NUM : INTEGER;
    function es_primo (N : INTEGER) return BOOLEAN is
        R : BOOLEAN := TRUE;
        I : INTEGER := 2;
    begin
        while (I * I <= N) AND R loop
            if (N mod I) = 0 then
                R := FALSE;
            end if;
            I := I + 1;
        end loop;
        return R;
    end es_primo;

Begin
    put ("Ingrese un numero: ");
    get (NUM);
    for I in Integer range 2..NUM loop
        if es_primo (I) then
            put(I);
        end if;
    end loop;
End IMPRIME_PRIMOS;

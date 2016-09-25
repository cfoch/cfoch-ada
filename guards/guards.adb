with Ada.Text_IO;
With Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure Guards is
   task type Cyclic_Buffer_Task_Type is
      entry Insert (An_Item: in Integer);
      entry Remove (An_Item: out Integer);
   end Cyclic_Buffer_Task_Type;

   Q_Size : Constant := 100;
   subtype Q_Range is Positive range 1 .. Q_Size;
   Length : Natural range 0 .. Q_Size := 0;
   Head, Tail : Q_Range := 1;
   Data : array (Q_Range) of Integer;

   task body Cyclic_Buffer_Task_Type is
      Datum : Integer;
   begin
      loop
         select
            when Length < Q_Size => 
               accept Insert (An_Item: in Integer) do
                  Data(Tail) := An_Item;
                  Put ("Inserting");
                  Put (An_Item);
                  New_Line (1);
               end Insert;
               Tail := Tail mod Q_Size + 1;
               Length := Length + 1;
         or
            when Length > 0 =>
               accept Remove (An_Item : out Integer) do
                  An_Item := Data(Head);
                  Put ("Removing");
                  Put (An_Item);
                  New_Line (1);
               end Remove;
               Head := Head mod Q_Size + 1;
               Length := Length - 1;
         end select;
      end loop;
   end Cyclic_Buffer_Task_Type;

   Datum : Integer;
   Buff : Cyclic_Buffer_Task_Type;

   begin
      Buff.Insert (10);
      Buff.Insert (20);
      Buff.Insert (90);
      Buff.Remove (Datum);
      Buff.Remove (Datum);
   end Guards;

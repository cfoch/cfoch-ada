with Ada.Text_IO;
use Ada.Text_IO;

procedure selective_wait is
   task type Encapsulated_Variable_Task_Type is
      entry Store (An_Item : in Integer);
      entry Fetch (An_Item : out Integer);
   end Encapsulated_Variable_Task_Type;

   task body Encapsulated_Variable_Task_Type is
      Datum : Integer;
   begin
      accept Store (An_Item : in Integer) do
         Datum := An_Item;
         Put_Line ("Storing");
      end Store;
      loop
         select
            accept Store (An_Item : in Integer) do
               Datum := An_Item;
               Put_Line ("Storing");
            end Store;
         or
            accept Fetch (An_Item : out Integer) do
               An_Item := Datum;
               Put_Line ("Fetching");
            end Fetch;
         end select;
      end loop;
   end Encapsulated_Variable_Task_Type;

   x, y : Encapsulated_Variable_Task_Type;
   it : Integer;

   begin
      it := 4;
      x.Store (10);
      y.Store (it);
      x.Fetch (it);

   end selective_wait;

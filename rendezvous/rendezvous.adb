with Ada.Text_IO;
use Ada.Text_IO;

procedure rendezvous is
   task type Encapsulated_Buffer_Task_Type is
      entry Insert (An_Item : in Integer);
      entry Remove (An_Item : out Integer);
   end Encapsulated_Buffer_Task_type;

   Buffer_Pool : array (0 .. 15) of Encapsulated_Buffer_Task_Type;
   This_Item : Integer;

   task body Encapsulated_Buffer_Task_Type is
      Datum : Integer;
   begin
      loop
         accept Insert (An_Item : in Integer) do
            Datum := An_Item;
            Put_Line ("Inserting");
         end Insert;
         accept Remove (An_Item : out Integer) do
            An_Item := Datum;
            Put_Line ("Removing");
         end Remove;
      end loop;
   end Encapsulated_Buffer_Task_Type;

   begin
      Buffer_Pool(1).Remove (This_Item);
      Put_Line ("Blah");
      Buffer_Pool(2).Insert (This_Item);
   end rendezvous;

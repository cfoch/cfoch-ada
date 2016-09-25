with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

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
            Put ("Inserting");
            Put (An_Item);
            New_Line;
         end Insert;
         accept Remove (An_Item : out Integer) do
            An_Item := Datum;
            Put ("Removing");
            Put (An_Item);
            New_Line;
         end Remove;
      end loop;
   end Encapsulated_Buffer_Task_Type;

   task Task0;
   task Task1;
   task Task2;
   task Task3;
   task Task4;

   task body Task0 is
   begin
      Put_Line ("This is task0. Removing.");
      Buffer_Pool(0).Remove(This_Item);
   end Task0;

   task body Task1 is
   begin
      Put_Line ("This is task1. Inserting.");
      Buffer_Pool(0).Insert(10);
   end Task1;

   task body Task2 is
   begin
      Put_Line ("This is task2. Inserting.");
      Buffer_Pool(0).Insert(40);
   end Task2;

   task body Task3 is
   begin
      Put_Line ("This is task3. Inserting.");
      Buffer_Pool(0).Insert(80);
   end Task3;

   task body Task4 is
   begin
      Put_Line ("This is task4. Removing.");
      Buffer_Pool(0).Remove(This_Item);
   end Task4;

   begin
      null;
   end rendezvous;

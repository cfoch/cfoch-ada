with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure Protected_Buffer is
   protected type Protected_Buffer_Type is
      entry Insert (An_Item : in Integer);
      entry Remove (An_Item : out Integer);
   private
      Buffer : Integer;
      Empty : Boolean := True;
   end Protected_Buffer_Type;

   protected body Protected_Buffer_Type is
      entry Insert (An_Item : in Integer)
         when Empty is
      begin
         Buffer := An_Item;
         Empty := False;
         Put ("Inserting");
         Put (An_Item);
         New_Line (1);
      end Insert;

      entry Remove (An_Item : out Integer)
         when not Empty is
      begin
         An_Item := Buffer;
         Empty := True;
         Put ("Removing");
         Put (An_Item);
         New_Line (1);
      end Remove;
   end Protected_Buffer_Type;

   Buff : array (0 .. 100) of Protected_Buffer_Type;
   Datum : Integer;

   task Task0;
   task Task1;
   task Task2;
   task Task3;
   task Task4;

   task body Task0 is
   begin
      Buff(0).Remove(Datum);
   end Task0;

   task body Task1 is
   begin
      Buff(0).Insert(10);
   end Task1;

   task body Task2 is
   begin
      Buff(0).Insert(40);
   end Task2;

   task body Task3 is
   begin
      Buff(0).Insert(80);
   end Task3;

   task body Task4 is
   begin
      Buff(0).Remove(Datum);
   end Task4;

   begin
      null;
   end Protected_Buffer;

with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure ProtectedExample is
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

   begin
      null;
   end ProtectedExample;

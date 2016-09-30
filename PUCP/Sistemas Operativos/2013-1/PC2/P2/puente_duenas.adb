with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure Puente_Duenas is
   subtype TasksRange is Integer Range 0 .. 1;
   package Random_Proc is new Ada.Numerics.Discrete_Random (TasksRange);
   use Random_Proc;
   G : Generator;
   Switch : TasksRange;
   

   protected type Switcher_Type is
      entry On;
      entry Off;
   private
      Enabled : Boolean := False;
   end Switcher_Type;

   protected body Switcher_Type is
      entry On
         when not Enabled is
      begin
         Put_Line ("Avanzando de Este a Oeste");
         Enabled := True;
      end On;

      entry Off
         when Enabled is
      begin
         Put_Line ("Avanzando de Oeste a Este");
         Enabled := False;
      end Off;
   end Switcher_Type;

   Switcher : Switcher_Type;


   task type TaskSwitch_Type;
   task body TaskSwitch_Type is
   begin
      Reset (G);
      Switch := Random (G);
      if Switch = 1 then
         Switcher.On;
      else
         Switcher.Off;
      end if;
   end TaskSwitch_Type;


   TasksOn : Array (1 .. 15) of TaskSwitch_Type;

   

begin
   null;
end Puente_Duenas;

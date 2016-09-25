with Ada.Text_IO; use Ada.Text_IO;
package body Greetings is
    procedure Hello is
    begin
        Put_Line ("Hello world!");
    end Hello;

    procedure Goodbye is
    begin
        Put_Line ("Goodby world!");
    end Goodbye;
end Greetings;

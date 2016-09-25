with ADA.text_io;
use ADA.text_io;

Procedure PingPong is
begin
	task type printer is
		entry do_it(text: in string);
	end printer;
end PingPong;

task body printer is
	begin 
		loop
			select
				accept do_it(text: in string) do
					put_line(text);
				end do_it;
				or
				terminate;
			end select;
		end loop;
	end printer;

ping,pong,pang,	printer:
	begin
		for index in 1..10 loop
			ping.do_it("ping");
			pong.do_it("pong");
			pang.do_it("pang");
		end loop;
	end ping, pong, pang;


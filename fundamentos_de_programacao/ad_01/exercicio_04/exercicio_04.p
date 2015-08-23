program ad_01_exercicio_04;

function x (m,n:integer):integer;
begin
  if(n = 1)then
    begin
      x := m;
    end
  else
    begin
      x := m * x(m,n-1);
    end;
end;


var
  m,n: integer;
begin

  Writeln('Informe m');
  readln(m);
  Writeln('Informe n');
  readln(n);
  Writeln(x(m,n));

end.

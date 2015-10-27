program ad_02_exercicio_02;

uses sysutils;

type
  Pessoa = record
            nome: string;
            idade: integer;
            salario: real;
          end;
  ArqPessoa = file of Pessoa;

var
  cadastroArquivo: ArqPessoa;
  cadastro: Pessoa;
  nome, caminhoDoArquivo: string;
  idade: integer;
  salario: real;
begin
  caminhoDoArquivo := './cadastro.txt';

  assign(cadastroArquivo, caminhoDoArquivo);
  rewrite(cadastroArquivo);

  writeln('Qual o nome do usuario?');
  readln(nome);
  cadastro.nome := nome;
  writeln('Qual a idade do usuario?');
  readln(idade);
  cadastro.idade := idade;
  writeln('Qual o salário do usuario em reais(R$)?');
  readln(salario);
  cadastro.salario := salario;

  write(cadastroArquivo,cadastro);
  close(cadastroArquivo);

  assign(cadastroArquivo,caminhoDoArquivo);
  reset(cadastroArquivo);
  read(cadastroArquivo,cadastro);

  writeln('O nome do funcionario é '+ cadastro.nome);
  writeln('A idade do funcionario é ' + IntToStr(cadastro.idade) + ' anos');
  writeln('O salário do funcionario é de R$ ' + FloatToStr(cadastro.salario));

  if(cadastro.idade > 60) then
    begin
      cadastro.salario := cadastro.salario * 1.11;
      seek(cadastroArquivo,0);
      write(cadastroArquivo,cadastro);
      close(cadastroArquivo);

      assign(cadastroArquivo,caminhoDoArquivo);
      reset(cadastroArquivo);
      read(cadastroArquivo,cadastro);
      writeln('O nome do funcionario é '+ cadastro.nome);
      writeln('A idade do funcionario é ' + IntToStr(cadastro.idade) + ' anos');
      writeln('O salário do funcionario é de R$ ' + FloatToStr(cadastro.salario));
    end;
end.

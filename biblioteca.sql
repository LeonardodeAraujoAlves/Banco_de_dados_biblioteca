create table Livro(
	cod_livro int primary key not null,
    nome_livro varchar(60) not null,
    autor_livro varchar(60) not null,
    quant_livro int not null,
    fk_categoria_livro int,
    fk_localização_livro int
);

create table Categoria_livro(
	cod_categoria int primary key not null,
    descr_categoria varchar(60)
);

create table Localizaco_livro(
	cod_estante int primary key not null,
    tema_estante varchar(60) not null
);

create table Emprestimo(
	quant_livros int not null,
    fk_cod_Livro int not null,
    fk_aluno_ra int primary key not null,
  	fk_nome_livro varchar(60) not null,
  	fk_cod_categoria int  not null,
  	fk_cod_localizacao_livro int not null 
  
);

create table Aluno(
	ra int primary key not null,
    nome_aluno varchar(100) not null,
    livros_alugados int,
    status_aluno enum('Cursando','Suspenso','Formado','Matricula trancada') default 'Cursando'
);

alter table Livro add constraint fk_categoria foreign key(fk_categoria_livro) references Categoria_livro(cod_categoria);
alter table Livro add constraint fk_localizacao foreign key(fk_localização_livro) references Localizaco_livro(cod_estante);

alter table Emprestimo add constraint fk_ra_alno foreign key(fk_aluno_ra) references Aluno(ra);
alter table Emprestimo add constraint fk_cod_livro foreign key(fk_cod_livro) references Livro(cod_livro);
alter table Emprestimo add constraint fk_nome_livro FOREIGN key(fk_nome_livro) REFERENCES Livro(nome_livro);
alter table Emprestimo add CONSTRAINT fk_cod_categoria FOREIGN key(fk_cod_categoria)REFERENCES Livro(fk_categoria_livro);
alter TABLE Emprestimo add CONSTRAINT fk_cod_localizacao FOREIGN key(fk_cod_localizacao_livro)REFERENCES livro(fk_localização_livro);

alter table Aluno add constraint fk_id_livroAlugado foreign key(livros_alugados) references Livro(cod_livro);


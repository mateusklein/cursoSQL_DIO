use company_constraints;

show triggers from company_constraints;

create table mensagens(
	id_mensagem INT auto_increment primary key,
    mensagem VARCHAR(100) NOT NULL,
    ssn_messages char(9) NOT NULL,
	CONSTRAINT fk_messages_ssn FOREIGN KEY (ssn_messages)
    REFERENCES employee(Ssn) ON DELETE CASCADE
);

delimiter //
create trigger null_value_check after insert on employee
for each row
	if (new.Address is null) then
		insert into mensagens (mensagem, ssn_messages) values(concat('Update your addres, please ', new.Fname), new.Ssn);
	else 
		insert into mensagens (mensagem, ssn_messages) values(concat('Error ', new.Fname), new.Ssn);
	end if;
//
delimiter ;

insert into employee values ("Joao", "S", "Andre", 123246781, "1974-05-12", null , "M", 20000, 123456782, 5);

select * from mensagens;

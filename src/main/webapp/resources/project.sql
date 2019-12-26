/* ==============================project==============================*/

use project;

drop table spms;
create table spms(
	no int(11) not null auto_increment,
	name varchar(50) not null,
	content text not null,
	startdate varchar(20) not null,
	enddate varchar(20) not null,
	progress varchar(20) not null,
	primary key(no)
);

desc spms;

select * from spms;
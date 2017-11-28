insert into vender(firm, firm_url, username, password, user_fname, mobile_no, pan_no,\
	tan_no, vat_no) values ('ABConstructors','http://www.abc.com','constructor','constructor',\
	'Alice Bob','9999999999','Abs1277','gdsagduya','sajdk23');

insert into admin(username, password) values ('admin','admin');

insert into tender( est_amt, tender_pub_date, tender_last_date, tender_active) values \
	(5000000, '2017-11-28', '2020-11-28', 'w');

insert into tender( est_amt, tender_pub_date, tender_last_date, tender_active) values \
	(7000000, '2017-12-18', '2020-12-18', 'a');
	
insert into tender( est_amt, tender_pub_date, tender_last_date, tender_active) values \
	(12000000, '2016-11-28', '2020-11-28', 'r');

insert into project_category values(1,'construction');

insert into project(title, state, district, project_category,bid_start_date, bid_end_date,\
	project_desc, project_status) values('Flyover','Karnataka','Bangalore',1,'2016-10-10','2017-11-30','To construct a flyover of length 1 km at silk board junction.','a');

insert into project(title, state, district, project_category,bid_start_date, bid_end_date,\
	project_desc, project_status) values('Commercial Complex','Karnataka','Bangalore',1,'2016-10-10','2017-11-30','To construct a commercial complex at MG Road.','w');

insert into bidding(vender_id,tender_id,project_id) values(100,1,1);

insert into bidding(vender_id,tender_id,project_id) values(100,2,1);

insert into bidding(vender_id,tender_id,project_id) values(100,3,1);



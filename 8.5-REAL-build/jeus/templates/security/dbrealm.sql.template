CREATE TABLE jeus_users ( domain varchar(30), username varchar(30), password varchar(100), primary key(domain, username));
CREATE TABLE jeus_groups ( domain varchar(30), groupname varchar(30), subgroups varchar(100), description varchar(100), primary key (domain, groupname));
CREATE TABLE jeus_group_members ( domain varchar(30) , groupname varchar(30) , username varchar(30), primary key (domain, groupname, username));

insert into jeus_users values('SYSTEM_DOMAIN','jeus','{base64}amV1cw==');
insert into jeus_users values('SYSTEM_DOMAIN','j2ee_vi','{base64}ajJlZV92aQ==');
insert into jeus_users values('SYSTEM_DOMAIN','javajoe','{base64}amF2YWpvZQ==');
insert into jeus_groups values('SYSTEM_DOMAIN', 'cts_group', null, 'CTS GROUP');
insert into jeus_groups values('SYSTEM_DOMAIN', 'group1', null, 'TEST GROUP');
insert into jeus_groups values('SYSTEM_DOMAIN', 'system_group', 'cts_group, group1', 'SYSTEM GROUP');
insert into jeus_group_members values('SYSTEM_DOMAIN', 'cts_group','j2ee');
insert into jeus_group_members values('SYSTEM_DOMAIN', 'cts_group', 'j2ee_vi');
insert into jeus_group_members values('SYSTEM_DOMAIN', 'cts_group', 'javajoe');
insert into jeus_group_members values('SYSTEM_DOMAIN', 'system_group', 'jeus');
insert into jeus_group_members values('SYSTEM_DOMAIN', 'system_group', 'anonymous');

CREATE TABLE jeus_role_permissions (domain varchar(30), rolepermissionid varchar(30), description varchar(100));
CREATE TABLE jeus_role_permission ( rolepermissionid varchar(30), role varchar(30), actions varchar(100), classname varchar(100), excluded varchar(5), unchecked varchar(5), primary key(rolepermissionid, role));
CREATE TABLE jeus_role_principal ( domain varchar(30), rolepermissionid varchar(30), username varchar(30), primary key (domain, rolepermissionid, username));
CREATE TABLE jeus_resource_role ( domain varchar(30), resourcepermissionid varchar(30), rolepermissionid varchar(30), primary key(domain, resourcepermissionid, rolepermissionid));
CREATE TABLE jeus_resource_permissions ( domain varchar(30), contextid varchar(30), resourcepermissionid varchar(30), description varchar(100), primary key(domain, contextid, resourcepermissionid));
CREATE TABLE jeus_resource_permission ( resourcepermissionid varchar(30), res varchar(30), actions varchar(100), classname varchar(100), excluded varchar(5), unchecked varchar(5), primary key(resourcepermissionid, res));

CREATE TABLE jeus_seqno (tablename varchar(30), currentseqno varchar(30), primary key(tablename));
insert into jeus_seqno values('jeus_role_permission', '0');
insert into jeus_seqno values('jeus_resource_permission', '0');

insert into jeus_role_permissions values('SYSTEM_DOMAIN', '1', 'CTS Role Permission');
insert into jeus_role_permissions values('SYSTEM_DOMAIN', '2', 'Security Administrator Role Permission');
insert into jeus_role_permissions values('SYSTEM_DOMAIN', '3', 'administratror Permission');
insert into jeus_role_permissions values('SYSTEM_DOMAIN', '4', 'jndi user Permission');

insert into jeus_role_permission values('1','ctsUser',null,'jeus.security.resource.RolePermission','false','false');
insert into jeus_role_permission values('2','SecurityAdministrator',null,'jeus.security.resource.RolePermission','false','false');
insert into jeus_role_permission values('3','administrator',null,'jeus.security.resource.RolePermission','false','false');
insert into jeus_role_permission values('4','jndiUser',null,'jeus.security.resource.RolePermission','false','false');

insert into jeus_role_principal values('SYSTEM_DOMAIN','1','javajoe');
insert into jeus_role_principal values('SYSTEM_DOMAIN','1','j2ee');
insert into jeus_role_principal values('SYSTEM_DOMAIN','1','j2ee_vi');
insert into jeus_role_principal values('SYSTEM_DOMAIN','2','jeus');
insert into jeus_role_principal values('SYSTEM_DOMAIN','3','jeus');
insert into jeus_role_principal values('SYSTEM_DOMAIN','4','anonymous');

insert into jeus_resource_permissions values('SYSTEM_DOMAIN','default','1','CTS Resource Permission');
insert into jeus_resource_permissions values('SYSTEM_DOMAIN','default','2','JEUS Resource Permission');
insert into jeus_resource_permissions values('SYSTEM_DOMAIN','default','3','WebT Resource Permission');

insert into jeus_resource_permission values('1', 'jeus.jndi.*', 'lookup', 'jeus.security.resource.ResourcePermission', 'false', 'false');
insert into jeus_resource_permission values('2', 'jeus.*', '*', 'jeus.security.resource.ResourcePermission', 'false', 'false');
insert into jeus_resource_permission values('3', 'tmax.*', '*', 'jeus.security.resource.ResourcePermission', 'false', 'false');

insert into jeus_resource_role values('SYSTEM_DOMAIN', '1', '4');
insert into jeus_resource_role values('SYSTEM_DOMAIN', '2', '1');
insert into jeus_resource_role values('SYSTEM_DOMAIN', '2', '2');
insert into jeus_resource_role values('SYSTEM_DOMAIN', '2', '3');
insert into jeus_resource_role values('SYSTEM_DOMAIN', '3', '3');



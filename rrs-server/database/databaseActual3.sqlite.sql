CREATE TABLE "workflows" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`workflow_name`	INTEGER,
	`stage_num`	INTEGER,
	`step_name`	varchar,
	`needs_assigned`	INTEGER DEFAULT 0,
	`assigner`	INTEGER,
	`assigned_group`	INTEGER,
	`approval_type`	REAL,
	`approval_person`	INTEGER,
	`task_type`	INTEGER,
	`task_description`	BLOB,
	`created_at`	INTEGER,
	`updated_at`	INTEGER
);
INSERT INTO `workflows` (id,workflow_name,stage_num,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (53,1,1,'GetAssigned',1,1,NULL,'None','select','SelectTaskType','Assign the Request to someone in the art department','2017-01-11 15:00:09','2017-01-11 15:00:09');
INSERT INTO `workflows` (id,workflow_name,stage_num,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (54,1,2,'UploadFile','','',NULL,'csr','select','upload','upload file for review','2017-01-11 15:00:09','2017-01-11 15:00:09');
INSERT INTO `workflows` (id,workflow_name,stage_num,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (55,1,3,'Review','','',NULL,'select','select','SelectTaskType','Review File for approval','2017-01-11 15:00:09','2017-01-11 15:00:09');
CREATE TABLE "workflow_forms" ("id" integer not null primary key autoincrement, "workflow_name" varchar not null, "form_name" varchar not null, "created_at" datetime null, "updated_at" datetime null);
INSERT INTO `workflow_forms` (id,workflow_name,form_name,created_at,updated_at) VALUES (1,'Artpack Request','artpack','2017-01-11 15:00:10','2017-01-11 15:00:10');
CREATE TABLE "users" (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`email`	BLOB NOT NULL,
	`password`	varchar,
	`remember_token`	varchar,
	`division`	INTEGER DEFAULT 0,
	`access_level`	INTEGER DEFAULT 0,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (0,'Choose Person','','password',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (1,'Austin Coleman','acoleman@paifashion.com','$2y$10$JaNPgt37dVnW4NfhcMiF6.xrCZwd7B4HMBGr7f5ykDKotzzglV0lG',NULL,1,2,'2016-12-14 18:59:48','2016-12-14 18:59:48');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (2,'Brian Biggins','bbiggins@paifashion.com','$2y$10$BTWSIi2HMpYqXeLsbyXIx.6VEw83Xgc6w22zUEanMVN7xDbxWDZz6',NULL,2,3,'2016-12-20 14:35:04','2016-12-20 14:35:04');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (3,'Kyle Biggins','kbiggins@paifashion.com','$2y$10$zoxleDNNnv.UHGw8fRwbF.6.cnWhIdSQd8McAS8SGI7FYCpGU7M/e',NULL,4,2,'2016-12-20 14:35:04','2016-12-20 14:35:04');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (4,'Tasha Eaton','teaton@paifashion.com','$2y$10$hS6UUXpGx7Jdw66lKHg9VuKZXtdT3MlPIxzJLuMHV5V3Vm9Zdfxze',NULL,3,1,'2016-12-20 14:35:04','2016-12-20 14:35:04');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (5,'Art User1','artUser1@paifashion.com','$2y$10$cjjTY.RD7mBhKFjthtYtheJHorIywxDwJvF7dzHAcYq9L/gA91ph.',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (6,'Art User2','artUser2@paifashion.com','$2y$10$a7AxIf./VAHOVWQ2s2v/XuqI.Xw0J90uJIR4TjRL9plEMj6PXJ7Nq',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (7,'Art User3','artUser3@paifashion.com','$2y$10$suYTXjRXJmeekOUjxdCYbuYU0xy1LJJmSbNl42xJLWZGjU2iTioP.',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (8,'Art User4','artUser4@paifashion.com','$2y$10$epk1CU/ejLpO3N.KDUvR4O.U0zJkcfFr72qLsd0aFQuTJsZ3N5urO',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (9,'Embroidery','embroidery@paifashion.com','',NULL,1,3,NULL,NULL);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (10,'testing','test@paifashion.com',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (11,'Austin Coleman','acoeman@paifashion.com',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (12,'Austin Coleman','aoleman@paifashion.com',NULL,NULL,0,0,NULL,NULL);
CREATE TABLE "tasks" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`table_name`	VARCHAR NOT NULL,
	`workflow_id`	INTEGER,
	`stage`	NUMERIC DEFAULT 0,
	`app_worker`	NUMERIC,
	`submitted_by`	INTEGER,
	`status`	VARCHAR,
	`created_at`	DATETIME,
	`updated_at`	DATETIME
);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (1,'embroidery',NULL,7,NULL,NULL,NULL,'2016-12-22 20:22:19','2017-01-09 20:25:05');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (2,'embroidery',NULL,7,NULL,NULL,NULL,'2016-12-22 22:04:55','2017-01-09 20:25:05');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (3,'embroidery',NULL,7,NULL,NULL,NULL,'2016-12-27 14:24:39','2017-01-09 20:25:05');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (4,'artpacks','ohwell',2,8,2,'active','2017-01-03 15:57:41','2017-01-10 20:06:57');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (5,'artpacks','shoot',2,5,2,'active','2017-01-04 21:48:32','2017-01-09 21:14:27');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (6,'artpacks','ohwell',1,2,2,'active','2017-01-05 15:34:25','2017-01-10 16:40:08');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (7,'artpacks','ohwell',2,2,2,'active','2017-01-05 15:42:24','2017-01-10 17:07:11');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (8,'artpacks','ohwell',1,1,2,'active','2017-01-05 15:50:07','2017-01-09 21:07:47');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (9,'artpacks','ohwell',2,2,2,'active','2017-01-05 16:06:47','2017-01-09 21:13:31');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (10,'artpacks','ohwell',2,1,2,'active','2017-01-05 16:09:27','2017-01-09 21:07:47');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (11,'artpacks','ohwell',2,1,2,'active','2017-01-05 16:10:53','2017-01-10 16:30:43');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (12,'artpacks',NULL,0,NULL,NULL,NULL,'2017-01-10 16:28:22','2017-01-10 16:28:22');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (13,'artpacks',NULL,2,9,NULL,NULL,'2017-01-11 15:46:57','2017-01-11 21:55:57');
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (14,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (15,'artpack',NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (16,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (17,'artpack',NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (18,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (19,'artpack',NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (20,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (21,'artpack',NULL,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (22,'artpack',1,0,1,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (23,'artpack',1,0,1,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (24,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (25,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (26,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (27,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (28,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (29,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (30,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (31,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (32,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (33,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (34,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (35,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (36,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (37,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (38,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (39,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (40,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (41,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (42,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (43,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (44,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (45,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (46,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (47,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (48,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (49,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (50,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (51,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (52,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (53,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (54,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (55,'artpack',NULL,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (56,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (57,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (58,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (59,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (60,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (61,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (62,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (63,'artpack',1,0,NULL,1,NULL,NULL,NULL);
INSERT INTO `tasks` (id,table_name,workflow_id,stage,app_worker,submitted_by,status,created_at,updated_at) VALUES (64,'artpack',1,0,NULL,1,NULL,NULL,NULL);
CREATE TABLE "task_steps" (
	`id`	INTEGER UNIQUE,
	`step_name`	varchar,
	`created_at`	DATETIME,
	`updated_at`	DATETIME
);
INSERT INTO `task_steps` (id,step_name,created_at,updated_at) VALUES (1,NULL,NULL,NULL);
CREATE TABLE "request_users" (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`first_name`	varchar NOT NULL,
	`last_name`	varchar NOT NULL,
	`phone_number`	varchar,
	`phone_extension`	varchar,
	`division`	varchar,
	`email`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (1,'Austin','Coleman',NULL,NULL,'ASI','amc_080@hotmail.com',NULL,NULL);
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (2,'test','test','test','test','test','test','2016-12-14 19:42:59','2016-12-14 19:42:59');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (3,'testin','testin','testin','testin','testin','testin','2016-12-14 20:12:37','2016-12-14 20:12:37');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (4,'testingg','testingg','testingg','testingg','testingg','testingg','2016-12-14 20:52:58','2016-12-14 20:52:58');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (5,'austinnn','colemannn','573205014','','','amc_08023@hotmail.com','2016-12-14 20:54:53','2016-12-14 20:54:53');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (6,'Brian','Biggins','3424442342','',NULL,'acoleman@paifashion.com','2016-12-14 21:03:55','2016-12-14 21:03:55');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (7,'Steve','Momber','888888239','',NULL,'amc_08@hotmail.com','2016-12-14 21:21:01','2016-12-14 21:21:01');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (8,'Harry','Moth','8888888888','','Imperial','ax@mail.com','2016-12-14 21:22:45','2016-12-14 21:22:45');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (9,'sdfij','weoifj','53463463','','Nike','we@mail.com','2016-12-14 21:31:02','2016-12-14 21:31:02');
INSERT INTO `request_users` (id,first_name,last_name,phone_number,phone_extension,division,email,created_at,updated_at) VALUES (10,'Susan','Smith','3424442342','','Nike','susansmith@mail.com','2016-12-22 16:05:48','2016-12-22 16:05:48');
CREATE TABLE "request_user" ("id" integer not null primary key autoincrement, "first_name" varchar not null, "last_name" varchar not null, "phone_number" varchar null, "phone_extension" varchar null, "division" varchar not null, "email" varchar not null, "password" varchar not null, "created_at" datetime null, "updated_at" datetime null);
CREATE TABLE "password_resets" ("email" varchar not null, "token" varchar not null, "created_at" datetime null);
CREATE TABLE "oauth_refresh_tokens" ("id" varchar not null, "access_token_id" varchar not null, "revoked" tinyint(1) not null, "expires_at" datetime null, primary key ("id"));
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('97815a869ee24f968318cd8051eedb8f9108d41e66a0404dfc3280141c8230c9c0f39a6cb107ae94','969628cb186bba908f267f22b3101e79726c23c07c7a8cac9cea1716da6c449104b071eb4b8f5387',0,'2017-12-14 19:29:10');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('5763ebdb574f8675bf43bc0ab19fd3ab52f9af4abf4f24e70767549c4767b54e54341c652ad7f248','d3883f90cd717e0331415fdacc675eadd2030c437e3c29da348f478e325c046efcd90898feca1fb2',0,'2017-12-14 20:15:57');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('9e66dd98fd0ba79466cd46d366bf738a5334f4058dc9091fd8a2f6f1c1bb642686a565c5ae6d60ce','20d159e0d8b74e4c03d25428fad705adf43368abcae08b9d9f5cbaa688bbec7460a5210be2609246',0,'2017-12-15 03:06:29');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('ea6c56bfc5a8c5602d7a2701f59fa2664c868987e50c45a4b2f8fae884ce19fa7c4756ec6e3013da','901c4295a867d3e2a51d7567fd30042b685411c4a7b373252f7101059a073227ab3a68dddba294d2',0,'2017-12-16 13:56:34');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('f8b2a52d2f9922c245a00fddf7b33c9f03cbcac77382be5c3e3b5e76b9f2c270f13d4afb831e7c44','ad601ac84221d413b67a0c8c9cbfb481b70da36ad4f76000e11fb85332047876810b137459d97c56',0,'2017-12-19 14:25:36');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('918fea597b7f264a420fc8e8cbc13bfcf87c5e3a567bbf1d9eff1da471d42f5321e6d3c157ba1e8b','3d5801e14116bde4c4a1db43715c21bd2732cc0c6edb8412dab03a3dbcce62f9100b1c4ca629c49f',0,'2017-12-19 14:47:30');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('dc680855e55c246f39e164b3358067d3abac75e175203deb72ce39585301f247c65fafb9c20e8faf','bf016503b85e3544c21b885314086edf2113b3d7df0399a2e57a73147bd5a80ad76c24d36a8ce6c6',0,'2017-12-19 15:16:55');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('db00d5a21c7406018b51ea4c80990b08e2e4b120ef4b6ef3640a598a7e904da29e3fdffc2f7c9b68','0feaf0ea9398e2b6ca095faa12636b7cca80165035fe6333dcea2109dc7b09b710773aa153ad5d7f',0,'2017-12-19 15:23:13');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('a573b6d6871169905a26f9f20035785e81b396e564148ae59b2da628e11dcb098ce41f0f4c205f9e','4f28d5971c425eb84efbb840d168298b62471f18dd949a21761ed9b2f76f21c139e88fd2722fd592',0,'2017-12-20 14:13:42');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('a514b9a777856d454098f5decab99868caeaafefd5d6c56efae09319186a09c7fbd017ab21f21967','7977ed9953fd1f58e9b37cb541ae2b8e58a1192531a7754d949c8ba4f84063cde9fd4952c2203d80',0,'2017-12-22 16:08:43');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('84d1ae1a3d5e4163d68cbb5496c2e926534a6a82ae7af7a38be1a91aebe7b03e02f2fc2b107c1019','c687c9cc84947c7e4eddf11fd60b606441bbdec48763163b66f65579f10dfffda6b7d2162c934785',0,'2017-12-22 19:02:01');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('7f0d709edb57192402990332504f9704e5ce39be1386d68aa321279733aaae1ea366818a3c68d318','a12164e114654b2a5d5508be4c5ef353fd9e1413ab10f7bb832fe68642a6667463ca56b24bf93ba2',0,'2017-12-27 13:47:25');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('31941f45461296ca31c79f285c0030d58804a6997ec85eb4e77ec5fa9581a7f011fac2325f55e3d9','82e32d180bdef2f09555d41dc06f4c8ab7e60cdcf4694edd09ce96a9435eaa6a5274e5edf1771413',0,'2017-12-27 15:32:52');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('b4a432f9018168bdaac35973d664b51ab542a64e37d7f023ac403172709bafb601ab85871e53df85','1a312d359c1641f76c4c14a65df11e2602e234720234c7ec01e4cfce1c17e4af843b819d50cd4893',0,'2017-12-28 02:25:42');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('ed28907ba12d6827ac31a4429765d2ea947fb08baaed7b7e47426369045ae7da3fdf77c482643e10','1d76a4e0b2cd5baa542113df3c5c4a172b02da577e18a580f0772f7c6e749794797733a99cef41c2',0,'2017-12-28 02:31:17');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('6bf850e89fd8529362a760b97aa7580fcbbdcb5ae27597bec1868731a7f7e2aad7a1a488d1d973ea','8c162041c50c0bd1d55c73590043be82a91c623da3aff15c803eed0cc83223428a777302e9c224f5',0,'2018-01-03 15:56:21');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('a89675236a48648d603844ac746bdd78ec241464fbecff15e7945d8c6baa58f2fdc2fd25092b052f','ef340d9aeb70b9b80cd2614d8ffe20f8410b4836da427bcc9dc765c37c17a902c357ea6fda3b381e',0,'2018-01-03 17:06:13');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('f87d5986351a92d4ac7184a5eb489abfd992f420e3ac48241be4e9b68d3a61c218cbcc50df983885','b6024bf4d47f8821959944b121d6d74532695378321c2f0ed55ecaec78093d3ff247b5c4cec3484d',0,'2018-01-03 17:09:51');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('0fcd22dc4b74af4afa8e1d4e215f05368bcf2206ad635d88e5378b389f4c7adb26f533c108b2e21d','723a4a49d3815b80439d7aada9788973b5306424afa0f66611f969e56757d38d9681ddd4c7ec1155',0,'2018-01-03 21:29:45');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('83bf2ea0b5006d6654b5364dab2dffaffc0fd0410e2d4986af5845201a88ccb20b0bd5d9941053ac','e9460bdf6b2c1189119aaa3b74001152f2e0448f3b932b96573aff8104d749e05e9bf6ed2fc3d909',0,'2018-01-04 13:41:01');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('ed40a0a60c6d75e677dc1cf0f6b210a5352785a8c97be3c6e73d8e29284b9a2d523b1dba74798a92','682a40a51aa6a3f0a14e8591b787812db470e2448c97546be65d08473fc34e7e61a2df40a83855f3',0,'2018-01-04 20:46:50');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('02d9d0ce22972bf71f01698d0d7eb33e0fed70a1cd36e6334e8a9977208f1ca91de72ccddf46db6c','80e1fcc926b739b4ba797b6346f4cbbc247c70ee25277f0d247c68142ac6ac283816e73d873d04ed',0,'2018-01-04 21:55:15');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('1e7d32023138c82e9cc654db7c7a53dd2f4a7cb5c297bb28167dfb8658a9f0b651488b128b0517fa','e8d495082aed078316b9a0d352f39cf1d523ee61ca44680fbc52063d118c55578fe41f8a949caadf',0,'2018-01-05 13:41:04');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('3b4c2aadaf2d68ac9858359516adef2196355bd67b7b565563f39a449dc938498270599baecd5321','3b2156aba6f294c35b334254d14febc6fa3658d585efe975567f9cfb7a429edd41b536a8a9b0ddc4',0,'2018-01-05 21:41:29');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('3009182f8d9b6fbd95ac152a4943bb63585a8803765221dc756fed5161b63a5b67540a7ddc7742fb','f16ad847e14afe7f0fba66543561f44b061d1b475d2d631d9da811bf91c80fe16bf6811418eef517',0,'2018-01-06 00:41:07');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('945b9191531d43191d587416eddc46d9e7154cc7410b543b36c7be481ab6306dd1bf78fbba8cf5b8','4956a11c4024c69b47de8104bc00195bf72c791b8014781e3614f15ec158a8f3dc18ffa0673d5bef',0,'2018-01-06 13:36:21');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('f45833d9dacfdbdd702b9447a94591a08e9516a2951b4ef16bb6ef2d2a1de1bb1850943bbc9c7780','244e721415cd4967acdb4ac8b7b8bf9c5684e166cae796aa99980ec20bfe987f8d41ae8ce297a07a',0,'2018-01-06 15:02:08');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('d3eca08e85b5c7b9bd9996012f7980b8e0dc571885bf6966f67ee2981e9a68a218944060ebc2022c','470cf993508e0494f3c3c5c1f74e2eeb63acf6ae1d9ceee9aea822c31a70e619bc61dcf14c852703',0,'2018-01-09 15:43:31');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('e091b429ff4fefdbf5e4897e99f39793d97914cf536c2baf6c4b4daf70b5242602f8007a27044ec6','e743c0f58f2f3edb73d267a4b5d8528fc228c862923e16df11a382ed64d740ae16def1f222dba685',0,'2018-01-09 16:07:04');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('489b2cb0885f41f8aae8aff8e2c4fccade6e5ae40ba53b6ee72f32a848f0bc857c3fff731319b41c','7df006beb244bb5cc2f9b50f90849d2bf113f516146f3e9fa0d52ebe2a42ad7ba879129c33abd9e4',0,'2018-01-09 16:35:49');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('6f81a260c4ff6ade80156fcc4f6b6dfe81f13c83eac0663ab7fddef62e48b65e06bedb4a1583f577','540178340e6732fb375c015a4ee9ba9c707550e76b7a76b2117677ab8a2963d8300f1d69b4d61072',0,'2018-01-09 22:02:14');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('161322faa29bb2eb6ea777d3ab3ea80bd38de72e30f8f11948a6ab0a9a77969bef2146daae6c605d','4dc48bb2977d4494fb832b9fe81ec52006e2532a8c449ab0f0271dad6c14a1aa6d9ff21bfbe0c695',0,'2018-01-09 22:03:17');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('954c73c670d70167dd1d0abde0e71aded701f29d82d2938057f54266a28eb58ea6b122ec10283424','f1174b150399d1f9581202c7d644cd55253fa1e0dfad4e5f996e3170760375ddd24d3c93bec27f80',0,'2018-01-10 01:28:47');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('8f44d75aae98d9e03dd9be538d91edd4d5032def1ffab8f63d1f23ef320ef35a7c23d0393fa8b452','d95876a027ce112e84a8b81989ad684d77186cdda7f586a2bc7dbc11d5042645467530cc113fb46e',0,'2018-01-10 13:42:59');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('d0ded86a6a3ff6fd73ae31fe48789654c813170fec661dede8756a14563c8bd3208f330667c1199a','a171f700dad76f230b50f1f35cc8dcb82b9cbed29b32c83d0f10af1a8690025a085900bbf1eeb631',0,'2018-01-10 13:44:45');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('07b223a6bba7aebbaa6160566aa0e066ec9dfaaa589ae6c5e628e0c297b44dcd1d44a50cca87792f','bf36ae7bb32298776b9897b2fcc07d57f32718b562fda8ac432cbf05f0a02d5aa2787a635bb939df',0,'2018-01-10 16:28:59');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('2f1165c8dbd4449b255c3534b6abb97144a6fae8197303355ed82579a33dcd76f50860fc372c2833','7f5c01af582459310d27fa1bf3597e4661af22e74a04877a6339723bdc86891aa264ed00d32f3cba',0,'2018-01-10 19:54:21');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('4337bdb38fee2069a07f8a23e788344a3dd25ba8f1e5520d9063900fd2e6d5202241f1c3e716706f','1be9b71a148232964bbc91abe48c05203ed23d4e513c9f3e67fd6b041f31fd0c702a1ded48e8d1af',0,'2018-01-11 13:43:34');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('72c623161b05d5269c7bbe52ee3acf6aeda13a7464c75abd487f6759792af5f348c7a3f952220284','1d595ad8c1100825d078ab597194ccafe9d534fee04d5c7e103e060c600e6c93a3de46f07424e0d6',0,'2018-01-11 14:00:48');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('ff9ce207f2ac6adb48c7af51dd9641795a3b4b916cbb5e42917dcec2c158e2a1d79c53fd5ef2a773','e2eb23935a6d6e5e025e1b5bd0a0c2297feb0f550a2df75922ec50ca5478e6974b4ee5063eeca8a1',0,'2018-01-11 16:29:24');
INSERT INTO `oauth_refresh_tokens` (id,access_token_id,revoked,expires_at) VALUES ('85d3e9d9933cbb74b2c7fad5784835266166d1f055fbdb64c61cddfc0e1172088badae8a3345a6d7','51c2b53ca17d5aa5d8861c524b34ce334600f77be6d6c6b7059dc27e9225e2eb04f84727a9d54f03',0,'2018-01-11 21:58:35');
CREATE TABLE "oauth_personal_access_clients" ("id" integer not null primary key autoincrement, "client_id" integer not null, "created_at" datetime null, "updated_at" datetime null);
CREATE TABLE "oauth_clients" ("id" integer not null primary key autoincrement, "user_id" integer null, "name" varchar not null, "secret" varchar not null, "redirect" text not null, "personal_access_client" tinyint(1) not null, "password_client" tinyint(1) not null, "revoked" tinyint(1) not null, "created_at" datetime null, "updated_at" datetime null);
INSERT INTO `oauth_clients` (id,user_id,name,secret,redirect,personal_access_client,password_client,revoked,created_at,updated_at) VALUES (1,NULL,'http://localhost','OGwT7X48orzvhdHqRgz06KAt0hHhcAsAtHGfT7I9','',1,0,0,NULL,NULL);
INSERT INTO `oauth_clients` (id,user_id,name,secret,redirect,personal_access_client,password_client,revoked,created_at,updated_at) VALUES (2,NULL,'http://localhost','ikJMjlGUnEOIBpxWDPiJaRY07RyFxJD06csAaVqy','',0,1,0,NULL,NULL);
CREATE TABLE "oauth_auth_codes" ("id" varchar not null, "user_id" integer not null, "client_id" integer not null, "scopes" text null, "revoked" tinyint(1) not null, "expires_at" datetime null, primary key ("id"));
CREATE TABLE "oauth_access_tokens" ("id" varchar not null, "user_id" integer null, "client_id" integer not null, "name" varchar null, "scopes" text null, "revoked" tinyint(1) not null, "created_at" datetime null, "updated_at" datetime null, "expires_at" datetime null, primary key ("id"));
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('8c162041c50c0bd1d55c73590043be82a91c623da3aff15c803eed0cc83223428a777302e9c224f5',1,2,NULL,'[]',0,'2017-01-03 15:56:21','2017-01-03 15:56:21','2018-01-03 15:56:21');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('ef340d9aeb70b9b80cd2614d8ffe20f8410b4836da427bcc9dc765c37c17a902c357ea6fda3b381e',1,2,NULL,'[]',0,'2017-01-03 17:06:13','2017-01-03 17:06:13','2018-01-03 17:06:13');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('b6024bf4d47f8821959944b121d6d74532695378321c2f0ed55ecaec78093d3ff247b5c4cec3484d',1,2,NULL,'[]',0,'2017-01-03 17:09:51','2017-01-03 17:09:51','2018-01-03 17:09:51');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('723a4a49d3815b80439d7aada9788973b5306424afa0f66611f969e56757d38d9681ddd4c7ec1155',4,2,NULL,'[]',0,'2017-01-03 21:29:45','2017-01-03 21:29:45','2018-01-03 21:29:45');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('e9460bdf6b2c1189119aaa3b74001152f2e0448f3b932b96573aff8104d749e05e9bf6ed2fc3d909',1,2,NULL,'[]',0,'2017-01-04 13:41:01','2017-01-04 13:41:01','2018-01-04 13:41:01');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('682a40a51aa6a3f0a14e8591b787812db470e2448c97546be65d08473fc34e7e61a2df40a83855f3',1,2,NULL,'[]',0,'2017-01-04 20:46:50','2017-01-04 20:46:50','2018-01-04 20:46:50');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('80e1fcc926b739b4ba797b6346f4cbbc247c70ee25277f0d247c68142ac6ac283816e73d873d04ed',1,2,NULL,'[]',0,'2017-01-04 21:55:15','2017-01-04 21:55:15','2018-01-04 21:55:15');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('e8d495082aed078316b9a0d352f39cf1d523ee61ca44680fbc52063d118c55578fe41f8a949caadf',1,2,NULL,'[]',0,'2017-01-05 13:41:04','2017-01-05 13:41:04','2018-01-05 13:41:04');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('3b2156aba6f294c35b334254d14febc6fa3658d585efe975567f9cfb7a429edd41b536a8a9b0ddc4',1,2,NULL,'[]',0,'2017-01-05 21:41:29','2017-01-05 21:41:29','2018-01-05 21:41:29');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('f16ad847e14afe7f0fba66543561f44b061d1b475d2d631d9da811bf91c80fe16bf6811418eef517',1,2,NULL,'[]',0,'2017-01-06 00:41:07','2017-01-06 00:41:07','2018-01-06 00:41:07');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('4956a11c4024c69b47de8104bc00195bf72c791b8014781e3614f15ec158a8f3dc18ffa0673d5bef',1,2,NULL,'[]',0,'2017-01-06 13:36:21','2017-01-06 13:36:21','2018-01-06 13:36:21');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('244e721415cd4967acdb4ac8b7b8bf9c5684e166cae796aa99980ec20bfe987f8d41ae8ce297a07a',4,2,NULL,'[]',0,'2017-01-06 15:02:08','2017-01-06 15:02:08','2018-01-06 15:02:08');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('470cf993508e0494f3c3c5c1f74e2eeb63acf6ae1d9ceee9aea822c31a70e619bc61dcf14c852703',1,2,NULL,'[]',0,'2017-01-09 15:43:31','2017-01-09 15:43:31','2018-01-09 15:43:31');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('e743c0f58f2f3edb73d267a4b5d8528fc228c862923e16df11a382ed64d740ae16def1f222dba685',4,2,NULL,'[]',0,'2017-01-09 16:07:04','2017-01-09 16:07:04','2018-01-09 16:07:04');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('7df006beb244bb5cc2f9b50f90849d2bf113f516146f3e9fa0d52ebe2a42ad7ba879129c33abd9e4',4,2,NULL,'[]',0,'2017-01-09 16:35:49','2017-01-09 16:35:49','2018-01-09 16:35:49');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('540178340e6732fb375c015a4ee9ba9c707550e76b7a76b2117677ab8a2963d8300f1d69b4d61072',1,2,NULL,'[]',0,'2017-01-09 22:02:14','2017-01-09 22:02:14','2018-01-09 22:02:14');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('4dc48bb2977d4494fb832b9fe81ec52006e2532a8c449ab0f0271dad6c14a1aa6d9ff21bfbe0c695',8,2,NULL,'[]',0,'2017-01-09 22:03:17','2017-01-09 22:03:17','2018-01-09 22:03:17');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('f1174b150399d1f9581202c7d644cd55253fa1e0dfad4e5f996e3170760375ddd24d3c93bec27f80',8,2,NULL,'[]',0,'2017-01-10 01:28:47','2017-01-10 01:28:47','2018-01-10 01:28:47');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('d95876a027ce112e84a8b81989ad684d77186cdda7f586a2bc7dbc11d5042645467530cc113fb46e',1,2,NULL,'[]',0,'2017-01-10 13:42:59','2017-01-10 13:42:59','2018-01-10 13:42:59');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('a171f700dad76f230b50f1f35cc8dcb82b9cbed29b32c83d0f10af1a8690025a085900bbf1eeb631',8,2,NULL,'[]',0,'2017-01-10 13:44:45','2017-01-10 13:44:45','2018-01-10 13:44:45');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('bf36ae7bb32298776b9897b2fcc07d57f32718b562fda8ac432cbf05f0a02d5aa2787a635bb939df',4,2,NULL,'[]',0,'2017-01-10 16:28:59','2017-01-10 16:28:59','2018-01-10 16:28:59');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('7f5c01af582459310d27fa1bf3597e4661af22e74a04877a6339723bdc86891aa264ed00d32f3cba',1,2,NULL,'[]',0,'2017-01-10 19:54:21','2017-01-10 19:54:21','2018-01-10 19:54:21');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('1be9b71a148232964bbc91abe48c05203ed23d4e513c9f3e67fd6b041f31fd0c702a1ded48e8d1af',8,2,NULL,'[]',0,'2017-01-11 13:43:34','2017-01-11 13:43:34','2018-01-11 13:43:34');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('1d595ad8c1100825d078ab597194ccafe9d534fee04d5c7e103e060c600e6c93a3de46f07424e0d6',1,2,NULL,'[]',0,'2017-01-11 14:00:48','2017-01-11 14:00:48','2018-01-11 14:00:48');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('e2eb23935a6d6e5e025e1b5bd0a0c2297feb0f550a2df75922ec50ca5478e6974b4ee5063eeca8a1',8,2,NULL,'[]',0,'2017-01-11 16:29:24','2017-01-11 16:29:24','2018-01-11 16:29:24');
INSERT INTO `oauth_access_tokens` (id,user_id,client_id,name,scopes,revoked,created_at,updated_at,expires_at) VALUES ('51c2b53ca17d5aa5d8861c524b34ce334600f77be6d6c6b7059dc27e9225e2eb04f84727a9d54f03',4,2,NULL,'[]',0,'2017-01-11 21:58:35','2017-01-11 21:58:35','2018-01-11 21:58:35');
CREATE TABLE "migrations" ("id" integer not null primary key autoincrement, "migration" varchar not null, "batch" integer not null);
INSERT INTO `migrations` (id,migration,batch) VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (3,'2016_06_01_000001_create_oauth_auth_codes_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (4,'2016_06_01_000002_create_oauth_access_tokens_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (6,'2016_06_01_000004_create_oauth_clients_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (8,'2016_11_03_175819_create_request_users_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (9,'2016_12_12_205935_create_artpack_form_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (10,'2016_12_14_142805_create_request_table',1);
INSERT INTO `migrations` (id,migration,batch) VALUES (11,'2016_12_16_211806_create_embroidery_form_table',2);
INSERT INTO `migrations` (id,migration,batch) VALUES (12,'2016_12_19_143645_add_columns_user_table',3);
INSERT INTO `migrations` (id,migration,batch) VALUES (13,'2016_12_19_152020_alter_embroidery_table_name',3);
INSERT INTO `migrations` (id,migration,batch) VALUES (14,'2016_12_20_143745_create_embroidery_table',4);
INSERT INTO `migrations` (id,migration,batch) VALUES (15,'2017_01_11_143251_create_workflow_form_table',5);
CREATE TABLE `groups` (
	`group_name`	INTEGER UNIQUE,
	`group_code`	INTEGER PRIMARY KEY AUTOINCREMENT
);
INSERT INTO `groups` (group_name,group_code) VALUES ('asi_csr',1);
INSERT INTO `groups` (group_name,group_code) VALUES ('imperial_csr',2);
INSERT INTO `groups` (group_name,group_code) VALUES ('art',3);
INSERT INTO `groups` (group_name,group_code) VALUES ('pai_csr',4);
CREATE TABLE "embroideries" ("id" integer not null primary key autoincrement, "po_num" integer not null, "address" varchar not null, "customer_num" integer not null, "due_date" date not null, "tape_num_1" integer not null, "tape_size_1" varchar not null, "tape_pos_1" varchar not null, "tape_num_2" integer not null, "tape_size_2" varchar not null, "tape_pos_2" varchar not null, "tape_num_3" integer not null, "tape_size_3" varchar not null, "tape_pos_3" varchar not null, "vector_file" varchar not null, "art_file_available" varchar not null, "cap_color" varchar not null, "description" varchar not null, "threads" varchar not null, "created_at" datetime null, "updated_at" datetime null);
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (4,2342,'230 drive',55345,'12/31/16',3,'L','Left','','','tape_2','','','tape_3','Yes','No','green','Couple of Hats','IDK what a thread is','2016-12-20 14:45:57','2016-12-20 14:45:57');
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (5,2352,'145 Aspen Drive',99939,'12/31/16',4352,'M','Left',234,'XL','Right','','','tape_3','Yes','Yes','red','Need it printed on the right side of the hat 1" from the bill','Idk what these are','2016-12-22 16:08:18','2016-12-22 16:08:18');
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (6,23421,'130 fire drive',2341,'12/31/16',432,'S','Left','','','tape_2','','','tape_3','Yes','No','blue','hope it works','i really do',NULL,NULL);
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (7,23421,'130 fire drive',2341,'12/31/16',432,'S','Left','','','tape_2','','','tape_3','Yes','No','blue','hope it works','i really do',NULL,NULL);
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (8,23421,'130 fire drive',2341,'12/31/16',432,'S','Left','','','tape_2','','','tape_3','Yes','No','blue','hope it works','i really do',NULL,NULL);
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (9,23421,'130 fire drive',2341,'12/31/16',432,'S','Left','','','tape_2','','','tape_3','Yes','No','blue','hope it works','i really do',NULL,NULL);
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (10,342,'145 Aspen Drive',99939,'12/31/16',4352,'L','Left','','','tape_2','','','tape_3','No','Yes','red','idkkkkkkk','idkkkkkkkkk',NULL,NULL);
INSERT INTO `embroideries` (id,po_num,address,customer_num,due_date,tape_num_1,tape_size_1,tape_pos_1,tape_num_2,tape_size_2,tape_pos_2,tape_num_3,tape_size_3,tape_pos_3,vector_file,art_file_available,cap_color,description,threads,created_at,updated_at) VALUES (11,2342,'230 drive',2342,'12/31/16',3,'L','Right','','','tape_2','','','tape_3','No','Yes','red','idk','idk',NULL,NULL);
CREATE TABLE "chats" (
	`task_id`	NUMERIC,
	`messages`	JSON,
	`created_at`	INTEGER,
	`updated_at`	INTEGER,
	PRIMARY KEY(`task_id`)
);
INSERT INTO `chats` (task_id,messages,created_at,updated_at) VALUES (7,'[{"name":"Art User4","id":"8","text":"testing out first time","date":""},{"name":"Art User4","id":"8","text":"testing out second time","date":""},{"name":"Art User4","id":"8","text":"Testing it out almost live!!","date":""},{"name":"Art User4","id":"8","text":"Hey update that art file please","date":""}]','2017-01-10 17:10:31','2017-01-11 15:46:15');
INSERT INTO `chats` (task_id,messages,created_at,updated_at) VALUES (11,'[{"name":"Art User4","id":"8","text":"hey how''s it going!!","date":""},{"name":"Austin Coleman","id":"1","text":"Hello there sir.","date":""},{"name":"Austin Coleman","id":"1","text":"Testing out the date.","date":"Mon Jan 16 2017 08:28:59 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"Testing out the date again","date":"Mon Jan 16 2017 08:30:42 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"Bet the date is still 10 minutes behind.","date":"Mon Jan 16 2017 08:43:49 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"It''s good to go!!","date":"Mon Jan 16 2017 08:47:00 GMT-0600 (CST)"}]','2017-01-10 17:32:07','2017-01-16 14:47:01');
INSERT INTO `chats` (task_id,messages,created_at,updated_at) VALUES (8,'[{"name":"Art User4","id":"8","text":"I need you to upload the file as soon as possible!!","date":""}]','2017-01-10 18:59:12','2017-01-10 18:59:12');
INSERT INTO `chats` (task_id,messages,created_at,updated_at) VALUES (10,'[{"name":"Austin Coleman","id":"1","text":"What''s going onnnn","date":"Mon Jan 16 2017 15:19:20 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"Testing","date":"Wed Jan 18 2017 09:16:30 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"testing pusher","date":"Wed Jan 18 2017 09:35:20 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"Testing pusher again","date":"Wed Jan 18 2017 09:42:23 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"incomin","date":"Wed Jan 18 2017 09:43:34 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"Still nothingggggg?","date":"Wed Jan 18 2017 09:43:49 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"testing","date":"Wed Jan 18 2017 09:52:42 GMT-0600 (CST)"},{"name":"Austin Coleman","id":"1","text":"Checking her out again","date":"Wed Jan 18 2017 09:54:26 GMT-0600 (CST)"}]','2017-01-16 21:19:20','2017-01-18 15:54:27');
CREATE TABLE "artpacks" (
	`task_id`	integer UNIQUE,
	`artpack_num`	INTEGER,
	`rep_name`	varchar NOT NULL,
	`turn_time`	varchar,
	`account_name`	varchar NOT NULL,
	`account_num`	integer NOT NULL,
	`customer_name`	varchar NOT NULL,
	`reference_tapes`	varchar,
	`package_type`	varchar,
	`style_preference`	varchar,
	`course_location`	varchar,
	`submitted_by`	INTEGER,
	`person_request`	NUMERIC,
	`manipulate_logo`	BLOB NOT NULL,
	`num_designs`	integer NOT NULL,
	`description`	varchar,
	`threads`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`task_id`) REFERENCES `tasks`(`id`)
);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (22,NULL,'Austin','idk','Nike','','Steve Bartman','','new','','ls',1,NULL,'Yes',4,'fsd','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (23,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'sdfs','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (24,NULL,'Austin','idk','Nike',34251,'Kyle Biggins','idk','new','idk','ls',1,NULL,'No',2,'dsfs','sdfs',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (25,NULL,'Austin','idk','Nike',234,'Kyle Biggins','idk','new','idk','ls',1,NULL,'Yes',4,'a','asd',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (26,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'sdf','fsd',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (27,NULL,'John Smith','idk','Nike',234,'Jim Bob','idk','new','idk','ls',1,NULL,'No',5,'sdf','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (28,NULL,'Austin','idk','Nike',234,'Kyle Biggins','idk','new','idk','ls',1,NULL,'No',5,'sdf','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (29,NULL,'Austin','idk','Nike','','Kyle Biggins','idk','new','','',1,NULL,'Yes',5,'idk','idk',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (30,NULL,'Austin','','Nike','','Kyle Biggins','idk','new','','ls',1,NULL,'Yes',5,'sdf','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (31,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','idk',1,NULL,'Yes',5,'sdf','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (32,NULL,'Austin','idk','Nike',234,'Kyle Biggins','idk','new','idk','ls',1,NULL,'Yes',5,'sdf','sdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (33,NULL,'Hayden Lock','','ASI','','Brian Biggins','','idk','idk','ls',1,NULL,'Yes',4,'testing','testing',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (34,NULL,'Hayden Lock','','ASI','','Kyle Biggins','','idk','','',1,NULL,'No',4,'dfsd','sdfsdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (35,NULL,'BB Biggins','','ASI','','Kyle Biggins','','idk','','',1,NULL,'No',34,'df','dfsdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (36,NULL,'John Smith','','ASI','','Kyle Biggins','','new','','ls',1,NULL,'Yes',2,'dsfsdf','sdfsdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (37,NULL,'John Smith','','ASI','','Kyle Biggins','','new','','ls',1,NULL,'Yes',2,'dsfsdf','sdfsdf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (38,NULL,'John Smith','idk','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',2,'sdfsdf','sdgfsgd',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (39,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'sdf','dsf',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (40,NULL,'John Smith','idk','Nike',234,'Steve Bartman','','new','','ls',1,NULL,'Yes',5,'sodifj','dfs',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (41,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',2,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (42,NULL,'Hayden Lock','','Nike',234,'Kyle Biggins','','new','','',1,NULL,'No',5,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (43,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (44,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','',1,NULL,'Yes',5,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (45,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',2,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (46,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',2,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (47,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (48,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (49,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','',NULL,NULL);
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (50,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 20:59:17','2017-01-23 20:59:17');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (51,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 21:01:32','2017-01-23 21:01:32');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (52,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 21:09:10','2017-01-23 21:09:10');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (53,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 21:13:59','2017-01-23 21:13:59');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (54,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 21:14:39','2017-01-23 21:14:39');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (55,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 21:18:21','2017-01-23 21:18:21');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (56,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:20:38','2017-01-23 21:20:38');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (57,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:21:41','2017-01-23 21:21:41');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (58,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:22:15','2017-01-23 21:22:15');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (59,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:26:11','2017-01-23 21:26:11');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (60,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:27:25','2017-01-23 21:27:25');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (61,NULL,'John Smith','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:28:16','2017-01-23 21:28:16');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (62,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:33:16','2017-01-23 21:33:16');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (63,NULL,'Austin','','Nike','','Kyle Biggins','','new','','ls',1,NULL,'No',5,'','','2017-01-23 21:34:28','2017-01-23 21:34:28');
INSERT INTO `artpacks` (task_id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,submitted_by,person_request,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (64,NULL,'Austin','','Nike',234,'Kyle Biggins','','new','','ls',1,NULL,'Yes',5,'','','2017-01-23 21:35:01','2017-01-23 21:35:01');

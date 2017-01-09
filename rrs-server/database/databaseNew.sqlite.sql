CREATE TABLE "workflows" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`workflow_name`	INTEGER,
	`step_name`	INTEGER,
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
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (36,'artpack','csr_submit',1,1,3,NULL,NULL,'assign','assign task to art worker',NULL,NULL);
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (37,'artpack','assign_task',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (38,'artpack','art_submit',0,NULL,4,NULL,3,NULL,NULL,NULL,NULL);
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (49,'embroideries','csr_submit','','',NULL,'select','select','inquire','csr_submit','2017-01-03 16:48:55','2017-01-03 16:48:55');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (50,'embroideries','assign_request',1,4,NULL,'None','select','SelectTaskType','Assign Request to a worker','2017-01-03 16:48:55','2017-01-03 16:48:55');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (51,'embroideries','upload_art','','',NULL,'person',3,'upload','uploading art for approval','2017-01-03 16:48:55','2017-01-03 16:48:55');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (52,'','','','',NULL,'person',1,'SelectTaskType','','2017-01-06 16:23:43','2017-01-06 16:23:43');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (53,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:23:43','2017-01-06 16:23:43');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (54,'','','','',NULL,'person',1,'SelectTaskType','','2017-01-06 16:25:44','2017-01-06 16:25:44');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (55,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:25:44','2017-01-06 16:25:44');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (56,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:25:44','2017-01-06 16:25:44');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (57,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:32:36','2017-01-06 16:32:36');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (58,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:32:36','2017-01-06 16:32:36');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (59,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:34:16','2017-01-06 16:34:16');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (60,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:34:16','2017-01-06 16:34:16');
INSERT INTO `workflows` (id,workflow_name,step_name,needs_assigned,assigner,assigned_group,approval_type,approval_person,task_type,task_description,created_at,updated_at) VALUES (61,'','','','',NULL,'select','select','SelectTaskType','','2017-01-06 16:34:16','2017-01-06 16:34:16');
CREATE TABLE "users" (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`email`	BLOB NOT NULL,
	`password`	varchar NOT NULL,
	`remember_token`	varchar,
	`division`	INTEGER,
	`access_level`	INTEGER,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (0,'Choose Person','','password',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (1,'Austin Coleman','amc_080@hotmail.com','$2y$10$JaNPgt37dVnW4NfhcMiF6.xrCZwd7B4HMBGr7f5ykDKotzzglV0lG',NULL,1,2,'2016-12-14 18:59:48','2016-12-14 18:59:48');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (2,'Brian Biggins','bbiggins@paifashion.com','$2y$10$BTWSIi2HMpYqXeLsbyXIx.6VEw83Xgc6w22zUEanMVN7xDbxWDZz6',NULL,2,3,'2016-12-20 14:35:04','2016-12-20 14:35:04');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (3,'Kyle Biggins','kbiggins@paifashion.com','$2y$10$zoxleDNNnv.UHGw8fRwbF.6.cnWhIdSQd8McAS8SGI7FYCpGU7M/e',NULL,4,2,'2016-12-20 14:35:04','2016-12-20 14:35:04');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (4,'Tasha Eaton','teaton@paifashion.com','$2y$10$hS6UUXpGx7Jdw66lKHg9VuKZXtdT3MlPIxzJLuMHV5V3Vm9Zdfxze',NULL,3,1,'2016-12-20 14:35:04','2016-12-20 14:35:04');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (5,'Art User1','artUser1@paifashion.com','$2y$10$cjjTY.RD7mBhKFjthtYtheJHorIywxDwJvF7dzHAcYq9L/gA91ph.',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (6,'Art User2','artUser2@paifashion.com','$2y$10$a7AxIf./VAHOVWQ2s2v/XuqI.Xw0J90uJIR4TjRL9plEMj6PXJ7Nq',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (7,'Art User3','artUser3@paifashion.com','$2y$10$suYTXjRXJmeekOUjxdCYbuYU0xy1LJJmSbNl42xJLWZGjU2iTioP.',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
INSERT INTO `users` (id,name,email,password,remember_token,division,access_level,created_at,updated_at) VALUES (8,'Art User4','artUser4@paifashion.com','$2y$10$epk1CU/ejLpO3N.KDUvR4O.U0zJkcfFr72qLsd0aFQuTJsZ3N5urO',NULL,3,3,'2017-01-06 13:50:30','2017-01-06 13:50:30');
CREATE TABLE "tasks" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`order_id`	INTEGER NOT NULL,
	`table_name`	VARCHAR NOT NULL,
	`stage`	INTEGER DEFAULT 0,
	`app_worker`	VARCHAR,
	`created_at`	DATETIME,
	`updated_at`	DATETIME
);
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (1,9,'embroidery',0,NULL,'2016-12-22 20:22:19','2016-12-22 20:22:19');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (2,10,'embroidery',0,NULL,'2016-12-22 22:04:55','2016-12-22 22:04:55');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (3,11,'embroidery',0,NULL,'2016-12-27 14:24:39','2016-12-27 14:24:39');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (4,5,'artpacks',0,NULL,'2017-01-03 15:57:41','2017-01-03 15:57:41');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (5,6,'artpacks',0,NULL,'2017-01-04 21:48:32','2017-01-04 21:48:32');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (6,7,'artpacks',0,NULL,'2017-01-05 15:34:25','2017-01-05 15:34:25');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (7,8,'artpacks',0,NULL,'2017-01-05 15:42:24','2017-01-05 15:42:24');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (8,9,'artpacks',0,NULL,'2017-01-05 15:50:07','2017-01-05 15:50:07');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (9,10,'artpacks',0,NULL,'2017-01-05 16:06:47','2017-01-05 16:06:47');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (10,11,'artpacks',0,NULL,'2017-01-05 16:09:27','2017-01-05 16:09:27');
INSERT INTO `tasks` (id,order_id,table_name,stage,app_worker,created_at,updated_at) VALUES (11,12,'artpacks',0,NULL,'2017-01-05 16:10:53','2017-01-05 16:10:53');
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
CREATE TABLE "artpacks" (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`artpack_num`	integer NOT NULL,
	`rep_name`	varchar NOT NULL,
	`turn_time`	varchar,
	`account_name`	varchar NOT NULL,
	`account_num`	integer NOT NULL,
	`customer_name`	varchar NOT NULL,
	`reference_tapes`	varchar,
	`package_type`	varchar,
	`style_preference`	varchar,
	`course_location`	varchar,
	`csr_name`	varchar,
	`manipulate_logo`	BLOB NOT NULL,
	`num_designs`	integer NOT NULL,
	`description`	varchar,
	`threads`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (1,87993,'Austin','idk','Nike',234,'Kyle Biggins','idk','idk','idk','ls','Becky','No',5,'who knows','who knows','2016-12-16 20:54:09','2016-12-16 20:54:09');
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (2,342,'John Smith','','Nike Outdoors',34251,'Steve Bartman','idk','ls','idk','idk','idk','No',5,'idk','idk','2016-12-19 14:48:31','2016-12-19 14:48:31');
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (3,9009,'New','idk','new',2343,'new','idk','new','idk','ls','gary','Yes',34,'yeppers','hi there','2016-12-22 19:04:45','2016-12-22 19:04:45');
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (4,3242,'BB Biggins','idk','Nike',234,'Steve Bartman','idk','ls','idk','idk','Becky','No',5,'idkkkkkkkkk','idkkkkkkkk','2016-12-22 22:04:13','2016-12-22 22:04:13');
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (5,8834,'Kyle Biggins','idk','Nike',2341,'Brian Biggins','idk','new','idk','ls','Becky','No',2,'idk','idk',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (6,432,'Hayden Lock','2 days','ASI',539,'Nike','idk','new','idk','ls','Chelsey','No',5,'Oh Artpack number 2','Oh just threading out mannnnn',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (7,234,'John Smith','2 days','ASI',539,'Kyle Biggins','idk','new','idk','ls','Chelsey','No',2,'yessir','idkk',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (8,342,'Austin','idk','Nike',234,'Kyle Biggins','idk','new','idk','ls','Becky','No',5,'yep','yerp',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (9,3242,'Austin','2 days','Nike',539,'new','idk','ls','idk','idk','idk','No',2,'idk','idk',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (10,9009,'Austin','2 days','ASI',234,'Kyle Biggins','idk','new','idk','ls','Becky','No',34,'sdf','sdfsdf',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (11,8834,'Austin','idk','Nike',234,'Kyle Biggins','idk','new','idk','ls','Becky','No',8,'hwe','hsdf',NULL,NULL);
INSERT INTO `artpacks` (id,artpack_num,rep_name,turn_time,account_name,account_num,customer_name,reference_tapes,package_type,style_preference,course_location,csr_name,manipulate_logo,num_designs,description,threads,created_at,updated_at) VALUES (12,432,'Hayden Lock','idk','Nike Outdoors',34251,'Steve Bartman','idk','ls','idk','ls','bob','No',8,'sf','dsf',NULL,NULL);

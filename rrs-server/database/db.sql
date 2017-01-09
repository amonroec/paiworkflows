BEGIN TRANSACTION;
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
COMMIT;

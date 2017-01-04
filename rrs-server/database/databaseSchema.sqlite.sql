BEGIN TRANSACTION;
CREATE TABLE "workflows" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`step_name`	INTEGER,
	`action_needed`	INTEGER,
	`needs_assigned`	INTEGER DEFAULT 0,
	`assigner`	INTEGER,
	`assigned_group`	INTEGER,
	`approval_type`	INTEGER,
	`approval_person`	INTEGER,
	`task_type`	INTEGER,
	`task_description`	BLOB,
	`created_at`	INTEGER,
	`updated_at`	INTEGER
);
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
CREATE TABLE "tasks" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`order_id`	INTEGER NOT NULL,
	`table_name`	VARCHAR NOT NULL,
	`stage`	INTEGER DEFAULT 0,
	`app_worker`	VARCHAR,
	`created_at`	DATETIME,
	`updated_at`	DATETIME
);
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
CREATE TABLE "request_user" ("id" integer not null primary key autoincrement, "first_name" varchar not null, "last_name" varchar not null, "phone_number" varchar null, "phone_extension" varchar null, "division" varchar not null, "email" varchar not null, "password" varchar not null, "created_at" datetime null, "updated_at" datetime null);
CREATE TABLE "password_resets" ("email" varchar not null, "token" varchar not null, "created_at" datetime null);
CREATE TABLE "oauth_refresh_tokens" ("id" varchar not null, "access_token_id" varchar not null, "revoked" tinyint(1) not null, "expires_at" datetime null, primary key ("id"));
CREATE TABLE "oauth_personal_access_clients" ("id" integer not null primary key autoincrement, "client_id" integer not null, "created_at" datetime null, "updated_at" datetime null);
CREATE TABLE "oauth_clients" ("id" integer not null primary key autoincrement, "user_id" integer null, "name" varchar not null, "secret" varchar not null, "redirect" text not null, "personal_access_client" tinyint(1) not null, "password_client" tinyint(1) not null, "revoked" tinyint(1) not null, "created_at" datetime null, "updated_at" datetime null);
CREATE TABLE "oauth_auth_codes" ("id" varchar not null, "user_id" integer not null, "client_id" integer not null, "scopes" text null, "revoked" tinyint(1) not null, "expires_at" datetime null, primary key ("id"));
CREATE TABLE "oauth_access_tokens" ("id" varchar not null, "user_id" integer null, "client_id" integer not null, "name" varchar null, "scopes" text null, "revoked" tinyint(1) not null, "created_at" datetime null, "updated_at" datetime null, "expires_at" datetime null, primary key ("id"));
CREATE TABLE "migrations" ("id" integer not null primary key autoincrement, "migration" varchar not null, "batch" integer not null);
CREATE TABLE `groups` (
	`group_name`	INTEGER UNIQUE,
	`group_code`	INTEGER PRIMARY KEY AUTOINCREMENT
);
CREATE TABLE "embroideries" ("id" integer not null primary key autoincrement, "po_num" integer not null, "address" varchar not null, "customer_num" integer not null, "due_date" date not null, "tape_num_1" integer not null, "tape_size_1" varchar not null, "tape_pos_1" varchar not null, "tape_num_2" integer not null, "tape_size_2" varchar not null, "tape_pos_2" varchar not null, "tape_num_3" integer not null, "tape_size_3" varchar not null, "tape_pos_3" varchar not null, "vector_file" varchar not null, "art_file_available" varchar not null, "cap_color" varchar not null, "description" varchar not null, "threads" varchar not null, "created_at" datetime null, "updated_at" datetime null);
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
CREATE UNIQUE INDEX "users_email_unique" on "users" ("email")

























;
CREATE UNIQUE INDEX "request_users_email_unique" on "request_users" ("email")
;
CREATE UNIQUE INDEX "request_user_email_unique" on "request_user" ("email");
CREATE INDEX "password_resets_token_index" on "password_resets" ("token");
CREATE INDEX "password_resets_email_index" on "password_resets" ("email");
CREATE INDEX "oauth_refresh_tokens_access_token_id_index" on "oauth_refresh_tokens" ("access_token_id");
CREATE INDEX "oauth_personal_access_clients_client_id_index" on "oauth_personal_access_clients" ("client_id");
CREATE INDEX "oauth_clients_user_id_index" on "oauth_clients" ("user_id");
CREATE INDEX "oauth_access_tokens_user_id_index" on "oauth_access_tokens" ("user_id");
COMMIT;














Laravel Personal Access Client


OGwT7X48orzvhdHqRgz06KAt0hHhcAsAtHGfT7I9

http://localhost

1

0

0






ikJMjlGUnEOIBpxWDPiJaRY07RyFxJD06csAaVqy

http://localhost

0

1

0



Actually talk to Andrew McMillen, ext. 221. He will be checking the art packs thru ASI order email address and will be most helpful

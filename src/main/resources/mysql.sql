CREATE TABLE movement (
	id BIGINT not NULL AUTO_INCREMENT,
	mtime varchar(32) NOT NULL ,
	name varchar(16) NOT NULL,
	cmd varchar(16) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO movement (mtime, name, cmd) VALUES ('10000000','moe','forward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('15001000','moe','left;');
INSERT INTO movement (mtime, name, cmd) VALUES ('20002000','moe','right;');
INSERT INTO movement (mtime, name, cmd) VALUES ('25003000','moe','backward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('30004000','moe','forward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('35005000','moe','forward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('10000000','curly','forward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('15001000','curly','left;');
INSERT INTO movement (mtime, name, cmd) VALUES ('20002000','curly','right;');
INSERT INTO movement (mtime, name, cmd) VALUES ('25003000','curly','backward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('30004000','curly','forward;');
INSERT INTO movement (mtime, name, cmd) VALUES ('35005000','curly','forward;');

commit;

# need to convert to UTF-8 before the web application will work peroperly
#
SELECT default_character_set_name FROM information_schema.SCHEMATA S WHERE schema_name = "sampledb";

SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA WHERE CCSA.collation_name = T.table_collation AND T.table_schema = "sampledb" AND T.table_name = "movement";

ALTER DATABASE sampledb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE movement CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

commit;


BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, areas;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE areas (
	area_id serial,
	name varchar(100) NOT NULL UNIQUE,
	description varchar(5000),
	directions varchar(5000),
	

	CONSTRAINT PK_area PRIMARY KEY (area_id) 
	
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO areas (name, description, directions) VALUES ('Beauty Mountain', 
														  'Another amazing sector of the New River Gorge, with a great lineup of sport and trad climbs of all grades. There''s great bouldering here, too.  Sub-areas are listed climber''s left-to-right (downstream to upstream).',
														 'From Route 19, drive along the Lansing-Edmond Road past the two parking lots for Endless Wall.  The distance from 19 to Beauty Mtn Rd is almost exactly 2.5 miles.   About 3/5 of a mile past the Nuttal Parking lot, look for the gravel Beauty Mountain Road heading right. Drive about 100 yards off the pavement to a sort of open intersection (this is where old parking was). Take a left, and in a couple seconds you''ll see the parking with a pit toilet off on your right.

Follow the obvious trail from this parking, passing a house and a gate.  Past the gate continue along a good gravel road that drops down into the gorge, where various cutoff paths branch off to climbing areas. The Super Mario/Tubin'' Dudes area is to your right, and all others to the left, designated by a brown Park Service Sign.

If you continue down this main gravel road, you''ll wind up at the Nuttalburg Mine Site, one of the best-preserved mining ruins in the area. It''s totally worth the trip!
')
INSERT INTO areas (name, description, directions) VALUES ('Kaymoor', 
														  'Amazing collection of sport routes on the rim with Northern exposure directly across from Diamond Point. Lots of steep routes, big holds and shady summer days make this area a favorite of summer Rock Climbing guides, Raft guides and locals alike.
Important to know: this area is shady and stays wet after rain for at least a day.',
														 'Take Route 16 out of Fayetteville, taking a left on the Gatewood Rd., just as Rt. 16 veers right. Drive through some windy curves, eventually taking a left on the Kaymoor Rd (signs may point to Kaymoor or Arrowhead Trails).')
COMMIT TRANSACTION;

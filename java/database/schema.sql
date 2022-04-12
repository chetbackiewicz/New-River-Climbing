DROP TABLE IF EXISTS users, areas, crags, routes;
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

CREATE TABLE crags (
	crag_id serial,
	name varchar(100) not NULL,
	description varchar(5000),
	directions varchar(5000),
	area_id int,
	
	CONSTRAINT PK_crag PRIMARY KEY (crag_id),
	CONSTRAINT FK_area_id FOREIGN KEY (area_id) REFERENCES areas(area_id)
);

CREATE TABLE routes (
	route_id serial,
	name varchar(50) not null,
	description varchar(1000),
	grade varchar(5),
	height int,
	rating int,
	sport_trad varchar(1),
	has_anchors boolean,
	crag_id int,
	
	CONSTRAINT PK_route_id PRIMARY KEY (route_id),
	CONSTRAINT FK_crag_id FOREIGN KEY (crag_id) REFERENCES crags(crag_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO areas (name, description, directions) VALUES ('Beauty Mountain', 
														  'Another amazing sector of the New River Gorge, with a great lineup of sport and trad climbs of all grades. There''s great bouldering here, too.  Sub-areas are listed climber''s left-to-right (downstream to upstream).',
														 'From Route 19, drive along the Lansing-Edmond Road past the two parking lots for Endless Wall.  The distance from 19 to Beauty Mtn Rd is almost exactly 2.5 miles.   About 3/5 of a mile past the Nuttal Parking lot, look for the gravel Beauty Mountain Road heading right. Drive about 100 yards off the pavement to a sort of open intersection (this is where old parking was). Take a left, and in a couple seconds you''ll see the parking with a pit toilet off on your right.

Follow the obvious trail from this parking, passing a house and a gate.  Past the gate continue along a good gravel road that drops down into the gorge, where various cutoff paths branch off to climbing areas. The Super Mario/Tubin'' Dudes area is to your right, and all others to the left, designated by a brown Park Service Sign.

If you continue down this main gravel road, you''ll wind up at the Nuttalburg Mine Site, one of the best-preserved mining ruins in the area. It''s totally worth the trip!
');
INSERT INTO areas (name, description, directions) VALUES ('Kaymoor', 
														  'Amazing collection of sport routes on the rim with Northern exposure directly across from Diamond Point. Lots of steep routes, big holds and shady summer days make this area a favorite of summer Rock Climbing guides, Raft guides and locals alike.
Important to know: this area is shady and stays wet after rain for at least a day.',
														 'Take Route 16 out of Fayetteville, taking a left on the Gatewood Rd., just as Rt. 16 veers right. Drive through some windy curves, eventually taking a left on the Kaymoor Rd (signs may point to Kaymoor or Arrowhead Trails).');
INSERT INTO areas (name, description, directions) VALUES ('Bridge Area',
														 'Most instant satisfaction crags in the New River Gorge. Also, this area was among the first developed by early New River Gorge climbers. Many Climbers planning a day out will start off meeting here, then make plans.

Some great rainy day routes can be found here as the all of the crags have a southern aspect.',
														 'Park at obvious pullout under the New River Gorge Bridge (heading north on rt 19 take three rights after crossing Bridge)');
INSERT INTO areas (name, description, directions) VALUES ('Bubba City',
														 'This area is on the North/East side of the Gorge, and most cliffs get morning shade and afternoon sun.

Many climbers consider "Bubba Shitty" to be the worst area of the New River Gorge, due to shorter clifflines, chossier, more broken rock, and easier climbs that are short and climb chossy, broken rock. There are without a doubt some gems here, and crags like Sandstonia are popular with mixed groups of beginners and strongmen for good reason. Enjoy the new approach trail, courtesy of NRAC!',
														'From 19 Take Ames Heights road west there are a few different parking areas, two main ones, but they aare both about 1-2 miles from 19.

For access to Rubble Rock, Sandstonia/Tattoo Wall, and Kingfish, use the Good Luck Cemetary parking on the left, approximately 1.7 miles from Route 19.  Once you''re parked, you''ll see the giant powerline cut.  Follow that and signs to get to your destination crag.

For all the other crags, from Little Head Wall to Beer Wall are best accessed from the Bubba City Parking, which you can find on your right, approximately 1.5 miles from Route 19, and is about 2/10 of a mile past Peregrine Ridge Rd.  Cross the street and take the marked trail, following signs.You have reached the Bubba City area after climbing down a ladder and a rope.');
INSERT INTO areas (name, description, directions) VALUES ('Cotton Hill',
														 'This is one of the farthest-downstream crags of the NRG; several miles below Bubba City, and below Hawk''s Nest Dam on the New. It''s home to a number of good sport routes; Psycho Wrangler, 5.12a, is not to be missed. If this area has seen rain recently, especially a heavy rain, expect to have some runoff, particularly the vertical wall right of Psycho Wrangler.  Many of the routes stay wet for a couple days on this wall after a heavy rain. Contrary to semantic nitpicking by some people with too much time on their hands, this area is part of the NRG Proper despite being cut off from the Greater Endless Wall cliffband.',
														 'From Fayetteville, drive north on 16 for 7 miles until you hit a bridge that crosses over the New River, just below the Hawk''s Nest Dam. The parking is immediately on the right after crossing the bridge.');
INSERT INTO areas (name, description, directions) VALUES ('Endless Wall',
														 'This is the crown jewel of all the crags on the New River. With nearly 3 miles of unbroken cliff (and nearly six if you include greater Endless Wall from Ambassador to Keeney''s Buttress), breathtaking views, and as much exposure as you can get on a single pitch off the ground, it''s easy to spend several days in a row here, or a season, or a lifetime. There is everything from glorious 100 foot bolted moderates to classic gear lines to modern sport and trad testpieces requiring mutant strength.  Spring and Fall are the best seasons here, but it''s possible to get great conditions at the Cirque in January, or Aesthetica area during August.  The only thing this place lacks is an abundance of easy bolted lines-- to get the most out of Endless, you''ll want to be solid on 5.10 trad and 5.11+ sport.

Since the Endless Wall Trail has been voted #1 hiking trail in a U.S. national park, it''s been getting a lot of traffic. With this traffic come more issues, especially with parking. If you park along the road and your tires are touching the asphalt then you will get towed! Get there early to get a spot in one of the lots, and carpool if possible.',
														 'Take second right after bridge (heading north). Park at Fern Point trail head (bottom of hill about 1 mi. from road) or up at the Nuttall parking at the top of the hill past the Fern parking.

If you park at the Fern Point trail head you will hike in through the hemlock forest and cross a bridge (cut off right from the trail just before this bridge to access lower sections of Fern Buttress), go up hill and then come to a sign for climber''s access on your right. Take that trail on the right and go down the ladders. This is Fern Point. Head left instead of right, follow the trail and the scenic views to reach the Honeymooner''s ladder.

From the Nuttall parking you will walk through the hemlock forest, cross the bridge, and then head up a hill. Eventually you will see a sign on the left side of the trail for climbing access. Take that trail and down the ladders to go to the Cirque.

Roughly equidistant between the Fern Point and Cirque ladders is another set-- Honeymooner''s ladders. Going down this set of ladders puts you dead in the middle (and arguably the most quality section) of Endless Wall at Snake Buttress.

As you get more familiar with the approaches to Endless, you''ll find that there are also a few convenient rappel stations that facilitate getting to a few areas a bit quicker. They are mentioned in more detail (with pictures) in the Williams guidebook, and are generally easy to find off of the approach trail.');
INSERT INTO areas (name, description, directions) VALUES ('Fern Buttress',
														 'This area is a huge downstream portion of Endless Wall, just like Beauty Mountain is the farthest upstream section.  Whatever its designation, there is amazing sport and trad here, from 5.5 to 5.14, and it features the same quality Nuttal Sandstone that makes Endless Wall great.

Sub-areas are listed from climber''s left-to-right, or downstream-to-upstream.',
														 'There are three ways to approach Fern Buttress.

First, you can park in the obvious pull off on Fayette Station Road. For any of the crags from Arm Forces area to Orchard Wall, this is the best way in. Walk slightly up the road to a wide old dirt path that goes downhill, eventually taking a sharp right into the woods. After crossing a small creek, do NOT keep following the creek down into the gorge. Keep heading on the trail until you see cliffline.

For access to the Fern Creek Falls area to Ritz Cracker area, you can park in the Fern Creek parking area off Lansing Edmond Rd. Take the Endless wall trail in heading toward Fern Creek. When you get to the Bridge, you can either cross the bridge and continue to the Fern Creek ladders (which will actually spit you out on the opposite side of Fern Creek- at the beginning of Endless Wall) or you can hang a right at the bridge, skirt the lip of the cliff on a trail, and rap in. There is usually a makeshift rappel station on the tree above the 5.8 crack route Night Moves.');
INSERT INTO crags (name, description, directions, area_id) VALUES ('The Hole',
																  'This is a fun collection of steep sport routes and linkups, and has the shortest approach of the Kaymoor crags.  Although it is very sheltered from rainfall, for some reason The Hole tends to seep and sweat more than the Cirque or the Coliseum.

Note: the Hole (along with the Cirque) is one of the few areas within the New River Gorge in which perma/project draws are accepted, even though they are still technically not legal anywhere within park boundaries. Take care in inspecting fixed gear.',
																  'Park at Rogers take east trail down towards old coal mines',
																  2);
INSERT INTO crags (name, description, directions, area_id) VALUES ('Butcher''s Branch',
																 'Collection of sports climbs 5.9-5.13-
This crag holds climbs for every sport climber. There are super pumpy 10s long 5.9s, and super classic 11+s, 12s, and 13s.

This is an awesome place that stays cool during the summer, well, as cool as possible.

Seeps after rain for at least one full day.',
																 'park at rogers take west trail and keep heading downhill to the west',
																 2);		
INSERT INTO routes (name, description, grade, height, rating, sport_trad, has_anchors, crag_id) VALUES ('Lactic Acid Bath',
																							  'big overhang slopers',
																							  '5.12d',
																							  70,
																							   4,
																							  'S',
																							  TRUE,
																								1);		
INSERT INTO routes (name, description, grade, height, rating, sport_trad, has_anchors, crag_id) VALUES ('Blood Raid',
																							  'big overhang slopers with dyno',
																							  '5.13a',
																							  70,
																							   4,
																							  'S',
																							  TRUE,
																								1);													
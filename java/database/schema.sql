DROP TABLE IF EXISTS activity_logs, users, areas, crags, routes;
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
	area_name varchar(100) NOT NULL UNIQUE,
	description varchar(5000),
	directions varchar(5000),
	
	CONSTRAINT PK_area PRIMARY KEY (area_id) 
);

CREATE TABLE crags (
	crag_id serial,
	crag_name varchar(100) not NULL,
	description varchar(5000),
	directions varchar(5000),
	area_id int,
	
	CONSTRAINT PK_crag PRIMARY KEY (crag_id),
	CONSTRAINT FK_area_id FOREIGN KEY (area_id) REFERENCES areas(area_id)
);

CREATE TABLE routes (
	route_id serial,
	route_name varchar(50) not null,
	description varchar(1000),
	grade varchar(5),
	height int,
	rating int,
	sport_trad varchar(1),
	has_anchors boolean,
	crag_id int,
	bolt_count int,
	
	CONSTRAINT PK_route_id PRIMARY KEY (route_id),
	CONSTRAINT FK_crag_id FOREIGN KEY (crag_id) REFERENCES crags(crag_id)
);

CREATE TABLE activity_logs (
	activity_log_id serial,
	user_id int,
	route_id int,
	attempts int,
	date_sent date,
	route_comments varchar(5000),
	
	CONSTRAINT PK_activity_logs PRIMARY KEY (activity_log_id),
	CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT FK_route_id FOREIGN KEY (route_id) REFERENCES routes(route_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO areas (area_name, description, directions) VALUES ('Beauty Mountain', 
														  'Another amazing sector of the New River Gorge, with a great lineup of sport and trad climbs of all grades. There''s great bouldering here, too.  Sub-areas are listed climber''s left-to-right (downstream to upstream).',
														 'From Route 19, drive along the Lansing-Edmond Road past the two parking lots for Endless Wall.  The distance from 19 to Beauty Mtn Rd is almost exactly 2.5 miles.   About 3/5 of a mile past the Nuttal Parking lot, look for the gravel Beauty Mountain Road heading right. Drive about 100 yards off the pavement to a sort of open intersection (this is where old parking was). Take a left, and in a couple seconds you''ll see the parking with a pit toilet off on your right.

Follow the obvious trail from this parking, passing a house and a gate.  Past the gate continue along a good gravel road that drops down into the gorge, where various cutoff paths branch off to climbing areas. The Super Mario/Tubin'' Dudes area is to your right, and all others to the left, designated by a brown Park Service Sign.

If you continue down this main gravel road, you''ll wind up at the Nuttalburg Mine Site, one of the best-preserved mining ruins in the area. It''s totally worth the trip!
');
INSERT INTO areas (area_name, description, directions) VALUES ('Kaymoor', 
														  'Amazing collection of sport routes on the rim with Northern exposure directly across from Diamond Point. Lots of steep routes, big holds and shady summer days make this area a favorite of summer Rock Climbing guides, Raft guides and locals alike.
Important to know: this area is shady and stays wet after rain for at least a day.',
														 'Take Route 16 out of Fayetteville, taking a left on the Gatewood Rd., just as Rt. 16 veers right. Drive through some windy curves, eventually taking a left on the Kaymoor Rd (signs may point to Kaymoor or Arrowhead Trails).');
INSERT INTO areas (area_name, description, directions) VALUES ('Bridge Area',
														 'Most instant satisfaction crags in the New River Gorge. Also, this area was among the first developed by early New River Gorge climbers. Many Climbers planning a day out will start off meeting here, then make plans.

Some great rainy day routes can be found here as the all of the crags have a southern aspect.',
														 'Park at obvious pullout under the New River Gorge Bridge (heading north on rt 19 take three rights after crossing Bridge)');
INSERT INTO areas (area_name, description, directions) VALUES ('Bubba City',
														 'This area is on the North/East side of the Gorge, and most cliffs get morning shade and afternoon sun.

Many climbers consider "Bubba Shitty" to be the worst area of the New River Gorge, due to shorter clifflines, chossier, more broken rock, and easier climbs that are short and climb chossy, broken rock. There are without a doubt some gems here, and crags like Sandstonia are popular with mixed groups of beginners and strongmen for good reason. Enjoy the new approach trail, courtesy of NRAC!',
														'From 19 Take Ames Heights road west there are a few different parking areas, two main ones, but they aare both about 1-2 miles from 19.

For access to Rubble Rock, Sandstonia/Tattoo Wall, and Kingfish, use the Good Luck Cemetary parking on the left, approximately 1.7 miles from Route 19.  Once you''re parked, you''ll see the giant powerline cut.  Follow that and signs to get to your destination crag.

For all the other crags, from Little Head Wall to Beer Wall are best accessed from the Bubba City Parking, which you can find on your right, approximately 1.5 miles from Route 19, and is about 2/10 of a mile past Peregrine Ridge Rd.  Cross the street and take the marked trail, following signs.You have reached the Bubba City area after climbing down a ladder and a rope.');
INSERT INTO areas (area_name, description, directions) VALUES ('Cotton Hill',
														 'This is one of the farthest-downstream crags of the NRG; several miles below Bubba City, and below Hawk''s Nest Dam on the New. It''s home to a number of good sport routes; Psycho Wrangler, 5.12a, is not to be missed. If this area has seen rain recently, especially a heavy rain, expect to have some runoff, particularly the vertical wall right of Psycho Wrangler.  Many of the routes stay wet for a couple days on this wall after a heavy rain. Contrary to semantic nitpicking by some people with too much time on their hands, this area is part of the NRG Proper despite being cut off from the Greater Endless Wall cliffband.',
														 'From Fayetteville, drive north on 16 for 7 miles until you hit a bridge that crosses over the New River, just below the Hawk''s Nest Dam. The parking is immediately on the right after crossing the bridge.');
INSERT INTO areas (area_name, description, directions) VALUES ('Endless Wall',
														 'This is the crown jewel of all the crags on the New River. With nearly 3 miles of unbroken cliff (and nearly six if you include greater Endless Wall from Ambassador to Keeney''s Buttress), breathtaking views, and as much exposure as you can get on a single pitch off the ground, it''s easy to spend several days in a row here, or a season, or a lifetime. There is everything from glorious 100 foot bolted moderates to classic gear lines to modern sport and trad testpieces requiring mutant strength.  Spring and Fall are the best seasons here, but it''s possible to get great conditions at the Cirque in January, or Aesthetica area during August.  The only thing this place lacks is an abundance of easy bolted lines-- to get the most out of Endless, you''ll want to be solid on 5.10 trad and 5.11+ sport.

Since the Endless Wall Trail has been voted #1 hiking trail in a U.S. national park, it''s been getting a lot of traffic. With this traffic come more issues, especially with parking. If you park along the road and your tires are touching the asphalt then you will get towed! Get there early to get a spot in one of the lots, and carpool if possible.',
														 'Take second right after bridge (heading north). Park at Fern Point trail head (bottom of hill about 1 mi. from road) or up at the Nuttall parking at the top of the hill past the Fern parking.

If you park at the Fern Point trail head you will hike in through the hemlock forest and cross a bridge (cut off right from the trail just before this bridge to access lower sections of Fern Buttress), go up hill and then come to a sign for climber''s access on your right. Take that trail on the right and go down the ladders. This is Fern Point. Head left instead of right, follow the trail and the scenic views to reach the Honeymooner''s ladder.

From the Nuttall parking you will walk through the hemlock forest, cross the bridge, and then head up a hill. Eventually you will see a sign on the left side of the trail for climbing access. Take that trail and down the ladders to go to the Cirque.

Roughly equidistant between the Fern Point and Cirque ladders is another set-- Honeymooner''s ladders. Going down this set of ladders puts you dead in the middle (and arguably the most quality section) of Endless Wall at Snake Buttress.

As you get more familiar with the approaches to Endless, you''ll find that there are also a few convenient rappel stations that facilitate getting to a few areas a bit quicker. They are mentioned in more detail (with pictures) in the Williams guidebook, and are generally easy to find off of the approach trail.');
INSERT INTO areas (area_name, description, directions) VALUES ('Fern Buttress',
														 'This area is a huge downstream portion of Endless Wall, just like Beauty Mountain is the farthest upstream section.  Whatever its designation, there is amazing sport and trad here, from 5.5 to 5.14, and it features the same quality Nuttal Sandstone that makes Endless Wall great.

Sub-areas are listed from climber''s left-to-right, or downstream-to-upstream.',
														 'There are three ways to approach Fern Buttress.

First, you can park in the obvious pull off on Fayette Station Road. For any of the crags from Arm Forces area to Orchard Wall, this is the best way in. Walk slightly up the road to a wide old dirt path that goes downhill, eventually taking a sharp right into the woods. After crossing a small creek, do NOT keep following the creek down into the gorge. Keep heading on the trail until you see cliffline.

For access to the Fern Creek Falls area to Ritz Cracker area, you can park in the Fern Creek parking area off Lansing Edmond Rd. Take the Endless wall trail in heading toward Fern Creek. When you get to the Bridge, you can either cross the bridge and continue to the Fern Creek ladders (which will actually spit you out on the opposite side of Fern Creek- at the beginning of Endless Wall) or you can hang a right at the bridge, skirt the lip of the cliff on a trail, and rap in. There is usually a makeshift rappel station on the tree above the 5.8 crack route Night Moves.');
INSERT INTO crags (crag_name, description, directions, area_id) VALUES ('The Hole',
																  'This is a fun collection of steep sport routes and linkups, and has the shortest approach of the Kaymoor crags.  Although it is very sheltered from rainfall, for some reason The Hole tends to seep and sweat more than the Cirque or the Coliseum.

Note: the Hole (along with the Cirque) is one of the few areas within the New River Gorge in which perma/project draws are accepted, even though they are still technically not legal anywhere within park boundaries. Take care in inspecting fixed gear.',
																  'Park at Rogers take east trail down towards old coal mines',
																  2);
INSERT INTO crags (crag_name, description, directions, area_id) VALUES ('Butcher''s Branch',
																 'Collection of sports climbs 5.9-5.13-
This crag holds climbs for every sport climber. There are super pumpy 10s long 5.9s, and super classic 11+s, 12s, and 13s.

This is an awesome place that stays cool during the summer, well, as cool as possible.

Seeps after rain for at least one full day.',
																 'park at rogers take west trail and keep heading downhill to the west', 2);
																 

INSERT INTO crags (crag_name, description, directions, area_id) VALUES ('Wild Seed Area', '5.11 and 5.12 trad and sport lines can be found at this crag that provides quality, scary routes, and shade. Definitly a worthwhile stop if you are cragging at Fern Buttress.', 'Continue past Conditioning Wall East to find this wall.', 7);																 

INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Against the Grain', 'Scramble up onto a ledge at the far left end of the cave and climb the relatively short line of bolts through the steep roof. This uncharacteristic power problem requires less endurance than the other routes but has some tough moves with bad feet.', 
																									   '5.13b', 50, 2, 'S',TRUE, 1, 6);		
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Mojo Hand', 'Scramble up onto a ledge at the far left end of the cave. Clip the shared first bolt with Against the Grain, then traverse right to the second. Crawl out a flat ceiling to a stance in a corner. Exit the corner to the right and engage the powerful finish.',
																										'5.12d', 60, 3, 'S', TRUE, 1, 8);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Devil Doll', 'Climb Lactic Acid Bath to the fifth bolt. Instead of moving rout out the underclings, keep heading left on slopers to a little perch on an arete. Finish with some powerful moves on small holds to the Mojo Hand anchor.', 
																									   '5.12d', 60, 3, 'S', TRUE, 1, 8);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('In the Flat Field', 'The toughest rig in The Hole. Climb Lactic Acid Bath through the undercling traverse, but instead of bailing to the kneebar rest, head up and left on slopers to the flattest stretch of ceiling in the cave. Rail out the huge flake to a boulder problem pulling onto the face.', 
																									   '5.13c', 70, 3, 'S', TRUE, 1, 10);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Massacre', 'If you get to the anchors of Lactic Acid Bath and still have some juice, take one step left and take on a final boulder problem to the high anchors.', 
																									   '5.13a', 80, 2, 'S', TRUE, 1, 10);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Lactic Acid Bath', 'The first line established in The Hole is an undisputed classic. Scramble up to a perch, then pump out the line of flakes past a pistol-grip clip, a campus move, and a quick shake before the crux. Chug out right on the undercling rail that will have your biceps working like the connecting rods of a locomotive. A kneebar rest, backhand slap, and some more pumping pulls take you to the anchors.',
																									   '5.12d', 70, 4, 'S', TRUE, 1, 9);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Blood Raid', 'Cruise up some chossy rock to a ledge, then thud out the gong shaped flake in the flat ceiling. Pull up onto the vertical face to some crimps and a tough clip at the final roof. A final showdown full-bore throw at the peak of pump guards the anchors to this excellent line.',
																									   '5.13a', 60, 4, 'S', TRUE, 1, 7);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Yowsah', 'This linkup is one of the most trafficked routes in The Hole due to its relatively easy grade although it''s still a tough haul! Climb Burning Cross to a good shake under the second roof. Travwerse left a bit under the roof, pull over it at the jug horn, then rail and heel-hook left to the anchors.',
																										'5.12b', 60, 3, 'S', TRUE, 1, 7);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Burning Choss', 'This rarely done but excellent line has some of the best moves in The Hole. Start at a right-facing corner near the right end of the steepest part of the cave. Climb to a ledge, reach out to a massive incut rail, and cut your feet. Climb out the jugs to a good shake under the second roof. Pull the roof direct and go straight up to independent anchors.',
																										'5.13a', 70, 3, 'S', TRUE, 1, 7);

INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('The Green Piece', 'The originally green rock of this nice face has cleaned up into one of the most popular routes in the gorge. After bolting this climb alone, Gus was so psyched to send that he cast off solo. Upon reaching the anchor, he realized he had forgotten his rappel device and barley survived the hand-over-hand descent down his fixed line!', 
																														 '5.10b', 70, 3, 'S', TRUE, 2, 6);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Low Voltage', 'Begin from the terrace and climb up to a crack near the first bolt. The face above has good holds but is steep enough to get you pumped.',
																														 '5.10b', 70, 3, 'S', TRUE, 2, 7);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Ministry', 'This short route climbs relatively easy rock to a stopper crux. Continuing up the gear-protected crack to the Low Voltage anchor is 5.10+',
																														 '5.12b', 40, 2, 'S', TRUE, 2, 4);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Sancho Belige', 'Sustained climbing on sloping holds up the gently overhangning wall make this a classic fitness route. Managing the pump can be a bit more challenging on hot summer days.', 
																														 '5.11c', 70, 4, 'S', TRUE, 2, 7);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('The Bicycle Club', 'Stick-clip, then climb slopers to a tricky section pulling the initial roof. A casual face leads to a thin crux that might have you backpedaling through the air.', 
																														 '5.11d', 60, 3, 'S', TRUE, 2, 5);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id) VALUES ('The Bag', 'A good hand crack that climbs through a roof and into an alcove. Squirm up the chimney to a bolt anchor on the ledge.', 
																														 '5.10d', 60, 2, 'T', TRUE, 2);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id) VALUES ('Jumpin'' Ring Snakes', 'Start with the first moves of Flight of the Gumbie, but move left into the Yosemite-like crack and chimney system. This is a fun route that is worth bringing a rack for.', 
																														 '5.9', 70, 2, 'T', TRUE, 2);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Flight of the Gumbie', 'This mega-classic arete starts on the face just right of the major corner. This is an excellent moderate lead, but many a fledgling sport weenie has taken the dreaded flight.', 
																														 '5.9', 80, 4, 'S', TRUE, 2, 9);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('All the Right Moves', 'Stick-clip, then jam up the crack and hand-traverse right and up to the first bolt. The climbing is continuously engaging, with two big roofs and a spectacular finish up a blank billboard of rock.', 
																														 '5.11d', 80, 3, 'S', TRUE, 2, 9);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Quickie in the Molar', 'Traverse in from the left past a small gear placement and clip a very high first bolt (which can be stick-clipped or equipped by lowering from Muscle Belly). Unlock the technical and strenuous crux between the 2nd and third bolt then stay on your feet for micro-crimping past one more bolt and a moderate runout to the Muscle Belly chains.

A second pitch continues straight up and encounters another 5.12a crux but we did not climb it. The latest New River guidebook notes that the top pitch is not equipped with anchors.

The first pitch is a great little route in its own right and will stay dry in the rain.', '5.12a', 60, 2, 'S', TRUE, 3, 4);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Muscle Belly', 'This climb has lots of thin moves and some friable rock, but it''s well worth doing. Start by climbing up on the right side of the arete. Stay on the right face for a few thin moves and then head back left toward the arete. From here, use small footholds and crimps on the right side of the arete aiming for a small horizontal crack (crux). Once you reach the horizontal, look to the left side of the arete for positive crimps and climb the arete to the finish.',
																														 '5.11c', 50, 2, 'S', TRUE, 3, 5);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Wild Seed', 'A great route for the grade, worth coming to the area to do. Climb up very easy rock to reach the high first bolt. Continue up right of crack system over a slabby section until under roof. Traverse right about 8 ft. Climb straight up over steep rock(crux), following great jugs all the way to the shuts.',
																														 '5.11a', 70, 3, 'S', TRUE, 3, 6);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Gonad the Bavarian', 'This is a short route, but fairly sustained climbing to the 4th bolt. Climbs like a trad route. Start by traversing in from the left under the first bolt. Continue up using shallow cracks and corners. It''s difficult to find a position to get your hands free to clip the bolts!',
																														 '5.11d', 50, 2, 'S', TRUE, 3, 4);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Foutre la Doigt', 'The crux is up higher. Going from the third to chains is the rough part. A few very interesting moves using opposing forces will help make quick work of this. Going from the fourth to the chains is a bit chossy, lots of moss.', 
																														 '5.12b', 50, 1, 'S', TRUE, 3, 4);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('The Chameleon', 'A good warm up for the other climbs on this wall. Climb up the juggy face, making use of a right leaning ramp at the half way point. Continue straight up. The crux is the final moves to reach the shuts. Figuring out the crux sequence may be a bit tricky.',
																														 '5.10b', 60, 2, 'S', TRUE, 3, 4);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Fly Girls', 'Great route with interesting moves. Start below a 3 ft wide roof about 10 ft off the ground. Climb up to gain an undercling under the roof, pull roof to reach a great shelf. Continue up and left climbing the face to reach a shallow right facing corner. Follow corner to a large stance, climbing eases up considerably from here on. Follow the face to the top.',
																														 '5.12a', 60, 2, 'S', TRUE, 3, 5);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Arbor Day', 'If you enjoy the slab climb Freaky Stylee you are sure to enjoy Arbor Day. The difficulties of the climb greet you early on as you''re forced to negotiate some balancy moves above a sharp little tree. Be sure to stay level headed as you clip an old rusty pin and make your way to a good rest. For the next few moves your hands are on good sidepulls while feet are on smears. After finishing this difficult sections look above you to see that you have another 15 feet of climbing to the last bolt. Finish by traversing another 10 feet to the anchor of Fragile Ego System.

This route is a little frightening with some bad fall potential. It might be smart to top rope the route off of Fragile Ego System before deciding to lead it.',
																														 '5.12a', 60, 3, 'S', TRUE, 3, 4);
INSERT INTO routes (route_name, description, grade, height, rating, sport_trad, has_anchors, crag_id, bolt_count) VALUES ('Fragile Ego System', 'Start by grabbing the jug below the first bolt and smearing your way up to a stance. Continue up the slabby face. The crux is reaching the 4th bolt where the face turns slightly overhanging. Pull up past this bolt to the best holds on the climb and follow up to the anchors. This route is pretty solid for the grade and it requires the leader to make some delicate moves with your feet a foot or two above the bolts. Great climbing, don''t pass this up if you are in the area!',
																														 '5.10b', 60, 2, 'S', TRUE, 3, 5);																														 







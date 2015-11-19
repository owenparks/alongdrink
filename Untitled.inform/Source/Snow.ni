	
The wrist is part of the player. The description is "[if the scene is Car_Escape]It throbbed with a dull ache where it had hit the armrest.[otherwise]Nothing special.[end if]"

A clue is a kind of thing.

Chapter 1 - Game Scene List

Mountain_Driving is a scene. Mountain_Driving begins when play begins. Mountain_Driving ends when Car_Escape begins.
Car_Escape is a scene. Car_Escape begins when upturned_car is visited. Car_Escape ends when Bottom of Cliff is visited.
Cliff_Climbing is a scene. Cliff_Climbing begins when Car_Escape ends. Cliff_Climbing ends when Car_Embarking begins.
Car_Embarking is a scene. Car_Embarking begins when Sharp Bend is visited. Car_Embarking ends when Riding_Scene begins.
Riding_Scene is a scene. Riding_Scene begins when the player is in the Valcar_Container for the first time. Riding_Scene ends when Body_Discovery begins.
Body_Discovery is a scene. Body_Discovery begins when the player is in the Driveway for the first time. Body_Discovery ends when the body is examined.
Prearrival is a scene. Prearrival begins when Body_Discovery ends. Prearrival ends when Guest_Arrival begins.
Guest_Arrival is a scene. Guest_Arrival begins when guests arrive. Guest_Arrival ends when first investigation starts.
First_Investigation is a scene. First_Investigation begins when Guest_Arrival ends. First_Investigation ends when PC_Bedroom_Door is open.
First_Sleep is a scene. First_Sleep begins when First_Investigation ends. First_Sleep ends when first_slept is true.
Wakeup is a scene. Wakeup begins when First_Sleep ends. Wakeup ends when Interrogation begins.
Interrogation is a scene. Interrogation begins when INTERRO_START is true. Interrogation ends when Interro_Count is 5.
Second_Investigation is a scene. Second_Investigation begins when Interrogation ends. Second_Investigation ends when ComingBack begins.
ComingBack is a scene. ComingBack begins when the brake line is examined and the location is Foyer. ComingBack ends when DiscoverDet begins.
DiscoverDet is a scene. DiscoverDet begins when the sun rises. DiscoverDet ends when the location is Wine_Cellar.
CellarThink is a scene. CellarThink begins when DiscoverDet ends. CellarThink ends when scene_conversation is exhausted.
VillainMonologue is a scene. VillainMonologue begins when CellarThink ends. VillainMonologue ends when scene_conversation is exhausted.
GetOutOfDodge is a scene. GetOutOfDodge begins when VillainMonologue ends. GetOutOfDodge ends when SHUTTERS_DOWN is false.
Conclusion is a scene. Conclusion begins when GetOutOfDodge ends.

Cliff_Gameover is a scene. Cliff_Gameover begins when the player is in the Precipice and Cliff_Climbing is happening.

[Arrival logic for guests to arrive after body is found]
Prearrival_Counter is a number variable. Prearrival_Counter is usually 0.
Every turn during Prearrival:
	Increase Prearrival_Counter by 1.
		
To decide whether the guests arrive:
	If Prearrival_Counter > 10, yes;
	no.	
	
First_Slept is a truth state that varies. First_Slept is initially false.
SHUTTERS_DOWN is a truth state that varies. SHUTTERS_DOWN is initially false.
DET_DISCOVERED is a truth state that varies. DET_DISCOVERED is initially false.
TRIED_BRAKING is a truth state that varies. TRIED_BRAKING is initially false.

Section 1 - Sleep Mechanics

[Gives the "you should sleep message]
Every turn when a random chance of 1 in 5 succeeds:
	if First_Investigation is happening and the Turn Count is greater than 100:
		say "I was starting to feel tired. Everything that had happened in the past few days was finally starting to take its toll. I thought it might help to find a bedroom and sleep for a few hours.";
	otherwise if First_Investigation is happening and FoundClues is greater than 4:
		say "I was starting to feel tired. Everything that had happened in the past few days was finally starting to take its toll. I thought it might help to find a bedroom and sleep for a few hours.";

	
Chapter 3 - Scene Car_Escape

Before climbing a direction (called D), try going D instead.

A room is either strapped or unstrapped. A room is usually unstrapped.
When the Car_Escape begins:
	Now the cell phone is broken.
	
Upturned_Car is a strapped room. The printed name is "Upturned Car". The description is "I wasn't sure how long I'd been out. Taking stock of my situation, I was surprised to find myself more or less unhurt, save for a dull ache in my left wrist where I'd tried to brace against the door. I took a few deep breaths, and tried to focus.[paragraph break]The car was currently lying at the bottom of a cliff on its side. Above me, I could dimly see the light of the moon, mottled by the snow on the passenger side windows. The windshield in front of me showed nothing but evergreen forest, extending into the darkness.[if Upturned_Car is strapped][paragraph break]I was still strapped in; the seat belt made sure I stayed put. At least one thing in this car still knew how to do its job right.[end if][if Upturned_Car is unstrapped][paragraph break]I crouched at the bottom of the car on the driver door, trying to figure the best way out.[end if]".

The glove compartment is scenery in the Upturned_Car. The description is "The glove box was full of the usual assortment of old registration cards, garage receipts, and an instruction manual, slightly yellowed with age. None of it was helpful.". Understand "glove box" as glove compartment.

Instead of opening the glove compartment:
	Try examining the glove compartment;
	stop the action;
[TODO: Figure out how to handle this shit]
[The windows are scenery in the Upturned_Car. The description is "The driver window or the passenger window?".]

The driver door is scenery in the Upturned_Car. The description is "The door was underneath me, now acting as the floor. Nothing was visible through the window but snow, crushed from the impact.".
Instead of kicking the driver door:
	say "It's down against a foot of packed snow, with hard earth below that. I try to kick the driver's side door, but don't get further than cracking the window.";
	stop the action.
Instead of punching the driver door:
	say "That wouldn't accomplish much.";
	stop the action.
Instead of attacking the driver door:
	try kicking the driver door.
Instead of opening the driver door:
	say "It's flat on the ground, no way that's happening.";
	stop the action.

The driver window is scenery in the upturned_car.
Instead of examining the driver window:
	Try examining the driver door.

The passenger window is scenery in the upturned_car.
Instead of examining the passenger window:
	Try examining the passenger door.

The passenger door is scenery in the upturned_car. The description is "The passenger door was a few feet above me. Half a tree's worth of snow had fallen on top of it, blocking out the view of the stars.".

Instead of kicking the passenger door:
	say "It's a little tough for me to kick up there. Even bracing against an armrest, I can't get enough reach and power to open it.".
Instead of punching the passenger door:
	say "I slam my fists against the window above me, but it doesn't break.".
Instead of attacking the passenger door:
	try punching the passenger door.
Instead of opening the passenger door:
	say "There's too much snow on top. I try to push, but the weight keeps the door from opening.".

The windshield is scenery in the upturned_car. The description is "Flecked with snow and road salt, it was already cracked in a spiderweb pattern where it'd collided with a rock on the way down. It was also probably my best way out of the jam I was in.".
Instead of opening the windshield:
	say "That's not something that typically opens on a car, I'll have to use some force.".
Instead of punching the windshield:
	say "I hit the windshield a few times, and could feel it start to come loose. A good solid kick ought to do it.".
Instead of pushing the windshield:
	Try punching the windshield.
Instead of attacking the windshield:
	try punching the windshield.
Instead of kicking the windshield:
	say "Bracing my back against the sideways seat, I gave the windshield a couple of sharp kicks. I felt the seal start to give, and then it dislodged entirely from the frame, making an exit. It fell out onto the snow with a muffled crunch, and the bitter wind started to blow into the old car. I pulled my coat tight around me, and stepped out into the forest.[paragraph break]".;
	say "(press any key)";
	wait for any key;
	Now the player is in the Bottom of Cliff;
	stop the action.
	
The seatbelt is scenery in the upturned_car. The description is "".
Understand "seat belt" as seatbelt.
	
After reading a command while the player is in the upturned_car:
	If the player's command matches "get out":
		say "I needed to find a way out of the car, but neither of the doors seemed to budge.[paragraph break]";
		stop the action;
	otherwise if the player's command matches "out":
		say "I needed to find a way out of the car, but neither of the doors seemed to budge.[paragraph break]";
		stop the action;
	otherwise if the player's command matches "go outside":
		say "I needed to find a way out of the car, but neither of the doors seemed to budge.[paragraph break]";
		stop the action;
	otherwise if the player's command matches "roll down window":
		say "The passenger window had a broken handle. I'd never bothered fixing it since I rarely had a passenger who would complain. Opening the driver window wouldn't do much good given the position of the car.";
		stop the action;
	otherwise if the player's command matches "open window":
		say "The passenger window had a broken handle. I'd never bothered fixing it since I rarely had a passenger who would complain. Opening the driver window wouldn't do much good, given the position of the car.";
		stop the action;

After reading a command while the player is in the upturned_car:
	If the player's command matches "look":
		Continue the action;
	If the player's command matches "unbuckle seat belt" or the player's command matches "unbuckle" or the player's command matches "unbuckle me" or the player's command matches "unbuckle myself" or the player's command matches "unstrap" or the player's command matches "unstrap seat belt" or the player's command matches "undo seat belt" or the player's command matches "remove seat belt" or the player's command matches "unbuckle self" or the player's command matches "take off seat belt"  or the player's command matches "take off seatbelt"  or the player's command matches "remove seat belt"  or the player's command matches "remove seatbelt"  or the player's command matches "undo seatbelt"  or the player's command matches "undo seat belt" or the player's command matches "unbuckle seatbelt":
		if the upturned_car is strapped:
			say "I wrestled with the jammed seat belt for a moment, then managed to undo it, falling a few inches down against the driver door once the chest belt was free.";
			now the upturned_car is unstrapped;
			stop the action;
		otherwise:
			say "I'd already extricated myself from the restraints.";
			stop the action;
	If the upturned_car is strapped:
		say "The seat belt held me firmly in place in what was now the bottom of the upturned car. I wasn't going to be able to see or do much of anything until I unbuckled myself.";
		stop the action;

Chapter 4 - Scene Cliff_Climbing

Bottom of Cliff is a room. Bottom of Cliff is below Sharp Bend. The description is "I stood on a ridge densely packed with trees some ways below the highway. My wrecked car sat a few feet away. The ridge extended as far as I could see to the north, going nowhere in particular. To the west I saw the steep incline the car had rolled down, and the path it'd cut through the snow and brush.[if Cliff_Climbing is happening][paragraph break]I was miles from nowhere, and the cherry on top was that my cell phone was broken. It had stopped snowing for the moment. The night sky was starting to lighten, I figured I had an hour before sunrise.[paragraph break]Fucking swell.[end if]".
Instead of going west in the Bottom of Cliff:
	try going up.
The car is scenery in the Bottom of Cliff. The description is "My Toyota Corolla in a fetching 'Regatta Blue' that must have looked appealing under bright dealership lights when it was brand new back in 1990. I wouldn't know. It now sat on its side at the bottom of the steep incline I'd rolled down.";

Instead of pushing the car:
	say "Given the shape it was in, it wasn't going anywhere.";

Chapter 5 - Scene Car_Embarking

Section 1 - Sharp Bend

When Car_Embarking begins:
	say "The second I turned my head to look down the lane, I saw a pair of headlights approach. A black Mercedes pulled up and came to a stop just in front of me. The timing was a little unnerving. The passenger door opened, and I saw Val looking out at me.[paragraph break][quotation mark]Get in,[quotation mark] she said.";
	now the Valcar_Container is in the Sharp Bend;
	now val_embark is in the Sharp Bend;
	now car_embark is in the Sharp Bend;
	
When Car_Embarking ends:
	remove val_embark from play;
	remove car_embark from play;
	
val_embark is scenery in the Sharp Bend. Understand "Val" as val_embark. The description is "I could only see a silhouette from here, I'd need to sit next to her for a better look.";

car_embark is scenery in the Sharp Bend. Understand "car" as car_embark. Understand "Mercedes" as car_embark. The description is "The car was imposing, smooth contours and powerful lines along its body. It was flecked with snow on top, and stained with road salt near the bottom.";

Sharp Bend is a room. Sharp Bend is above Bottom of Cliff and north of Hairpin_Turn. The description is "I walked on the snowy road about a hundred feet from the hairpin turn where my car had gone over; I could see the tire tracks and broken guardrail to the east.".

The guardrail is scenery in the Sharp Bend. The description is "[if Mountain_Driving is not happening]The impact had torn the gray metal wide open. It gaped like a cut ribbon.[otherwise]A metal guardrail, the only thing between the road and a steep cliff going a hundred feet down[end if]".

Rule for writing a paragraph about the Valcar_Container:
	if the location is Driveway:
		say "Val's Mercedes was parked to one side of the driveway.";
	Otherwise:
		say "A Mercedes was quietly idling in the middle of the road, V8 purring.";
	
[TODO: Maybe leaving this in could leave a trail of fixmes]
Rule for writing a paragraph about a person:
	stop;
	
Rule for writing a paragraph about Val:
	If Val is in the Sedan:
		say "Val drove the car, her eyes looking miles beyond the road, the mountains, and the horizon.".
	
Instead of going south in the Sharp Bend:
	If Cliff_Climbing is happening:
		say "I'd only known Val a couple of days, but I knew she didn't like to be kept waiting.";
		stop the action;
	Otherwise:
		say "There was nothing interesting that way except for Manhattan, and it was a little far to walk.".
Before going down in the Sharp Bend:
	If Cliff_Climbing is happening:
		say "I'd only known Val a couple of days, but I knew she didn't like to be kept waiting.";
		stop the action;
	Otherwise:
		Continue the action.

Instead of going east in the Sharp Bend:
	try going down.


Chapter 6 - Scene Riding_Scene

When Riding_Scene begins:
	Now the player is in the Sedan.

The Valcar_Container is an enterable container. It is not portable. The printed name is "Mercedes". Understand "Mercedes" as Valcar_Container. Understand "Val's car" as Valcar_Container. Understand "Val's Mercedes" as Valcar_Container. Understand "car" as Valcar_Container.
[TODO: Can't go down in initial scene, but allow the player to come back here]

Sedan is a room. The description is "The inside of the Mercedes was yards of brushed metal and hand-stitched leather. It still smelled new.[if the player recollects what the chalet and the player recollects what time sunrise and the player recollects what time sunrise] Having run out of things to talk about, I had nothing to do but wait for us to arrive.[end if]".

[TODO: Add scenery]
Val is a woman. Val is in the Sedan. The description is "The first thing I noticed were the dark green eyes, clear even driving down a street with no lights. She looked to be in her thirties, but she could have been three hundred for all I knew. Her face shone in the moonlight, pale and beautiful and unnatural. She was wearing too-red lipstick, which gave her the look of a Venetian mask. Wavy auburn hair framed a face I wouldn't have kicked out of bed for eating crackers.[paragraph break]".

Instead of waiting in the Sedan during Riding_Scene:
	If scene_conversation is exhausted:
		Now the player is in the Driveway;
	Otherwise:
		Continue the action.

Chapter 7 - Scene Cliff_Gameover

Mountain Ridge is north of Bottom of Cliff. The description is "I had a bad feeling as I walked my way along the ridge, trudging a couple of miles through the foot-deep snow. The path didn't seem to be leading anywhere, and the sky kept getting lighter as I went. I still had enough time to turn back, if I wanted to."

Dense Forest is north of Mountain Ridge. The description is "I walked for what must have been half an hour through the pines, which kept getting denser. In the light just before dawn, I saw the evergreen foliage come to a sudden stop ahead. I was starting to get seriously worried."

Precipice is north of Dense Forest. The description is "The forest abruptly ended in the edge of a cliff, overlooking a valley and several lakes hundreds of feet below."

When Cliff_Gameover begins:
	end the story saying "The north end of the ridge had a stunning view of the eastern valley, and unfortunately the horizon, too. Through what must have been some quirk of fate, I never made it to the chalet. I smiled sardonically at the sunrise, searing like a fire newly kindled, even on that cold, windswept ridge. I guess I'd been spared what would have no doubt been an interminable weekend.[paragraph break]As far as last sights went, I supposed it could have been worse."

Chapter 8 - Scene Body_Discovery

Val_House is a woman. The printed name is "Val". Understand "Val" as Val_House. The description is "She wore a belted black raincoat with straight shoulders, which covered all of her except for the bottom of a long pencil skirt. She hadn't bothered taking her driving gloves off. I couldn't put my finger on it, but there was something stiffly formal and practiced about the way she moved.[if Val_House is in the Reading_Nook][paragraph break]Her eyes rested on what was left of the professor, her expression unreadable.[end if]".

Rule for writing a paragraph about Val_House:
	If Val_House is in the Reading_Nook:
		say "Val stood to my left, looking impassively at the body of Alan Bowden.";
	If Guest_Arrival is happening:
		say "";

When Body_Discovery begins:
	now Val_House is in the Foyer;
	now ValCar_Container is in the Driveway;
	say "Val got out of the car, and took her bag out of the trunk.[paragraph break][quotation mark]Come on, I'll introduce you to Alan,[quotation mark] she said, walking up the drive.".
	
Instead of saying hello to Val_House during Body_Discovery:
	say "I started to talk to her, but she walked further into the house, apparently looking for the owner.";
	remove Val_House from play.

Driveway is a room. "I stood at the end of a long gravel drive, staring up at a large house with a dark red wood exterior. A porch spanned the facade of the place, wrapping around to a deck in the back that presumably had a great view of the lake and the countryside. It was more ski lodge than cabin, and looked like it could comfortably shelter an entire biathlon team if it had to.[paragraph break]To the east, I could see a path up to the house."
House is scenery in the Driveway. Understand "facade/chalet/lodge" as house. The description is "It seemed oddly imposing for what was just another vacation home in the Adirondacks. From the front, it looked like two or three spacious floors with high ceilings. The steeply angled roofs were clearly designed to shed the several feet of snow dumped on it by nor'easters every year. ".
Driveway_scenery is scenery in the Driveway. Understand "driveway" as driveway_scenery. Understand "drive" as driveway_scenery. The printed name is "the driveway". The description is "It seemed to be fine gravel underneath, but it was hard to tell under all the snow. Tires had cleaved into the powder, leaving tracks all over.".

Countryside is scenery in the Driveway. The description is "The mountain and valley were blanketed with snow.".

Section 1 - Mercedes

[TODO: Can the player enter in other scenes??]
[TODO: Add custom message]
Instead of entering the Valcar_Container:
	if the brake line is examined and Second_Investigation is happening:
		say "I learned what I needed to, there wasn't much point in going back to the crash site now."; 
	if Second_Investigation is happening:
		if the location is Driveway:
			if the brake line is examined:
				say "I learned what I needed to, there wasn't much point in going back to the crash site now.";
			otherwise:
				now Val_SecondInv is in the Sharp Bend;
				now Valcar_Container is in the Sharp Bend;
				say "We got in the car and Val pulled out of the driveway. A short while later, we were back at the mountain road where I'd broken through the guardrail.";
				say "(press any key)";
				wait for any key;
				now the player is in the Sharp Bend;
		otherwise if the location is Sharp Bend:
			say "I got back in the Mercedes, and Val drove us to the house. Neither of us spoke on the way back, we had too much on our minds, I guess.";
			say "(press any key)";
			wait for any key;
			now Val_SecondInv is in the Driveway;
			now Valcar_Container is in the Driveway;
			now the player is in the Driveway;	
	Otherwise:
		Continue the action.	

Front_Porch is a room. Front_Porch is east of the Driveway. The printed name is "Front Porch". The description is "Steps led up from the gravel driveway to the porch. Narrow unpainted wood planks extended the length of the house, along with windows that looked into rooms at the front. Through them, I saw blinds, and a glint of something metallic, like a shutter.".

Carry out going east in the Front_Porch:
	if Second_Investigation is happening:
		say "I walked into the house, taking care to close the door behind me.";
		now the front door is closed;
		now the player is in the Foyer.

Windows are scenery in the Front_Porch. The description is "I peered at the window next to the door. It looked to be double or triple pane glass. Crouching, I saw a recessed mechanism for a metal shutter door, almost like a security gate. Presumably, upon activation, it would slam down and block entry.". Understand "shutter" as windows. Understand "blinds" as windows.
[TODO: Ask Val about shutters if they are observed]

the front door is a lockable unlocked door. the front door is open. front door is west of the Foyer and east of the Front_Porch. The description is "A large wooden door, painted white as a preacher's picket fence. It didn't have a window or peephole. Something seemed odd about the lock, like it had been damaged. There was splintered wood on the side of the doorframe where someone had apparently forced the door open." Understand "doorframe" as front door.
Rule for writing a paragraph about the front door:
	say "The front door stood [if the front door is open]open [end if]to the east.[if the front door is unexamined][line break]There was something about the door that looked like a B&E job.[end if]".
	
The lock is scenery in the Front_Porch. The lock is a clue. The description is "I could see obvious scratch marks at the deadbolt that could've been left by an intruder using a lockpick. Judging by the deep gouges in the doorframe, the attempt hadn't been successful.";

lock_dummyobj is scenery in the Foyer. Understand "lock" as lock_dummyobj.
Instead of examining the lock_dummyobj:
	If the location is Foyer:
		say "I needed to be on the other side of the door to see what'd been done to the lock.".
	
Foyer is a room. The description is "I walked into the spacious foyer, trying not to walk into the large lacquered wood screens in front of the door. The shiny black surfaces were decorated with an intricate picture in gold paint, depicting a Chinese court scene. It seemed at odds with the exterior of the house, but matched the rest of the decor; the interior was a mixture of Old World furniture and Asian influences.[if Body_Discovery is happening][paragraph break]A layer of snow had blown in through the open doorway, and was slowly melting into a puddle on the enormous Persian rug.[end if]
[if Guest_Arrival is happening][paragraph break]Three men stood on the rug, their coats and pant cuffs damp with snow. Val made introductions all around, as if nothing was wrong. [paragraph break]I studied their faces carefully. If one of them knew about Alan upstairs, they weren't letting on. The three men were overdressed for vacation, as rich men often are. But somehow, they were oddly mismatched. I doubted that they came here together.[end if]"

The lacquered wood screens are scenery in the Foyer. The description is "The painted gold stood out from the shiny black screen. It depicted a palace with noblemen and ladies all sitting around in some kind of courtyard. I couldn't tell what they were up to, if anything. No one seemed to be having much fun going by their expressions.";

The snow is scenery in the Foyer. The description is "Some snow sat on top of the rug. It wasn't in heaps in footprint shapes, as thought it had fallen off of boots. It was in a thin, even layer, like the door had been open for some time, and the wind had blown it in as the snow fell outside.".

Section 2 - Greatroom

Greatroom is a room. Greatroom is east of the Foyer. The description is "The greatroom was clearly where the occupants of the house were meant to spend the majority of their time. Tall, dark wooden rafters criscrossed the high ceiling, the exposed beams meant to evoke a Swiss chalet.
	
A large L-shaped sofa was arranged around a huge rug. A dark [if the stain is examined]wine [end if]stain was conspicuous on the armrest, standing out on the white fabric. Everything in the room faced a gray slate fireplace. [if the fire is lit]A fire roared inside, fresh logs having been added not too long ago.[end if]

A small spiral staircase in the corner led up to a reading nook, which was open to the greatroom, separated by a wooden balustrade.[if the radio is switched on] Coming from somewhere up there I heard [carol title] warbling from what sounded like an old radio.[end if]".
To decide whether the fire is lit:
	If Body_Discovery is happening, yes;
	If First_Investigation is happening, yes;
	no.
The stain is scenery in the greatroom. The stain is a clue. The printed name is "stain on Greatroom sofa". The description is "An oblong red spot about the size of a pear stood out from the beige couch. From the color, it looked like wine. [if the player does not have the glass shard]As I looked at it, I realized something on the floor was reflecting firelight back at me.[end if]".;

The sofa is scenery in the greatroom. Understand "couch" as sofa. The description is "A spacious beige sofa big enough to lie down on. It seems a little unnaturally suited to the space, like it was picked out of a catalog by a decorator to sit in a showroom. Despite that, it has clearly seen a lot of use.[paragraph break]For instance, a conspicuous dark red stain on top of one of the cushions.".

After examining the sofa for the first time:
	Now the glass shard is in the greatroom.
	
After examining the stain for the first time:
	Now the glass shard is in the greatroom.
	
After examining the rug for the first time:
	Now the glass shard is in the greatroom.

After examining the floor for the first time:
	Now the glass shard is in the greatroom.

[Does this work?]
After examining the glass shard for the first time:
	Now the shattered glass is in the greatroom.	

The glass shard is a thing. The description is "A broken shard of glass.[if the shattered glass is examined] It came from a broken wineglass in the greatroom.[end if] The ruined facets of vintage crystal reflected light like a cheap engagement ring.[paragraph break]I crouched down for a closer look and realized it had come from a shattered wineglass, the pieces obscured by the sofa.".
[Instead of taking the glass shard:
	try examining the glass shard.]

The shattered glass is a clue. The printed name is "broken wineglass". Understand "broken wineglass" as shattered glass. The description is "The curves of the wineglass were jagged edges now, a heap of shattered crystal under the sofa. It must've fallen from quite a height.".
After taking the shattered glass:
	say "I had enough of a mess on my hands without taking this one with me, but kept it anyway. It told an interesting story.";
	stop the action.

[TODO: Fireplace as clue scenery]
The fireplace is scenery in the Greatroom. Understand "fire" as fireplace. The description is "A fireplace big enough for a country manor house.[if the fire is lit] Flames crackled inside, the logs slowly burning into hot coals.[otherwise] It was still warm from the fire that had been burning earlier.[end if]".

[Nonsense scenery]
The rug is scenery in the Greatroom. The description is "I looked at the plush carpet, checking it for footprints. A shoe size can be pretty damn circumstantial, but at this point, I needed every clue I could get.[paragraph break]I didn't see one, it was just as pristine as the drifts of snow in the valley below.[paragraph break]But something caught my eye, something small and sharp, glinting in the light of the room as I walked the perimeter of the rug. A shard of glass by the edge of the sofa.";

The staircase is scenery in the Greatroom.The logs are scenery in the Greatroom.The balustrade is scenery in the Greatroom.The ceiling is scenery in the Greatroom.The rafters are scenery in the Greatroom.The beams are scenery in the Greatroom.

The floor is scenery in the Greatroom.
Instead of examining the floor:
	Try examining the rug.	

Section 3 - Reading Nook

[TODO: should I correct the if body discovery is happening line below so the corpse gets removed? just gets rid of clues, really]
Reading_Nook is a room. Reading_Nook is above Greatroom. The printed name is "Reading Nook". The description is "I climbed the stairs to the reading nook. Shelves lined the walls of the small room, and a couple of books had been knocked off them onto the floor. A pair of wingback armchairs faced each other with a coffee table in between. A small pool of red liquid lay underneath the table.[if the scene is body_discovery][paragraph break]A man sat in one, slightly paunchy and slightly grey, his eyes and mouth wide open. His glasses were askew. He was wearing a navy blue cardigan, stained all over the front with a dark, almost black liquid. What looked like a small knife was sticking out of his neck, plunged in so far that only the handle was visible.[end if]".
The body is scenery in the reading_nook. Understand "corpse / man" as body. The description is "He looked like he was fifty, but something about his well-preserved look told me that he was probably sixty. It wasn't that he was in good shape-- I doubted he'd seen much real exercise since he was in high school, and maybe not even then. He struck me as a debate team sort of guy. I could tell he didn't get out much. His fingers were broad, but smooth. His soft, uncallused hands had no rings, but he wore a Rolex watch. It wasn't fake, and had cost probably three times what my car was worth before I'd driven it off a cliff a few hours ago."
Instead of taking body:
	say "I didn't want to move him just yet.";
	stop the action.
The knife is scenery in the reading_nook. The knife is a clue. The description is "It looked like a silver letter opener with an ivory handle. A monogram on the end read 'AHB'. It didn't look that long or that sharp, but someone had made a pretty clean business of stabbing Bowden with it. Or maybe they'd just gotten lucky. It happens like that sometimes."

Instead of taking the knife:
	say "I made a point of not disturbing crime scenes any more than I had to. The only thing pulling the knife would tell me was how long a blade it had. The dead man and I both already knew the answer to that: long enough.";
Instead of pulling the knife:
	try taking the knife.
	
The watch is scenery in the reading_nook. The description is "A Rolex Submariner. Maybe a little uncreative, but people with expensive tastes often are.".

Instead of taking the watch:
	say "It wasn't relevant to finding out who killed him, except that they probably didn't want money. Or at least they weren't interested in fencing a watch.".

the shelves are scenery in the reading_nook. Understand "bookshelves" as shelves. The description is "Mostly non-fiction: scholarly journal archives, collections of essays, and books on literature. A small section appeared to contain first and second editions. The owner seemed to have a bit of a collector's streak.".

the books are scenery in the reading_nook. 
Instead of taking books:
	say "I thought I'd better not disturb the scene. They were just some random books anyhow, not much use to take them with me.";
	stop the action.

[TODO: Remove body at some point?]

The radio is a device in the reading_nook. The radio is switched on. The description is "It was a vintage vacuum tube radio, maybe 1920 or 1930 if I had to guess, though the polished dark wood didn't look like it'd aged a day.".

the pool of wine is a clue in the reading_nook. It is scenery. The description is "A small pool of red wine had fallen on the rug underneath the table, bleeding out onto the wood floor." Understand "pool" as pool of wine. Understand "pool of liquid" as pool of wine.

Instead of switching on the radio:
	say "I wasn't really in the mood for more carols.".
Instead of taking the radio:
	say "I didn't see the point in carrying an old-fashioned wood radio with me.".

Rule for writing a paragraph about the radio:
	say "An antique wooden radio sat on the table[if the radio is switched on], playing Christmas carols[end if].".
	
To say carol title:
	Choose a random row from the Table of Christmas Carols;
	Say "[quotation mark]";
	say description entry;
	Say "[quotation mark]".

Table of Christmas Carols
Description
"God Rest Ye Merry, Gentlemen"
"O Come, All Ye Faithful"
"Angels We Have Heard on High"
"Hark, The Herald Angels Sing"
"We Three Kings"

a bottle of wine is in the Reading_Nook. It is a clue. The description is "A Bordeaux from back in 2001, uncorked and almost empty. Expensive bottle to be drinking alone."

a wineglass is in the Reading_Nook. It is a clue. The description is "A crystal wineglass, empty but for a few drops of red wine at the bottom.".

When Body_Discovery ends:
	Now Val_House is in the Reading_Nook;
	say "Val came up the stairs, freezing the second she saw the body. Her eyes narrowed, and I could tell her mind was racing, the first time I'd seen anything but placid boredom on her face. Half of me was relieved to know that there was something in this world that could perturb her. The other half was unnerved by it. She looked away and hitched the poker face back on pretty quick.[paragraph break]Val nodded at the poor stiff and said, [quotation mark]Meet Professor Alan Bowden, our host this weekend.[quotation mark][line break]";
	say "(press any key)";
	wait for any key;

Chapter 9 - Scene Prearrival

Instead of saying hello to Val_House during Prearrival:
	say "She stood there in stunned silence. There'd be time for questions later.";

Chapter 10 - Scene Guest_Arrival

When Guest_Arrival begins:
	say "[if the player is not in the Foyer]I heard the front door open, and the sound of voices from the foyer. It closed a minute later.[end if][if the player is in the Foyer]The front door opened, and three men filed in, a lanky one in designer jeans holding the door for the other two. He closed it behind them, and they stood there looking around and putting snow on the rug, as though they expected a butler to come and announce them.[end if][paragraph break][if the player is in the Reading_Nook]Val and I glanced at each other across the dead man, and she left back down the stairs.[end if][if the player is in the Greatroom]Val came down the stairs, and crossed the room toward the sound of the noise.[end if]";
	say "(press any key)";
	wait for any key;
	now Jan_Arrival is in the Foyer;
	now Scott_Arrival is in the Foyer;
	now Nathan_Arrival is in the Foyer;
	now Val_House is in the Foyer;
	now the front door is closed.

When Guest_Arrival ends:
	Remove Jan_Arrival from play;
	Remove Scott_Arrival from play;
	Remove Nathan_Arrival from play;

Jan_Arrival is a man. The printed name is "Jan". Understand "Jan" as Jan_Arrival. The description is "Jan Svennson was a broad-shouldered man with pale blue eyes. He was casually brushing snow off a European performance fleece sweater. Either he liked ice climbing, or he wanted people to think he did. He had the handshake of a salesman and the grin of a frat boy.".
Scott_Arrival is a man. The printed name is "Scott". Understand "Scott" as Scott_Arrival. The description is "Scott Gage, on the other hand, was tall and lanky, and didn't seem at all suited to the cold. He wore a pair of Japanese selvedge jeans with the cuffs turned up to make sure everyone knew it. I'd have guessed he'd picked them up somewhere in SoHo if it weren't for the sweater he was wearing, useless against real cold, as all Californian sweaters are.".
Nathan_Arrival is a man. The printed name is "Nathan". Understand "Nathan" as Nathan_Arrival. The description is "The sideswept brown locks and pencil mustache were meant to look youthful and sporty, like he'd just stopped playing cricket for teatime. The lines on the face and brow made him look more Vincent Price than Errol Flynn, though. I could tell by the way he stood that he didn't have a care in the world, or at least I wasn't one of them. His half-lidded stare gave him an air of casual arrogance, like he was perpetually waiting for the valet to bring his car around.".

Instead of saying hello to Jan_Arrival:
	say "He didn't seem to be in a talking mood. He kept tapping his foot and looking at the door like he had somewhere to be, even though we both knew he wasn't leaving soon. None of us were.";
	stop the action.
Instead of saying hello to Scott_Arrival:
	say "He put a cigarette in his mouth, patted a few pockets for a lighter, before apparently thinking better of the whole idea, and putting it away. I thought I'd talk to him later when he was a little less jittery.";
	stop the action.
Instead of saying hello to Nathan_Arrival:
	say "I approached him and got a condescending look for my trouble. He clearly didn't want to speak to me. At least, not until he had a reason to.";
	stop the action.

[LOGIC to change scene conditions from Guest_Arrival to First_Investigation]
Left_Guests is a truth state that varies. Left_Guests is initially false.

Instead of going west in the Foyer during Guest_Arrival:
	now Left_Guests is true;
Instead of going east in the Foyer during Guest_Arrival:
	now Left_Guests is true;
Instead of saying hello to Val_House in the Foyer during Guest_Arrival:
	now Left_Guests is true;

To decide whether first investigation starts:
	If Left_Guests is true:
		decide yes;
	decide no.

Chapter 11 - Scene First_Investigation

When First_Investigation begins:
	say "Val waited a minute for the conversations the three were having to die down.";
	say "(Press a key)";
	wait for any key;
	clear the screen;
	say "She folded her arms across her chest and took a deep breath quiet enough that only I heard it.[paragraph break][quotation mark]Gentlemen, we have a problem. Alan's dead. We found him upstairs, stabbed.[quotation mark][paragraph break]A stunned silence followed. When it was clear no one was going to break it, she went on. [quotation mark]I'm going to call it in to the New York Magistrate's and find out who isn't on vacation that they can send over.[quotation mark] She lifted a hand, exposing her pale wrist enough to read the face of her watch. [quotation mark]It's going to be at least six hours before they can send someone, and they'll have to make it through what's left of the winter storm. Until we can figure out exactly what happened and who's responsible, I suggest we all stay in our rooms. My associate here has some experience with police investigation, he can do the basics until the officials show up.[quotation mark][paragraph break]Nathaniel seemed to bristle at this. [quotation mark]Hang on a minute, wait in our rooms? Am I to take it you're presuming us suspects? How do I know you and your friend didn't just kill Alan?[quotation mark][paragraph break]Val shrugged and pointed at me. [quotation mark]It happens that my friend here is the only one of us with a solid alibi, unless I'm mistaken.[quotation mark][paragraph break]The lack of a response indicated that she wasn't, which bothered me a little. The three picked up their bags and trundled down the hall, varying degrees of insulted, Jan called back in a raised voice. [quotation mark]You're making a big mistake. Don't you remember what happened at Lake Geneva in 1986? I think there's someone out there who got Alan, and now we're sitting ducks.[quotation mark][paragraph break]He said it with false bravado, and I shouldn't have let the idea take root in my mind, but it did.";
	now Nathaniel_Investigation is in the Nathan_Room;
	now Scott_Investigation is in the Scott_Room;
	now Jan_Investigation is in the Jan_Room;
	now the front door is closed;
	now the front door is locked;
	say "(Press a key)";
	wait for any key;
	
[TODO: this still seems to take an extra turn for Val to appear]
When First_Investigation ends:
	now Val_Sleep is in the PC_Bedroom.
	
[LOGIC for when shutters come down]
Shutter_Counter is a number variable. Shutter_Counter is usually 0.
Every turn during First_Investigation:
	Increase Shutter_Counter by 1;
	If Shutter_Counter is 3:
		say "With no more sound than a loud whisper, shutters slid down on the inside of every window in the house. They looked like opaque fabric window shades, but the heavy sound of the seal told me the core was probably metal. The light from outside went out as suddenly as if someone had thrown a curtain over the moon.[paragraph break]";
		now SHUTTERS_DOWN is true;
		say "(press any key)";
		wait for any key.
[TODO: make shutters scenery visible from all interior rooms, maybe it should be a backdrop.]
		
Scott_Investigation is a man. The printed name is "Scott". The description is "He had an unlit cigarette between his lips. They all seemed to smoke. His fingers fumbled with a brushed metal lighter and didn't seem to be making much progress, but he was giving it the old college try. I watched his eyes scan across the walls out of habit, and annoyance flicker briefly in them as he failed to find a TV on any of them."


Jan_Investigation is a man. The printed name is "Jan". Understand "Jan" as Jan_Investigation. The description is "He stood well over six feet tall, but only about as wide as an aircraft carrier. His dirty blonde hair looked windswept, but it probably looked that way when he got out of bed. He wore a sleek gray performance jacket made from some synthetic material. The snow sat on top of it in beads. I didn't recognize the brand, which meant that it had probably cost about three hundred dollars.".
			
			[Even through the thick turtleneck he was wearing, I could tell from his size that his back and forearms got a lot of work. It didn't seem like he needed all that gear, I'd have believed he could claw his way to the top of Everest unaided.[paragraph break]The gray sweater had flecks of dark brown dried on it, only really visible in the light.]
[TODO: move this description to his room when he removes the jacket]

Rule for writing a paragraph about Jan_Investigation:
	say "Jan stood here amid his piles climbing gear, coiling a long length of rope around one of his broad shoulders.";

Nathaniel_Investigation is a man. The printed name is "Nathaniel". The description is "The sideswept brown locks and pencil mustache were meant to look youthful and sporty, like he'd just stopped playing cricket for teatime. The lines on the face and brow made him look more Vincent Price than Errol Flynn, though. I could tell by the way he stood that he didn't have a care in the world, or at least I wasn't one of them. His half-lidded stare gave him an air of casual arrogance, like he was perpetually waiting for the valet to bring his car around. He sat in the chair, smoking idly.".
[TODO: custom description here]

Section 1 - Main House

Section 2 - Hallway Downstairs

Hallway_Downstairs is a room. Hallway_Downstairs is east of the Greatroom. The printed name is "Downstairs Hallway". The description is "A long narrow corridor connected the entrance of the house with the bedrooms. Lights were recessed into the ceiling overhead, shining down onto the polished wood floor. Maybe some people liked this sterile modern crap, but it made the place look like an art gallery, as far as I was concerned. A couple of paintings even adorned the walls, so maybe that was the idea, and I was just uncultured."

the painting is scenery in the Hallway_Downstairs. it is a closed openable container. The description is "An oil painting of a crowded scene, bright colors jumping out from shadows and mottled light coming down from above. Everyone in the painting seemed pretty upset, though it wasn't really apparent why. It looked like it was done in the Romantic style, but I'm no art historian. It could just as easily have been the Old Testament as Paradise Lost.".

Carry out opening the painting:
	say "I felt around the edges of the gold-trimmed frame and found a latch. The entire painting swung off the wall smoothly, like the hinges were well oiled. A refrigerated compartment inside leaked cold vapor like an old sci-fi movie used dry ice. It was full of plastic pouches.";
	now the painting is open.
Instead of moving the painting:
	Try opening the painting.
	
[TODO: Move me]
Understand the command "move" as something new. Moving is an action applying to one thing. Understand "move [something]" as moving.

The pouch of liquid is in the painting. The description is "The clear plastic was mostly covered with white labels and barcodes, most of which had been scratched out with a marker. It held a thick, dark liquid I tried not to look too closely at.".

Instead of opening the pouch of liquid:
	say "I was only going to open it for one reason.";
	stop the action.

Instead of drinking the pouch of liquid:
	say "I tried not to look at the viscous contents as I tore off the end of the plastic with my teeth. I closed my eyes and forced myself to keep drinking until it was empty. It warmed me like drinking spiced cider by the fireside. Until that moment, I hadn't realized how cold I'd been.";
	now Blood_status is true;
	remove the pouch from play.

Section 3 - Kitchen
			
Kitchen is a room. Kitchen is east of the Hallway_Downstairs. The description is "I stepped into a kitchen big enough for a game of football. Wooden cabinets and handsome tile in earth tones went from wall to wall. The quaint country look was somewhat ruined by the collection of modern stainless steel kitchen appliances. They were brand new and it looked like not one of them had been used. It figured, this didn't seem like the kind of place that had a cooking staff.".

Section 4 - Library

Library is a room. Library is north of the Hallway_Downstairs. The description is "Of all the rooms I'd seen in the house, this one looked the most lived in. It had the musty smell of old books mixed with stale coffee coming from several cups on the desk.[paragraph break]The rest of the desk was covered with messy stacks of papers.".

cups are scenery in the Library. The description is "Mugs of coffee, stone cold. I could see rings on the sides of the half-empty cups where the liquid had evaporated. They'd been here a few days, but that didn't indicate a time of death. The kind of man who leaves more than two coffee cups sitting on a desk isn't in a hurry to clean up after himself.".
Instead of taking the cups:
	say "Val asked me to find his killer. I wasn't going to do his dishes.";

the desk is scenery in the Library. the desk is a closed openable container. The description is "Unlike most of the other expensive furniture in the house, it looked like the mahogany desk got a lot of use. A computer at least five years old, sat on it, the keyboard mostly buried by papers and books. Worn brass handles barely hung on to a row of drawers along the right side.";

the papers are scenery in the Library.
Instead of examining papers:
	say "I thumbed through the pile on the desk, finding term papers and dissertations, collections of academic journals. Underneath most of it was something that caught my eye, a document with dollar signs on it and more zeroes than I'm used to seeing on paper.";
	Remove the bank statement from play;
	now the bank statement is in the Library.

[TODO: front door lock should be scenery/clue]

a bank statement is a clue. it is inside the desk. The description is "A bank statement detailing transactions for the past 6 months. Most of it is purchases of home furnishings and luxury goods. A couple of withdrawals stand out as having too many zeroes. Alan had made some large bank transfers every month to a foreign bank, and then one last cash withdrawal for the balance of the account. He'd needed liquid capital fast, which seemed a little odd for someone who seemed to be so financially stable.[paragraph break]On the back of the page were three numbers, hastily scrawled:[line break][bold type]23 - 4 - 15[roman type]".

the box of bullets is a clue. it is inside the desk. The description is "A box of bullets, but no gun. The outside read:[paragraph break][tab]Birmingham Arms Co.[line break][tab]38 Special[line break][tab]125 Gr[line break][tab]Sterling Silver[line break][tab]Jacketed Hollow Point[paragraph break]Six were missing.".

Section 5 - Basement

Wine_Cellar is a room. Wine_Cellar is below the Hallway_Downstairs. The printed name is "Wine Cellar". The description is "[if DiscoverDet is not happening]The second I walked into the dark wine cellar, recessed lights in the ceiling turned on, probably activated by a motion sensor.
[paragraph break][end if]
A wine rack ran the perimeter of the room, holding enough bottles to supply a French restaurant. A few seemed to be missing here and there. A wooden chair sat in the corner."

The wooden chair is scenery in the Wine_Cellar. The description is "A simple chair made from dark wood, appearing to have woven reeds for the seat. It's probably just here to add to the country style decor, I can't imagine anyone sitting in the cellar drinking wine long enough to use it.".

The wine rack is scenery in the Wine_Cellar. The description is "What had to be about a hundred dark green bottles rested in the diamond-crossed wooden cubbyholes, corks facing out.[paragraph break]I took a look at the gaps in the collection. A couple were missing from a section of Californian whites. One was missing from the other end, the hole surrounded by bottles of Burgundy red."

Understand "missing wine" as wine rack.
Understand "missing bottles" as wine rack.

NEED_EMERGENCY_SHUTTER is a truth state that varies. NEED_EMERGENCY_SHUTTER is false.

The fuse box is in the Wine_Cellar. The fuse box is a device. The description is "The box was sleek and black, nothing like the ones I'd seen in old city buildings. It was some sort of custom installation.";

Rule for writing a paragraph about the fuse box:
	say "In the corner was a fuse box, partially obscured by shelves.";
	
Instead of switching on the fuse box:
	say "I saw no reason to mess with it now.";
	
Instead of switching off the fuse box:
	say "I saw no reason to mess with it now.";

Section 6 - Upstairs Hallways

Hallway_Upstairs is above the Hallway_Downstairs. The printed name is "Upstairs Hallway". The description of Hallway_Upstairs is "I stood in a normal-sized hallway that seemed cramped compared to the dimensions of the rest of the house. The hardwood floor was just as polished as the one downstairs. To the east were a couple of the smaller rooms clearly intended for overnight guests. To the north was another bedroom, and a set of double doors that led to the master suite.".

North_Hallway is north of the Hallway_Upstairs. The printed name is "North Hallway". The description is "The northmost section of the upstairs hallway led to a couple of guest rooms. West of me was a bedroom, and straight ahead to the north was the master bedroom.".

East_Hallway is east of the Hallway_Upstairs. The printed name is "East Hallway". The description is "The eastern side of the upper floor led to several guest bedrooms to the north, east, and south. A window [if SHUTTERS_DOWN is false]looked out onto the valley and a vast lake, a real one put there by nature, not a big hole dug by a developer to increase 'lakeside' property values.[end if][if SHUTTERS_DOWN is true]faced north, blocked by the closed shutter.[end if]".

Section 7 - Master Bedroom

master bedroom door is a closed door. it is scenery. it is north of the North_Hallway and south of the Master_Bedroom.

[TODO: Name who's staying where based on "scene has happened"]

Master_Bedroom is a room. The printed name is "Master Bedroom". The description is "The master suite sat at the north end of the house and [if SHUTTERS_DOWN is false]had the best view of the valley and the lake[end if][if SHUTTERS_DOWN is true]had a row of floor-to-ceiling paned windows that ran the length of the room, but the shutters were closed, keeping the room dark as night[end if]. A four-poster bed with a thick down comforter looked like it would sink at least half a foot under any weight. Ornate wooden nightstands flanked the bed on either side. One was bare except for a lamp, the other was piled high with what must have been bedtime reading. In the corner of the room, I could see into a spacious closet."

the book is a clue. the book is in the Master_Bedroom. The description is "[italic type]Kokoro[roman type], by Soseki Natsume. The binding looked expensive and uncracked. A post-it note was stuck to the cover. Just two words were written on it: [quotation mark]I'm sorry.[quotation mark][paragraph break]I started to flip through the book and noticed something handwritten on the title page. The cursive looked like it'd been written with a fountain pen.[paragraph break][paragraph break]For Kelly[line break]     Somewhat appropriately, I got this book from my teacher, and now I'd like you to have it. More than whatever literary value it may have, from now on, I'll always remember it as the first book we read together.[paragraph break]Yours,[line break]Alan".
Rule for writing a paragraph about the book:
	say "A book lay on the nightstand.".

Instead of opening the book:
	try examining the book.
Instead of reading the book:
	try examining the book.

Instead of entering the closet:
	try examining the closet.
Instead of going west in the Master_Bedroom:
	try examining the closet.

Walk-in closet is scenery in the master_bedroom. The description is "I walked into the closet and flicked on the light. Three quarters of it was the usual cruft that finds its way to a person's closet and never gets worn.[paragraph break]I looked at the rest of it. A handful of suits that looked like they'd been bought in the 80s, judging by the lapels. Performance fleece winter gear and hiking boots, none of it looked like it had been worn. Velvet smoking jacket, no sweatpants or loungewear. Professor Bowden seemed to have some old-fashioned sensibilities.".

the wall_safe is a locked container in the Master_Bedroom. the wall_safe is fixed in place. The printed name is "wall safe". Understand "wall safe" as wall_safe. Understand "safe" as wall_safe. The description is "A safe had been installed in the wall next to the bed. It was partially obscured by a painting someone had moved. A large dial with numbers around it sat in the middle."

instead of opening the wall_safe:
	if the bank statement is examined:
		say "I spun the dial, stopping it carefully on the numbers written on the paper.";
		now the wall_safe is unlocked;
		now the wall_safe is open;
	otherwise:
		say "There's a couple of simple locksmith's tricks you can pull on a simple combo lock, but this one was a little beyond my safecracking abilities. I'd need to find the combination.";
		stop the action.

the manila envelope is a closed container in the wall_safe.
instead of opening the manila envelope:
	say "I opened the envelope, and took out the contents, a handful of photos";
	now the player has the photos;
	remove the manila envelope from play.
	
nightstand is scenery in the Master_Bedroom. The description is "Made of a heavy mahogany, the nightstands were carved with an intricate pattern of leaves. The workmanship and slightly faded look told me that they were antiques.".
	
some cash is in the wall_safe. the cash is a clue. The description is "Five neat stacks of worn bills, each banded with a gold paper strip reading '10,000.'".

the photos are a clue. The description is "Several photographs of a blonde young man in his early twenties, taken with a telephoto lens. He hadn't spotted the photographer. He's wearing a shortsleeve polo shirt and jeans, so it must have been taken months ago. The man was holding a cup of coffee, and exiting a coffee shop. The daily routine must have made it pretty easy for whoever was tailing him. The height of the shots put the photographer in a car across the street. The photos looked dim and hazy, even for a black and white shot.".

before examining the photos:
	now BLACKMAIL_KNOWN is true;

Section 8 - Guest Bedrooms

Nathan_Room is a room. The printed name is "Oak Room". The description is "The room had a large white rug in the center, and a four-poster bed that looked nice enough that it might have once sat in the master bedroom. An ugly, expensive-looking valise lay on the bed, its weight sinking it a full six inches into the feathertop mattress.".

Oak_Door is a door. The printed name is "door". It is east of the East_Hallway and west of the Nathan_Room.

Rule for writing a paragraph about the Oak_Door:
	say "".

Scott_Room is a room. The printed name is "Sumac Room". The description is "There was something decidedly autumn about the decoration of the room, heavy curtains the color of cherries, and luxurious golden bed linens that looked like smooth parchment on the king-size bed.".

Sumac_Door is a door. The printed name is "door". It is south of the East_Hallway and north of Scott_Room.

Rule for writing a paragraph about the Sumac_Door:
	say "".


Jan_Room is a room. The printed name is "Hemlock Room". The description is "The room had an angled ceiling to give the impression of a cozy attic or country cabin, except it was about as big as my entire apartment. Piles of climbing equipment and bunched-up coils of rope were heaped in the corner on top of his luggage. A gray sweater hung on a chair, flecks of dark reddish-brown stains dried on it.".
The sweater is scenery in the Jan_Room. The description is "It was a thick wool turtleneck, so big it looked like a blanket draped over the chair. Around the front and the sleeves, blood stains were visible where some had apparently splashed back onto it."
	
Hemlock_Door is a door. The printed name is "door". It is north of the East_Hallway and south of Jan_Room.

Rule for writing a paragraph about the Hemlock_Door:
	say "".

[TODO: If the player is too confused, simply change to an objective, use the "acting confused" cues from EmShort]

Chapter 12 - Scene First Sleep

Section 1 - PC Bedroom

When First_Sleep begins:
	remove Val_House from play;	
	
When First_Sleep ends:
	say "I changed into my pajamas and got into bed under the covers. I kept a reasonable distance between the two of us on the bed, though she didn't seem the type to get prudish about that kind of thing. I lay there thinking for a long time, trying to put together everything I'd heard into a picture that made sense. After five minutes that took two hours, I fell asleep, and dreamt of nothing.";
	remove Val_Sleep from play;
	say "[paragraph break](press any key)";
	wait for any key.

[Vampires don't dream?]

PC_Bedroom_Door is a closed door. The printed name is "bedroom door".
PC_Bedroom_Door is scenery.
PC_Bedroom_Door is west of the North_Hallway and east of the PC_Bedroom.

Rule for writing a paragraph about the PC_Bedroom_Door:
	say "".

Before opening PC_Bedroom_Door for the first time:
	if First_Investigation is happening and the Turn Count is greater than 100:
		Continue the action;
	if First_Investigation is happening and FoundClues is greater than 4:
		Continue the action;
	Otherwise:
		say "I reached the room where Val was staying, and supposed it was where I was staying, too. My tired fingers closed tightly around the doorknob like a pitcher throwing his last solid knuckleball in the ninth inning. [paragraph break]I paused for a moment, mentally tallying what I'd put together about what had happened. I figured I ought to make sure I'd found enough clues for the day before I turned in.";
		stop the action.

[TODO: fix this description for the wakeup scene]
The PC_Bedroom is a room. The printed name is "Bedroom". The description is "[if First_Sleep is happening]It was getting late, almost noon. I had a million things to think about, but figured I should get a few hours of sleep while I still could.[end if]"

Val_Sleep is a woman. The printed name is "Val". Understand "Val" as Val_Sleep. The description is "[If First_Sleep is happening]Val was lying on top of the covers, facing the window. Her breathing was steady and slow, but I couldn't tell if she was asleep. She wore just a satin pajama shirt. If the cold bothered her, she didn't show it.[end if]"

the bottle of bourbon is in the PC_Bedroom. The description is "A bottle of Woodford Reserve. One of the better ways to pass the time, if I had to choose. It was still half full, if I had to be an optimist about something." ;

instead of drinking the bottle of bourbon for the first time:
	say "I poured out a measure into one of the glasses on the nightstand and drank it slowly, letting it linger on my tongue.[paragraph break]I thought about the idea that someone was just outside the window, trying to peer in, waiting the way a hunter sits outside a burrow. I thought about the three men I'd just met, and how I liked none of them. I thought about the man I'd seen in the chair with his eyes wide open, who didn't seem to mind that I was drinking his bourbon, since he didn't mind much of anything anymore.";
instead of drinking the bottle of bourbon for the second time:
	say "I went back to the bottle and poured again, more generous this time. I listened to the sound of something between snow and frozen rain pattering against the window. I listened to Val's steady breathing. She was either asleep, or thinking just as hard as I was. I stared at her back a long time, trying to decide if I wanted to talk to her.";
	
instead of drinking the bottle of bourbon for the third time:
	try sleeping.

[TODO: Make sure sleeping has a decent message]

Instead of drinking the bottle of bourbon for the fourth time:
	say "The bottle beckoned, but I had a rule about not having the same thing for two meals in a row.".

instead of drinking the bottle of bourbon:
	say "I decided it was time to cut myself off. I'd never found a clue hidden at the bottom of a whiskey bottle.".
	
instead of taking the bottle of bourbon:
	say "Taking the entire bottle with me wouldn't have been a very classy move, but the thought crossed my mind.".

instead of sleeping in the PC_Bedroom during First_Sleep:
	now first_slept is true.
	
The memo is a thing. The description is "Kid,[line break]You'll be hungry soon. Alan used to keep a personal stash behind a painting in the hallway downstairs. [paragraph break]Help yourself, I need you to stay sharp for this one. Or don't, your call.".

Section 2 - Conversation Riding_Scene

Chalet is a subject. Understand "ski chalet/house" as chalet.
Sunrise is a subject. Understand "dawn" as sunrise.
Vals_Car is a subject. Understand "Mercedes" as Vals_Car.

what her car is a repeatable questioning quip.
	The printed name is "about her car". The true-name is "Vals_Car".
	[Understand "Mercedes/car/her car/the car/Mercedes" as what her car.]
	The comment is "'Nice ride,' I said.".
	The reply is "'You should have called,' Val replied, ignoring my comment.".
	It mentions Mercedes.
	The proper scene is Riding_Scene.
what the chalet is a repeatable questioning quip.
	The printed name is "about the chalet". The true-name is "what the chalet".
	It mentions house.
	It mentions ski chalet.
	[Understand "ski chalet/house" as what the chalet.]
	The comment is "'Where are we going?'".
	The reply is "'I already told you, a friend's house. He lives not too far from here, halfway up the mountain.'".
	The proper scene is Riding_Scene.
what time sunrise is a repeatable questioning quip.
	The printed name is "about sunrise". The true-name is "what time sunrise".
	It mentions dawn.
	The comment is "'Sun goes up at 7:03 today. Always check the time before you leave for the night,' she said.".
	The reply is "I looked out the window, trying not to feel like a kid being lectured by his mom.".
	The proper scene is Riding_Scene.

	[An availability rule for what time sunrise:
		it is off-limits.
		it is available.]

Chapter 13 - Conversations First_Investigation

Section 1 - Val

about alan is a repeatable questioning quip.
	The printed name is "about Alan".
	The comment is "[quotation mark]How well did you know Alan?[quotation mark]".
	The reply is "[quotation mark]I knew him for probably ten years, we were only close for a handful of those. He wasn't perfect, but I knew him well enough that I feel like he deserved better than he got.[quotation mark]".
	It quip-supplies Val_House.
	The proper scene is First_Investigation.

about murder is a repeatable questioning quip.
	The printed name is "about the murder".
	The comment is "Val leaned in close until her face was inches from mine, and lowered her voice, even though no one was around. [quotation mark]Listen, kid. Here's how it's going down. We have a few hours before what passes for the law for our kind shows up and starts stomping its flat feet around. They don't much care if the wrong one of us takes the rap, or if no one does. Alan's nobody to the Circle, I doubt they'd care if this case went stone cold. But he used to be a friend of mine, and this is something I want to do for him.[quotation mark]".
	The reply is "I didn't say anything.".
	It quip-supplies Val_House.
	The proper scene is First_Investigation.

about pouch is a repeatable questioning quip.
	The printed name is "about the pouch".
	The comment is "[quotation mark]So where exactly did you get... Who--[quotation mark] I began.".
	The reply is "[quotation mark]They've got a skim set up with the Red Cross. Like the mafia used to do with the nightly take at casinos. We've got ways to keep anyone from talking about it.[quotation mark][if Blood_status is true][paragraph break]Something inside me rebelled at the thought of it, my stomach churning. [quotation mark]I can't just take it, it could've been used to help someone![quotation mark][paragraph break][quotation mark]It is going to help someone: you. If someone from outside killed Alan, I need to know if he's likely to come back. If it was someone here, I need you on your toes.[end if]".
	It quip-supplies Val_Investigation.
	The proper scene is First_Investigation.
	
an availability rule for about pouch:
	if the pouch is unexamined:
		it is off-limits.

who nathaniel is a repeatable questioning quip.
	The printed name is "about Nathaniel". The true-name is "about Nathaniel".
	The comment is "[quotation mark]This Nathaniel Wyndham, is he old money?[quotation mark] I asked."
	The reply is "[quotation mark]I guess. He made a sizeable fortune selling boots to the Allies during World War I, a real war profiteer. He used it to buy that ridiculous title, a couple of country estates, and even restored an old manor house. But a little time running with the Circle crowd will tell you that [quotation mark]old money[quotation mark] is a relative term.[quotation mark]".
	It quip-supplies Val_House.
	The proper scene of who nathaniel is First_Investigation.
	
what was in it for me is a repeatable questioning quip.
	The printed name is "what was in it for me". The true-name is "what was in it for me".
	The comment is "[quotation mark]Seems like a pretty long way to stick my neck out for you. What's in it for me, exactly?[quotation mark]".
	The reply is "She gave me a sharp look. I could tell it got a lot of use, it was just as practiced as everything else about her. Here was a woman who wasn't afraid to throw her weight around, and made it a bad habit to force her to do it.[paragraph break][quotation mark]Think of me as your first client as a private dick. I'm asking you to make this one on the house. You owe me, remember?[quotation mark][paragraph break]She had me there. I didn't know if this was the kind of thing I could pay back, but I didn't like owing that kind of debt.".
	It quip-supplies Val_House.
	The proper scene is First_Investigation.
	
Section 2 - Nathaniel

[TODO: fix name]
why nathaniel here is a repeatable questioning quip.
	The printed name is "why Nathaniel came here".
	The comment is "[quotation mark]So, do you come here often? I'm having trouble telling if this is a private party or a resort. Were you good friends with Alan?[quotation mark]".
	The reply is "[quotation mark]He was all right. Really, the house has nice position, and at the height of skiing season, it's hard to beat the crowd.[quotation mark] He gestured vaguely towards the surrounding countryside as though it were a buffet.".
	It quip-supplies Nathaniel_Investigation.
	The proper scene is First_Investigation.

whether he's been here before is a repeatable questioning quip.
	The printed name is "whether he's been here before".
	The comment is "[quotation mark]You've been here before.[quotation mark]".
	The reply is "[quotation mark]Oh, sure. He liked to keep things small, but he always wanted to be the center of attention. He'd do these little get-togethers a few times a season. Here in the winter, and his home in Martha's Vineyard for the summers. There's nothing quite like riding a horse along the beach in the moonlight, is there?[quotation mark]".
	It quip-supplies Nathaniel_Investigation.
	The proper scene is First_Investigation.
	
why he isn't especially upset is a a repeatable questioning quip.
	The printed name is "why he isn't especially upset".
	The comment is "'You know there's a dead man upstairs, right?' I asked.[line break]'Oh, no one's arguing that, sweetheart.'[line break]'It's just that you don't seem all that upset.'[line break]'I liked him well enough, but it was really only ever a friendship of convenience. He threw great parties, knew the right people, you know. He raised both eyebrows playfully. You can't possibly still think one of us did it? I think it's pretty clear that it was an outsider who did the killing.".
	The reply is "".
	It quip-supplies Nathaniel_Investigation.
	The proper scene is First_Investigation.
an availability rule for why he isn't especially upset:
	If the current interlocutor is not Nathaniel_Investigation, it is off-limits;
	if the player recollects why nathaniel here, it is available;
	otherwise it is off-limits.
	
[TODO: match name]
about nates alibi is a repeatable questioning quip. It indirectly-follows why he isn't especially upset.
	The printed name is "about his alibi".
	The comment is "[quotation mark]Where were you last night?[quotation mark]".
	The reply is "His lofty affected manner disappeared the second I asked. His smile was still fixed on his face, but the black eyes were suddenly cold and threatening. I met his gaze, unflinching. It felt like skinny dipping in Lake Ontario.[paragraph break][quotation mark]I don't know what the hell you think you're playing at, but let's get one thing straight. You're nobody, and if you carry on making wild accusations, you're going to make a lot of enemies. Who knows, maybe even one your little sugar mommy can't protect you from.[quotation mark]".
	It quip-supplies Nathaniel_Investigation.
	The proper scene is First_Investigation.

[TODO: Fix name]
what sanction is a repeatable questioning quip.
	The printed name is "about the Sanction".
	The comment is "'What happens to folks who don't wait their turn for becoming a Patron?'[line break]'The Circle only really has a single sanction.'[line break]'What is it?'[line break]
He gave me one of his best condescending smiles, and looked at me through half-lidded eyes. It made my skin crawl.[line break][quotation mark]What do you think?[quotation mark]".
	The reply is "".
	It quip-supplies Nathaniel_Investigation.
	The proper scene is First_Investigation.

Section 3 - Scott

about jan svensson is a repeatable questioning quip.
	The printed name is "Jan".
	The comment is "[quotation mark]Have you met Mr. Svensson?[quotation mark] I asked.".
	The reply is "[quotation mark]Jan? Jesus, I can't stand him. He's insufferable at every damn conference I run into him at. Blowhards like him look down their noses at people like you and me, you know? He'll act like he's slumming it investing in startups, then take all the credit when a tech rally helps lift that boat anchor of a fund he runs.[quotation mark]".
	It quip-supplies Scott_Investigation.
	The proper scene is First_Investigation.
	
hedge fund is a repeatable questioning quip.
	The printed name is "about the hedge fund".
	The comment is "[quotation mark]I take it you're not invested in Svensson's financial ventures, then?[quotation mark]".
	The reply is "He gave me a knowing smile that was not at all kind. [quotation mark]Did he already give you the sales pitch? He probably left out the part where he's lost good ten percent more than the indexes. That joke of a fund of his is bleeding money, it's not surprising he's trying to get new clients to keep things solvent.[quotation mark]".
	It quip-supplies Scott_Investigation.
	The proper scene is First_Investigation.
An availability rule for hedge fund:
	If the current interlocutor is not Scott_Investigation, it is off-limits;
	if the player recollects about jan svensson, it is available;
	otherwise it is off-limits.

who he thinks did it is a repeatable questioning quip.
	The printed name is "who he thinks did it".
	The comment is "'Who you figure got to Bowden before we got here?'".
	The reply is "The second I asked, he started shifting around like something was crawling under his skin. 'There's someone out there, you mark my words. Did you see the door? They knew he lived alone, broke in, and stabbed him, simple as that. You can bet I'm getting the hell out of here the second the sun sets. This is like Geneva all over again, I'm not ending up like those people!' His high voice was a whine now, the shrill panic of a man who didn't deal well with stress.".
	It quip-supplies Scott_Investigation.
	The proper scene is First_Investigation.
	
what happened in Geneva is a repeatable questioning quip.
	The printed name is "what happened in Geneva".
	The comment is "'What happened in Geneva in 1986?'".
	The reply is "'Some fucking do-gooder with a gun and a handful of silver bullets. Our people are connected enough in the media and the government to keep a tight lid on any leaks, but every so often, one person comes along who can slip through the net. He buried himself in the snow and found a vantage point on a house by Lake Geneva, a wealthy Patron was having a party. Anyone who tried to leave the house at night was picked off at fifty paces. Anyone who tried to run during the day... well, you can imagine.[paragraph break]The Inquisition made a big public show of the execution when they caught him. You know how it goes, they had to look like the situation was under control after a colossal security fuckup like that.'".
	It quip-supplies Scott_Investigation.
	The proper scene is First_Investigation.

Section 4 - Jan

jans work is a repeatable questioning quip.
	The printed name is "about his work".
	The comment is "[quotation mark]So what do you do for a living, Mr. Svensson?[quotation mark] I kept my voice light and conversational, like we were at a cocktail party.".
	The reply is "[quotation mark]Hedge funds, mainly. It's a lot of handshaking and time on the golf course, but it pays for the rest of everything.[quotation mark] He gestured vaguely at the gear.".
	It quip-supplies Jan_Investigation.
	The proper scene is First_Investigation.

about climbing is a repeatable questioning quip.
	The printed name is "about climbing".
	The comment is "[quotation mark]Planning on doing some rock climbing?[quotation mark]".
	The reply is "[quotation mark]I was, before all this happened. You can find the best ice climbing on the Eastern seaboard in the Adirondacks, if you ask me.[quotation mark]".
	It quip-supplies Jan_Investigation.
	The proper scene is First_Investigation.

[TODO: Formatting's a mess here]
about business is a repeatable questioning quip.
	The printed name is "about business".
	The comment is "[quotation mark]How are the markets treating you? With everything I hear in the news...[quotation mark] I trailed off, waiting for the self-appointed expert to jump in and correct the ignorant layperson. He didn't disappoint.".
	The reply is "[quotation mark]Oh sure, we took a hit during the downturn, but so did everyone. We'll bounce back, and I'm not worried, nor are our high-profile clients.[quotation mark][paragraph break]It all sounded a little too well-rehearsed. I saw him give me a quick once over, it was almost imperceptible.[paragraph break][quotation mark]Now's the best time to buy in, when you consider the numbers. Do you know someone who'd be interested in an account with us? Your friend, Ms. Sinclair, perhaps?[quotation mark][line break]I chuckled politely and gave a noncommittal shrug.[line break][quotation mark]There'd be a finder's fee in it for you, of course, if things did move to business. Think it over.[quotation mark]".
	It quip-supplies Jan_Investigation.
	The proper scene is First_Investigation.

about val jan is a repeatable questioning quip.
The printed name is "about Val".
	The comment is "'You've met Val?'".
	The reply is "He looked surprised. 'Sure. Everybody knows Val. For someone who's been around as long as her, I'm surprised she hasn't tried her hand at politics. Just about all the other elders love their little backroom deals and power plays. She hasn't been very interested in becoming a Patron either. I think you're her first in some fifty years.'".
	It quip-supplies Jan_Investigation.
	The proper scene is First_Investigation.

about patronage is a repeatable questioning quip.
	The printed name is "about Patronage".
	The comment is "'Patron?'".
	The reply is "He gave a hearty laugh that didn't endear me any more to him. 'Wow, I guess she's as tight-lipped as they say. Patronage is the flowery little euphemism for the way we expand our little Circle. I was told the term came from the aristocrats in the old days. You know, bring in an artist or a mathematician, someone of value, and preserve their genius for all time. And of course, the prestige that comes from having such a stable. A little trophy case to show off in front of the other elders.' He gave me a grin that made him look like an overgrown schoolboy. 'Well, that was the idea, anyway. In reality, Patrons have needs like anyone else. They'll bring in someone who can bring something practical to the table. Unique skills, money... love.' His grin was starting to look more like a leer.".
	It quip-supplies Jan_Investigation.
	The proper scene is First_Investigation.
		
an availability rule for about patronage:
	if the current interlocutor is not Jan_Investigation, it is off-limits;
	if the player recollects about val jan, it is available;
	otherwise it is off-limits.


Section 5 - Val_Sleep

how long she'd known Bowden is a repeatable questioning quip.
	The comment is "[quotation mark]Did you know Alan well?[quotation mark]".
	The reply is "[quotation mark]I suppose we've spent a lot of time together over the years at little soirées like this one. But not well, no.[if BLACKMAIL_KNOWN is true][paragraph break]'Well enough that he'd ask you for help with a blackmailer?'[paragraph break]I listened hard, straining to hear anything against the silence. For what, I wasn't sure. Certainly not a gasp of surprise. I couldn't even hear her blinking.[end if][quotation mark]".
	It quip-supplies Val_Sleep.
	The proper scene is First_Sleep.
	
Chapter 14 - Scene Wakeup

When Wakeup begins:
	now the front door is unlocked;
	now the memo is in the PC_Bedroom;
	now SHUTTERS_DOWN is false;
	now Adrian_Investigation is in the North_Hallway;
	say "I awoke to an empty room, bathed in the silver moonlight. She hadn't made a sound when she'd left. It took a second for me to realize that the shutters had gone back up. Through the window, I could see that lights were starting to come on in the distant houses dotted across the mountainside.[paragraph break]I wasn't sure how long I'd slept, but it must have been about eight o'clock in the evening.".

[TODO: This needs to go before the scene change]
When Wakeup ends:
	remove Adrian_Investigation from play;
	

Section 1 - Adrian_Investigation

Adrian_Investigation is a man. The printed name is "Adrian". Understand "Adrian" as Adrian_Investigation. The description is "He stood well over six feet with a build that belonged on the inside of a steel cage. The designer charcoal suit he wore hadn’t quite been successfully altered to his wide frame. A deep purple tie sat at his neck in a fat knot Donald Trump would have approved of. The dark hair atop his head was neatly parted at the side, and slicked back almost flat to his head. His eyes were gray, and there was something baleful deep in them, peering out. His size and heavy brow made him look like a gorilla in Prada.[if Wakeup is happening][paragraph break]He introduced himself as 'Adrian Castillo, Deputy to the Warden of the Peace, appointed to serve at the pleasure of the Honorable Countess of Westchester.' I didn't know what most of that meant, but I knew his suit was a little too nice for a cop entirely on the level. I wondered if that all fit on his business card.".

Before saying hello to Adrian_Investigation:
	try examining Adrian_Investigation;
	continue the action.

[He was thirty-five and yet not.. He had the eyes of an old man bitter at the world and the look of a young boy pulling the wings off a butterfly. Here was someone who enjoyed pushing people with impunity, I'd bet money on it.]

INTERRO_START is a truth state that varies. INTERRO_START is initially false.

Instead of going south in the North_Hallway during Wakeup:
	if the player recollects about questioning val:
		say "I followed the enormous man downstairs and into the library. Val was already sitting in one of the chairs at the desk, apparently at ease, like she had nothing else she'd rather be doing.";
		now INTERRO_START is true;
	otherwise if the current interlocutor is Adrian_Investigation:
		say "I moved to leave, but he blocked my way. It seemed like had something to say to me.";
	otherwise:
		try saying hello to Adrian_Investigation.

about questioning me is a repeatable questioning quip.
	The printed name is "about questioning me".
	The comment is "[quotation mark]So am I a suspect here?[quotation mark]".
	The reply is "'Nah. I'm going through the formalities, just in case. I just wanted to talk to everyone who had a personal connection with the guy. That leaves you off the hook. Not to mention the the alibi you left, according to your girlfriend.[line break]'Oh?'[line break]'Yeah, that twisted junk heap at the bottom of a cliff. They'll have a heck of a time towing that up. Anyway, if you were wandering out there a couple of hours ago, then there's no way you could get here at the time of death. But hey, if the lady turns out to have done it, maybe I can pin you with accessory to murder if you smile at me real nice.'".
	It quip-supplies Adrian_Investigation.
	The proper scene is Wakeup.

about questioning Val is a repeatable questioning quip. It indirectly-follows about questioning me.
	The printed name is "about questioning Val".
	The comment is "'I'm going to need you to come with me downstairs. I've got to ask Ms. Sinclair a few questions, and she asked you be present.' That confused me a bit. I wasn't entirely certain what Val and I were to each other, but I sure as hell wasn't her lawyer.".
	The reply is "".
	It quip-supplies Adrian_Investigation.
	The proper scene is Wakeup.

[TODO: add him calling my name to the intro scene of going in the hallway]

how he knew my name is a repeatable questioning quip.
	The printed name is "how he knew my name".
	The comment is "'Did Val tell you about me?'".
	The reply is "'Nah, you I remember. I couldn't tell you much about these old timers, but your paperwork went through the office just the other day. We like to keep tabs on the newcomers. Your file said you used to work in homicide, huh.' It wasn't a question.".
	It quip-supplies Adrian_Investigation.

about my file adrian is a repeatable questioning quip. It indirectly-follows how he knew my name.
	The printed name is "about my file".
	The comment is "'I've only been one of you people for 48 hours, and I already have a file?'".
	The reply is "'You've had a file for three weeks now.' I didn't like that. I didn't like it so much I could hardly think of a cute comeback to make. He seemed to enjoy lording over me the fact that he knew something that I didn't. It was probably a feeling he didn't get to enjoy very often.".
	It quip-supplies Adrian_Investigation.

about anyone outside is a repeatable questioning quip. It indirectly-follows about questioning val.
	The printed name is "about anyone outside".
	The comment is "'See anyone on your way in? A couple of guests seemed pretty spooked about the idea that the killer would come back, something about Lake Geneva.' I kept my voice smooth and casual, like I wasn't at all nervous about the idea of being game in somebody else's pheasant hunt.".
	The reply is "'Nope, all quiet out there.' Something in my face must've shown my silent vote of no confidence, since he tried to follow it up. 'Listen, punk. I've been in this business twice as long as you've been alive. If I don't see nobody out there, there ain't nobody.' I didn't tell him that that meant exactly jack and shit in my book. One look at him told me he didn't have an eye for detail. There's people on every force who can't think their way out of a wet paper bag, and I'd have bet my weight in cake donuts that Deputy Castillo here was one of them.".
	It quip-supplies Adrian_Investigation.

Chapter 15 Interrogation

[TODO:Does this need to move to the wakeup scene ending?]
When Interrogation begins:
	now Adrian_Interrogation is in the Library;
	now Val_Interrogation is in the Library;
	now the player is in the Library.

When Interrogation ends:
	say "Val put her cigarette out and got up. Her expression was stony, the businesslike demeanor she'd started with was gone now. Castillo got up, too, but stopped himself from saying anything. He didn't strike me as the sharpest tool in the shed, but he'd clearly learned where the line was. Staying in the good graces of his employer meant staying within the level of harassment his job warranted, and not ruffling the feathers of anyone too important in the Circle.[paragraph break]'You'll let me know if there's anything else I can do to help, Deputy?' she said icily. She hadn't bothered looking at him as she said it. She gave me a look full of meaning and left the room in the direction of the foyer, closing the door behind her. Castillo suddenly seemed very small standing behind the desk. He must have felt it, too, because he got up and left without another word to me.";
	remove Val_Interrogation from play;
	remove Adrian_Interrogation from play;
	now Adrian_Investigation is in the Hallway_Downstairs;
	now Val_SecondInv is in the Foyer;
	[now the quip-suggestion-phrase is "[We] [could] ".]

Instead of going south in the Library during Interrogation:
	say "";
	
Instead of saying hello to Adrian_Interrogation:
	say "He was occupied with his conversation with Val.";
	
Section 1 - Adrian_Interrogation

Adrian_Interrogation is a man. The printed name is "Adrian". Understand "Adrian" as Adrian_Interrogation. The description is "He stood well over six feet with a build that belonged on the inside of a steel cage. The designer charcoal suit he wore hadn’t quite been successfully altered to his wide frame. A deep purple tie sat at his neck in a fat knot Donald Trump would have approved of. The dark hair atop his head was neatly parted at the side, and slicked back almost flat to his head. His eyes were gray, and there was something baleful deep in them, peering out. His size and heavy brow made him look like a gorilla in Prada."

Section 2 - Val_Interrogation

Val_Interrogation is a woman. The printed name is "Val". Understand "Val" as Val_Interrogation. The description is "She sat in one of the chairs in front of the desk, a cigarette held delicately between two fingers. Every so often, she tapped the ash into one of the coffee cups on the desk.".

Section 3 Val_Interrogation

Interro_Count is a number variable. Interro_Count is initially 0.

Every turn during Interrogation:
	if Interro_Count is 1:
		say "Castillo took an official sort of bearing, or the nearest he could manage to one. 'Please state your name for the record.'[line break]'Valentine Nicole Sinclair.'[line break]'Any aliases or other names you've used before?'[line break]'Nicky Deverell, but not recently.'";
	otherwise if Interro_Count is 2:
		say "The questions continued. Where she'd spent the last few days, what time she got to the chalet, that sort of thing. I looked around the library in the meantime, already knowing the answers to the parts I'd been present for.";
	otherwise if Interro_Count is 3:
		say "'Any family?' he asked.[line break]'None living.'[line break]'Married?'[line break]'Widowed.'";
	otherwise if Interro_Count is 4:
		say "'And what was your late husband's name?'[line break]'Maxwell. But seeing as he's been dead fifty years, how about we leave him out of this?'[line break]Castillo didn't pursue it any further after hearing her tone. He probably could have, but didn't want to push things into open antagonism without a reason. I wouldn't have, in his place.";
	Increment Interro_Count;	

Chapter 16 Second_Investigation

When Second_Investigation begins:
	Now the Valcar_Container is in the Driveway;
	Now the Players_Cluecar is in the Bottom of Cliff.

Players_Cluecar is a device. It is not portable. The printed name is "my car". Understand "my car" as Players_Cluecar. Understand "car" as Players_Cluecar.

After reading a command while the location is Bottom of Cliff:
	if Second_Investigation is happening:
		if the player's command matches "turn key", replace the player's command with "switch on car".

Instead of entering the Players_Cluecar:
	say "Given the state it was in, I could see everything I needed to from the outside.".

Instead of examining the Players_Cluecar:
	say "The car I'd driven for close to the last hundred thousand miles, fender bent and windshield missing. I hadn't expected to have to look at it again, but if Val thought there was something here, that's the hunch I was going to play.[paragraph break]If I was going to find anything, I'd have to look through it piece by piece to figure out what happened. I started to feel detached from the place, like I'd never been there before. Start fresh, don't miss anything. I told myself to treat it like any other crime scene.[if the Players_Cluecar is switched on][paragraph break]The radio chattered away to nobody, muffled slightly by the sound of air flowing out of the heater.[end if]".

Rule for writing a paragraph about the Players_Cluecar:
	say "My Toyota Corolla in a fetching 'Regatta Blue' that must have looked appealing under bright dealership lights when it was brand new back in 1990. I wouldn't know. It now sat on its side like a beached whale, exactly where I'd left it. The key was still in the ignition.[if the Players_Cluecar is switched on][paragraph break]The power was on, and the dashboard blinked orange and red lights at me.[end if]".


the brake line is scenery. the brake line is a clue. the brake line is part of the Players_Cluecar. The description is "I put a hand behind the wheel and the suspension arm and felt along the metal tube of the brake line, nearly slicing my finger on a thin slit. It wasn't a bit of rust or metal fatigue, the cut was too clean. It might have been made by a dremel or a wire cutter. Cutting brake lines straight through would stop the front brakes from working entirely. But a leak like this could take hours to affect performance. Whatever my state of mind or driving had been on that turn, this wasn't an accident.[paragraph break]The fact that I was able to see all of this without a flashlight barely registered.".

the dashboard is scenery. the dashboard is part of the Players_Cluecar. The description is "[if the Players_Cluecar is switched off]The car was off, the dashboard only showed dust and smudgy fingerprints. I hadn't been a big believer in car washing.[end if][if the Players_Cluecar is switched on]I scanned the panel, and saw a red indicator I'd never seen lit before. The brake light.[end if]".

the brakes are scenery. the brakes are part of the Players_Cluecar. The description is "The rotors were pretty worn, and a little rusty, but they were too expensive to replace as often as they say. Something occurred to me suddenly, and I thought I should check the brake line.".

Carry out examining the brakes:
	if the Players_Cluecar is switched on and we have examined the dashboard:
		try examining the brake line;
		stop the action;

the tires are scenery in the Bottom of Cliff.
the cluecar_windshield is scenery. The cluecar_windshield is part of the Player_Cluecar. The printed name is "windshield". Understand "windshield" as cluecar_windshield. The description is "The windshield lay on the ground where I'd kicked it out, already dusted with an inch of fresh snow.".

the tires are scenery in the Bottom of Cliff.
the wheels are scenery in the Bottom of Cliff.

instead of switching on the Players_Cluecar:
	say "I leaned into the cabin through the hole left by the windshield and turned the key. The headlights flicked on, and the dashboard lit up. I heard the radio bleat into the empty forest, muffled by the dull roar of air pouring out of the A/C vents. The engine turned over but didn't start. The inertia switch had cut off fuel to the engine when the car rolled down the hill. I didn't really mind, I hadn't planned on driving it out of here.";
	now the Players_Cluecar is switched on.
	
instead of switching off the Players_Cluecar:
	say "At this point, there was no harm in letting the battery drain. It was going to get hauled off anyway.";

Rule for writing a paragraph about the Players_Cluecar:
	if the brake line is examined:
		say "I took one last look at the wreck of my old car, it'd told me everything it could. It was stupid, but for the first time I felt a little bad leaving it abandoned here. The old bucket had been with me a long time. That's sentimentalism, I suppose.";
	otherwise:
		say "I walked over to the car and crouched down beside it to look for clues. There had to be something to tell me if Val's hunch was right or not."

Section 1 - Val_SecondInv
	
Val_SecondInv is a woman. The printed name is "Val". Understand "Val" as Val_SecondInv.

about the deputy is a repeatable questioning quip.
	The comment is "'That guy was quite a character,' I said, trying not to sound too judgemental in case Val liked him. It seemed unlikely.[line break]'Adrian? What did you make of him, was he up to your standards for a lawman?'[line break]'Ever hear the schoolyard joke about what pennies are made of?'[line break]She laughed. It wasn't a high, put-on laugh, but something rich and throaty, like a note from a cello.".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.

about my file val is a repeatable questioning quip.[ It indirectly-follows about my file adrian.]
	The printed name is "about my file".
	The comment is "I put on my tough detective voice to try and take some of the surprise out of it. I had an image to maintain. 'I heard about my file from Castillo. You've been stalking me for weeks now?'[line break]'I wouldn't put it like that.'[line break]'How would you put it then?'[line break]'I got the go ahead for a Patron application I put in a while back. That sort of opportunity doesn't come every day, so I scouted for a recruit. And then I made you an offer.'".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.

An availability rule for about my file val:
	If the player does not recollect about my file adrian:
		It is off-limits.
	
about our first meeting is a repeatable questioning quip. It indirectly-follows about my file val.
	The printed name is "about our first meeting".
	The comment is "'So the first time we met, that wasn't a coincidence, was it?'[line break]'Would you have chosen differently if you'd known?'[line break]'No.'[line break]'Then what the hell are you sore about?' She was starting to sound impatient again.".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.

what she wanted to see me about is a repeatable questioning quip.
	The printed name is "what she wanted to see me about".
	The comment is "She came over and leaned against the wall next to me. She bent over slightly, as though she were stretching, or just killing time on a lazy Sunday afternoon.[line break]'Did you tell anyone you were coming here? Your boss, or your partner, maybe?'[line break]I shook my head. 'Why, what's this all about?'[line break]'What if I told you that a week ago, Alan contacted me, saying he was in some trouble?'[line break][if BLACKMAIL_KNOWN is true]'You mean blackmail.' I didn't make a question out of it. She looked up at me, then around to make sure no one else was in earshot.[otherwise]'Go on,', I said.[end if][line break]".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.
		
what she was trying to say is a repeatable questioning quip. It indirectly-follows what she wanted to see me about.
	The comment is "'What are you trying to say, exactly?'[line break]'If someone was squeezing Alan for money, it's possible that the blackmailer didn't want a detective in the house.'[line break]'Are you saying that you think whoever killed Alan is coming after me next?'[line break]'I'm saying I think they already tried. You still think your car going off that cliff was an accident? If someone as clueless as Castillo has his hands on your file, how many other people knew about you, and that you were coming here? It'd be easy, especially if it's someone who could dig up serious dirt on Alan in the first place.'[line break]I didn't really want to believe it. Though I was clearly a small fish in this pond, I'd taken some comfort in what I thought was my anonymity as a newcomer. Being an unknown quantity can be an advantage in a lot of situations. I'd chalked up that crash to bad driving on a shitty road, but Val and I seemed to have at least one thing in common in that we didn't really believe in coincidence.".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.

whether she was ready to head back is a questioning quip.
	The printed name is "whether she was ready to head back".
	The comment is "'I'm all done here.'[line break]'Find anything interesting?' she asked.[line break]'Just that my fan club is even smaller than I imagined.'[line break]She looked down the steep incline at the wreck, eyes narrowed like she was trying to see something far on the horizon. 'I've been thinking about it since I picked you up, but I don't figure why they went after you in the first place. They had to know that the law would show up eventually once they killed Alan.'[line break]'They didn't plan on killing him in the first place. Like you said, blackmailers don't have any reason to kill their marks, since there's no money in it. [if the knife is examined]The murder weapon was clearly an object that was lying around in the house, not something the killer brought with them.[end if]' [if the box of bullets is examined]There were bullets in the desk, but no gun. The killer might have found it, but after he killed Alan, because they weren't used in the crime.[end if] Most of all, it doesn't make sense to kill a man just before sunrise, with house guests on the way. If he'd planned it, why do it at a time when there'd be no chance of escape, and a high possibility of being trapped in a house with people who know there's been a murder?".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.
	
An availability rule for whether she was ready to head back:
	If the location is not Sharp Bend:
		It is off-limits;
	If the brake line is unexamined:
		It is off-limits.
		
about who else would is a repeatable questioning quip. It indirectly-follows whether she was ready to head back.
	The printed name is "about who else would have access to my file".
	The comment is "'Can you tell me anything about who else might have seen my file?' I asked.[line break]'Almost anyone with connections to Castillo, the Countess, the ability to hack the ancient computers they use, or enough money to bribe one of the Archivists. So almost anyone, really.'".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.	
	
why she hid things from me is a repeatable questioning quip. It indirectly-follows whether she was ready to head back.
	The comment is "Something I'd been thinking about for a while boiled over in my mind. I decided to finally ask her about it. 'You said you were going to be straight with me.'[line break]'I have been.'[line break]'Maybe you forgot to mention the little fact that he was being blackmailed?'[line break]'I didn't think it was relevant.'".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.	

An availability rule for why she hid things from me:
	If BLACKMAIL_KNOWN is false:
		It is off-limits.

how the hell she didn't think it was relevant is a repeatable questioning quip. It indirectly-follows why she hid things from me.
	The comment is "'How the hell didn't you think that was relevant?'[line break]'Because blackmailers don't kill their marks.'[line break]She'd clearly thought it out, but I thought she was missing something. 'You asked me to be on this, you're going to have to get used to the idea of doing things my way. That means giving me the clearest picture possible. Unless you've changed your mind and want the Deputy back there to handle it.'[line break]'Fair enough.'".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.	

why she didn't tell me about the blackmail is a repeatable questioning quip. It indirectly-follows how the hell she didn't think it was relevant.
	The comment is "'Why didn't you tell me he was being blackmailed?'[line break]'We all have secrets. I wanted to save Alan some embarassment. Not to mention that knowing things like that is often a way to get yourself involved too deep in someone else's business.'[line break]'It's a bit late for that.'[line break]'Jesus, what do you want from me?' She gave a tired sigh.'".
	The reply is "".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.	

what he was being blackmailed over is a repeatable questioning quip. It indirectly-follows why she didn't tell me about the blackmail.
	The comment is "'Did he tell you what this was about?'[line break]'No. He could be an idiot sometimes, but thank God he had the sense to not put it in an e-mail.'[line break]'You must have some idea. How much shady business could a guy like that possibly have going on?'[line break]'I have an idea. Let's just say he didn't invite the students up here for polite little tea parties.'".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.

about the bourbon is a repeatable questioning quip.
	The comment is "'Your friend Alan seems to have kept this place well-stocked with liquor,' I said.[line break]'Like I mentioned, he entertained a lot of guests. You seem to have a taste for bourbon yourself.'[line break]'Sure,' I said. 'I know this great speakeasy on the East Side, off Houston Street. Best selection of bourbon you'll ever see.'[line break]'A [italic type]what?[roman type]'[line break]'A speakeasy,' I repeated. She rolled her eyes.".
	It quip-supplies Val_SecondInv.
	The proper scene is Second_Investigation.

an availability rule for about the bourbon:
	If the bottle of bourbon is unexamined:
		It is off-limits.

Chapter 17 ComingBack

When ComingBack begins:
	Now the front door is locked;
	Now Oak_Door is locked;
	Now Hemlock_Door is locked;
	[Now Sumac_Door is locked;]
	Now SHUTTERS_DOWN is true;
	Remove Scott_Investigation from play;
	Remove Adrian_Investigation from play;
	say "I hadn't realized it until I saw an edge of light blue on the horizon, but we'd cut things pretty close again. A quiet whirring of the closing shutters and a click of the lock was the only indication that the sun was about to rise. The foyer went artificially dark again, except for the light of the brass chandelier.";

[Arrival logic for guests to arrive after body is found]
Sun_Counter is a number variable. Sun_Counter is usually 0.
Every turn during ComingBack:
	Increase Sun_Counter by 1.
		
To decide whether the sun rises:
	If Sun_Counter > 2, yes;
	no.	

Chapter 18 DiscoverDet

When DiscoverDet begins:
	[TODO lock doors to guest rooms]
	say "Through the stillness of the house, I heard yelling upstairs. It started as a panicked cry of shock and surprise, but quickly turned to screams of agony. It went on, loud and incoherent, muffled by the wooden walls of the house, getting more raspy and strangled, like a pillow smothering a face. Then, just as suddenly, it stopped. I felt a lump in my stomach like a lead weight, and reached for where my shoulder holster used to be for a gun that wasn't there.";
	say "(press any key)";
	wait for any key.

When DiscoverDet ends:
	say "I was so focused on trying to read the labels on the fuse box that I didn't notice the footsteps behind me. Maybe I wouldn't have anyway. I heard a dull crack and realized it was the sound of a heavy bottle hitting the back of my head. It was the last thing I remembered thinking about before the rush of unconsciousness. I was out before I hit the floor.";
	say "(press any key)";
	wait for any key;
	now me_npc is in the Wine_Cellar;
	now the current interlocutor is me_npc;
	now the description of the Wine_Cellar is "I woke up with a headache like I'd kissed the Long Island Express goodnight. When I tried to put my hands up to feel the back of my head, they jerked against ropes tying them to the chair, along with my legs. He'd gotten the drop on me, that was for sure.[paragraph break]Well, I was in pretty deep now. I looked around the dark room. No one to talk to but myself for the moment.";
	[now the quip-suggestion-phrase is "[We] [could] have ";]
		
Before going north in the North_Hallway:
	if DiscoverDet is happening:
		say "The door to the master bedroom was ajar. I opened it a crack to peer inside. Castillo must have been looking for something in Alan's room. That's the only reason he would've gone in there. It struck me suddenly how bright the room was; the shutters were open, flooding the entire room with daylight.[paragraph break]I saw a figure on the floor, though figure was no longer an apt term for it. It was a mass draped in expensive suitcloth, lumpy and charred. There was nothing I could do for him now. I couldn't even get to him, for that matter. He might as well have been on the surface of the sun itself. What I needed to do now was reset the circuit, if something shorted. Any overrides would probably be in a basement fuse box.";
		now DET_DISCOVERED is true;
		say "[paragraph break](press any key)";
		wait for any key;
		stop the action;
	otherwise:
		continue the action.

Before going east in the Hallway_Upstairs:
	if DiscoverDet is happening:
		say "The shutter at the end of the east hallway hadn't closed with the sunrise. Light from outside was slowly stretching across the floor. No way was I going over there.";
		stop the action;
	otherwise:
		continue the action.
[shutters are open in parts of the upstairs and the guest room and the hallway]

Chapter 19 CellarThink

When CellarThink begins:
	now the player is in the Wine_Cellar;
	
When CellarThink ends:
	now the description of the Wine_Cellar is "";
	Remove me_npc from play;
	say "I lifted my head when I heard a noise straight ahead. The door opened, and a figure stood silhouetted there for a moment. He quietly closed the door behind him, and I saw Scott's face turn around to face me. He was holding a gun that wasn't pointed at anything specific, but I didn't think it would stay that way for long.";
	say "[line break](press any key)";
	wait for any key;
	clear the screen;
	[Now the quip-suggestion-phrase is "[We] [could] ";]
	Now the description of the Wine_Cellar is "Scott had me dead to rights. The overhead lights in the cellar made his brow and nose cast long shadows down his face. Even so, I could tell his eyes burned with hate and bitterness. It wasn't all for me. He'd formed himself from a shy nerd into a the confidence man who gave TED talks and blithely took the venture capital thrown at him. But every day of it had been a tremendous effort. I saw it now that years of simmering hatred had stripped it away, down to the bone.[paragraph break]None of that mattered now. I was in his way, and whatever plan he'd come here with had unravelled spectacularly. If I didn't talk fast, I wasn't making it out of this basement. I wasn't sure if anyone was still home, or still alive. Maybe someone would hear if I yelled. I didn't want to try it unless I knew for sure that help would come; that's really only a trick that works once.";
	now Scott_Villain is in the Wine_Cellar;
	now the player is in the Wine_Cellar.
	
me_npc is a person. The printed name is "myself". Understand "self" as me_npc. Understand "myself" as me_npc.

Rule for writing a paragraph about me_npc:
	say "".

Instead of saying hello to the player:
	If CellarThink is happening:
		try saying hello to me_npc;
	Otherwise:
		say "Talking to [yourself] [regarding it][are] unrewarding at the moment.";

Instead of leavetaking during CellarThink:
	say "I didn't really have anyone else to talk to.";

Instead of saying goodbye to me_npc during Cellarthink:
	say "I didn't really have anyone else to talk to.";

why there were two wineglasses is a questioning quip.
	the comment is "There were two wineglasses[if the bottle of wine is examined]and an expensive bottle of wine[end if] that once sat on that table in the reading nook. Alan had known whoever it was well enough, or wanted to impress them enough to warrant opening a bottle of Bordeaux.".
	It quip-supplies me_npc.
	The proper scene is CellarThink.

why Alan was stabbed using a letter opener is a repeatable questioning quip.
	the comment is "Why had that particular murder weapon been used? He hadn't been stabbed with a knife, he'd been stabbed by his own letter opener, the initials proved that. Whoever had stabbed him hadn't planned to. It seemed pretty farfetched that someone would drive all the way here with the express purpose of killing a man, and trust finding a letter opener to do it with.".
	It quip-supplies me_npc.
	The proper scene is CellarThink.

why there was a stain on the sofa is a questioning quip.
	the comment is "Alan and his visitor were apparently having civilized conversation and drinking their wine for some time, judging by the state of the bottle. Then suddenly, a struggle had broken out. One wineglass got knocked over onto the floor, another went over the railing into the living room and under the sofa. And of course, Alan's assailant won the struggle. ".
	It quip-supplies me_npc.
	The proper scene is CellarThink.

An availability rule for why there was a stain on the sofa:
	if the stain is unexamined:
		it is off-limits.

why someone cut my brakes is a questioning quip.
	the comment is "That part got under my skin more than the rest of it. It almost seemed entirely unrelated and oddly personal. Someone hadn't wanted me here. But to all of these people, I was nobody until yesterday. Even then, I might've just been some guest Val brought along.[if BLACKMAIL_KNOWN is true] I could think of another reason it might be advantageous to not have a cop at the house: they were the one blackmailing Alan.[end if]".
	It quip-supplies me_npc.
	The proper scene is CellarThink.

[TODO: Can add bottle-sensitive clue wording to this]
why the lock had scratches on it is a questioning quip.
	the comment is "The scratches on the lock and damage to the front door frame were a nice touch. Anyone responding to the house would think the killer had broken in, that it was someone Alan hadn't known.[if the shattered glass is examined] Alan hadn't been alone, and it was someone he'd known for a long time.[end if][if the knife is examined] On top of all that, it didn't add up that someone would go through all that trouble to break in and kill Alan, and end up doing it with a letter opener that happened to be lying around.[end if]".
	It quip-supplies me_npc.
	The proper scene is CellarThink.

An availability rule for why the lock had scratches on it:
	if the lock is unexamined:
		it is off-limits.
[TODO: Rest of the clues]

Chapter 20 VillainMonologue

When VillainMonologue begins:
	remove the knife from play;
	now the current interlocutor is Scott_Villain.
	
When VillainMonologue ends:
	remove Scott_Villain from play;
	say "Val was almost within reaching distance of Scott now, and he somehow sensed it, turning his head around. His eyes went wild, and for a moment I felt like I could actually see his nerves fray and snap. His upper lip curled back over bared teeth so far it looked inhuman. He swung the revolver to point it straight at Val's serene face, and pulled the trigger. Her head was nowhere near the gun when it went off. She'd ducked to the side faster than I'd seen anyone move before, like Mayweather slipping a punch.[paragraph break]When Scott tried to aim the gun at her this time, screaming an unearthly scream, her hands were already up in a blur. She let him get another shot off, which I thought was pretty charitable of her, except there didn't seem to be anything behind her eyes but cold fury. It seemed for a second like she'd disarmed him as the gun dropped to the floor. It took a long time to fall. Then I noticed in the dim light of the wine cellar a glint of silver attached to his neck, a small knife labeled with the initials 'AHB.' His now empty hands went to his throat, and he crumpled over. We listened to quiet gasping for a minute as Val came over to untie me from the chair. By the time she'd finished, it had stopped.";
	say "(press any key)";
	now Scott_Body is in the Wine_Cellar;
	wait for any key;

[TODO: Change the number of quips it takes for Val to enter]
Every turn during VillainMonologue:
	If the number of available quips which are not recollected by Scott_Villain is 1:
		now the knife is in the Wine_Cellar;
		say "Val opened the door noiselessly behind him. He was too absorbed in his rant to really notice. I had to make sure it stayed that way. She tiptoed behind him quietly on stockinged feet, her gaze never leaving him. She was holding something in her right hand, something slender and reflective. My heart was pounding away in my neck as I tried not to betray any sign that anything was out of the ordinary. Her walk was as painfully deliberate as a leopard making an ambush. Every step took an eternity.";
	if Debug_on is true:
		say "Total number of quips left: [the number of available quips which are not recollected by Scott_Villain]".

Instead of leavetaking during VillainMonologue:
	say "I had to keep talking. In my situation, keeping him distracted was the only thing keeping me alive.";
	
Instead of saying goodbye to the current interlocutor during VillainMonologue:
	say "I had to keep talking. In my situation, keeping him distracted was the only thing keeping me alive.";
	
Instead of going up during VillainMonologue:
	say "I was tied tight to the chair, I wasn't going anywhere.".

Section 1 - Scott_Villain

Scott_Villain is a man. The printed name is "Scott". Understand "Scott" as Scott_Villain. The description is "He held what I assumed was Alan's revolver in his hand, pointed straight at me. The self-assured genius entrepreneur was gone. There was no trace of ironic amusement or even disdain in his face now. The strain seemed to pull his skin grotesquely taut over his gaunt face like stretched rubber. He looked cornered, a desperate man preparing to do desperate things.".

how he planned on getting away is a questioning quip. The printed name is "how he planned on getting away".
	The comment is "'You seriously plan to just kill us and get out of here?'".
	The reply is "'It'll be easy. A house full of corpses turned to ash, I can just make sure it looks like mine is among them. I disappear, and start over with a new life. It's easy enough to pull off, we all have to do it every century or so. No one will come looking for me, we'll just be tragic victims of some rogue hunter. I take care of you and the lady, open all the shutters, and that's that. Come sundown, that makes a clean getaway.'".
	It quip-supplies Scott_Villain.
	The proper scene is VillainMonologue.
	
where he got the gun is a questioning quip.
	The comment is "I licked my lips, trying not to look as panicky as I felt. 'Where'd you get the gun? Alan's desk?'[line break]'Uh-huh. The last payment was supposed to be a dead drop of the cash, but I knew he got cold feet. That, or he was trying to set me up by calling you and Val.'".
	It quip-supplies Scott_Villain.
	The proper scene is VillainMonologue.
	
why he needed the money is a questioning quip.
	The comment is "'I guess business isn't as great as all that if you were trying to shake Alan down.[if the cash is examined] Risky to switch to cash and make an exchange, especially if he didn't know it was you blackmailing him.[end if]'[line break]He said nothing. I didn't expect him to really own up to his mistakes, he wasn't the type for a lot of self-reflection. It wasn't hard to imagine,  though, with the way most of these startups are run. You'd think people would have learned from the dot-com bust.'".
	It quip-supplies Scott_Villain.
	The proper scene is VillainMonologue.
an availability rule for why he needed the money:
	if BLACKMAIL_KNOWN is true and the current interlocutor is Scott_Villain:
		it is available;
	otherwise:
		it is off-limits.
	
why he killed Alan is a questioning quip. It indirectly-follows where he got the gun.
	The comment is "'If my guess is right, you never meant to kill Alan. Your scheme just got out of hand, and you panicked.'[line break]He nodded slowly. 'It was supposed to be just a couple of bank transfers, just to get the company solvent again. He would've never known it was me. But the back pay, the fines, and then the lawsuit... I needed money fast, I was thinking about just leaving the country and starting over, so I asked for cash, wrote him, saying he should drop the bag off in the park.'[line break]'And when you started to think he wasn't about to go through with it, you got nervous, and came here.'[line break]'I came here, to try and talk to him, give him some friendly advice. Of course, he didn't know it was me writing those letters, so he tried not to let on that anything was wrong. But when I tried to find out if he had the cash in the house, he put it together.'[line break]I didn't need him to go on, I knew what'd happened then. Alan had come at him, and in the fight, Scott had grabbed the closest object, and ended up stabbing him. He sat the body back in the chair, did his best to search the house for the cash, then left, pretending to arrive later with the rest of the guests.".
	It quip-supplies Scott_Villain.
	The proper scene is VillainMonologue.
	
how he found out about Alan's secret is a questioning quip. It indirectly-follows why he needed the money.
	The comment is "'How'd you find out about Alan's dirty little secret?'[line break]'People who have been around as long as him aren't exactly technologically savvy. His email password was sent unencrypted. Not to mention the fact that it was a five letter English word and easy to guess. I barely had to do any work at all to dig up something.'".
	It quip-supplies Scott_Villain.
	The proper scene is VillainMonologue.
	
Chapter 21 GetOutOfDodge

Scott_Body is a thing. It is not portable. The printed name is "Scott's body.". The description is "I looked down at him, sprawled out on the floor like he was making a snow angel. He'd been young and desperate, and his insane plan had been a result of that youth, and Alan's panicked murder had been a product of his desperation. He thought he'd get his chance at greatness through angel investors, and after that, maybe the Circle. Maybe he'd made a deal with the devil, but I had a hard time blaming him. We'd all made the same one. What did any of us do when life had us over a barrel, and someone like Val came along, and offered to take a long drink? We sold a part of our soul just for a chance to spin the wheel one more time. Scott's number had just come up sooner than mine, and a little after Alan's.".

Rule for writing a paragraph about Scott_Body:
	say "Scott's body was lying on the floor face-up, in a pool of blood.".
	
When GetOutOfDodge begins:
	now the description of Wine_Cellar is "The wine cellar had at first seemed like a display of hedonistic excess at first. A monument to one man's appetites and the material wealth to indulge every inch of them. Now, it was just another dank warehouse with a body in it.".

When GetOutOfDodge ends:
	now the front door is unlocked;

After waiting during GetOutOfDodge:
	now SHUTTERS_DOWN is false;
	say "The shutters clicked open, the most musical sound I'd ever heard in my life.";
	
Chapter 22 Conclusion

Instead of entering the Valcar_Container during Conclusion:
	say "I walked to the Mercedes and she and I looked at each other over the roof. I didn't realize I was on the driver's side until she tossed me the keys.[if BLACKMAIL_KNOWN is true][line break]Your friend Alan seemed like quite a romantic. Thing like that gets a guy in trouble.'[line break]'We all have things we'd rather not let go of. Even you.'[line break]'Like that?' I pointed to the gold ring on her necklace, which had come into view, resting on the front flap of her coat. She gave me a hard look, and for a second I'd thought I'd crossed the line. Then, a smile broke out on her face.[line break]'C[']mon, drive. I'll tell you the whole story on the way.[end if]
[line break]'So where we headed?'[line break]'What was the last time you were in Vegas?' We got in, and I started the car.[paragraph break]We started off down the road and we began to really talk for the first time since I'd met her. We started off down the open road, in the shadow of the mountain, high above the valley and its waves and ribbons of untouched snow like an unmade bed. [paragraph break]I was already getting thirsty, and no quantity of expensive bourbon was going to help.";
	end the story finally;

[I have a little experience doing that.
This one's been cold for 40 years.
I like a challenge.
What was the last time you were in Vegas?]

Chapter 23 - Game Mechanics

Section 1 - Global Variables

BLACKMAIL_KNOWN is a truth state that varies. BLACKMAIL_KNOWN is initially false.

This is the make blackmail known rule:
	if BLACKMAIL_KNOWN is false:
		now BLACKMAIL_KNOWN is true;
		say "Forgive my sudden request, but I really don't know where else to turn. A few months ago, I received a series of threatening letters from an anonymous individual demanding payment. I can't go into the details here, but suffice it to say that I gave in to the threats, and attempted to find a sum that this person would settle for. I have resolved not to pay them further, since it does not appear that they will reasonably ever leave me alone. Please, I need you to find who this is, and scare them off, or something, and I need it done quietly. Obviously, I would rather the authorities not get involved in this.[line break]Sincerely, Alan";
		wait for any key;
		continue the action;

Section 2 - Command Overrides

Understand the command "read" as something new. Reading is an action applying to one thing. Understand "read [something]" as reading.

After reading a command:
	If the player's command matches "what":
		Replace the player's command with "";
	Otherwise if the player's command matches "ask":
		Replace the player's command with "topics";
	Otherwise if the player's command matches "load":
		Replace the player's command with "restore".

Ascending is an action applying to nothing. Understand "ascend", "go
upstairs", and "upstairs" as ascending.

Instead of ascending: try going up.

Descending is an action applying to nothing. Understand "descend",
"downstairs", and "go downstairs" as descending.

Instead of descending: try going down.

Understand the command kick as something new. Kicking is an action applying to one thing. Understand "kick [something]" as kicking. 
Instead of kicking a person:
	say "In my experience, detective work required far less kicking than 70s cop shows had led me to believe."

Understand the command punch as something new. Punching is an action applying to one thing. Understand "punch [something]" as punching.
Instead of punching a person:
	say "Might be hard to believe from the way I look, but I always thought of my investigative methods as more Hercule Poirot than Dick Tracy.".
Instead of punching something:
	say "I had an Everlast heavy bag for that sort of thing.".

Understand the command hit as something new. Hitting is an action applying to one thing. Understand "hit [something]" as attacking.

	
Section 3 - Conversation Tweaks

[The standard listing subject changes rule is not listed in any rulebook.
The standard report other subjects rule is not listed in any rulebook.]

the default greeting rule is not listed in any rulebook.

the prefix-ask rule is not listed in any rulebook.

[the flatten ifs rule is not listed in any rulebook.]

Listing repeatable quips is an activity.

Rule for listing repeatable quips (this is the standard listing repeatable subject changes rule):
    prepare a list of repeatable quips which are available;
    say "[quip-suggestion-phrase][the prepared list delimited in disjunctive style]." (A).

Check changing the subject (this is the subject change revised rule):
	unless the current interlocutor is a person:
		say "[We] wasn't talking to anyone.";
		stop the action;
	if the number of repeatable quips is 0:
		say "[We] [can think] of no valid changes of subject right [now]." (A) instead.

The subject change revised rule substitutes for the subject change default rule.

Carry out changing the subject (this is the revised report other subjects rule):
	Carry out the listing repeatable quips activity;
	stop the action.
	
The revised report other subjects rule substitutes for the standard report other subjects rule.

When play begins:
		now the quip-suggestion-phrase is "[We] [could] asked ".
[TODO: This needs fixing]

To decide whether scene_conversation is exhausted:
	decide on whether or not the number of available quips which are not recollected by someone is 0.

To decide whether interro_conversation is exhausted:
	decide on whether or not the number of available quips which are not recollected by Val_Interrogation is 0.

[Understand "remember [any subject]" or "remember [something]" as remembering. Remembering is an action applying to one visible thing.]
[Check remembering:
if the number of quips which are recollected by someone is 0, say "You have not yet had any conversations to remember." instead.
    
    Carry out remembering:
        let N be 0;
        repeat with item running through quips which mention the noun:
            if someone recollects the item:
                say "You have discussed '[the item]' with [the list of other people who recollect the item].";
                increment N;
        if N is 0, say "You haven't discussed [the noun] with anyone yet."]

Section 4 - Credits

Understand the command "credits" as something new. Understand "credits" as asking for credits. Asking for credits is an action out of world.

Understand the command "about" as something new. Understand "about" as asking for credits.

Carry out asking for credits:
	say "[italic type]A word from the author:[line break]This work would not have been possible without help from a great many people. Special thanks to my testers: FK, TF, KG, DO, caleb, inurashii, Sequitur, matt w, and busterwrites, and all the patient folks in #i7 on the IFMUD.[line break]This story has many edge cases. If you believe you have found a bug, please send an email to: alongdrink@beyondcoast.org[paragraph break]Cover art by Dan Smith
Licensed under Creative Commons By 2.0
Image at: https://flic.kr/p/pPkjHD
License Terms at: https://creativecommons.org/licenses/by/2.0/
[paragraph break]Thanks for playing.[roman type]"

Section 5 - Clues and Hints

Hint reminder is some text that varies. Hint reminder is initially "(first time players: type HELP)"

Understand the command "hint" as something new. Understand "hint" as asking for a hint. Asking for a hint is an action out of world. Instead of thinking, try asking for a hint.
Carry out asking for a hint:
	Try asking for objective;
	Try asking for clues;
	say "[paragraph break]";
	say "[command reminder]";

Understand the command "help" as something new. Understand "help" as asking for a hint.


A thing can be examined or unexamined. A thing is usually unexamined.

Before examining a noun:
	If the noun is unexamined:
		Now the noun is examined;
		If the noun is a clue:
			Increment FoundClues;

FoundClues is a number variable.
When play begins:
	Let FoundClues be 0;
	
command reminder is some text that varies. command reminder is initially "[bold type]Command Help[roman type][paragraph break]exits: List exits[line break]talk to (name): start conversation[line break]stop talking: end conversation[line break]topics: list dialogue choices[line break]save: save progress[line break]restore: load savegame[paragraph break]";

Understand the command "objective" as something new. Understand "objective" as asking for objective. Asking for objective is an action out of world.

[OBJECTIVE LOGIC Scene and status specific objectives, should be one for every scene]
Carry out asking for objective:
	say "[bold type]Objective[roman type][paragraph break]";
	if Mountain_Driving is happening:
		say "Val had said we were going to spend the weekend at her friend's cabin in the mountains.[line break]Maybe it was childish or stubborn, trying to cling to my independence like this. I'd decided to drive myself, even through this weather.";
	otherwise if Car_Escape is happening:
		say "The doors were stuck, and there was no way out but through.";
	otherwise if Cliff_Climbing is happening:
		say "I had to get back to the road to get help or else hitch a ride. In a few hours, the sunrise would make this a less than ideal place to camp out.";
	otherwise if Car_Embarking is happening:
		say "In the short time I'd known her, Val seemed like the kind of woman who was thinking ten moves ahead, though how she knew I'd need a ride was a little unsettling.";
	otherwise if Riding_Scene is happening:
		say "The thing about long car trips is that the awkward silences can spiral and echo. I tried to fill it as best I could with small talk.";
	otherwise if Body_Discovery is happening:
		if the Foyer is not visited:
			say "Now to find Val's friend. He had to be somewhere in this huge place.";
		otherwise:
			say "I'd been around long enough to know something was wrong with this scene: front door open, no one answering. We had to find Val's friend, wherever he was.";
	otherwise if Prearrival is happening:
		say "Alan Bowden was sitting in an armchair in his own home, apparently deader than McKinley. Why was a distant question in my mind at the moment, I was more interested in anything that could tell me who had done it, and where they were.";
	otherwise if Guest_Arrival is happening:
		if the location is not Foyer:
			say "It sounded like we weren't the only guests who had arrived a little late.";
		otherwise:
			say "I didn't know who these guys were, but I didn't like the look of them. Either they were in the same boat as Val and I, or one of them might have been related to the murder.";
	otherwise if First_Investigation is happening:
		say "Now was my chance to look through the place and see if anything could tell me what happened to Alan, and why.";
	otherwise if First_Sleep is happening:
		say "It had been a long day. I was ready to turn in for the moment. There'd be plenty of time to look around tomorrow.";
	otherwise if Wakeup is happening:
		say "I wasn't a morning person, even if the time had shifted to 7 in the evening. Whatever passed for the heat in Val's world must have shown up by now.";
	otherwise if Interrogation is happening:
		say "It seemed like we weren't going anywhere until Adrian asked his questions. None of them were going to lead anywhere, of course, but he had to pretend like he was doing a job.";
	otherwise if Second_Investigation is happening:
		if the player does not recollect what she wanted to see me about:
			say "Val looked like she had something to tell me that couldn't wait. I thought I saw her walk off towards the front door.";
		otherwise if the brake line is unexamined:
			say "We thought that maybe whoever killed Alan had wanted to prevent me from getting here in the first place. At least, I thought it was worth going back to that cliff to find out.";
		otherwise:
			say "I had another chance to look around the house for clues. I figured I should use it.";
	otherwise if ComingBack is happening:
		say "I had another chance to look around the house for clues. I figured I should use it.";
	otherwise if DiscoverDet is happening:
		if DET_DISCOVERED is false:
			say "The screams I heard from the second floor had the air of finality about them. Someone was dead or dying, and I was running out of time to find out who.";
		otherwise:
			say "Castillo was dead. Someone had rigged the shutters in his room to stay open at sunrise, though thankfully something had stopped them before they were able to uncover the whole house.[paragraph break]If there was a manual override or circuit breaker, it'd be in the basement.";
	otherwise if CellarThink is happening:
		say "It seems like I had some time on my hands. What else could I do but try to make some sense of what I'd found?";
	otherwise if VillainMonologue is happening:
		say "He'd lost it. I had to keep him talking and distracted. If I did that, and kept a cool head, I'd get out of this scrape, no problem.";
	otherwise if GetOutOfDodge is happening:
		say "I could take one last look around, or I could just wait for the sun to set, so Val and I could blow this joint.";
	otherwise if Conclusion is happening:
		say "It was time to go. I never wanted to see the inside of that house again.";
		
Understand the command "clues" as something new. Understand "clues" as asking for clues. Asking for clues is an action out of world.

Carry out asking for clues:
	say "[bold type]Clues[roman type][paragraph break]";
	repeat through the Table of NotAloneClues:
		if the clue entry is examined:
			say "[clue entry][line break]";		
	say "[line break]"; 
	repeat through the Table of StruggleClues:
		if the clue entry is examined:
			say "[clue entry][line break]";
	say "[line break]";
	repeat through the Table of CrimeofPassionClues:
		if the clue entry is examined:
			say "[clue entry][line break]";
	say "[line break]";
	repeat through the Table of BlackmailClues:
		if the clue entry is examined:
			say "[clue entry][line break]";

Table of NotAloneClues
clue
the shattered glass
bottle of wine

Table of StruggleClues
clue
the stain
pool of wine
wineglass

Table of CrimeofPassionClues
clue
knife
lock

Table of BlackmailClues
clue
book
bank statement
the cash
the brake line


Section 6 - Debugging

Every turn:
	if Debug_on is true:
		say "Turn Count: [Turn Count][line break]";
		say "FoundClues: [FoundClues][line break]"; 
		say "BLACKMAIL_KNOWN: [BLACKMAIL_KNOWN][line break]";
[		say "Sleepy: [First_Sleepy]";]

Section 7 - Inventory and Mechanics

A room can be indoors or outdoors. A room is usually indoors.

Doors are usually closed.

A thing can be either broken or unbroken. A thing is usually unbroken.

The player is carrying a cell phone. The cell phone is a device. The description of the cell phone is "A smartphone a few hardware revisions back. [if the cell phone is broken]The screen had shattered due to an impact, rendering it unusable.[end if]".
Instead of switching on the cell phone:
	if the cell phone is broken:
		say "The screen was cracked to hell. No way could I make a call on it now.";
	otherwise:
		say "I wasn't really in a talking mood.";

[TODO: Maybe change this stuff?]
After reading a command:
	If the player's command matches "use cell phone":
		try switching on the cell phone;
	Otherwise if the player's command matches "dial cell phone":
		try switching on the cell phone;
	Otherwise if the player's command matches "dial 911":
		try switching on the cell phone;
	Otherwise if the player's command matches "call for help":
		try switching on the cell phone;

Blood_status is a truth state that varies. Blood_status is usually false.

Section 8 - Tests

Test carescape with "drive/drive/brake/look/unbuckle seat belt"

Test firstconvo with "test carescape / kick windshield / anykey / w / get in / talk to val"

Test sunrise_lose with "drive/drive/brake/look/unbuckle seat belt/kick windshield/n/n/n"

Test discover with "test firstconvo/talk to val/ask about sunrise/ask about house/ask about car/wait"

Test body with "test discover/e/e/e/u"

Test arrival with "test body/x body/x body/d/e/w/e/w/e/w/e/w/e/w/w/w/talk to val"

Test myclues with "test arrival/e/anykey/x stain/x shard/x broken wineglass/u/x bottle/x knife/x wineglass/d/e/n"

Test valinvest with "test arrival/ask about Alan/ask about murder/ask about nathaniel/ask what was in it for me";

Test janinv with "test valinvest/e/e/u/e/n/talk to jan/ask about work/ask about business/ask about climbing";

Test master with "test arrival/e/e/u/n/";
	
Test computer with "test myclues"
	
Test bedtime with "test myclues/s/u/w/n/w/w/x val/drink bourbon/drink bourbon/drink bourbon"

Test vdet with "test bedtime / e / s / d"

Test cartrip with "test vdet / talk to val / ask about herself / ask about her family / ask about her husband /s /w /w/w/w/enter Mercedes"

Test gettinbopped with "test cartrip / e / turn on car / x dashboard / x brakes / w / enter car / e / e /e /e/down/anykey /"

Test me with "test janinv/s/w/d/open painting/take all/x pouch/drink pouch";

Section 9 - Computer

The computer is a device in the Library. The computer is switched off. The computer is fixed in place.

Instead of switching on the computer:
	say "I booted up Alan's computer to see what I could find. There were barely any house phones, and I hadn't found a cell phone. That meant his e-mail and web browser were probably his main points of contact.[line break](Type 'email' to access e-mail, 'history' for search engine autocomplete history)";

Instead of taking the computer:
	say "I wasn't about to seize the whole thing and hand it over to the boys in data forensics, considering I wasn't a cop anymore.";

Understand the command "history" as something new. Understand "history" as historying. Historying is an action applying to a topic. Understand "history [text]" as historying.

Before historying a topic:
	if Debug_on is true:
		continue the action;
	if the Library is not visited:
		say "I don't know anything about that.";
		stop the action;
	if the location is not Library:
		say "I'd need to go to the library for that.";
		stop the action;
	if Interrogation is happening:
		say "This didn't really seem like the time to be digging around on the computer.";
		stop the action;

Carry out historying a topic:
	if the topic understood is "":
		say "Please supply a search term, e.g. 'history new york'";
		stop the action;
	say "Searching webhistory for [The topic understood]...[line break]";
	repeat through the Table of BrowserHistory:
		If the link entry matches the regular expression "^[The topic understood]":
			say "[link entry][line break]";

Table of BrowserHistory
link
"new york traffic"
"new york city map"
"new york weather"
"blackmail"
"how to hire a private detective"
"new york private detectives"
"blackmail felony"
"transfer money"
"cayman bank"
"asian literature"
"chinese literature journal"
"japanese medieval literature"
"medieval japanese literature"
"premodern japanese literature"
"swiss bank"
"bank transfer"
"kokoro first edition"
"kokoro natsume soseki"
"tales of the water margin"
"journey to the west"
"all men are brothers"
"new york traffic"
"buying a gun"
"where to buy a gun"
"where to buy a gun in new york"
"new york gun shops"
"new york blackmail law"
"japanese language and literature"
"new york extortion law"
"extortion felony"
"bibliography mla format citation"
"bibliography citing a source"
"hiring a private detective"
"private detective agencies"
"academic literature journals"
"jstor"
"chinese language and literature"
"american historical review"
"detective agencies in new york"
"barnett college"
"barnett faculty portal"
"atm maximum withdrawal limit"
"withdrawal limit bank"
"bank account withdrawal limit"
"detective agency"
"literature review"
"tale of genji"
"journal of east asian literature"
"asian language and literature"
"literature of chinese diaspora"

Understand "email" as using the computer.
Understand "e-mail" as using the computer.

Check using the computer:
	if Debug_on is true:
		continue the action;
	if the location is not Library:
		say "I'd need to go to the library for that.";
		stop the action;
	if Interrogation is happening:
		say "This didn't really seem like the time to be digging around on the computer.";
		stop the action;

Using the computer is an action out of world.

Carry out using the computer:
	Now the current menu is the Table of Emails;
	carry out the displaying activity;
	clear the screen;
	try looking.

tab is some text that varies. tab is usually "     ".

Table of Emails
title	subtable	description	toggle
"Inbox"	Table of InboxEmails	--	--
"Sent"	Table of SentEmails	--	--
	
Table of InboxEmails
title	subtable	description	toggle
"Date[tab]From[tab][tab]Subject"	--	"Make a selection"	--
"Dec 20[tab]payroll@barnett.edu[tab][tab]W-2 Copy Request"	--	"A copy of your W-2 has already been mailed to you. If you need an additional copy of your W-2 form for recordkeeping, please request it directly from Jennifer at the payroll office."	--
"Dec 18[tab]payroll@barnett.edu[tab][tab]"	--	"Stuff"	--
"Dec 12[tab]hchanthavong@barnett.edu[tab][tab]Recommendation"	--	"Hi Professor Bowden,[line break]I was wondering if you'd be willing to write me a recommendation for a graduate program I'll be applying to in a few months. I hope you've been happy with my work TAing the 200 level classes, and I'd be happy to give more specifics about my interests if that would help. The deadline for the submission is in a few months. I look forward to hearing back from you.[line break]Thanks,[line break] Hilary Chanthavong"	--
"Nov 24[tab]JBates@Barnett.edu[tab][tab]Out of Office until 12/01 Autoreply"	--	"I am out of the office today, 11/24 and will respond to your message on Monday, 12/01."	--
"Sep 02[tab]PStillman@barnett.edu[tab]Final Exam"	--	"Hi Professor I was just wondering when the final exam was because I have a lot of classes and think one of them might conflict with another class I'm taking thanks"	--
"Sep 02[tab]TDeavers@barnett.edu[tab][tab]Final"	--	"Professor Bowden,[line break]When is the final exam?"	--
"Sep 02[tab]MChung@barnett.edu[tab][tab]Registration[tab]"	--	"Professor,[line break]When I got to the registration system it said the class was full, even though there appear to be slots open in the listing. I wasn't able to contact anyone at the registrar's office, can you help me? I need to take this class for my major.[line break]Thanks,[line break]Melissa Chung"	--


Table of SentEmails
title	subtable	description	toggle
"Date[tab]From[tab][tab]Subject"	--	"Make a selection"	--
"Dec 12[tab]To: valsinclair7@beyondcoast.org[tab]Urgent request"	--	"Forgive my sudden request, but I really don't know where else to turn. A few months ago, I received a series of threatening letters from an anonymous individual demanding payment. I can't go into the details here, but suffice it to say that I gave in to the threats, and attempted to find a sum that this person would settle for. Please, I need you to find who this is, and scare them off, or something, and I need it done quietly.[line break]Sincerely, Alan"	make blackmail known rule
"Nov 29[tab]To: Cassie Detra[tab]Quick question"	--	"Hi Cassie,[line break]I haven't seen Kelly in class recently, have the two of you had any contact? Just thought I'd ask.[line break][line break]Hope all's well,[EmailSignature]"	--
"Nov 20[tab]To: AsianStudies201@barnett.edu[tab][tab]Thanksgiving Holiday"	--	"All,[line break]I'd like to wish everyone a Happy Thanksgiving, please take some time off to relax and spend it with family. For those of you who are traveling home, have a safe journey. For those of you who are not able to, I'm hosting Thanksgiving dinner at my home, and all are welcome to attend. There's a great view of the lake, and I promise excellent food, drink, and company.[line break]Happy Holidays,[EmailSignature]"	--
"Nov 12[tab]To: FranklinColl@barnett.edu[tab][tab]Happy Hour "	--	"Hi Frank,[line break]We have a guest speaker coming in to give a talk about historical architecture in Kyoto. I thought I'd give you guys a heads up in case your department or any of your students had an interest in that. I think her talk might be a little light on the history and heavy on the architecture, so just be aware of that. It's this Wednesday at 6pm in the Weber Hall auditorium, light refreshments to follow."	--
"Nov 11[tab]To: AlexandraCohen@barnett.edu[tab]Copier malfunction"	--	"Alex,[line break]It seems like the photocopy machine in the Asian Studies department office is low on toner, who do I talk to about getting that replaced?[line break]Thanks,[line break][EmailSignature]"	--
"Nov 10[tab]To: kakhtar@barnett.edu[tab][tab]Office hours"	--	"Karam,[line break]You mentioned in class today you wanted to discuss some revisions to your midterm paper in my office hours. I'm on campus Mondays and Tuesdays late in the evening, stop by sometime after 7. One of the TAs may have more convenient hours for you."	--
"Nov 01[tab]To: registrar@barnett.edu[tab][tab][tab]Late registration"	--	"Hi Linda,[line break]A couple of students in my class were trying to register past the add deadline, and said there was an error accessing the online system, is this indeed the case? Let me know if you anticipate any problems doing a manual add.[line break]Thanks,[EmailSignature]"	--
"Sep 03[tab]To: AsianStudies201@barnett.edu[tab]Course Syllabus"	--	"Class,[line break]I've already received several questions about the homework and date of the final exam, which as I've already stated, is in the course syllabus, which is available at the intranet link I mentioned in class. The syllabus already has the date of the midterm and final exam, as well as the grading policy for the entire semester listed in detail. I regret that I will not be able to answer any further questions to which the answers are already available.[line break]Regards,[EmailSignature]"	--
"Sep 02[tab]To: AsianStudies201@barnett.edu[tab]Welcome to another semester"	--	"Class,[line break]As you may have heard, my name is Alan Bowden, and I'll be teaching Intro to Asian Literature 201, as I do every fall. Even after so many years of teaching in this field, I love seeing a class of fresh new faces, and the enthusiasm and ideas with which you tackle this material. More than just having you read journals and criticism, my goal this semester is to teach you to think critically, and how to hone your own ideas about some of the world's oldest classics. For some of you, this will be a time to get your feet wet in a different literary tradition than you're used to. I look forward to an enjoyable semester together! For your reference, the syllabus may be found at the following intranet link.[line break]Regards,[EmailSignature]"	--



EmailSignature is some text that varies. EmailSignature is "[line break]--[line break]Alan Bowden[line break]Asian Studies Department[line break]Barnett College, NY[line break]mbowden@barnett.edu"

[FIXME - Add Glimmr Automap?]
[He was putting on a good show, but I could tell he didn't seem to have any interest in finding out who did it. That, or some brass had told him not to.]

[I told myself it was just tomato juice]

["Why didn't you just tell me?" "Because I need you to find something I missed. You're a fresh set of eyes, and I don't want to bias what you see."]
[Sinclair died some 70 years ago. Cases was stone cold. And the fact that Val was bothering to throw me at it meant that she thought the killer was still alive.][You have to wait to sire, Val waited 50 years]
[TODO line about patrtons creating vam in the throes of passion]

[That lazy piece of shit? He never worked a day in his life. Born with a silver spoon in his mouth, ran a factory or two during the war, and reinvented himself as some scholar? What a fucking joke. He sits in this house drinking thousand dollar bottles of wine and fucking undergrads.]


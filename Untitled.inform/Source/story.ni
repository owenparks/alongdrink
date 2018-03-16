"A Long Drink" by Owen Parks.

The story headline is "An Interactive Mystery".

Release along with a website and interpreter and cover art.
The Release number is 8.

The story genre is "Mystery".

The story description is "The first time I'd met Val was the day before yesterday, on my way out of the hospital. I'd been in a numb stupor for hours. There's no good way to take that kind of news.  She'd asked me out for a drink. I remember thinking there was something Old Hollywood glam about her, like Veronica Lake or Lauren Bacall. I figured she was trouble, but I had nothing to lose, and she looked like my kind of trouble. Turns out I didn't know the half of it.

Daybreak was just a few hours away. I stared at the crumpled remains of my car, and beyond to the frozen lake below. I wondered if I'd ever see her again.".

[========= Extensions ==============]
Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.

[Include Threaded Conversation by Chris Conley.]
[Made with Threaded Conversation Version 2/140602]
Include Menus by Emily Short.

[Include Exit Lister by Gavin Lambert.]
Include List Control by Eric Eve.
Include Automap by Mark Tilford.

[======= Extension Overrides ========]

[====== Debugging and Play Start =====]

[CHANGE THE FOLLOWING LINE FOR DEBUGGING]
Debug_on is a truth state that varies. Debug_on is usually false.
Logging_on is a truth state that varies. Logging_on is usually false.

When play begins:
	now the story viewpoint is first person singular;
	now the story tense is past tense;
	If logging_on is true:
		try switching the story transcript on.
	
Chapter 2 - Scene Mountain_Driving

Mountain_Driving is a scene.

[======== Introcar General =====]

Introcar is a region.

Road is a backdrop. Road is in the introcar. The description is "Snow was coming down in great, big flakes, landing right on top of the packed, slippery mess on the road.".
Snow is a backdrop. Snow is in the introcar.
Window is a backdrop. Window is in the introcar. Understand "windshield" as window.
Car is a backdrop. Car is in the introcar. The description is "The beat up Toyota Corolla wasn't much to look at, but it got me from Point A to Point B without costing much in terms of repairs."
Introcar_radio is a backdrop. Introcar_radio is in the introcar. The printed name is "radio". Understand "radio" as Introcar_radio. The description is "An aftermarket stereo the previous owner put in. The blue lights and shiny dials were stark against the shabby interior of the rest of the car."
Instead of listening when the player is in the introcar:
	say "News, traffic, and weather reports. Thankfully I was driving alone, most passengers I knew got tired of listening to it for hours on end.";
Instead of examining outside when the player is in the introcar:
	Try examining the road.
Instead of examining the window when the player is in the introcar:
	Try examining the road.
Instead of examining snow when the player is in the introcar:
	Try examining the road.	

After reading a command while the player is in the introcar and the location is not Hairpin_Turn:
	If the player's command matches "go":
		try going north;
		stop the action;
	If the player's command matches "drive":
		try going north;
		stop the action.
		

[======== Room Mountain Road =======]

The player is in the Mountain_Road.

Mountain_Road is a room in the introcar. 
The printed name of Mountain_Road is "Mountain Road". The description is "They say you shouldn't drive when you're angry. That was just one of a hundred pieces of good advice I was ignoring as I drove along the icy road to the chalet, my foot a little heavier on the gas than it needed to be.[paragraph break]I'd had a long, promising career in homicide ahead of me, or so I kept telling myself, and it was all down the drain now. I had planned on a senior detective's desk being in the cards for me, at least. Maybe even quitting and going into private investigations. Well, I guessed I could still do that.[paragraph break]Not six hours earlier, I'd turned in my badge and my gun and walked out, more or less the way I'd seen it in the movies. The captain was yelling his head off, couldn't figure out why a promising young detective like me would just up and quit. I honestly hoped he never did.[paragraph break]I kept on driving north.[paragraph break]"

[TODO: put hint reminder in for new player]

[====== Room Mountain Pass =======]

Mountain_Pass is a room in the introcar. 
The printed name of Mountain_Pass is "Mountain Pass". Mountain_Pass is north of the Mountain_Road. The description is "I had the radio on tuned to some news station-- truth be told, I already missed the chatter of the dispatch as I was driving. The traffic report had little bearing on my current locale, but the weather gave me some concern: a snowstorm coming up off the Great Lakes. Spending the weekend with a small crowd I barely knew wasn't my idea of a good time. Being cooped up with them the entire time due to weather seemed like a recipe for an epidemic of cabin fever.[paragraph break]I continued north along the snowy road."
Instead of going south when the player is in the Mountain_Pass:
	say "I had somewhere to be. Making a U-turn wasn't going to get me there any faster.";
	stop the action.	

[======= Room Hairpin Turn ========]

Hairpin_Turn is a room in the introcar. The printed name of Hairpin_Turn is "Hairpin Turn". Hairpin_Turn is north of the Mountain_Pass. The description is "If I'd finished that last thought a few seconds earlier, I might've noticed the caution sign for the sharp turn, barely visible through the snow. The car was going too fast, and the guardrail came out of nowhere."

After reading a command while the location is Hairpin_Turn:
	replace the player's command with "look";
	say "I hit the brakes, but the car kept straight for the guardrail, slamming through, and going over.[paragraph break]The back end of the car lost traction and swung out wide, trying valiantly to chase the front like a powerslide in a car commercials. The right side of the car went over the edge of the cliff, momentum taking the rest of the car with it. In shock, my brain couldn't manage to tell my body to do more than grip the wheel uselessly as the car tumbled down the steep incline. I lost count of the rolls after three. The roof hit a tree, and I jerked upward against the seat belt. Snow from the branches overhead fell into a pile onto the passenger window from the impact. I heard it thud, and the brief glimpse of moonlight was snuffed out.[paragraph break]";
		end the story finally.

The description of the player is "Clothes were a little wrinkled, but I wasn't used to having people to impress. Not much the worse for wear, considering what I'd been through.".

[FIXME: Bit about wrist?]


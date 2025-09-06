/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/
    
-> beginning

VAR name = ""
VAR reminders = 0
VAR time = -1
VAR first_time_room_1 = true
VAR first_time_room_2_east = true
VAR first_time_room_2_west = true
VAR first_time_room_3_east = true
VAR first_time_room_3_west = true
VAR has_pickaxe = false

== beginning == 
    Here it is. The chasm that holds so much history. You sit at the edge, tied and harnessed securely. You are all but ready to dive, but you feel like you don't have much of a choice.
    Failure to bring back anything will only lead to more trouble for you. God knows you've already had enough. 
    You have your phone with you, if anything. Just get something of value, and get out.
* [Grab your rope and climb down] -> the_descent
* [Step back] -> cowardice

== the_descent == 
    It's a long descent; that's for sure. 
    
    As you slowly lower yourself down the cliffside, the phone in your bag begins to speak.
    
    "Helloooooooo? Hello?"
* [Stop climbing and look at phone] -> the_call
* [Ignore and keep going] -> persisting_climbing

== the_call == 
    A face takes up most of the screen, and there's no decline button. 
    {persisting_climbing: "You don't look very happy, but this is important, so just hold on."}
    {persisting_climbing: |"I can't see very much from wherever you are...} {persisting_climbing: "}Anyway, I'm trapped inside somewhere, and need some help! I was just collecting some rocks from the river, and it swept me down into a tunnel at the bottom of the chasm!"
    
    The water at the bottom of the chasm hardly counts as a river. The water rises higher much further to the west. Either they had a long journey, or there's something else going on.
    
* ["What's in it for me?"] -> gamble_help
* [Stay silent] -> silent_climbing


== persisting_climbing == 
    You stay silent.
    ___________________________________________________________________________________________________
    The phone continues to talk.
    
    "Ok, well, I'm still going to talk..."
    
    Oh my god it's going to keep talking.
    
* [Stop climbing and look at phone annoyedly] -> the_call
    
== gamble_help ==
    YOU: "What's in it for me?"
    ___________________________________________________________________________________________________
    {persisting_climbing: |"Really? Goodwill isn't enough of a reward for you? Where's your heart?"}
    {persisting_climbing: "I see, you're the type to only speak up when you want something. Hmm."}
    {persisting_climbing: |"..."}
    "Well, there's some broken junk in the room with me. It seems that the river drifts a handful of junk down into here sometimes."
    "Let's see...colorful beads, rusted machinery bits, some antique jewelry, cool fossilized rocks...OOH!"
    "...maybe some JEWELS would entice you?"
    
    The phone changes from the face, to orange gems encased within a stone wall. Looks like you'd need to find something to be able to get those out.
    
    That's if you even REALLY wanted them. The antique jewelry sounded like a better money grab, and less effort. Even then...there could be better things to find if you spend your time on your actual mission. 
    
    * ["We'll see."] -> the_search_begins
    
== silent_climbing ==
    You stay silent.
    ___________________________________________________________________________________________________
    {persisting_climbing: "You know I can't see a thing, right? Can you even hear me...? ...Whatever."}
    "I'm still going to guide you, even if you don't answer. It's not like I have many other options here."
    * [Finish your descent down the chasm and land at the bottom] -> the_search_begins
== the_search_begins == 
    {gamble_help: YOU: "We'll see."}
    {gamble_help: ___________________________________________________________________________________________________}
    After putting your phone away, you finally make it to the bottom of the chasm. You unhook your rope from your harness, and think on the "phone call."
    How are they even contacting you from a cave? How is the connection even that strong? How long have they been down here?
    {gamble_help: And that's not even taking into consideration what they have in the room with them. Is there actually any of those items the person described? Or is it a trap?}
    There's a lot of unanswered questions there, but you do have a mission to fulfill. One that's not prioritizing charity cases. 
    
    * [Look around] -> room_1

== room_1 == 
    There's two directions here to go, east or west. It's dark, with only some local fauna lighting the way. It's considerably less lit to the east.
    
    { add_time() }
    
    {first_time_room_1: The person on the phone speaks from your pocket. "Go west here!"}
    ~ first_time_room_1 = false
    + [Go west] -> room_2_west
    + [Go east] -> room_2_east
    + [Speak with the mysterious phone person] -> room_1_talk_options
    
== room_2_east ==
The room darkens and the walls narrow. You use the light emitting from your phone to find the path. 

{ add_time() }

{first_time_room_2_east: Your guide, exasporated, sighs.}

{first_time_room_2_east: "I told you to go west. So, go back the other way, please."}
~ first_time_room_2_east = false
+ [Go back] -> room_1
+ [Keep going deeper] -> room_3_east
+ [Speak with the mysterious phone person] -> room_2_east_talk_options

== room_3_east == 
-> END

== room_2_east_talk_options ==
+ ["Remind me where to go here?"] -> where_to_go_room_2_east
+ [Stop chatting] -> room_2_east

== where_to_go_room_2_east == //NEW
{reminders == 0: "Again, go back!"}
{reminders == 1: "...go back."}
{reminders > 1: "..."}
~ reminders = reminders + 1
+ [Stop chatting] -> room_2_east

== room_2_west == //NEW
Mushrooms and yellow flowers dot the path, leading further to the west.

{ add_time() }

{first_time_room_2_west: "Just keep going down this way!"}
~ first_time_room_2_west = false

+ [Go back] -> room_1
+ [Keep going deeper] -> room_3_west
+ [Speak with the mysterious phone person] -> room_2_west_talk_options

== room_3_west == //NEW
To the right, you can see an opening. {grabbed_pick: |A pickaxe lies near you, propped up against the wall.}

{ add_time () }

{first_time_room_3_west: "You're almost there! Just keep going!"}
~ first_time_room_3_west = false

* [Grab the pickaxe] -> grabbed_pick
+ [Go back] -> room_2_west
+ [Keep going deeper] -> room_4_west

== grabbed_pick == //NEW
Besides the cobwebbing on it, it looks brand new. Odd, considering how old everything around it is. 

At least you have something to defend yourself, if needed.
* [Continue] -> room_3_west

== room_4_west == //NEW
-> END

== room_2_west_talk_options == //NEW
+ ["Remind me where to go here?"] -> where_to_go_room_2_west
+ [Stop chatting] -> room_2_west

== where_to_go_room_2_west == //NEW
{reminders == 0: "Again, keep going!"}
{reminders == 1: "...just keep going."}
{reminders > 1: "..."}
~ reminders = reminders + 1
+ [Stop chatting] -> room_2_west

== room_1_talk_options ==
* ["What's your name?"] -> name_of_beast
+ ["Remind me where to go here?"] -> where_to_go_room_1
+ [Stop chatting] -> room_1
    
== name_of_beast ==
YOU: "What's your name?"
___________________________________________________________________________________________________
"Oh, what a good question! Well, since we've got time to spare, why don't you answer my riddle?"

Oh joy.

"Starting with D and ending with A, my name is next to godliness on any other day. But because you've stumbled into this terrible hole, today, it ends with the letter O."

The face smiles a toothy grin.

"It's a good one, isn't it? Well, take a guess!"

There's not much to go off of here, but a few names come to mind.
* ["Domingo?"] 
~ name = "Domingo" 
-> name_of_beast_2
* ["Daniella?"] 
~ name = "Daniella"
-> name_of_beast_2
* ["Draco?"]
~ name = "Draco"
-> name_of_beast_2

== name_of_beast_2 ==
"{name}?"

{name == "Domingo": "...it means Sunday or 'of the Lord,' in Spanish. Popularized by Santo Domingo, a saint who gave everything he had for the hungry in Spain's famine. Sure, that's my name."}
{name == "Daniella": "...it means 'God is my judge,' in Hebrew. A variation on Daniel, a name associated with visions and dreams, but also righteousness. That could be my name."}
{name == "Draco": "...it means 'dragon' or 'serpent' in Greek. Most notably the name of the first Athens legislator, who would assign death to anyone who defied his laws. Yes, that's my name."}

What a cryptic sentence...and waste of time.

* [Stop chatting] -> room_1

== where_to_go_room_1 ==
YOU: "Remind me where to go here?"
___________________________________________________________________________________________________
{reminders == 0: "Again, go west!"}
{reminders == 1: "...go west."}
{reminders > 1: "..."}
~ reminders = reminders + 1
+ [Stop chatting] -> room_1

== cowardice == 
    They were watching, and saw your hesitation. You were killed before you even blinked. Were you looking for treasure or trouble?
    -> END

== function add_time == //NEW
~ time = time + 1
{- time > 24: time = 0}
{
- time == 0: The midnight sky makes everything harder to see.
- time == 3: The early sun peers through.
- time == 6: The sun continues to rise.
- time == 12: The high noon sun warms the cave.
- time == 15: Heat swarms the depths of the chasm, and you begin to sweat.
- time == 18: The sun begins to rest.
- time == 21: The sun is no longer in the sky.
}



/**
other dialogue options to put in somewhere
* ["How long have you been stuck down here?"] -> how_long
* ["Why were you looking for rocks in the river?"] -> rocks_explained
**/

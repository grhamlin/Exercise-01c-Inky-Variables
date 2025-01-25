/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots 
Choose name, coin Pickup, Secret Door, Inventory
 - Assign at least TWO new variables through player choices
 Player name, Coin
 - Print at least one of the variables to the player in a passage
 How many coins you have when you pick up another one
 - Check the value of a variable and have it do something
 If you have at least 3 coins, you can access the secret door

 
 VARIABLE CHECKING

Equality  X == X -> True
Not equality X != Y -> True
Greater: >
Less: <
Greater/less or equal >= or <=
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR Coin = 0
VAR player_name = ""

-> choose_name

== choose_name==
You are about to begin a grand adventure, filled with danger and excitement. What's your name explorer? 

*[Johnathan]
    ~ player_name = "Johnathan"
    -> memory
*[Brayden]
    ~ player_name = "Brayden"
    -> memory
*[Caleb]
    ~ player_name = "Caleb"
    -> memory
    
    
== memory ==
Before you stands a great cave. You wish your childhood pet was with you. The cave might be less intimadating. What was your pet's name?

* [Charlie] 
    ~ pet_name = "Charlie" 
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    -> cave_mouth
    

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now! 

You can check your item status from the cave mouth at any time!


+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
+ [Check inventory] -> Inventory

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
+ {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west

{ pet_name == "Spot" : Spot would love it here in the west| }

+ {Coin >= 3} [Open secret door using 3 coins] -> Secret_door
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
+ {Coin < 3 } [Pick up a coin] -> coin_pickup
+ [Go back] ->cave_mouth
-> END

== coin_pickup ==
~ Coin = Coin + 1
You have picked up a coin!
{Coin == 1 : You have 1 coin!}
{Coin > 1 : You have {Coin} coins!}
+[Go back] -> east_tunnel_lit

== Secret_door ==
You found the treasure!
+[Return to cave mouth] -> cave_mouth


== Inventory ==
You have {Coin} coins!
You have {torches} torches!
+ [Go back] -> cave_mouth

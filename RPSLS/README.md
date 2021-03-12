# README for Game RPSLS

This is an implementation of the game Rock, Paper, Scissors, built based on Ruby's OOP principles.

Game rules: The original RPS is played based on the real-life version of the game, where two players take turns choosing one of the three possible hands. 

In this extended version, the following features are added:
1. Instead of three possible hands, two more possible hands are available - sprock, and lizard.
2. Users can exit the game either by choosing to leave at the end of every game, or the game will naturally stop after a maximum number of wins is reached by one of the users. This number is a constant and can be changed.
3. Game moves are shown at the end of every round, and final game winner is revealed either when the user choose to exit, or when the game comes to a natural close. 
4. Not a feature, but each hand/move is in fact its own class. Therefore, if more "hands" are added to the game, this should be realtively easy to add as a subclass of Move. 

Features not added and can be explored further:
1. Personality-driven bot player.
2. Statistical analysis of player patterns and how a more optimal player strategy can be devised. 

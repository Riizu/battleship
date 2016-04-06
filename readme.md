# Battleship

This Turing School project is designed to emulate the classic board game
Battleship. Players place ships on a simple grid interface, with each ship
taking up a pre-defined space on the grid. After setup each player takes turns
guessing at the location of their opponent's ships. The defending player reports
whether or not a guess was a 'hit' or a 'miss.' This continues, with the first
to hit all grid spaces that the defending player's ships occupy declared the
winner.

### Example Grid Layout

```
======================================
|   |  A | B | C |  D |  E |  F |  G |      * = ship
|===|====|===|===|====|====|====|====|      H = Hit
| 1 |  * | * | * |    |    |    |    |      M = Miss
|===|====|===|===|====|====|====|====|     
| 2 |    |   |   |    |    |    |    |
|===|====|===|===|====|====|====|====|
| 3 |    | M |   |    |    | *  |    |
|===|====|===|===|====|====|====|====|
| 4 |    | M |   |    |    | H  | M  |
|===|====|===|===|====|====|====|====|
| 5 |    | M |   |    |    |    |    |
|===|====|===|===|====|====|====|====|
| 6 |    |   |   |    |    |    |    |
|===|====|===|===|====|====|====|====|
| 7 |    |   |   |    |    |    |    |
|===|====|===|===|====|====|====|====|
```

### Required Behavior

All required behavior can be found at the link below
[Project Spec](https://github.com/turingschool/curriculum/blob/master/source/projects/battleship.markdown)

### Class Design

The class design for this project is as follows

* Main: the initial starting point for the game. Instantiates the state machine
and manages program flow
* StateMachine: Stores available program states and current state
* Game: Primary game logic location. Instantiates all relevant game objects
* Player: Represents a player. Stores owned ships, guess history, places ships
* Guess: Represents a guess. Stores its location and what type it was.
* Ship: Represents a given ship. Stores data on sunk state, hit state, position, placed state, ship owner, places on board
* Board: each player's existing ship count and board size, checks position validity, adds data to board
* AI: Represents an AI player for single-player games
* InputHandler: Controls and manages all user input, parses guesses

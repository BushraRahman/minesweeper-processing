## Group Info
Bushra Rahman, Danielle Que
## Overview
This project is a recreation of Minesweeper in Processing.  
In this version of Minesweeper, the player starts out with a 16x16 board of squares. 40 of these squares are mines.  
The goal is to click on all of the squares that are not mines. Clicking on a square that isn't a mine either reveals how many mines it's neighboring or reveals squares in each direction, including diagonals, until it reveals a square that neighbors at least one mine.  
The game is lost when the player clicks on a mine and the game is won when all squares that are not mines are clicked on.  
Squares that are potentially mines can be marked with a flag.  
The number of mines left to flag is indicated at the top and is labeled with "Mines: ".  
Unclicked on squares are peach. Flagged squares are peach with a red square. Revealed squares that aren't mines are white. Mines are black squares with red circles in the middle.  
Squares that were incorrectly flagged are black with a red rectangle when the game is over.  
When the game ends, players can create a custom game choosing between a width & height of 8-25 squares and a mine count between 16 and the product of one less of the chosen height times one less of the chosen width.  
Players choosing to restart in the middle of the game also have the option at the top left corner to restart on a new board of the same size as the previous board.  
## Instructions
Right-click a square to add or remove a flag.  
Click on a square to uncover it.  
Click on a button labelled "RESTART" to play with another board of the same size with a different configuration of mines. This can be found on the game over screen or by clicking the "OPTIONS" button on the top left.  
Click on a button labelled "Custom Game" to play with another board of a custom configuration. Pressing the button will open a screen with 3 controls for width, height, and mines.   
Toggle the arrows to set the desired board configuration and press "Create Game" to start.  

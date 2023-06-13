# Work Log

## Rahman, Bushra

### May 22

-Created a personal branch
-Added variables and untested methods to Space class

### May 23

-Tested methods in Space class
-Fixed drawSquare()
-Changed variable name in Space
-Added variables, constructor, and the beginning of mouseClicked to Game

### May 24
-Made untested versions of the methods countAdjacent and placeMines in Board class

### May 25
-Made untested version of displayMines in Board class
-Overloaded drawSquare and edited the Space class so that drawSquare() can work properly
-Testing mouseClicked() in Game class
-Fixed some errors in mouseClicked() in Game class

### May 26 (classwork)
-Made folder with another name because case-sensitive path error was interfering with pushing and pulling

### May 29
-Fixed run-time errors when clicking certain Spaces by modifying the Board constructor, countAdjacent, and mouseClicked
-Fixed the method placeMines
-The above changes means that the user can now click on Spaces and the Spaces change their look different depending on if they're a mine or not

### May 30
-Added a Space having a flag when users click on it
-Began working on an Options button

### May 31
-Game ends when all non-mines have been clicked on
-Began working on a game over screen with a restart button

### June 1
-Made Game Over screen centered on board, transparent
-Restart buttons now work
-Fixed error where clicking above the board modified the board
-Added demo feature that reveals most non-mines
-Cleaned up code: added comments to improve readability, moved and renamed some variables
-Made and added uncoverAdjacent

### June 5
-Added feature that displays the time since the game has started
-Began working on displaying the game statistics (games played, games won, percentage) on the game over screen

### June 7
-Started adding collapsable buttons that can be opened by clicking on the options button
-Made the timer stop when the game is over
-Changed the appearance of wrongly flagged Spaces

### June 11
-Finished working on the buttons
-Added game statistics to game over screen
-Fixed bugs with custom screen

## Que, Danielle

### May 22
- Created personal branch

### May 23
- Created Board Class, added Constructor and 2 helper methods

### May 24-25
- Attempted to fix merging issues

### May 26
- Recreated folder and files to match Folder and File names
- Fixed Board class
- Finally got merging to work

### May 29
- Updated main (cleaned it up so only the Board folder is in there)
- Doubled size of the board
- Starting to work on uncovering adjacent feature
- Changed visuals of uncovering and mines for ease

### May 31
- Working on uncovering adjacent feature

### June 1/2
- Finished working uncovering adjacent spaces feature

### June 6
- Fixed corner issue on uncoverAdjacent
- Beginning work on custom game option

### June 7
- Created custom game screen, shows dimensions

### June 12
- Finished custom game screen
- Added controls to increase and decrease dimensions and mine count

## Dev Log

### Working Features
- Initializing the game: The screen opens to a 16x16 grid with 40 mines which the player can play like a normal minesweeper game to either complete & win or lose.
- Game Over: Losing or winning opens a screen that allows the player to restart or create a custom game. This screen also keeps track of games won and played.
- Custom Game: The player has the ability to create custom games by changing the width and height (in terms of spaces) and number of mines. Once these are set, the player can create the new game.
- Options Menu: The player can click on the options menu in the top left of the game screen to have the ability to restart with a new game.
- Timer: The timer displays how long it is taking the player to solve the game.

### Broken Features/Bugs
- Pressing S: Hitting the S key is supposed to uncover all the non-mines except one and flag all of the mines. This allows users to easily end the game by clicking on the last remaining uncovered square. However, this feature sometimes uncovers all non-mines and doesn't end the game. 

### Content Resources
- The Processing Reference: Very useful for learning about Inputs.
- Google Minesweeper: Good reference material for minesweeper basics
-freeminesweeper.org Minesweeper: Good reference material for the graphics of minesweeper

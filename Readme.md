# A toy chess engine to accomplish the following

* Pairing to teach a new engineer some object modeling and testing fundamentals
* New ruby 3 features like ractors and fibers
* Learn more about chess

## Objects

### Pieces

* ~~Piece type~~
* ~~Team~~
* Valid moves(current_board)
  * ~~basic moves (pieces make valid moves and stay on the board)~~
  * take collisions in to account when moving
  * advanced movement (castling, en passant, promotions)
* Checked/Checkmated
* ~~Value~~
* ~~Position on board~~
  * ~~File (Letters) - First Coordinate~~
  * ~~Rank (Numbers) - Second Coordinate~~

### Board

* ~~All the pieces on the board~~
* ~~Set itself up (heres a new game)~~
  * ~~from new game~~
  * ~~from an established board matrix~~
  * from an input vector of moves
* ~~How many of each piece are left - Score balance~~

### Players

* Type (computer, human)
* Next move
* Team
* Time remaining

### Game

* What turn
* Asks if game is over, if so, awards winner
* Initial time per player

## Optimization Algorithm (Alpha-Beta Pruning)

Here is the algorithm

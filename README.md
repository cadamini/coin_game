# coin_game
This is a little test project to solve a geocaching mystery
and to practise programming and writing specs.

* Each coin is lying upside-down at the beginning. 
* In the first round each coin is flipped-over.
* In each subsequent round one more coin is skipped, 
  - 2nd round -> every 2nd coin
  - 3rd round -> every 3rd coin
  - and so on ...

Each coin has a value on the top side. The first coin has 1, the second 2 and so on. At the end each visible number of each non-flipped coin laying upside-down is counted. 

Run `ruby start_game.rb 256` to start the game.

# Computer Pathfinding

## Summary of A* Pathfinding method

1. Add the starting square (or node) to the open list.
2. Repeat the following:

    a) Look for the lowest F cost square on the open list. We refer to this as the current square.

    b) Switch it to the closed list.

    c) For each of the 8 squares adjacent to this current square …

    * If it is not walkable or if it is on the closed list, ignore it. Otherwise do the following.

    * If it isn't on the open list, add it to the open list. Make the current square the parent of this square. Record the F, G, and H costs of the square.

    * If it is on the open list already, check to see if this path to that square is better, using G cost as the measure. A lower G cost means that this is a better path. If so, change the parent of the square to the current square, and recalculate the G and F scores of the square. If you are keeping your open list sorted by F score, you may need to resort the list to account for the change.

    d) Stop when you:

    * Add the target square to the closed list, in which case the path has been found (see note below), or

    * Fail to find the target square, and the open list is empty. In this case, there is no path.
3. Save the path. Working backwards from the target square, go from each square to its parent square until you reach the starting square. That is your path.


### References

[Computer Pathfinding](http://archive.gamedev.net/archive/reference/articles/article2003.html)

[A* Search Algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm)

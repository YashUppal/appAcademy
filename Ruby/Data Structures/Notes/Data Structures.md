# Data Structures

## Data Structres

* Data Structures are a way of representing, organizing and storing data and relationship between the data, that makes it easier to perform operations on it. Examples of data structures are Arrays, Strings, Hash etc.

## Abstract Data Types (ADT)

* ADT is a logical representation of a way of data organization, which contrasts from the data structures, which is a **concrete implementation** of it. Abstract Data Types are implemented using data structures.

* An example of ADT would be a Set, which according to mathematics is a bunch of unique values grouped together. A set cannot have duplicate values. So, we can implement a set using Arrays, just by ensuring that it cannot have duplicate values. An ADT does not care how you implement it or what data structure you use to implement it, all it cares for is that you keep the _guarantees_ that it expects.

### Some ADTs

1) Stack : A LIFO (Last In First Out) ADT which is similar to a stack of trays. The last (latest) tray to be put on top of the stack will be the first one to be taken out. The two operations are pop (take the topmost element off) and push (insert an element on the top)

2) Queue : A FIFO (First in First out) ADT which is similar to a queue in real world. The first element in the queue would be serviced first. Similar to the 'queue' outside a theater. Operations include pop (take the element from front out) and push (insert an element at the end of queue)

3) Trees : A tree is a 'tree-like' representation of data, having parent-child relationships between the different 'nodes'. Originate from a 'root-node'. The last nodes are called 'leaf-nodes'. There are Binary Trees, where each node can have **atmost** two children, a Ternary tree where each node can have **atmost** three children and a Polynode tree where a node can have many children. 

### Tree Traversal

1) Breadth First Search (BFS) : In BFS a tree is traversed layer by layer.
2) Depth First Search (DFS) : In DFS, the tree is traversed by diving right to the leaf nodes first.
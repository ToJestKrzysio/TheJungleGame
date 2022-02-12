# Tensorflow Docker Image via pycharm

Build the docker image and add appropriate configuration to pycharm.

```dockerfile
docker build -t tojestkrzysio/thejunglegame:1.0 .
```

# Game state representation

According to Deepmind paper [[1]][1] current board state was represented using 9x7x22 matrix. First
20 dimensions were devoted to keeping track of the pieces, first 10 layers for the current player
and the following 10 for the opponent. Two final dimensions are used to track number of repeated
moves.

Exact layer structure:

1. Current player trap pieces location, boolean array with 1 representing the trap.
2. Current player den piece location, boolean array with 1 representing the unit.
3. Current player mouse piece location, boolean array with 1 representing the unit.
4. Current player cat piece location, boolean array with 1 representing the unit.
5. Current player dog piece location, boolean array with 1 representing the unit.
6. Current player wolf piece location, boolean array with 1 representing the unit.
7. Current player leopard piece location, boolean array with 1 representing the unit.
8. Current player tiger piece location, boolean array with 1 representing the unit.
9. Current player lion piece location, boolean array with 1 representing the unit.
10. Current player elephant piece location, boolean array with 1 representing the unit.
11. Enemy player trap pieces location, boolean array with 1 representing the trap.
12. Enemy player den piece location, boolean array with 1 representing the unit.
13. Enemy player mouse piece location, boolean array with 1 representing the unit.
14. Enemy player cat piece location, boolean array with 1 representing the unit.
15. Enemy player dog piece location, boolean array with 1 representing the unit.
16. Enemy player wolf piece location, boolean array with 1 representing the unit.
17. Enemy player leopard piece location, boolean array with 1 representing the unit.
18. Enemy player tiger piece location, boolean array with 1 representing the unit.
19. Enemy player lion piece location, boolean array with 1 representing the unit.
20. Enemy player elephant piece location, boolean array with 1 representing the unit.
21. Current player repetitions, integer array filled with value representing number of repeated
    moves.
22. Enemy player repetitions, integer array filled with value representing number of repeated
    moves.

[1]:https://arxiv.org/abs/1712.01815

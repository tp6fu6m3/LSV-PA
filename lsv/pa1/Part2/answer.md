### 2. [ABC Boolean Function Representations]

In ABC there are different ways to represent Boolean functions.  
(a) Compare the following differences with the four-bit adder example.  
1. logic network in AIG (by command `aig`) vs.
structurally hashed AIG (by command `strash`)

    - Command `aig` just converts local functions of nodes to AIGs, it does not change the network type.
    
    - Command `strash` transforms the current network into an AIG by one-level structural hashing.

2. logic network in BDD (by command `bdd`) vs.
collapsed BDD (by command `collapse`)

    - Command `bdd` just converts local functions of nodes to AIG, it does not change the network type.

    - Command `collapse` recursively composes the fan in nodes into the fanout nodes resulting in a network, in which each CO is produced by a node, whose fanins are CIs. It is performed by building global functions using BDDs.

(b) Given a structurally hashed AIG, find a sequence of ABC command(s) to covert it to a logic network with node function expressed in sum-of-products (SOP).
    
- Commad: `logic` (Transforms the AIG into a logic network with the SOP representation of the two-input AND-gates.)
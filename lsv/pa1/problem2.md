#LSV PA1 Problem2

###(a) Command Comparisons
1. command `aig` v.s. command `strash`
   - Output of command `aig`
   ```
   **4bitadder**        : i/o = 9/5   lat = 0   nd = 8   edge = 24   aig = 52   lev = 4
   ```
   - Output of command `strash`
   ```
   **4bitadder**        : i/o = 9/5   lat = 0   and = 44   lev = 13
   ```
   - Difference: Command `aig` simply converts node functions to AIG (i.e. substitutes the SOPs with AIG), which is not structurally hashed. However, many operations can only be done on strashed networks. Hence, another `strash` command is needed after the first `aig` command we entered. We can see from the output of the `print_stats` commands that two circuits are different, where the `aig` one still contains `nd` and `edges`, which are information of logic networks, and the `strash` one does not.

2. command `bdd` v.s. command `collapse`
   - Output of command `bdd`
   ```
   **4bitadder**        : i/o = 9/5   lat = 0   nd = 8   edge = 24   bdd = 28   lev = 4
   ```
   - Ouptut of command `collapse`
   ```
   **4bitadder**        : i/o = 9/5   lat = 0   nd = 5   edge = 33   bdd = 43   lev = 1
   ```
   - Differences: Command `bdd` simply converts node functions to BDD. On the other hand, command `collapse` converts the network by constructing global BDDs. Entering command `bdd`, we get "local" BDDs constructed with intermediate nodes. However, entering command `collapse` gives us "global" BDDs, which are functions of PIs.

###(b) Sequence of Commands
- By entering command `logic` and then `sop`, we can convert the originally strashed AIG network to a logic network with node function expressed in SOP.


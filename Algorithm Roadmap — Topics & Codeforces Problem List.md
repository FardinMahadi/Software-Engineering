Ordered by tier, roughly matching when you should learn each topic. Don't skip ahead — each tier assumes the previous one is close to automatic.

## How to use this list

1. Pick a topic, learn the idea properly ([cp-algorithms.com](https://cp-algorithms.com/) is the best reference — better than most YouTube for this).
2. Implement the textbook version from scratch — no template, no copy-paste.
3. Solve the problems listed for that topic. If you get stuck for more than ~30 min on the _easiest_ one in the row, you didn't actually learn the idea — go back to step 1.
4. Don't move to the next tier until you can solve the current tier's problems without hints, in a reasonable contest-time window.

> **Note:** CF problem IDs occasionally shift when the archive gets reorganized. If a link 404s, search the problem name directly on Codeforces, or fall back to the **CSES Problem Set** (cses.fi/problemset) — same topics, more stable links.

---

## Tier 0 — Foundations

_Should already be near-automatic._

|Topic|CF Problems|
|---|---|
|Time/space complexity, brute force|4A (Watermelon), 71A (Way Too Long Words)|
|Basic math (GCD/LCM, primes, modular arithmetic)|1A (Theatre Square), 230B (T-primes), 284A (Cows and Primes)|
|Sorting & basic greedy|4C (Registration System), 1A, 318A (Even Odds)|
|Binary search (on value & on answer)|812B, 1117C|

## Tier 1 — Core CP Toolkit

_This is what unblocks most Div2 problems._

| Topic                           | CF Problems                 |
| ------------------------------- | --------------------------- |
| Two pointers                    | 1538C, 279B (Books)         |
| Prefix sums / difference arrays | 1546B, 1450C                |
| Sliding window                  | 1004B, 1175C                |
| Bitmasking basics               | 1416C, 1238D                |
| Greedy patterns                 | 1526C1, 1374B               |
| Recursion / backtracking        | 1188A, 580C (Kefa and Park) |

## Tier 2 — Graphs

_High ROI — shows up everywhere, including system design interviews._

| Topic                          | CF Problems                            |
| ------------------------------ | -------------------------------------- |
| BFS/DFS, connected components  | 1108D, 919D                            |
| Topological sort               | 510C (Fox And Names), 1385F (harder)   |
| Dijkstra (shortest path)       | 20C (Dijkstra), 1051D                  |
| Bellman-Ford / negative cycles | 95B (Lucky Numbers), 1486D             |
| Union-Find (DSU)               | 25D (Roads not only in Berland), 1167B |
| MST (Kruskal/Prim)             | 1245D, 1108F                           |
| Bipartite check / 2-coloring   | 862B, 1176E                            |

## Tier 3 — Dynamic Programming

_The actual filter between "knows syntax" and "thinks algorithmically."_

| Topic             | CF Problems                       |
| ----------------- | --------------------------------- |
| 1D DP basics      | 4D (Mysterious Present), 466C     |
| Knapsack variants | 1446A, 1238E                      |
| LIS / LCS         | 1257E, 1582F (harder LIS variant) |
| DP on intervals   | 1140C, 607B                       |
| DP on trees       | 1153D, 1010D                      |
| Bitmask DP        | 1316E, 1228E                      |
| Digit DP          | 1216E1, 55D                       |

## Tier 4 — Strings

|Topic|CF Problems|
|---|---|
|Hashing|1200E, 514C|
|KMP / Z-function|126B (Password — Z-function classic), 471D|
|Trie|1295D, 1056E|
|Suffix arrays (later, not urgent)|802I (advanced, skip until you need it)|

## Tier 5 — Advanced Data Structures

|Topic|CF Problems|
|---|---|
|Segment tree (range sum/min)|339D, 52C|
|Segment tree with lazy propagation|1556E, 380C|
|Fenwick tree (BIT)|1042D, 459D|
|Sparse table|1454F|
|**PBDS** (`ordered_set`, `tree`, `priority_queue` with custom comparators)|1614C2, 1430F — also rewrite old segment-tree solutions using `ordered_set` to feel the speed/syntax trade-off|

## Tier 6 — Math / Combinatorics

_Your stated strength — push this further, it's a real differentiator._

|Topic|CF Problems|
|---|---|
|Combinatorics (nCr, Pascal's triangle, modular inverse)|1342B, 559C|
|Number theory (sieve, Euler's totient, modular exponentiation)|1542B, 989D|
|Probability / expected value|1265E, 235B|
|Matrix exponentiation|1182E, 185A|
|Game theory (Nim, Sprague-Grundy)|1140A, 850C|

## Tier 7 — Niche

_Only once you're stable in everything above._

- Heavy-light decomposition
- Centroid decomposition
- Persistent data structures
- FFT / NTT
- Suffix automaton
- Flow networks (max-flow / min-cut)

Don't touch these until Tiers 0–6 feel automatic — they're rare even in CF Div1, and basically never come up outside CP/ICPC.

---

```cpp
// In the name of Allah, the Most Gracious, the Most Merciful
#include <bits/stdc++.h>
using namespace std;
int32_t main() {
    return 0;
}
```
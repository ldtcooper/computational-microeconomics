set STATES;
set BIDS;

param cost{b in BIDS}; /* What bidder pays for bid b*/
param payout{b in BIDS, s in STATES}; /* amount bidder recieves in state if bid accepted */


var accepted{b in BIDS}, binary; /* whether or not a bid is accepted */
# var accepted{b in BIDS} >= 0, <= 1; /* whether or not a bid is accepted -- allows partials */
var profits{s in STATES}; /* how much we gain/lose from a bid in a state */
var worst_case_profit >= 0; /* smallest positive profit we can make */

maximize least_proft: worst_case_profit;
s.t. profit {s in STATES}: profits[s] = sum{b in BIDS} (accepted[b] * (cost[b] - payout[b,s]));
s.t. get_worst {s in STATES}: sum{b in BIDS} (accepted[b] * (cost[b] - payout[b,s])) >= worst_case_profit;

data;

set STATES := q r s t; 
set BIDS := a b c d e;

param cost := a 3 b 4 c 5 d 3 e 1;
param payout: q  r  s  t :=
a        0  0  11 0
b        0  2  0  8
c        9  9  0  0
d        6  0  0  6
e        0  0  0  10;

end;
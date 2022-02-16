set ITEMS;
set BIDDERS;
set POSITIVE_HYPEREDGES;
set NEGATIVE_HYPEREDGES;

param positive_valuation{b in BIDDERS, e in POSITIVE_HYPEREDGES}; /* bidder b's valuation for positive hyperedge e */
param negative_valuation{b in BIDDERS, e in NEGATIVE_HYPEREDGES}; /* bidder b's valuation for negative hyperedge e */
param occurs_in_positive{i in ITEMS, e in POSITIVE_HYPEREDGES}; /* whether item (vertex) i is adjacent to positive hyperedge e*/
param occurs_in_negative{i in ITEMS, e in NEGATIVE_HYPEREDGES}; /* whether item (vertex) i is adjacent to negative hyperedge e*/
param num_items; /*number of items: 5 in example*/

var assigned{b in BIDDERS, i in ITEMS}, binary; /*set to 1 if b receives i*/
var positive_applies{b in BIDDERS, e in POSITIVE_HYPEREDGES}, binary; /* set to 1 if b receives all items in positive hyperedge e */
var negative_applies{b in BIDDERS, e in NEGATIVE_HYPEREDGES}, binary; /* (set to 1 if b receives all items in negative hyperedge e */

maximize efficiency: (sum{b in BIDDERS, p in POSITIVE_HYPEREDGES} positive_applies[b,p] * positive_valuation[b,p]) - (sum{b in BIDDERS, n in NEGATIVE_HYPEREDGES} negative_applies[b,n] * negative_valuation[b,n]);

/* no item given to more than one person */
s.t. assign_once{i in ITEMS}: sum{b in BIDDERS} assigned[b,i] <= 1;
/* positive_applied set only when all items touching positive hyperedge e assigned to bidder b*/
s.t. positive_constraint{b in BIDDERS, e in POSITIVE_HYPEREDGES}:  num_items * positive_applies[b,e] + sum{i in ITEMS} occurs_in_positive[i,e] - sum{i in ITEMS} occurs_in_positive[i,e] * assigned[b,i] <= num_items;
/* positive_applied set only when all items touching positive hyperedge e assigned to bidder b*/
s.t. negative_constraint{b in BIDDERS, e in NEGATIVE_HYPEREDGES}:  /* you need to fill this in */

data;

set ITEMS := i_1 i_2 i_3 i_4 i_5;
set BIDDERS := b_1 b_2 b_3;
set POSITIVE_HYPEREDGES := p_1 p_2 p_3 p_4 p_5 p_6 p_7;
set NEGATIVE_HYPEREDGES := n_1 n_2;

param positive_valuation:
      p_1 p_2 p_3 p_4 p_5 p_6 p_7 :=
b_1    2   1   2   1   2   3   2
b_2    2   1   3   3   2   1   1
b_3    1   3   1   1   2   1   0;

param negative_valuation:
      n_1 n_2 :=
b_1    2   2
b_2    1   1
b_3    3   1;

param occurs_in_positive:
      p_1 p_2 p_3 p_4 p_5 p_6 p_7 :=
i_1    1   0   0   0   0   1   0
i_2    0   1   0   0   0   0   1
i_3    0   0   1   0   0   0   0
i_4    0   0   0   1   0   0   1
i_5    0   0   0   0   1   1   0;

param occurs_in_negative:
      n_1 n_2 :=
i_1    0   1
i_2    0   0
i_3    1   1
i_4    1   0
i_5    0   1;

param num_items := 5;

end;
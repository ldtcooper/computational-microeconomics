set ROW_ACTIONS;
set COL_ACTIONS;

param row_payoff {r in ROW_ACTIONS, c in COL_ACTIONS};
param col_payoff {r in ROW_ACTIONS, c in COL_ACTIONS};
param dominated_row_strat {c in COL_ACTIONS};

# param chosen_col_strat {r in ROW_ACTIONS};

var probability{r in ROW_ACTIONS};
var epsilon;

maximize margin: epsilon;
s.t. prob_one: sum{r in ROW_ACTIONS} probability[r] = 1;
s.t. dominance {c in COL_ACTIONS}: (sum{r in ROW_ACTIONS} probability[r] * row_payoff[r,c]) >= dominated_row_strat[c] + epsilon;

data;

## full set of decisions
# set ROW_ACTIONS := U M D;
# set COL_ACTIONS := L M R;

set ROW_ACTIONS := U D;
set COL_ACTIONS := L M R;

param row_payoff: L M R :=
U                 4 4 1
# M                 3 3 2
D                 4 1 5;

param col_payoff: L M R :=
U                 0 0 2
# M                 5 4 4
D                 0 1 0;

param dominated_row_strat := L 3 M 3 R 2;

end;

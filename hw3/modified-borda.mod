set VOTES;
set OTHER_ALTERNATIVES;

param special_score{v in VOTES};
param other_score{v in VOTES, a in OTHER_ALTERNATIVES};

var discard_vote{v in VOTES}, binary; # whether we keep a vote or not

minimize removed_votes: sum{v in VOTES} discard_vote[v];
s.t. greater_than_alternatives {a in OTHER_ALTERNATIVES}: sum{v in VOTES} other_score[v,a] * (-1 * (discard_vote[v] - 1)) <= sum{v in VOTES} special_score[v] * (-1 * (discard_vote[v] - 1));
# (-1 * (discard_vote[v] - 1)) gives us 0 for a discarded vote and 1 for a kept vote


data;
# # default: A is special
# set VOTES := v1 v2 v3 v4;
# set OTHER_ALTERNATIVES := b c;
# param special_score := v1 2 v2 2 v3 1 v4 0;
# param other_score: b c :=
# v1                 0 1
# v2                 0 1
# v3                 2 0
# v4                 2 1;

# # default: B is special
# set VOTES := v1 v2 v3 v4;
# set OTHER_ALTERNATIVES := a c;
# param special_score := v1 0 v2 0 v3 2 v4 2;
# param other_score: a c :=
# v1                 2 1
# v2                 2 1
# v3                 1 0
# v4                 0 1;

# default: C is special
set VOTES := v1 v2 v3 v4;
set OTHER_ALTERNATIVES := a b;
param special_score := v1 1 v2 1 v3 0 v4 1;
param other_score: a b :=
v1                 2 0
v2                 2 0
v3                 1 2
v4                 0 2;

# # p2 tie: A is special
# set VOTES := v1 v2;
# set OTHER_ALTERNATIVES := b c;
# param special_score := v1 2 v2 1;
# param other_score: b c :=
# v1                 1 0
# v2                 0 2;

# # p2 tie: B is special
# set VOTES := v1 v2;
# set OTHER_ALTERNATIVES := a c;
# param special_score := v1 1 v2 0;
# param other_score: a c :=
# v1                 2 0
# v2                 1 2;

# # p2 tie: C is special
# set VOTES := v1 v2;
# set OTHER_ALTERNATIVES := a b;
# param special_score := v1 0 v2 2;
# param other_score: a b :=
# v1                 2 1
# v2                 1 0;

end;
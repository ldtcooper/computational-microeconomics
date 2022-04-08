set OUTCOMES;
set PROBABILITIES;

param preferences{p in PROBABILITIES, o in OUTCOMES};
param correspondences{i in PROBABILITIES, j in PROBABILITIES};

var utility{o in OUTCOMES};
var margin;

maximize max_margin: margin;
    
s.t. preferred_greater {i in PROBABILITIES, j in PROBABILITIES}: 
    (sum{o in OUTCOMES} correspondences[i,j] * preferences[i, o] * utility[o]) >= (sum{o in OUTCOMES} correspondences[i,j] * preferences[j, o] * utility[o]) + margin;

s.t. util_positive {o in OUTCOMES}: utility[o] >= 0;  

s.t. util_in_range {o in OUTCOMES}: utility[o] <= 1;

data;
set OUTCOMES := A B C D;
set PROBABILITIES := p1 p2 p3 p4 u1 u2 u3 u4;

param preferences:  A   B   C   D :=
p1                  0.1 0.2 0.3 0.4
p2                  0.4 0.4 0.1 0.1
p3                  0.6 0.1 0.0 0.3
p4                  0.4 0.3 0.2 0.1
u1                  0.1 0.2 0.4 0.3
u2                  0.4 0.2 0.2 0.2
u3                  0.4 0.3 0.3 0.0
u4                  0.5 0.5 0.0 0.0;

param correspondences: p1 p2 p3 p4 u1 u2 u3 u4 :=
p1                     0  0  0  0  1  0  0  0
p2                     0  0  0  0  0  1  0  0
p3                     0  0  0  0  0  0  1  0
p4                     0  0  0  0  0  0  0  1
u1                     1  0  0  0  0  0  0  0
u2                     0  1  0  0  0  0  0  0
u3                     0  0  1  0  0  0  0  0
u4                     0  0  0  1  0  0  0  0;

end;
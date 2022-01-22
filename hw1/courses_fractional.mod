set REQUIREMENTS;
set COURSES;
param points_required{i in REQUIREMENTS};
param effort{j in COURSES};
param points_contributed{i in REQUIREMENTS, j in COURSES};
var take_class{j in COURSES} <= 1;

minimize effort_exerted: sum{j in COURSES} take_class[j]*effort[j];
s.t. required_points {i in REQUIREMENTS}: sum{j in COURSES} points_contributed[i, j]*take_class[j] >= points_required[i];

data;

set REQUIREMENTS := ns ss hu;
set COURSES := neuro stats bioph gwarm;
param points_required := ns 10 ss 10 hu 10;
param effort := neuro 5 stats 5 bioph 2 gwarm 2;
param points_contributed:  neuro stats bioph gwarm :=
 ns                        8     3     5     4          
 ss                        6     6     3     2
 hu                        4     8     1     2;
end;
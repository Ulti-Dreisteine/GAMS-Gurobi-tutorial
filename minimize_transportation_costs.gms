* ---- 参数层 ----------------------------------------------------------------------*

Set
    i factory   /seattle, san-diego/
    j city      /new-york, chicago, topeka/ ;

Table D(i, j)  从工厂 i 到城市 j 的距离
                new-york    chicago     topeka
    seattle        2.5        1.7         1.8
    san-diego      2.5        1.8         1.4 ;

Parameter
    supply(i)   工厂 i 的产能    /seattle 350, san-diego 600/
    demand(j)   城市 j 的需求    /new-york 325, chicago 300, topeka 275/ ;

Scalar
    F 每一千英里每单位货物运输费用（按千美元计） /90/ ;

Parameter C(i, j);
    C(i,j) = F * D(i, j) ;

* ---- 变量层 ----------------------------------------------------------------------*

Variable
    z   总运输费用（按千美元计） ;

Positive Variable
    x(i, j) 从工厂 i 到城市 j 的货物运输量;

* ---- 模型层 ----------------------------------------------------------------------*

Equation
     cost               目标函数
     total_supply(i)    工厂 i 的供应限制
     total_demand(j)    城市 j 的需求限制;

cost                ..      z  =e=  sum((i,j), C(i,j) * x(i,j)) ;
total_supply(i)     ..      sum(j, x(i,j))  =l=  supply(i) ;
total_demand(j)     ..      sum(i, x(i,j))  =g=  demand(j) ;

Model transport /all/ ;

Solve transport using lp minimizing z ;

Display x.l, x.m ;
    
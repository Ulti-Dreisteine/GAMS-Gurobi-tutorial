* ---- ������ ----------------------------------------------------------------------*

Set
    i factory   /seattle, san-diego/
    j city      /new-york, chicago, topeka/ ;

Table D(i, j)  �ӹ��� i ������ j �ľ���
                new-york    chicago     topeka
    seattle        2.5        1.7         1.8
    san-diego      2.5        1.8         1.4 ;

Parameter
    supply(i)   ���� i �Ĳ���    /seattle 350, san-diego 600/
    demand(j)   ���� j ������    /new-york 325, chicago 300, topeka 275/ ;

Scalar
    F ÿһǧӢ��ÿ��λ����������ã���ǧ��Ԫ�ƣ� /90/ ;

Parameter C(i, j);
    C(i,j) = F * D(i, j) ;

* ---- ������ ----------------------------------------------------------------------*

Variable
    z   ��������ã���ǧ��Ԫ�ƣ� ;

Positive Variable
    x(i, j) �ӹ��� i ������ j �Ļ���������;

* ---- ģ�Ͳ� ----------------------------------------------------------------------*

Equation
     cost               Ŀ�꺯��
     total_supply(i)    ���� i �Ĺ�Ӧ����
     total_demand(j)    ���� j ����������;

cost                ..      z  =e=  sum((i,j), C(i,j) * x(i,j)) ;
total_supply(i)     ..      sum(j, x(i,j))  =l=  supply(i) ;
total_demand(j)     ..      sum(i, x(i,j))  =g=  demand(j) ;

Model transport /all/ ;

Solve transport using lp minimizing z ;

Display x.l, x.m ;
    
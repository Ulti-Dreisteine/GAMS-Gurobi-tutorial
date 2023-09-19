### GAMS-tutorial

GAMS练手

#### 一、基本语法

**基本数据结构**

集合：

```
Sets
    i   goods   /bread, milk/
    h   factors /capital, labor/;
```

标量：

```
Scalars
    Max maximum value   /1E8/
    Min minimum value   /0/;
```

一维向量：

```
Parameters
    alpha(i)    coefficient a   /0.2, 0.8/
    px(i)       coefficient p   /1, 2/
    pz(h)       coefficient h   /2, 1/
    z(h)        coefficient z   /10, 20/;
```

二维向量：

```
Table D(i, h) interaction coefficients
            capital   labor
    bread       1       2
    milk        2       3;
```

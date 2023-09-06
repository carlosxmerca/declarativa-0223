
## Guía #1

¿Cuál es el resultado de realizar las consultas siguientes?
a. 
```
=(+(3,X),C), =(W, X), =(W, 8).
```
```
X = W, W = 8,
C = 3+8.
``` 

b.
```
is(X, max(10,12)), is(Y, mod(12, 10)), is(W, tan(+(X,Y))).
```
``` 
X = 12,
Y = 2,
W = 7.2446066160948055.
```

c.
```
is(X, max(10, 12)), is(Y, mod(12, 10)), =(W, tan(+(X,Y))).
```
```
X = 12,
Y = 2,
W = tan(12+2).
```

d.
```
=(g(h(Q)), W), is(Q, +(sin(0), cos(0))).
```
```
Q = 1.0,
W = g(h(1.0)).
```

e.
```
=(g(h(Q)), W), =(Q, +(sin(0), cos(0))).
```
```
Q = sin(0)+cos(0),
W = g(h(sin(0)+cos(0))).
```
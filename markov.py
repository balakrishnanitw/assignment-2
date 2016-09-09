
from __future__ import division
import numpy as np

# rates for leaving current state
A = np.array([.1, .2, .1])                                     
# number of Markov transitions to observe
N = int(1e5)
# state vector
X = np.zeros(N+1)
# time vector
T = np.zeros(N+1)
# 'probability' vector
P = np.zeros(3)

for n in range(N):

    # sample the next transition time from exp distribution                                   
    tnext = np.random.exponential() / A[X[n]]
    T[n+1] = T[n] + tnext

    # move to the next Markov state                                                           
    if X[n] == 0:
        X[n+1] = 1
    elif X[n] == 1:
        if np.random.rand() > .5:
            X[n+1] = 2
        else:
            X[n+1] = 0
    else:
        X[n+1] = 1;

for i in range(3):

    # idxs of when Markov Chain transitioned to state i                                                        
    idx = np.where(X == i)[0];
    idx = idx[:-1];

    # 'Probabilities' (fraction of the time MC in state i)                                         
    P[i] = np.sum( (T[idx+1] - T[idx]) ) / (T[-1] - T[0]);

print "Fraction of time observed by each state is: "
print P


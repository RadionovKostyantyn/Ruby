from scipy.stats import cauchy

import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots(1, 1)
mean, var, skew, kurt = cauchy.stats(moments='mvsk')

x = np.linspace(cauchy.ppf(0.01), cauchy.ppf(0.99), 100)

ax.plot(x, cauchy.pdf(x), 'r-', lw=5, alpha=0.6, label='cauchy pdf')
rv = cauchy()

ax.plot(x, rv.pdf(x), 'k-', lw=2, label='neiman pdf')
vals = cauchy.ppf([0.001, 0.5, 0.999])

np.allclose([0.001, 0.5, 0.999], cauchy.cdf(vals))

r = cauchy.rvs(size=100)
ax.hist(r, density=True, histtype='stepfilled', alpha=0.2)

ax.legend(loc='best', frameon=False)
plt.show()


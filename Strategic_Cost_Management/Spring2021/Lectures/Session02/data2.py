import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns
import scipy.stats

# Matplotlib params
plt.rcParams['svg.fonttype'] = 'none'

name = 'data2'
x = 'Total Sales'
y = 'Marketing Costs'

df = pd.read_csv(name+'.csv', skiprows=1)


xlim = [2700, 3100]
ylim = [400, 470]

ax = sns.scatterplot(x=x, y=y, data=df)
ax.set_xlim(xlim)
ax.set_ylim(ylim)
plt.savefig(name+'_scatter.svg', transparent=True)

sns.regplot(x=x, y=y, data=df)
ax.set_xlim(xlim)
ax.set_ylim(ylim)
plt.savefig(name+'_reg.svg', transparent=True)


# Plot thefull regression line
ax.set_xlim([0, 3500])
ax.set_ylim([200, 500])
slope, intercept, r_value, p_value, std_err = \
 scipy.stats.linregress(x=df[x],y=df[y])
xlims = ax.get_xlim()
new_x = np.arange(xlims[0], xlims[1],(xlims[1]-xlims[0])/250.)
ax.plot(new_x, intercept + slope *  new_x, linestyle='--', lw = 2.5)

plt.savefig(name+'_regfull.svg', transparent=True)

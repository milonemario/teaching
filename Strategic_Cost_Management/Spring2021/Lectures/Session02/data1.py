import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns
import scipy.stats

# Matplotlib params
plt.rcParams['svg.fonttype'] = 'none'

df = pd.read_csv('data1.csv')

ax = sns.scatterplot(x='DL Total', y='OH Total', data=df)
ax.set_xlim([240, 320])
ax.set_ylim([740, 780])
plt.savefig('data1_scatter.svg', transparent=True)

sns.regplot(x='DL Total', y='OH Total', data=df)
ax.set_xlim([240, 320])
ax.set_ylim([740, 780])
plt.savefig('data1_reg.svg', transparent=True)


# Plot thefull regression line
ax.set_xlim([0, 320])
ax.set_ylim([600, 780])
slope, intercept, r_value, p_value, std_err = \
 scipy.stats.linregress(x=df['DL Total'],y=df['OH Total'])
xlims = ax.get_xlim()
new_x = np.arange(xlims[0], xlims[1],(xlims[1]-xlims[0])/250.)
ax.plot(new_x, intercept + slope *  new_x, linestyle='--', lw = 2.5)

plt.savefig('data1_regfull.svg', transparent=True)

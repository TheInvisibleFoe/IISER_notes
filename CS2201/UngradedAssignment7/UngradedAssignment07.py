import matplotlib.pyplot as plt
from sklearn.cluster import KMeans

pl =[[10,2],[14,3],[15,10],[1,2],[7,2],[5,6],[17,17],[19,5],[25,3],[2,9],[5,3],[5,3],[4,4,],[11,2]]
x = [i[0] for i in pl]
y = [i[1] for i in pl]
v = {}
for i in range(1,10):
    km = KMeans(n_clusters=i, max_iter = 1000).fit(pl)
    v[i] = km.inertia_
#plt.scatter(x,y)
plt.plot(list(v.keys()),list(v.values()))
plt.show()

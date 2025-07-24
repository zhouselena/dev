from signal_processing_algorithms.energy_statistics import energy_statistics
import numpy as np

v1 = [50, 52, 53, 50, 48, 49, 52]
v2 = [100, 50, 52, 48]

x = np.array(v1)
y = np.array(v2)

energy_stats = energy_statistics.get_energy_statistics_and_probabilities(x, y)
print(energy_stats)
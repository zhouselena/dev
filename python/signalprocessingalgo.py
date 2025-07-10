from signal_processing_algorithms.energy_statistics import energy_statistics
import numpy as np

x = np.random.rand(100, 5)
y = np.random.rand(100, 5)

energy_stats = energy_statistics.get_energy_statistics_and_probabilities(x, y)
change_points = energy_statistics.e_divisive(x)

print(energy_stats)
print(change_points)
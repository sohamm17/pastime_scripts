import numpy as np
import math
import matplotlib.pyplot as plt
import sys



def main():
    
    util_points = []
    upper_bound = []
    amc_points = []
    pastime_points = []
    with open("util_amc_avg_lc_util.csv") as f:
        
        for line in f:
            vals = line.strip().rstrip('\n').split("\t")
            #print vals
            util_points.append(float(vals[0]))
            upper_bound.append(float(vals[1]))
            amc_points.append(float(vals[2]))
            pastime_points.append(float(vals[3]))

    fig = plt.figure(num=None, figsize=(6, 4.5), dpi=80, edgecolor='k')
    #plt.xlim(5, 100)
    ax = fig.add_subplot(111)
    plt.ylim(0, 54)
    plt.xlabel("Initial Total LO-mode Utilization (%)", fontsize=20)
    plt.ylabel("Avg. Util. of LC tasks (%)", fontsize=20)
    #plt.xticks(util_points)
    ax.plot(util_points, upper_bound, "g-", marker=None, label="LO-mode UB", linewidth=3.9, markersize=14)
    ax.plot(util_points, pastime_points, "y--", marker="o", label="AMC-PAStime", linewidth=3.9, markersize=14)
    ax.plot(util_points, amc_points, "b:", marker="s", label="AMC", linewidth=3.9, markersize=14)
    plt.tick_params(axis='both', which='major', labelsize=20)
    plt.tick_params(axis='both', which='minor', labelsize=20)

    ax.legend(loc='upper left', bbox_to_anchor=(0.001, 1.03), prop={'size': 20})
    plt.grid()
    plt.tight_layout()
    #plt.show()
    plt.savefig("util_amc_avg_lc_util.pdf")


if __name__ == "__main__":
    main()

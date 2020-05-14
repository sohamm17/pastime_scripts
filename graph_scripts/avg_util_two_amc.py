import numpy as np
import math
import matplotlib.pyplot as plt
import sys



def main():
    
    util_points = []
    amc_points = []
    pastime_points = []
    with open("avg_util_two_amc.csv") as f:
        
        for line in f:
            vals = line.strip().rstrip('\n').split("\t")
            #print vals
            util_points.append(float(vals[0]))
            amc_points.append(float(vals[1]))
            pastime_points.append(float(vals[2]))

    upper_bound = [25 for i in util_points]
    fig = plt.figure(num=None, figsize=(6, 4.5), dpi=80, edgecolor='k')
    plt.xlim(28, 185)
    ax = fig.add_subplot(111)
    plt.ylim(10, 26)
    plt.xlabel("Seconds", fontsize=20)
    plt.ylabel("Avg Util. of LC task (%)", fontsize=20)
    plt.xticks(util_points)
    ax.plot(util_points, upper_bound, "g-", marker=None, label="LO-mode UB", linewidth=3.9, markersize=14)
    ax.plot(util_points, pastime_points, "y--", marker="o", label="AMC-PAStime", linewidth=3.9, markersize=14)
    ax.plot(util_points, amc_points, "b:", marker="s", label="AMC", linewidth=3.9, markersize=14)
    plt.tick_params(axis='both', which='major', labelsize=20)
    plt.tick_params(axis='both', which='minor', labelsize=20)

    ax.legend(loc='upper left', bbox_to_anchor=(0.005, 0.955), prop={'size': 19}, handletextpad=0.1)
    plt.grid()
    plt.tight_layout()
    #plt.show()
    plt.savefig("avg_util_two_amc.pdf")


if __name__ == "__main__":
    main()

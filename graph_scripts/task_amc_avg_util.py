import numpy as np
import math
import matplotlib.pyplot as plt
import sys



def main():
    
    tasks = []
    amc_points = []
    pastime_points = []
    upper_bound = []
    with open("task_amc_avg_util.csv") as f:
        
        for line in f:
            vals = line.strip().rstrip('\n').split("\t")
            #print vals
            tasks.append(int(vals[0]))
            upper_bound.append(float(vals[1]))
            amc_points.append(float(vals[2]))
            pastime_points.append(float(vals[3]))

    fig = plt.figure(num=None, figsize=(6, 4.5), dpi=80, edgecolor='k')
    plt.xlim(0, 22)
    ax = fig.add_subplot(111)
    plt.ylim(0, 25)
    plt.xlabel("# of Total Tasks", fontsize=20)
    plt.ylabel("Avg. Util. of LC tasks (%)", fontsize=20)
    plt.xticks(tasks)
    bar_width = 1.25
    bars = []
    bar_index = -0.5
    i = 0

    #for t in tasks:
    bar = ax.bar([k + bar_width * bar_index for k in tasks], amc_points,
    bar_width, label="AMC", hatch='-', align='center', color='y', edgecolor='k')
    bar = ax.bar([k + bar_width * (bar_index + 1) for k in tasks], pastime_points,
    bar_width, label="AMC-PAStime", hatch='\\', align='center', color='#CCF4C6',edgecolor='k')

    plt.tick_params(axis='both', which='major', labelsize=20)
    plt.tick_params(axis='both', which='minor', labelsize=20)

    ax.legend(loc='upper left', bbox_to_anchor=(0.1, 1.0), prop={'size': 20})
    plt.grid()
    plt.tight_layout()
    #plt.show()
    plt.savefig("task_amc_avg_util.pdf")


if __name__ == "__main__":
    main()

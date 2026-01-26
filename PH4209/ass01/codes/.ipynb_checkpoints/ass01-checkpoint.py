import marimo

__generated_with = "0.19.6"
app = marimo.App(width="medium")


@app.cell
def _():
    import marimo as mo
    import matplotlib.pyplot as plt
    import numpy as np
    from numba import njit
    return njit, np, plt


@app.cell
def _():
    # u1 rate of mutation from 0 to 1
    # u2 rate of mutation from 1 to 0
    u1 = 0.003
    u2 = 0.001

    # Number of generations
    T = 2

    # Population size
    N = 1000
    return N, T, u1, u2


@app.cell
def _(N, np):
    # Generation of initial population
    # Probability of A/B 
    prob = 0.5
    pop_0 = np.zeros(N)


    #ensuring half is A/B 
    numA = int(prob*N)
    indices = np.random.choice(N,numA, replace=False)
    for i in indices:
        pop_0[i] =1
    return (pop_0,)


@app.cell
def _(njit, np):
    @njit
    def mut_no_selection(T,N,pop_0,u1,u2):
        """
        Mutation without selection
        ---------
        Parameters:
        T: int
            number of generations
        N: int
            population size
        pop_0: array(Nx1)
            initial population size
        u1: float
            rate of change from one species to another
        u2: float
            rate of change from one species to another
    
        """
        population = np.zeros((T,N))
        frequency = np.zeros((T,2))
        population[0] = pop_0
        frequency[0,0] = N- np.sum(pop_0)
        frequency[0,1] = np.sum(pop_0)
        for i in range(T):
            for j in range(N):
                type = population[i,j]
                if type == 0 and np.random.rand()<u1:
                    type = 1
                if type == 1 and np.random.rand()<u2:
                    type = 0
                population[i,j] = type
                frequency[j,1] = np.sum(population[j])
                frequency[j,0] = N - np.sum(population[j])
        return population, frequency
            
    
    return (mut_no_selection,)


@app.cell
def _(N, T, mut_no_selection, pop_0, u1, u2):
    pops, freq = mut_no_selection(T,N,pop_0,u1,u2)
    return (freq,)


@app.cell
def _(T, freq, np, plt):
    fig, axes = plt.subplots(figsize=(10,6))
    plt.plot(np.arange(T), freq[:,1], label="Type B")
    plt.plot(np.arange(T), freq[:,0], label="Type A")
    return


@app.cell
def _():
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()

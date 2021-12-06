import random

from deap import base, creator, tools
from copy import deepcopy

import warnings
warnings.simplefilter("ignore")


# define the payoff matrix
tc1_payoffs = [[(5,5),(4,8)],[(8,4),(0,0)]]
tc2_payoffs = [[(12,12),(11,13)],[(13,11),(12,12)]]

# import numpy
# install numpy first by typing 'pip install numpy' on the terminal
import numpy as np

#define the Player class to make random players with the random strategy and random default,history with flexible depth(default is 2)
class Player:
      def __init__(self,depth=2):
            self.depthOf=depth
            self.wholeBits=np.random.randint(2, size=2**(2*depth)+2*depth)
            self.strategy=self.wholeBits[:2**(2*depth)]
            self.defaults=self.wholeBits[2**(2*depth):2**(2*depth)+depth]
            self.memory=self.wholeBits[2**(2*depth)+depth:]


# 2(a)
def payoff_to_player1(player1, player2, game):
    # your code goes here	
    lengthBitsCom=player1.depthOf*2
    sumOfMemoryBits=np.append(player1.memory,player2.memory)
    #use this calculation since memory depth can be flexible (default depth=2)
    calculatedBits=0
    for i in range(lengthBitsCom):
         calculatedBits+=sumOfMemoryBits[i]*(2**(lengthBitsCom-i-1))
    player1Cal=player1.strategy[calculatedBits]
    player2Cal=player2.strategy[calculatedBits]
    #input 'game' should be tc1_payoffs or tc2_payoffs
    payoff=game[player1Cal][player2Cal][0]
    return payoff

# make two random strategy players with memory depth=2 to call the function
player1=Player()
player2=Player()

# call the functions and print out the payoff for player 1 in each games
print(payoff_to_player1(player1,player2,tc1_payoffs))
print(payoff_to_player1(player1,player2,tc2_payoffs))

# make two random strategy players with memory depth=3 to call the function
player1=Player(depth=3)
player2=Player(depth=3)

# call the functions and print out the payoff for player 1 in each games
print(payoff_to_player1(player1,player2,tc1_payoffs))
print(payoff_to_player1(player1,player2,tc2_payoffs))



# 2(b)
def next_move(player1, player2, round):    
    #your code goes here 
    #every round starts from 1, when round is 1 use defaults
    lengthBitsCom=player1.depthOf*2
    if round==1:
         calculatedBits=0
         sumOfDefaultsBits=np.append(player1.defaults, player2.defaults)
         #use this calculation since memory depth can be flexible (default depth=2)
         for i in range(lengthBitsCom):
             calculatedBits+=sumOfDefaultsBits[i]*(2**(lengthBitsCom-i-1))
         player1Cal=player1.strategy[calculatedBits]
    # when round is not 1(in this case from 2~) use memory
    else:
         calculatedBits=0
         sumOfMemoryBits=np.append(player1.memory,player2.memory)
         for i in range(lengthBitsCom):
             calculatedBits+=sumOfMemoryBits[i]*(2**(lengthBitsCom-i-1))
         player1Cal=player1.strategy[calculatedBits]
    player1_move=player1Cal
    return player1_move

# make two random strategy players with memory dept=2 to call the function
player1=Player()
player2=Player()

# call the functions with players, specific round and print out the player1's next move
print(next_move(player1,player2,1))
print(next_move(player1,player2,2)) 

# make two random strategy players with memory dept=3 to call the function
player1=Player(depth=3)
player2=Player(depth=3)

# call the functions with players, specific round and print out the player1's next move
print(next_move(player1,player2,1))
print(next_move(player1,player2,2)) 



# 2(c)
def process_move(player, move, memory_depth):
    # your code goes here
    if np.size(player.memory) != memory_depth:
          return False
       # make new memory bits with the move bit
    else:
          for i in range(memory_depth):
                if i==memory_depth-1:
                      player.memory[i]=move
                else:
                      player.memory[i]=player.memory[i+1]

          return True
 

# call the function with memory depth=3
player1=Player(depth=3)
print(process_move(player1,1,3))
print(process_move(player1,0,3))

# call the function with memory depth=2 (default)
player2=Player()
print(process_move(player2,1,2))
print(process_move(player2,0,2))


# 2(d)
def score(player1, player2, m_depth, n_rounds, game):
    # your code goes here
    score_to_player1=0
    for rounds in range(n_rounds):
        p1Move=next_move(player1,player2,round)
        p2Move=next_move(player2,player1,round)
        process_move(player1,p1Move,m_depth)
        process_move(player2,p2Move,m_depth)
        score_to_player1 += payoff_to_player1(player1,player2,game)
    return score_to_player1

# call the function 
player1=Player()
player2=Player()
print(score(player1, player2, 2, 3, tc1_payoffs))
print(score(player1, player2, 2, 3, tc2_payoffs))





# 2(e)
# Create the toolbox with the right parameters
def create_toolbox(num_bits):
    creator.create("FitnessMax", base.Fitness, weights=(1.0,))
    creator.create("Individual", list, fitness=creator.FitnessMax)
    toolbox = base.Toolbox()
    # cooperate =0 and defect=1
    toolbox.register("attr_bool", random.randint, 0, 1)
    #generates individuals 
    toolbox.register("individual", tools.initRepeat, creator.Individual, toolbox.attr_bool, num_bits)
    # define the population to be a list of individuals
    toolbox.register("population", tools.initRepeat, list, toolbox.individual)
    # register the crossover operator
    toolbox.register("cross", tools.cxTwoPoint)
    # flip each attribute/gene of 0.05: mutate function (5% probability)
    toolbox.register("mutate", tools.mutFlipBit, indpb=0.05)
    # drawn randomly from the current generation through selBes function
    toolbox.register("select", tools.selBes)
    #evaulation for the individuals will be score
    toolbox.register("evalute", score)
    return toolbox
    


# This function implements the evolutionary algorithm for the game
def play_game(mem_depth, population_size, generation_size, n_rounds, game): 
    # your code goes here: calculate the bits using the mem_depth value
    num_bits=2**(2*mem_depth)+2*mem_depth

    # Create a toolbox using the above parameter
    toolbox = create_toolbox(num_bits)

    # Seed the random number generator
    random.seed(3)

    # Create an initial population of n individuals
    population = toolbox.population(n = population_size)

    # Define probabilities of crossing and mutating
    probab_crossing, probab_mutating  = 0.5, 0.2    
    
    print('\nStarting the evolution process')
    
    # Evaluate the entire population    
    fitnesses = []

    for individual in population:
          fitness=0
          for adversary in population:
                fitness += toolbox.evaluate(individual, adversary, mem_depth, n_rounds, game)
          individual.fitness.value = fitness
          fitnesses.append(individual.fitness.value)
      # need to replace the adversary  
    
    print('\nEvaluated', len(population), 'individuals')
    print(fitnesses)
 
    # Iterate through generations
    for g in range(generation_size):
        #children is the best half of the population
        children =toolbox.select(population, k=int(population_size/2))
        while children.len < population_size:
              children.append(random.choice(children))

        for child1, child2 in zip(children[::2], children[1::2]):
            # cross two individuals with probability 'probab_crossing'
            if random.random() < probab_crossing:
                toolbox.cross(child1, child2)

                # fitness values of the children
                # must be recalculated later
                del child1.fitness.values
                del child2.fitness.values
        
        for mutant in children:
            # mutate an individual with probability MUTPB
            if random.random() < probab_mutating:
                toolbox.mutate(mutant)
                del mutant.fitness.values
        #population replaced
        population[:]=children

        print("\n===== Generation", g)



if __name__ == "__main__":
    mem_depth = 2
    population_size = 10
    generation_size = 5
    n_rounds = 4

    print('===================')
    print('Play the game ITC1')
    print('===================')
    play_game(mem_depth, population_size, generation_size, n_rounds, tc1_payoffs)

    print('\n\n===================')
    print('Play the game ITC2')
    print('===================')
    play_game(mem_depth, population_size, generation_size, n_rounds, tc2_payoffs)

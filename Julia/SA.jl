# Importar bibliotecas necesarias
using Random
using Printf

# Definir la función de costo (distancia Euclidiana)
function costo(cities, tour)
    total = 0.0
    n = length(tour)
    for i in 1:n-1
        city1 = tour[i]
        city2 = tour[i+1]
        total += sqrt((cities[city2, 1]-cities[city1, 1])^2 + (cities[city2, 2]-cities[city1, 2])^2)
    end
    return total
end

# Implementar el algoritmo Simulated Annealing
function simulated_annealing_tsp(cities, initial_solution, initial_temperature, final_temperature, cooling_rate)
    current_solution = copy(initial_solution)
    best_solution = copy(initial_solution)
    current_cost = costo(cities, current_solution)
    best_cost = current_cost
    temperature = initial_temperature

    while temperature > final_temperature
        for i in 1:length(current_solution)
            j = rand(1:length(current_solution))
            current_solution[i], current_solution[j] = current_solution[j], current_solution[i]
            new_cost = costo(cities, current_solution)

            if new_cost < current_cost
                current_cost = new_cost

                if new_cost < best_cost
                    best_solution = copy(current_solution)
                    best_cost = new_cost
                end
            else
                p = exp((current_cost - new_cost) / temperature)

                if rand() < p
                    current_cost = new_cost
                else
                    current_solution[i], current_solution[j] = current_solution[j], current_solution[i]
                end
            end
        end

        temperature *= cooling_rate
    end

    return best_solution, best_cost
end




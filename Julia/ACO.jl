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

# Implementar el algoritmo ACO
function aco_tsp(cities, n_ants, n_iterations, evaporation_rate, alpha, beta)
    n_cities = size(cities, 1)
    best_tour = zeros(Int, n_cities)
    best_cost = Inf
    
    # Inicializar matriz de feromonas
    pheromones = fill(1.0 / n_cities, n_cities, n_cities)
    
    for iter in 1:n_iterations
        # Construir soluciones de cada hormiga
        tours = []
        for ant in 1:n_ants
            visited = falses(n_cities)
            tour = [rand(1:n_cities)]
            visited[tour[1]] = true
            while length(tour) < n_cities
                current_city = tour[end]
                unvisited_cities = [c for c in 1:n_cities if !visited[c]]
                probabilities = [pheromones[current_city, c]^alpha * (1.0 / costo(cities, [tour; c]))^beta for c in unvisited_cities]
                probabilities /= sum(probabilities)
                next_city = unvisited_cities[findmax(probabilities)[2]]
                push!(tour, next_city)
                visited[next_city] = true
            end
            push!(tours, tour)
        end
        
        # Actualizar feromonas
        pheromones *= evaporation_rate
        for ant in 1:n_ants
            tour = tours[ant]
            tour_cost = costo(cities, tour)
            if tour_cost < best_cost
                best_tour = copy(tour)
                best_cost = tour_cost
            end
            for i in 1:n_cities-1
                city1 = tour[i]
                city2 = tour[i+1]
                pheromones[city1, city2] += 1.0 / tour_cost
                pheromones[city2, city1] += 1.0 / tour_cost
            end
        end
    end
    
    return best_tour, best_cost
end
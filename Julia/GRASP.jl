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

# Implementar el algoritmo GRASP para el TSP
function grasp_tsp(cities, n_iterations, alpha)
    n_cities = size(cities, 1)
    best_tour = zeros(Int, n_cities)
    best_cost = Inf
    
    for iter in 1:n_iterations
        # Construir solución inicial
        candidate_tour = randperm(n_cities)
        
        # Mejorar la solución utilizando búsqueda local (2-opt)
        improved_tour, improved_cost = local_search(cities, candidate_tour)
        
        # Actualizar la mejor solución encontrada
        if improved_cost < best_cost
            best_tour = copy(improved_tour)
            best_cost = improved_cost
        end
    end
    
    return best_tour, best_cost
end

# Implementar la búsqueda local utilizando 2-opt
function local_search(cities, tour)
    n_cities = length(tour)
    best_tour = copy(tour)
    best_cost = costo(cities, tour)
    improved = true
    
    while improved
        improved = false
        
        for i in 2:n_cities-1
            for j in i+1:n_cities
                new_tour = reverse(tour[i:j])
                new_cost = costo(cities, new_tour)
                
                if new_cost < best_cost
                    best_tour[i:j] = new_tour
                    best_cost = new_cost
                    improved = true
                end
            end
        end
        
        tour = copy(best_tour)
    end
    
    return best_tour, best_cost
end


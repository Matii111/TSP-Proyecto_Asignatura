# Importar los archivos ACO.jl, GRASP.jl y SA.jl
include("ACO.jl")
include("GRASP.jl")
include("SA.jl")

# Datos de prueba
cities = [0.0 0.0;
          1.0 1.0;
          2.0 2.0;
          3.0 3.0;
          4.0 4.0]
n_ants = 10
n_iterations = 100
evaporation_rate = 0.5
alpha = 1.0
beta = 1.0
initial_solution = [1, 2, 3, 4, 5]
initial_temperature = 100.0
final_temperature = 0.1
cooling_rate = 0.99

println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
# Ejecutar GRASP
println("-------------RESULTADOS-GRASP-----------------")
@time begin
    best_tour_grasp, best_cost_grasp = grasp_tsp(cities, n_iterations, alpha)
end
println("Mejor recorrido encontrado (GRASP): ", best_tour_grasp)
println("Costo del mejor recorrido (GRASP): ", best_cost_grasp)

# Ejecutar SA
println("--------RESULTADOS-Simulated_Annealing--------")
@time begin
    best_tour_sa, best_cost_sa = simulated_annealing_tsp(cities, initial_solution, initial_temperature, final_temperature, cooling_rate)
end
println("Mejor recorrido encontrado (SA): ", best_tour_sa)
println("Costo del mejor recorrido (SA): ", best_cost_sa)
# Ejecutar ACO
println("--------------RESULTADOS-ACO------------------")
@time begin
    best_tour_aco, best_cost_aco = aco_tsp(cities, n_ants, n_iterations, evaporation_rate, alpha, beta)
end
println("Mejor recorrido encontrado (ACO): ", best_tour_aco)
println("Costo del mejor recorrido (ACO): ", best_cost_aco)

println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
include("Include.jl")

# load the data dictionary -

data_dictionary = no_regulation_aerobic_data_dictionary(0,0,0)
#data_dictionary = no_regulation_anaerobic_data_dictionary(0,0,0)
#data_dictionary = regulation_aerobic_data_dictionary(0,0,0)
#data_dictionary = regulation_anaerobic_data_dictionary(0,0,0)


# solve the lp problem -
(objective_value, flux_array, dual_array, uptake_array, exit_flag) = FluxDriver(data_dictionary)

{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf470
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww25400\viewh14500\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 ## CHEME7770 Problem Set 2, Problem 2 Ferra Pinnock \
\

\b This repository holds 
\b0 the flux balance analyses (FBA)for Problem 2, part B. The maximum growth rate per unit glucose uptake and flux array was calculated for 4 cases:\
     
\b case 1:
\b0  aerobic culture without constraints (see : \'93aerobic_without_constraints.txt\'94) \
     
\b case 2:
\b0   anaerobic culture without constraints (see : \'93anaerobic_without_constraints.txt\'94) \
     
\b case 3:
\b0   aerobic culture with constraints (see : \'93aerobic_with_constraints.txt\'94) \
     
\b case 4: 
\b0  anaerobic culture with constraints (see : \'93anaerobic_with_constraints.txt\'94) \
\
The FBA problem is taken from the E.coli network example developed by the Palsson Laboratory [Palsson laboratory](http://systemsbiology.ucsd.edu/Downloads/EcoliCore) and is described in [EcoSal Chapter 10.2.1 - Reconstruction and Use of Microbial Metabolic Networks: the Core Escherichia coli Metabolic Model as an Educational Guide by Orth, Fleming, and Palsson (2010)](http://www.asmscience.org/content/journal/ecosalplus/10.1128/ecosalplus.10.2.1). \
\
The code contains default constraints which are encoded in [DataDictionary.jL] and modified constraints which are encoded in [Regulation.jl].  The driver that performs the flux balance analysis calculation is given in [Solve.jl]. Running [Solve.jl] generates the maximum  growth rate and the flux array calculated  for each case. \
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\b\fs28 \cf0 \ul \ulc0 Assumptions
\b0\fs24 \ulnone \
The constraints were implemented based on the following assumptions:\
\
1) Glucose is the only extracellular carbon source present in the culture media \
2) Extracellular non-carbon nutrients (e.g. inorganic phosphate, hydrogen, water, ) are present in the culture media \
3) Under anaerobic conditions, extracellular oxygen concentration is 0  and the oxygen uptake at the cell boundary is 0 \
4) Like Palsson, assume a pH = 7.2 \
5) glucose uptake rate is the same for aerobic and anaerobic conditions \
6) in an unregulated system, all reactions are assumed to be on \
7) in a regulated system, all reactions not subject to regulation are assumed to be on. \
\
\

\b\fs28 \ul Instructions for running code for each case
\b0\fs24 \ulnone \
To run the calculation for  case 1, go to the [Solve.jl] file in the [src folder] and delete the # on line 5 to activate data_dictionary = no_regulation_aerobic_data_dictionary(0,0,0). Make sure all other lines  between 3 and 10 are commented out.  Then run  Solve.jl in Julia.  The output should match the contents of the file  \'93aerobic_without_constraints.txt\'94\
\
To run the calculation for  case 2, go to the [Solve.jl] file in the [src folder] and delete the # on line 6 to activate data_dictionary = no_regulation_anaerobic_data_dictionary(0,0,0). Make sure all other lines remain commented out.  Then run the Solve.jl in Julia. The output should match the contents of the file  \'93anaerobic_without_constraints.txt\'94\
\
To run the calculation for  case 3, go to the [Solve.jl] file in the [src folder]  and delete the # on line 7 to activate:  data_dictionary = regulation_aerobic_data_dictionary(0,0,0). Make sure all other lines remain commented out.  Then run the Solve.jl in Julia. The output should match the contents of the file  \'93aerobic_with_constraints.txt\'94\
\
To run the calculation for  case 4, go to the [Solve.jl] file in the [src folder]  and delete the # on line 8 to activate:  data_dictionary = regulation_anaerobic_data_dictionary(0,0,0). Make sure all other lines remain commented out.  Then run the Solve.jl in Julia. The output should match the contents of the file  \'93anaerobic_with_constraints.txt\'94\
\
\

\b\fs28 \ul Analysis of Results 
\b0\fs24 \ulnone \
The maximum growth rate per unit glucose uptake determined for each case is: \
        
\b case 1:
\b0  aerobic culture without constraints : -0.49850448654037904 mmol/gDw/h\
        
\b case 2:
\b0   anaerobic culture without constraints: -0.21425371013776112 mmol/gDw/h\
        
\b case 3:
\b0   aerobic culture with constraints:    -0.49850448654037904 mmol/gDw/h\
        
\b case 4: 
\b0  anaerobic culture with constraints: -0.21425371013776112 mmol/gDw/h\
\
\
Growth rate did not vary between the regulated and unregulated network for both the aerobic culture and the anaerobic culture. Not all reactions are governed by the regulatory system. Based on these model predictions, the reactions that are subject to regulation do not play a substantial role in the optimal E.coli growth rate on glucose otherwise we would expect to see sizable differences between the growth with constraint and growth without constraints. \
\
The flux distributions are equivalent for aerobic conditions with and without constraints. In the presence of extracellular oxygen, the some of the larger fluxes observed correspond to reaction numbers 22 (22.45 mmol/h), 28 (21.67 mmol/h)), 50(15.05 mmol/h)  in the flux_bound _arrays in [DataDictionary.jl]. These reactions belong to the electron transport chain and oxidative phosphorylation pathway. This aligns with Palsson\'92s findings that flux through the election transport chain is high under aerobic conditions.  However, Palsson predicts higher maximum growth rate of 0.87 mmol/gDW/h under aerobic conditions. This discrepancy likely stems from differences in the constraint specifications, such as differing uptake or production rates of non-carbon nutrients or cell byproducts.  \
\
The flux distributions are equivalent for anaerobic conditions with and without constraints. In the absence of extracellular oxygen, the some of the larger fluxes observed correspond to reaction numbers 2 (7.99 mmol/h), 31(15.26 mmol/h), and 48( 9.99 mmol/h) in the flux_bound _arrays in [DataDictionary.jl]. These reactions belong to fermentation, glycolysis, and the uptake of protons to generate water for biomass production. Anaerobic respiration relies on fermentation to generate energy for the cell in the form of ATP, which explains the heightened flux through this pathway.  As expected, the larger flux rates for the anaerobic cases are, on average, smaller than those observed above for aerobic conditions. In general, these results highlight that optimal cell growth is stunted under anaerobic respiration. \
\

\b\fs28 \ul Constraints \

\b0\fs24 \ulnone Constraints on  metabolite  extracellular and intracellular uptake, consumption, and production were specified  in [Regulation.jl] by altering t the upper and lower bounds for the species_bounds_array defined in [DataDictionary.jl]. The  positive upper bound values conveyed rates of production of intracellular species (denoted with a c)  and rates of secretion for boundary species (denoted with a b). The negative lower bound values conveyed rates of uptake for boundary species (denoted with a b) or consumption of intracellular species. 0 corresponded to no flux in that direction. These bounds were adjusted to capture the desired environmental conditions. \
\
To specify regulatory constraints, an aerobic_regulation_array and an anaerobic_regulation_array were declared for aerobic functions and anaerobic functions respectively. Each element of these 142x1 arrays corresponded to the 142 reaction fluxes defined in the flux_bounds_array. In an unregulated system, all reactions were assumed to be on, so all elements of the regulation array were set equal to 1. To generate the flux distribution, the regulation array was multiplied by the upper bound (2nd column) of the flux_bound_array to obtain results for 
\i optimal
\i0  growth. In a regulated system, boolean rules were used to implement the regulatory rules given in Tables 16 and 17 of EcoSal Chapter 10.2.1. These boolean rules modified the regulation array to turn certain reactions on or off given certain environmental conditions (e.g presence of absence of oxygen). 
\b\fs28 \ul \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\fs24 \cf0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\b0 \cf0 \ulnone \
\
\
\
\
\
\
 \
\
\
\
\
\
}
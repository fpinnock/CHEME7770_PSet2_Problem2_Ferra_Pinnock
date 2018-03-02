
function no_regulation_anaerobic_data_dictionary(time_start,time_step,time_stop)

    # Get Default data data dictionary
    data_dictionary = DataDictionary(time_start,time_step,time_stop)

    # Get default objective coefficient array
    objective_coefficient_array = data_dictionary["objective_coefficient_array"]
    objective_coefficient_array[24] = -1.0

    # Get default flux bound array
    default_flux_bounds_array = data_dictionary["default_flux_bounds_array"]
    default_flux_bounds_array[21,2] = 0.0

    # Setup species bound array
    species_bounds_array =  data_dictionary["species_bounds_array"]
    species_bounds_array[57,1] = 0 # M_o2_e absent from extracellular environment

        # setup exchange array -
        exchange_array = [
            0.0	  100.0	;	# 73 M_ac_b
            0.0   0.0	;	# 74 M_acald_b
            0.0   0.0	;	# 75 M_akg_b
            0.0	  100.0	;	# 76 M_co2_b
            0.0   8.0	;	# 77 M_etoh_b
            0.0	  100.0	;	# 78 M_for_b
            0.0	  0.0	;	# 79 M_fru_b
            0.0	  0.0	;	# 80 M_fum_b
          -10.0	  0.0	;	# 81 M_glc_D_b # only glucose uptake
            0.0	  0.0	;	# 82 M_gln_L_b
            0.0	  0.0	;	# 83 M_glu_L_b
         -10.0	  10.0	;	# 84 M_h2o_b
         -100.0	  100.0	;	# 85 M_h_b
            0.0	  100.0	;	# 86 M_lac_D_b
            0.0	  0.0	;	# 87 M_mal_L_b
         -100.0	  100.0	;	# 88 M_nh4_b
            0.0	  0.0	;	# 89 M_o2_b  no uptake of oxygen under anaerobic conditions
          -100.0  100.0	;	# 90 M_pi_b
            0.0	  0.0	;	# 91 M_pyr_b
            0.0	  0.0	;	# 92 M_succ_b
        ]

        # how many unbalanced species do we have?
        offset = 72
        (number_of_exchange_species,number_of_bounds) = size(exchange_array)
        for exchange_index = 1:number_of_exchange_species

            bounds_row_index = offset+exchange_index

            # update the lower bound -
            species_bounds_array[bounds_row_index,1] = exchange_array[exchange_index,1]

            # update the upper bound -
            species_bounds_array[bounds_row_index,2] = exchange_array[exchange_index,2]
        end

    # Setup no_regulation_aerobic_array
    no_regulation_anaerobic_array = ones(142,1)

    # Generate modified flux_bounds_array to account for no regulation
    default_flux_bounds_array = default_flux_bounds_array[:2]*no_regulation_anaerobic_array

      return data_dictionary
end



function no_regulation_aerobic_data_dictionary(time_start,time_step,time_stop)

    # Get Default data data dictionary
    data_dictionary = DataDictionary(time_start,time_step,time_stop)

    # Get default objective coefficient array
    objective_coefficient_array = data_dictionary["objective_coefficient_array"]
    objective_coefficient_array[24] = -1.0

    # Get default flux bound array
    default_flux_bounds_array = data_dictionary["default_flux_bounds_array"]
    default_flux_bounds_array[21,2] = 0.0


    # Setup species bound array
    species_bounds_array =  data_dictionary["species_bounds_array"]
    species_bounds_array[57,1] = -1.0  # M_o2_e present in extracellular environment

    # setup exchange array -
    exchange_array = [
        0.0	   10.0	;	# 73 M_ac_b
        0.0   	0.0	;	# 74 M_acald_b
        0.0	    0.0	;	# 75 M_akg_b
        0.0	  100.0	;	# 76 M_co2_b
        0.0	    0.0	;	# 77 M_etoh_b
        0.0	    0.0	;	# 78 M_for_b
        0.0	    0.0	;	# 79 M_fru_b
        0.0   	0.0	;	# 80 M_fum_b
        -10.0	0.0	;	# 81 M_glc_D_b
        0.0	    0.0	;	# 82 M_gln_L_b
        0.0	    0.0	;	# 83 M_glu_L_b
      -10.0	   10.0	;	# 84 M_h2o_b
     -100.0	  100.0	;	# 85 M_h_b
        0.0	    1.0	;	# 86 M_lac_D_b
        0.0	    0.0	;	# 87 M_mal_L_b
     -100.0	  100.0	;	# 88 M_nh4_b
      -20.0	    0.0	;	# 89 M_o2_b
      -4.0	    0.0	;	# 90 M_pi_b
        0.0	    0.0	;	# 91 M_pyr_b
        0.0	    0.0	;	# 92 M_succ_b
     ]

    	# how many unbalanced species do we have?
    	offset = 72
    	(number_of_exchange_species,number_of_bounds) = size(exchange_array)
    	for exchange_index = 1:number_of_exchange_species

    		bounds_row_index = offset+exchange_index

    		# update the lower bound -
    		species_bounds_array[bounds_row_index,1] = exchange_array[exchange_index,1]

    		# update the upper bound -
    		species_bounds_array[bounds_row_index,2] = exchange_array[exchange_index,2]
    	end

     # Setup no_regulation_aerobic_array
     no_regulation_aerobic_array = ones(142,1)

     # Generate modified flux_bounds_array to account for no regulation
     default_flux_bounds_array = default_flux_bounds_array[:2]*no_regulation_aerobic_array

      return data_dictionary
end



function regulation_anaerobic_data_dictionary(time_start,time_step,time_stop)

    # Get Default data data dictionary
    data_dictionary = DataDictionary(time_start,time_step,time_stop)

    # Get default objective coefficient array
    objective_coefficient_array = data_dictionary["objective_coefficient_array"]
    objective_coefficient_array[24] = -1.0

    # Get default flux bound array
    default_flux_bounds_array = data_dictionary["default_flux_bounds_array"]
    default_flux_bounds_array[21,2] = 0.0


    # Setup species bound array
    species_bounds_array =  data_dictionary["species_bounds_array"]
    species_bounds_array[57,1] = 0  # M_o2_e not present in extracellular environment

        # setup exchange array -
        exchange_array = [
            0.0	  100.0	;	# 73 M_ac_b
            0.0   0.0	;	# 74 M_acald_b
            0.0   0.0	;	# 75 M_akg_b
            0.0	  100.0	;	# 76 M_co2_b
            0.0   8.0	;	# 77 M_etoh_b
            0.0	  100.0	;	# 78 M_for_b
            0.0	  0.0	;	# 79 M_fru_b
            0.0	  0.0	;	# 80 M_fum_b
          -10.0	  0.0	;	# 81 M_glc_D_b  only glucose uptake
            0.0	  0.0	;	# 82 M_gln_L_b
            0.0	  0.0	;	# 83 M_glu_L_b
          -10.0	  10.0	;	# 84 M_h2o_b
         -100.0	  100.0	;	# 85 M_h_b
            0.0	  100.0	;	# 86 M_lac_D_b
            0.0	  0.0	;	# 87 M_mal_L_b
         -100.0	  100.0	;	# 88 M_nh4_b
            0.0	  0.0	;	# 89 M_o2_b  no uptake of oxygen under anaerobic conditions
          -100.0  100.0	;	# 90 M_pi_b
            0.0	  0.0	;	# 91 M_pyr_b
            0.0	  0.0	;	# 92 M_succ_b
        ]

        # how many unbalanced species do we have?
        offset = 72
        (number_of_exchange_species,number_of_bounds) = size(exchange_array)
        for exchange_index = 1:number_of_exchange_species

            bounds_row_index = offset+exchange_index

            # update the lower bound -
            species_bounds_array[bounds_row_index,1] = exchange_array[exchange_index,1]

            # update the upper bound -
            species_bounds_array[bounds_row_index,2] = exchange_array[exchange_index,2]
        end

    # Define presence of extracellular variables (0 = not present/false, 1 = present/true)
     o2_e = 0 # oxygen
     succ_e = 0 #succinate
     fum_e = 0 # fumeras
     malL_e = 0 # malate
     glcD_e = 1 #glucose
     Biomass = 1
     ac_e = 0 #acetate
     nh4_e = 1 #ammonium
     pi_e = 1 # inorganic phosphate
     lacD_e = 0 #lactate
     fru_e = 0 # fructose not present
     gluL_e = 0 #glutamate

     #Define presence of regulators given extracellular variables for anaerobic environment
     FBP = 0 # fructose biphosphate
     TKT2 = 0
     TALA = 0
     PGI = 0
     ME2 = 1 # malic enzyme (NAD)
     ME1 = 1 # malic enzyme (NADP)
     LDH_D = 1-o2_e # fermentation occurs under anaerobic conditions (pg.19)
     ArcA = 1-o2_e
     DcuS = max(succ_e,fum_e,malL_e)
     DcuR = DcuS
     CRPnoGLM = max(1-glcD_e,1-malL_e,1-lacD_e)
     SUCCt2_2 = o2_e # Succt2_2 inactivated under anaerobic conditions (Pg.29)
     FadR = max(glcD_e,1-ac_e)
     Fis = Biomass
     Fnr = 1-o2_e
     surplusFDP = max(min(1-FBP,max(1-TKT2,1-TALA,1-PGI)),fru_e)
     FruR = 1-surplusFDP
     PYK = 1-FruR; #FruR represses pykF coding for pyruvate kinase, PYK(Pg.31)
     PFK = PGI  # phosphofrucokinase,
     GLCpts = glcD_e  #FruR induces ptsG coding for D-glucose transport GLCpts (Pg.31)
     surplusPYR = min(max(1-ME2,1-ME1),max(1-GLCpts,1-PYK,1-PFK,1-LDH_D,1-SUCCt2_2))
     GlcC = ac_e
     GlnG = 1-nh4_e
     IclR = FadR
     Mlc = 1-glcD_e
     NRI_low = GlnG
     NRI_hi = NRI_low
     Nac = NRI_low
     PdhR = 1-surplusPYR
     PhoR = 1-pi_e
     PhoB = PhoR
     CRPnoGLC = 1-glcD_e

     # Setup default anaerobic_regulation_array where all reactions turned off
     anaerobic_regulation_array = ones(142,1) # some genes not regulated and assumed active (Pg.27)

     # Modify on & off reactions in aerobic regulation array based on anaerobic regulators
     anaerobic_regulation_array[1] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     anaerobic_regulation_array[2] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     anaerobic_regulation_array[3] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     anaerobic_regulation_array[4] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     anaerobic_regulation_array[5] = max(CRPnoGLC,Fnr)
     anaerobic_regulation_array[6] = max(CRPnoGLC,Fnr)
     anaerobic_regulation_array[18] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     anaerobic_regulation_array[19] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     anaerobic_regulation_array[28] = max(1-Fnr,ArcA)
     anaerobic_regulation_array[29] = max(1-ArcA,min(1-ArcA,GlcC))
     anaerobic_regulation_array[30] = max(1-ArcA,min(1-ArcA,GlcC))
     anaerobic_regulation_array[65] = max(ArcA,min(Fnr,CRPnoGLC))
     anaerobic_regulation_array[66] = max(ArcA,min(Fnr,CRPnoGLC))
     anaerobic_regulation_array[67] = max(Fnr,DcuR)
     anaerobic_regulation_array[68] = max(CRPnoGLM,1-Mlc)
     anaerobic_regulation_array[69] = max(max(1-ArcA,1-Fnr),max(Fnr,CRPnoGLC,DcuR))
     anaerobic_regulation_array[70] = max(max(1-ArcA,1-Fnr),max(Fnr,CRPnoGLC,DcuR))
     anaerobic_regulation_array[71] = min(CRPnoGLM,1-ArcA,DcuR)
     anaerobic_regulation_array[76] = max(CRPnoGLM,1-Mlc,1-FruR)
     anaerobic_regulation_array[77] = CRPnoGLC
     anaerobic_regulation_array[79] = max(1-Nac,1-gluL_e)
     anaerobic_regulation_array[80] = max(1-Nac,1-gluL_e)
     anaerobic_regulation_array[81] = max(1-glcD_e,min(nh4_e,1-CRPnoGLC))
     anaerobic_regulation_array[82] = min(1-NRI_hi,1-gluL_e)
     anaerobic_regulation_array[90] = min(1-IclR,max(1-ArcA,FruR))
     anaerobic_regulation_array[93] = max(min(1-IclR,min(1-ArcA,FruR)),min(1-ArcA,GlcC))
     anaerobic_regulation_array[94] = min(CRPnoGLM,1-ArcA,DcuR)
     anaerobic_regulation_array[95] = 1-ArcA
     anaerobic_regulation_array[96] = 1-ArcA
     anaerobic_regulation_array[99] = max(1-ArcA,1-Fnr)
     anaerobic_regulation_array[105] = max(1-PdhR,Fis)
     anaerobic_regulation_array[107] = max(max(ArcA,Fnr),max(Fnr,CRPnoGLC),max(ArcA,min(Fnr,CRPnoGLC)))
     anaerobic_regulation_array[115] = 1-PhoB
     anaerobic_regulation_array[116] = 1-PhoB
     anaerobic_regulation_array[119] = FruR
     anaerobic_regulation_array[122] = 1-FruR
     anaerobic_regulation_array[129] = min(CRPnoGLM,1-ArcA,DcuR)
     anaerobic_regulation_array[131] = max(max(1-ArcA,1-Fnr),CRPnoGLC,Fis)

     # Generate modified flux_bounds_array to account for regulation under anaerobic conditions
     default_flux_bounds_array = default_flux_bounds_array[:2]*anaerobic_regulation_array

      return data_dictionary
end



function regulation_aerobic_data_dictionary(time_start,time_step,time_stop)

    # Get Default data data dictionary
    data_dictionary = DataDictionary(time_start,time_step,time_stop)

    # Get default objective coefficient array
    objective_coefficient_array = data_dictionary["objective_coefficient_array"]
    objective_coefficient_array[24] = -1.0

    # Get default flux bound array
    default_flux_bounds_array = data_dictionary["default_flux_bounds_array"]
    default_flux_bounds_array[21,2] = 0.0

    # Setup species bound array
    species_bounds_array =  data_dictionary["species_bounds_array"]
    species_bounds_array[57,1] = -1.0  # M_o2_e present in extracellular environment

        # setup exchange array -
        exchange_array = [
        0.0	   10.0	;	# 73 M_ac_b
        0.0   	0.0	;	# 74 M_acald_b
        0.0	    0.0	;	# 75 M_akg_b
        0.0	  100.0	;	# 76 M_co2_b
        0.0	    0.0	;	# 77 M_etoh_b
        0.0	    0.0	;	# 78 M_for_b
        0.0	    0.0	;	# 79 M_fru_b
        0.0   	0.0	;	# 80 M_fum_b
       -10.0	0.0	;	# 81 M_glc_D_b
        0.0	    0.0	;	# 82 M_gln_L_b
        0.0	    0.0	;	# 83 M_glu_L_b
       -10.0	10.0;	# 84 M_h2o_b
      -100.0	100.0;	# 85 M_h_b
         0.0	1.0	;	# 86 M_lac_D_b
         0.0	 0.0;	# 87 M_mal_L_b
      -100.0   100.0;	# 88 M_nh4_b
       -20.0	 0.0;	# 89 M_o2_b
      -100.0   100.0;	# 90 M_pi_b
         0.0	 0.0;	# 91 M_pyr_b
         0.0	 0.0;	# 92 M_succ_b
          ]

   # how many unbalanced species do we have?
   offset = 72
   (number_of_exchange_species,number_of_bounds) = size(exchange_array)
   for exchange_index = 1:number_of_exchange_species

       bounds_row_index = offset+exchange_index

       # update the lower bound -
       species_bounds_array[bounds_row_index,1] = exchange_array[exchange_index,1]

       # update the upper bound -
       species_bounds_array[bounds_row_index,2] = exchange_array[exchange_index,2]
   end

    # Define presence of extracellular variables (0 = not present/false, 1 = present/true)
     o2_e = 1 # oxygen
     succ_e = 0 #succinate
     fum_e = 0 # fumeras
     malL_e = 0 # malate
     glcD_e = 1 #glucose
     Biomass = 1
     ac_e = 0 #acetate
     nh4_e = 1 #ammonium
     pi_e = 1 # inorganic phosphate
     lacD_e = 0 #lactate
     fru_e = 0 # fructose not present
     gluL_e = 0 #glutamate

     #Define presence of regulators given extracellular variables for anaerobic environment
     FBP = 0 # fructose biphosphate
     TKT2 = 0
     TALA = 0
     PGI = 0
     ME2 = 1 # malic enzyme (NAD)
     ME1 = 1 # malic enzyme (NADP)
     LDH_D = 1-o2_e # fermentation occurs under anaerobic conditions (pg.19)
     ArcA = 1-o2_e
     DcuS = max(succ_e,fum_e,malL_e)
     DcuR = DcuS
     CRPnoGLM = max(1-glcD_e,1-malL_e,1-lacD_e)
     SUCCt2_2 = o2_e # Succt2_2 inactivated under anaerobic conditions (Pg.29)
     FadR = max(glcD_e,1-ac_e)
     Fis = Biomass
     Fnr = 1-o2_e
     surplusFDP = max(min(1-FBP,max(1-TKT2,1-TALA,1-PGI)),fru_e)
     FruR = 1-surplusFDP
     PYK = 1-FruR; #FruR represses pykF coding for pyruvate kinase, PYK(Pg.31)
     PFK = PGI  # phosphofrucokinase,
     GLCpts = glcD_e  #FruR induces ptsG coding for D-glucose transport GLCpts (Pg.31)
     surplusPYR = min(max(1-ME2,1-ME1),max(1-GLCpts,1-PYK,1-PFK,1-LDH_D,1-SUCCt2_2))
     GlcC = ac_e
     GlnG = 1-nh4_e
     IclR = FadR
     Mlc = 1-glcD_e
     NRI_low = GlnG
     NRI_hi = NRI_low
     Nac = NRI_low
     PdhR = 1-surplusPYR
     PhoR = 1-pi_e
     PhoB = PhoR
     CRPnoGLC = 1-glcD_e

     # Setup default anaerobic_regulation_array where all reactions turned off
     aerobic_regulation_array = ones(142,1) # some genes not regulated and assumed active (Pg.27)

     # Modify on & off reactions in aerobic regulation array based on anaerobic regulators
     aerobic_regulation_array[1] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     aerobic_regulation_array[2] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     aerobic_regulation_array[3] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     aerobic_regulation_array[4] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     aerobic_regulation_array[5] = max(CRPnoGLC,Fnr)
     aerobic_regulation_array[6] = max(CRPnoGLC,Fnr)
     aerobic_regulation_array[18] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     aerobic_regulation_array[19] = max(1-o2_e,min(1-o2_e,1-FruR),Fis)
     aerobic_regulation_array[28] = max(1-Fnr,ArcA)
     aerobic_regulation_array[29] = max(1-ArcA,min(1-ArcA,GlcC))
     aerobic_regulation_array[30] = max(1-ArcA,min(1-ArcA,GlcC))
     aerobic_regulation_array[65] = max(ArcA,min(Fnr,CRPnoGLC))
     aerobic_regulation_array[66] = max(ArcA,min(Fnr,CRPnoGLC))
     aerobic_regulation_array[67] = max(Fnr,DcuR)
     aerobic_regulation_array[68] = max(CRPnoGLM,1-Mlc)
     aerobic_regulation_array[69] = max(max(1-ArcA,1-Fnr),max(Fnr,CRPnoGLC,DcuR))
     aerobic_regulation_array[70] = max(max(1-ArcA,1-Fnr),max(Fnr,CRPnoGLC,DcuR))
     aerobic_regulation_array[71] = min(CRPnoGLM,1-ArcA,DcuR)
     aerobic_regulation_array[76] = max(CRPnoGLM,1-Mlc,1-FruR)
     aerobic_regulation_array[77] = CRPnoGLC
     aerobic_regulation_array[79] = max(1-Nac,1-gluL_e)
     aerobic_regulation_array[80] = max(1-Nac,1-gluL_e)
     aerobic_regulation_array[81] = max(1-glcD_e,min(nh4_e,1-CRPnoGLC))
     aerobic_regulation_array[82] = min(1-NRI_hi,1-gluL_e)
     aerobic_regulation_array[90] = min(1-IclR,max(1-ArcA,FruR))
     aerobic_regulation_array[93] = max(min(1-IclR,min(1-ArcA,FruR)),min(1-ArcA,GlcC))
     aerobic_regulation_array[94] = min(CRPnoGLM,1-ArcA,DcuR)
     aerobic_regulation_array[95] = 1-ArcA
     aerobic_regulation_array[96] = 1-ArcA
     aerobic_regulation_array[99] = max(1-ArcA,1-Fnr)
     aerobic_regulation_array[105] = max(1-PdhR,Fis)
     aerobic_regulation_array[107] = max(max(ArcA,Fnr),max(Fnr,CRPnoGLC),max(ArcA,min(Fnr,CRPnoGLC)))
     aerobic_regulation_array[115] = 1-PhoB
     aerobic_regulation_array[116] = 1-PhoB
     aerobic_regulation_array[119] = FruR
     aerobic_regulation_array[122] = 1-FruR
     aerobic_regulation_array[129] = min(CRPnoGLM,1-ArcA,DcuR)
     aerobic_regulation_array[131] = max(max(1-ArcA,1-Fnr),CRPnoGLC,Fis)

     # Generate modified flux_bounds_array to account for regulation under anaerobic conditions
     default_flux_bounds_array = default_flux_bounds_array[:2]*aerobic_regulation_array

     return data_dictionary
end

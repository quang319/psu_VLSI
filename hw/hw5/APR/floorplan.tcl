
create_floorplan -core_width 500 -core_height 500 -control_type aspect_ratio

set_app_var physopt_hard_keepout_distance 10

set_route_zrt_global_options -effort low -timing_driven false -crosstalk_driven false 


set_app_var placer_max_cell_density_threshold 0.6

set_app_var placer_reduce_high_density_regions true


create_fp_placement -timing_driven

save_mw_cel -as conv_tile_floorplan



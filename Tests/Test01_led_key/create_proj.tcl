#
# Vivado (TM) v2017.1 (64-bit)
#
# create_proj.tcl: Tcl script for re-creating project
#

# Get project configuration
source ./src/tcl/conf.tcl

# Create a new project
create_project $project_name ./$project_name -part $project_part
set_property target_language $proj_target_language [current_project]

# Set IP repository paths
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "[file normalize "./src/ip_repo"]" $obj
update_ip_catalog -rebuild -scan_changes

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Add source files
add_files -fileset sources_1 -norecurse -scan_for_includes ./src/rtl
import_files -fileset sources_1 -norecurse ./src/rtl

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset -srcset constrs_1
}

# Add constraint files
add_files -fileset constrs_1 -norecurse -scan_for_includes ./src/constr
import_files -fileset constrs_1 -norecurse ./src/constr

# Build the Block Design
source ./src/tcl/bd.tcl

# Create the HDL wrapper (if not user wrapper)
if {!$user_wrapper} {
	export_ip_user_files -of_objects  [get_files  ./$project_name/$project_name.srcs/sources_1/bd/design_1/design_1.bd] -sync -no_script -force -quiet
	make_wrapper -files [get_files ./$project_name/$project_name.srcs/sources_1/bd/design_1/design_1.bd] -top
	
	# Add the wrapper to the fileset
	set obj [get_filesets sources_1]
	set files [list \
	 "[file normalize "./$project_name/$project_name.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd"]"\
	]
	add_files -norecurse -fileset $obj $files
}


# Validate the BD and Generate the output products
validate_bd_design 
generate_target all [get_files ./$project_name/$project_name.srcs/sources_1/bd/design_1/design_1.bd]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$project_name/$project_name.srcs/sources_1/bd/design_1/design_1.bd]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Add the simulation Test Bench
add_files -fileset sim_1 -norecurse -scan_for_includes ./src/sim
import_files -fileset sim_1 -norecurse ./src/sim
update_compile_order -fileset sim_1


#Run synthesis

if {$run_synthesis} {
	# Create 'synth_1' run (if not found)
	if {[string equal [get_runs synth_1] ""]} {
	  create_run -simset synth_1
	}
	
	launch_runs synth_1
	wait_on_run synth_1
	
	if {$run_implementation} {
		# Create 'impl_1' run (if not found)
		if {[string equal [get_runs impl_1] ""]} {
		  create_run -simset impl_1
		}
		
		if {$gen_bitstream} {
			launch_runs -to_step write_bitstream impl_1
		}
		else {
			launch_runs impl_1
		}
		wait_on_run impl_1
		
	}
	
}
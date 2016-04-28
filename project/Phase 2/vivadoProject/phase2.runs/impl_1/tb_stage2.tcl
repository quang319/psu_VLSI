proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir {/home/grads/qxn5005/Documents/psu_VLSI/project/Phase 2/vivadoProject/phase2.cache/wt} [current_project]
  set_property parent.project_path {/home/grads/qxn5005/Documents/psu_VLSI/project/Phase 2/vivadoProject/phase2.xpr} [current_project]
  set_property ip_repo_paths {{/home/grads/qxn5005/Documents/psu_VLSI/project/Phase 2/vivadoProject/phase2.cache/ip}} [current_project]
  set_property ip_output_repo {{/home/grads/qxn5005/Documents/psu_VLSI/project/Phase 2/vivadoProject/phase2.cache/ip}} [current_project]
  add_files -quiet {{/home/grads/qxn5005/Documents/psu_VLSI/project/Phase 2/vivadoProject/phase2.runs/synth_1/tb_stage2.dcp}}
  read_xdc {{/home/grads/qxn5005/Documents/psu_VLSI/project/Phase 2/vivadoProject/phase2.srcs/sources_1/new/constrainsAndClockWiz/ucf/fpga.xdc}}
  link_design -top tb_stage2 -part xc7vx690tffg1157-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force tb_stage2_opt.dcp
  catch {report_drc -file tb_stage2_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force tb_stage2_placed.dcp
  catch { report_io -file tb_stage2_io_placed.rpt }
  catch { report_clock_utilization -file tb_stage2_clock_utilization_placed.rpt }
  catch { report_utilization -file tb_stage2_utilization_placed.rpt -pb tb_stage2_utilization_placed.pb }
  catch { report_control_sets -verbose -file tb_stage2_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force tb_stage2_routed.dcp
  catch { report_drc -file tb_stage2_drc_routed.rpt -pb tb_stage2_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file tb_stage2_timing_summary_routed.rpt -rpx tb_stage2_timing_summary_routed.rpx }
  catch { report_power -file tb_stage2_power_routed.rpt -pb tb_stage2_power_summary_routed.pb }
  catch { report_route_status -file tb_stage2_route_status.rpt -pb tb_stage2_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}


# IP package identification
startgroup
set_property vendor bjump.org [ipx::current_core]
set_property name BlackParrot [ipx::current_core]
set_property version 0.1 [ipx::current_core]
set_property display_name BlackParrot [ipx::current_core]
set_property description BlackParrot_v0_1_11d0890 [ipx::current_core]
set_property vendor_display_name {Bespoke Silicon Group} [ipx::current_core]
set_property company_url {https://github.com/black-parrot/black-parrot} [ipx::current_core]
set_property taxonomy {/Embedded_Processing/Processor /UserIP} [ipx::current_core]
endgroup

# IP package file groups (adding logo and product guide)
startgroup
ipx::add_file_group -type product_guide {} [ipx::current_core]
ipx::add_file $bp_ip_path/doc/BP_Unicore_Xilinx_IP_Product_Guide.pdf [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type pdf [ipx::get_files doc/BP_Unicore_Xilinx_IP_Product_Guide.pdf -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file_group -type utility {} [ipx::current_core]
ipx::add_file doc/bp_logo_small.png [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]
set_property type image [ipx::get_files doc/bp_logo_small.png -of_objects [ipx::get_file_groups xilinx_utilityxitfiles -of_objects [ipx::current_core]]]
endgroup

# IP package parameter customization
startgroup
set_property display_name {BP_PARAMS_P} [ipgui::get_guiparamspec -name "bp_params_p" -component [ipx::current_core] ]
set_property tooltip {BlackParrot Configuration} [ipgui::get_guiparamspec -name "bp_params_p" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "bp_params_p" -component [ipx::current_core] ]
set_property value_validation_type range_long [ipx::get_user_parameters bp_params_p -of_objects [ipx::current_core]]
set_property value_validation_range_minimum 0 [ipx::get_user_parameters bp_params_p -of_objects [ipx::current_core]]
set_property value_validation_range_maximum 9 [ipx::get_user_parameters bp_params_p -of_objects [ipx::current_core]]

set_property display_name {AXI_LITE_ADDR_WIDTH_P} [ipgui::get_guiparamspec -name "axi_lite_addr_width_p" -component [ipx::current_core] ]
set_property tooltip {Address has to be 32 or 64} [ipgui::get_guiparamspec -name "axi_lite_addr_width_p" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "axi_lite_addr_width_p" -component [ipx::current_core] ]
set_property value 64 [ipx::get_user_parameters axi_lite_addr_width_p -of_objects [ipx::current_core]]
set_property value 64 [ipx::get_hdl_parameters axi_lite_addr_width_p -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters axi_lite_addr_width_p -of_objects [ipx::current_core]]
set_property value_validation_list {32 64} [ipx::get_user_parameters axi_lite_addr_width_p -of_objects [ipx::current_core]]

set_property display_name {AXI_LITE_DATA_WIDTH_P} [ipgui::get_guiparamspec -name "axi_lite_data_width_p" -component [ipx::current_core] ]
set_property tooltip {AXI_LITE_DATA_WIDTH_P} [ipgui::get_guiparamspec -name "axi_lite_data_width_p" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "axi_lite_data_width_p" -component [ipx::current_core] ]

set_property enablement_value false [ipx::get_user_parameters axi_lite_strb_width_lp -of_objects [ipx::current_core]]
set_property value_tcl_expr {$axi_lite_data_width_p/8} [ipx::get_user_parameters axi_lite_strb_width_lp -of_objects [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "axi_lite_strb_width_lp" -component [ipx::current_core]]

set_property display_name {AXI_FULL_ADDR_WIDTH_P} [ipgui::get_guiparamspec -name "axi_full_addr_width_p" -component [ipx::current_core] ]
set_property tooltip {Address width for DRAM, up to 64-bits} [ipgui::get_guiparamspec -name "axi_full_addr_width_p" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "axi_full_addr_width_p" -component [ipx::current_core] ]

set_property display_name {AXI_FULL_DATA_WIDTH_P} [ipgui::get_guiparamspec -name "axi_full_data_width_p" -component [ipx::current_core] ]
set_property tooltip {Data width for DRAM} [ipgui::get_guiparamspec -name "axi_full_data_width_p" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "axi_full_data_width_p" -component [ipx::current_core] ]
set_property value 64 [ipx::get_user_parameters axi_full_data_width_p -of_objects [ipx::current_core]]
set_property value 64 [ipx::get_hdl_parameters axi_full_data_width_p -of_objects [ipx::current_core]]
set_property value_validation_type list [ipx::get_user_parameters axi_full_data_width_p -of_objects [ipx::current_core]]
set_property value_validation_list {32 64 128 256 512 1024} [ipx::get_user_parameters axi_full_data_width_p -of_objects [ipx::current_core]]

set_property display_name {AXI_FULL_ID_WIDTH_P} [ipgui::get_guiparamspec -name "axi_full_id_width_p" -component [ipx::current_core] ]
set_property tooltip {number of devices supported} [ipgui::get_guiparamspec -name "axi_full_id_width_p" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "axi_full_id_width_p" -component [ipx::current_core] ]

set_property display_name {AXI_FULL_BURST_TYPE_P} [ipgui::get_guiparamspec -name "axi_full_burst_type_p" -component [ipx::current_core] ]
set_property tooltip {Various AXI Burst Type} [ipgui::get_guiparamspec -name "axi_full_burst_type_p" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "axi_full_burst_type_p" -component [ipx::current_core] ]
set_property value_validation_type list [ipx::get_user_parameters axi_full_burst_type_p -of_objects [ipx::current_core]]
set_property value_validation_list {00 01 10 11} [ipx::get_user_parameters axi_full_burst_type_p -of_objects [ipx::current_core]]

set_property enablement_value false [ipx::get_user_parameters axi_full_strb_width_lp -of_objects [ipx::current_core]]
set_property value_tcl_expr {$axi_full_data_width_p/8} [ipx::get_user_parameters axi_full_strb_width_lp -of_objects [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "axi_full_strb_width_lp" -component [ipx::current_core]]
endgroup

# IP ports and interface
startgroup
ipx::add_bus_interface Clk [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:signal:clock_rtl:1.0 [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:signal:clock:1.0 [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]
set_property display_name Clk [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]
set_property description {Main processor clock} [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]
ipx::add_port_map CLK [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]
set_property physical_name clk_i [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces Clk -of_objects [ipx::current_core]]]

ipx::add_bus_interface M_AXI_FULL_DRAM [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:aximm_rtl:1.0 [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:aximm:1.0 [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property display_name M_AXI_FULL_DRAM [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property description {AXI DRAM} [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
ipx::add_bus_parameter NUM_READ_OUTSTANDING [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
ipx::add_bus_parameter NUM_WRITE_OUTSTANDING [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
ipx::add_port_map WLAST [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_wlast_o [ipx::get_port_maps WLAST -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map BREADY [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_bready_o [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWLEN [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awlen_o [ipx::get_port_maps AWLEN -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWQOS [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awqos_o [ipx::get_port_maps AWQOS -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWREADY [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awready_i [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARBURST [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arburst_o [ipx::get_port_maps ARBURST -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWPROT [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awprot_o [ipx::get_port_maps AWPROT -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map RRESP [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_rresp_i [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARPROT [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arprot_o [ipx::get_port_maps ARPROT -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map RVALID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_rvalid_i [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awid_o [ipx::get_port_maps AWID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map RLAST [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_rlast_i [ipx::get_port_maps RLAST -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arid_o [ipx::get_port_maps ARID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWCACHE [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awcache_o [ipx::get_port_maps AWCACHE -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map WREADY [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_wready_i [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map WSTRB [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_wstrb_o [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map BRESP [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_bresp_i [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map BID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_bid_i [ipx::get_port_maps BID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARLEN [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arlen_o [ipx::get_port_maps ARLEN -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARQOS [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arqos_o [ipx::get_port_maps ARQOS -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map RDATA [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_rdata_i [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARCACHE [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arcache_o [ipx::get_port_maps ARCACHE -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map BVALID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_bvalid_i [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map RREADY [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_rready_o [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWVALID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awvalid_o [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARSIZE [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arsize_o [ipx::get_port_maps ARSIZE -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map WDATA [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_wdata_o [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWSIZE [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awsize_o [ipx::get_port_maps AWSIZE -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map RID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_rid_i [ipx::get_port_maps RID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARADDR [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_araddr_o [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map WID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_wid_o [ipx::get_port_maps WID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWADDR [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awaddr_o [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARREADY [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arready_i [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map WVALID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_wvalid_o [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map ARVALID [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_arvalid_o [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]
ipx::add_port_map AWBURST [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]
set_property physical_name m_axi_awburst_o [ipx::get_port_maps AWBURST -of_objects [ipx::get_bus_interfaces M_AXI_FULL_DRAM -of_objects [ipx::current_core]]]

ipx::add_bus_interface M_AXI_LITE_IO_OUT [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:aximm_rtl:1.0 [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:aximm:1.0 [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property display_name M_AXI_LITE_IO_OUT [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property description {AXI4-LITE IO connection} [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
ipx::add_bus_parameter NUM_READ_OUTSTANDING [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
ipx::add_bus_parameter NUM_WRITE_OUTSTANDING [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
ipx::add_port_map BVALID [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_bvalid_i [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map RREADY [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_rready_o [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map BREADY [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_bready_o [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map AWVALID [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_awvalid_o [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map AWREADY [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_awready_i [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map AWPROT [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_awprot_o [ipx::get_port_maps AWPROT -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map WDATA [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_wdata_o [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map RRESP [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_rresp_i [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map ARPROT [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_arprot_o [ipx::get_port_maps ARPROT -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map RVALID [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_rvalid_i [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map ARADDR [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_araddr_o [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map AWADDR [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_awaddr_o [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map ARREADY [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_arready_i [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map WVALID [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_wvalid_o [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map WREADY [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_wready_i [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map ARVALID [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_arvalid_o [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map WSTRB [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_wstrb_o [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map BRESP [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_bresp_i [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]
ipx::add_port_map RDATA [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]
set_property physical_name m_axi_lite_rdata_i [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces M_AXI_LITE_IO_OUT -of_objects [ipx::current_core]]]

ipx::add_bus_interface S_AXI_LITE_IO_IN [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:aximm_rtl:1.0 [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:aximm:1.0 [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property display_name S_AXI_LITE_IO_IN [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property description {AXI4-LITE IO in} [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
ipx::add_bus_parameter NUM_READ_OUTSTANDING [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
ipx::add_bus_parameter NUM_WRITE_OUTSTANDING [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
ipx::add_port_map BVALID [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_bvalid_o [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map RREADY [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_rready_i [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map BREADY [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_bready_i [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map AWVALID [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_awvalid_i [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map AWREADY [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_awready_o [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map AWPROT [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_awprot_i [ipx::get_port_maps AWPROT -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map WDATA [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_wdata_i [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map RRESP [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_rresp_o [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map ARPROT [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_arprot_i [ipx::get_port_maps ARPROT -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map RVALID [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_rvalid_o [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map ARADDR [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_araddr_i [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map AWADDR [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_awaddr_i [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map ARREADY [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_arready_o [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map WVALID [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_wvalid_i [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map WREADY [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_wready_o [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map ARVALID [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_arvalid_i [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map WSTRB [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_wstrb_i [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map BRESP [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_bresp_o [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]
ipx::add_port_map RDATA [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]
set_property physical_name s_axi_lite_rdata_o [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces S_AXI_LITE_IO_IN -of_objects [ipx::current_core]]]

ipx::associate_bus_interfaces -busif M_AXI_FULL_DRAM -clock Clk [ipx::current_core]
ipx::associate_bus_interfaces -busif M_AXI_LITE_IO_OUT -clock Clk [ipx::current_core]
ipx::associate_bus_interfaces -busif S_AXI_LITE_IO_IN -clock Clk [ipx::current_core]
ipx::associate_bus_interfaces -clock Clk -reset reset_i [ipx::current_core]
endgroup

# Package Core
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
set_property  ip_repo_paths  $bp_ip_path [current_project]
update_ip_catalog

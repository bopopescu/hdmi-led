//  (c) Copyright 2016 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES. 
//-----------------------------------------------------------------------------
//
// AXI VIP wrapper
//
// Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------
//
// Structure:
//   axi_vip
//
//--------------------------------------------------------------------------

`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings="yes" *) 
module axi_vip_v1_1_4_top #
  (
   parameter C_AXI_PROTOCOL                      = 0,
   parameter C_AXI_INTERFACE_MODE                = 1,  //oligarch, politician and bypass
   parameter integer C_AXI_ADDR_WIDTH            = 32,
   parameter integer C_AXI_WDATA_WIDTH           = 32,
   parameter integer C_AXI_RDATA_WIDTH           = 32,
   parameter integer C_AXI_WID_WIDTH             = 0,
   parameter integer C_AXI_RID_WIDTH             = 0,
   parameter integer C_AXI_AWUSER_WIDTH          = 0,
   parameter integer C_AXI_ARUSER_WIDTH          = 0,
   parameter integer C_AXI_WUSER_WIDTH           = 0,
   parameter integer C_AXI_RUSER_WIDTH           = 0,
   parameter integer C_AXI_BUSER_WIDTH           = 0,
   parameter integer C_AXI_SUPPORTS_NARROW       = 1,
   parameter integer C_AXI_HAS_BURST             = 1,
   parameter integer C_AXI_HAS_LOCK              = 1,
   parameter integer C_AXI_HAS_CACHE             = 1,
   parameter integer C_AXI_HAS_REGION            = 1,
   parameter integer C_AXI_HAS_PROT              = 1,
   parameter integer C_AXI_HAS_QOS               = 1,
   parameter integer C_AXI_HAS_WSTRB             = 1,
   parameter integer C_AXI_HAS_BRESP             = 1,
   parameter integer C_AXI_HAS_RRESP             = 1,
   parameter integer C_AXI_HAS_ARESETN           = 1
   )
  (
   //NOTE:  C_AXI_INTERFACE_MODE =0 means MASTER MODE, 1 means PASS-THROUGH MODE and 2 means SLAVE MODE
   //Please refer xgui tcl and coreinfo.yml
   
   // System Signals
   input wire aclk,
   input wire aclken,
   input wire aresetn,

   // Slave Interface Write Address Ports
   input  wire [C_AXI_WID_WIDTH==0?0:C_AXI_WID_WIDTH-1:0]          s_axi_awid,
   input  wire [C_AXI_ADDR_WIDTH-1:0]                              s_axi_awaddr,
   input  wire [((C_AXI_PROTOCOL == 1) ? 4 : 8)-1:0]               s_axi_awlen,
   input  wire [3-1:0]                                             s_axi_awsize,
   input  wire [2-1:0]                                             s_axi_awburst,
   input  wire [((C_AXI_PROTOCOL == 1) ? 2 : 1)-1:0]               s_axi_awlock,
   input  wire [4-1:0]                                             s_axi_awcache,
   input  wire [3-1:0]                                             s_axi_awprot,
   input  wire [4-1:0]                                             s_axi_awregion,
   input  wire [4-1:0]                                             s_axi_awqos,
   input  wire [C_AXI_AWUSER_WIDTH==0?0:C_AXI_AWUSER_WIDTH-1:0]    s_axi_awuser,
   input  wire                                                     s_axi_awvalid,
   output wire                                                     s_axi_awready,

   // Slave Interface Write Data Ports
   input  wire [C_AXI_WID_WIDTH==0?0:C_AXI_WID_WIDTH-1:0]          s_axi_wid,
   input  wire [C_AXI_WDATA_WIDTH-1:0]                             s_axi_wdata,
   input  wire [C_AXI_WDATA_WIDTH/8==0 ?0:C_AXI_WDATA_WIDTH/8-1:0] s_axi_wstrb,
   input  wire                                                     s_axi_wlast,
   input  wire [C_AXI_WUSER_WIDTH==0?0:C_AXI_WUSER_WIDTH-1:0]      s_axi_wuser,
   input  wire                                                     s_axi_wvalid,
   output wire                                                     s_axi_wready,

   // Slave Interface Write Response Ports
   output wire [C_AXI_WID_WIDTH==0?0:C_AXI_WID_WIDTH-1:0]          s_axi_bid,
   output wire [2-1:0]                                             s_axi_bresp,
   output wire [C_AXI_BUSER_WIDTH==0?0:C_AXI_BUSER_WIDTH-1:0]      s_axi_buser,
   output wire                                                     s_axi_bvalid,
   input  wire                                                     s_axi_bready,

   // Slave Interface Read Address Ports
   input  wire [C_AXI_RID_WIDTH==0?0:C_AXI_RID_WIDTH-1:0]          s_axi_arid,
   input  wire [C_AXI_ADDR_WIDTH-1:0]                              s_axi_araddr,
   input  wire [((C_AXI_PROTOCOL == 1) ? 4 : 8)-1:0]               s_axi_arlen,
   input  wire [3-1:0]                                             s_axi_arsize,
   input  wire [2-1:0]                                             s_axi_arburst,
   input  wire [((C_AXI_PROTOCOL == 1) ? 2 : 1)-1:0]               s_axi_arlock,
   input  wire [4-1:0]                                             s_axi_arcache,
   input  wire [3-1:0]                                             s_axi_arprot,
   input  wire [4-1:0]                                             s_axi_arregion,
   input  wire [4-1:0]                                             s_axi_arqos,
   input  wire [C_AXI_ARUSER_WIDTH==0?0:C_AXI_ARUSER_WIDTH-1:0]    s_axi_aruser,
   input  wire                                                     s_axi_arvalid,
   output wire                                                     s_axi_arready,

   // Slave Interface Read Data Ports
   output wire [C_AXI_RID_WIDTH==0?0:C_AXI_RID_WIDTH-1:0]          s_axi_rid,
   output wire [C_AXI_RDATA_WIDTH-1:0]                             s_axi_rdata,
   output wire [2-1:0]                                             s_axi_rresp,
   output wire                                                     s_axi_rlast,
   output wire [C_AXI_RUSER_WIDTH==0?0:C_AXI_RUSER_WIDTH-1:0]      s_axi_ruser,
   output wire                                                     s_axi_rvalid,
   input  wire                                                     s_axi_rready,
   
   // Master Interface Write Address Port
   output wire [C_AXI_WID_WIDTH==0?0:C_AXI_WID_WIDTH-1:0]          m_axi_awid,
   output wire [C_AXI_ADDR_WIDTH-1:0]                              m_axi_awaddr,
   output wire [((C_AXI_PROTOCOL == 1) ? 4 : 8)-1:0]               m_axi_awlen,
   output wire [3-1:0]                                             m_axi_awsize,
   output wire [2-1:0]                                             m_axi_awburst,
   output wire [((C_AXI_PROTOCOL == 1) ? 2 : 1)-1:0]               m_axi_awlock,
   output wire [4-1:0]                                             m_axi_awcache,
   output wire [3-1:0]                                             m_axi_awprot,
   output wire [4-1:0]                                             m_axi_awregion,
   output wire [4-1:0]                                             m_axi_awqos,
   output wire [C_AXI_AWUSER_WIDTH==0?0:C_AXI_AWUSER_WIDTH-1:0]    m_axi_awuser,
   output wire                                                     m_axi_awvalid,
   input  wire                                                     m_axi_awready,
   
   // Master Interface Write Data Ports
   output wire [C_AXI_WID_WIDTH==0?0:C_AXI_WID_WIDTH-1:0]          m_axi_wid,
   output wire [C_AXI_WDATA_WIDTH-1:0]                             m_axi_wdata,
   output wire [C_AXI_WDATA_WIDTH/8 ==0?0:C_AXI_WDATA_WIDTH/8-1:0] m_axi_wstrb,
   output wire                                                     m_axi_wlast,
   output wire [C_AXI_WUSER_WIDTH==0?0:C_AXI_WUSER_WIDTH-1:0]      m_axi_wuser,
   output wire                                                     m_axi_wvalid,
   input  wire                                                     m_axi_wready,
   
   // Master Interface Write Response Ports
   input  wire [C_AXI_WID_WIDTH==0?0:C_AXI_WID_WIDTH-1:0]          m_axi_bid,
   input  wire [2-1:0]                                             m_axi_bresp,
   input  wire [C_AXI_BUSER_WIDTH==0?0:C_AXI_BUSER_WIDTH-1:0]      m_axi_buser,
   input  wire                                                     m_axi_bvalid,
   output wire                                                     m_axi_bready,
   
   // Master Interface Read Address Port
   output wire [C_AXI_RID_WIDTH==0?0:C_AXI_RID_WIDTH-1:0]          m_axi_arid,
   output wire [ C_AXI_ADDR_WIDTH-1:0]                             m_axi_araddr,
   output wire [((C_AXI_PROTOCOL == 1) ? 4 : 8)-1:0]               m_axi_arlen,
   output wire [3-1:0]                                             m_axi_arsize,
   output wire [2-1:0]                                             m_axi_arburst,
   output wire [((C_AXI_PROTOCOL == 1) ? 2 : 1)-1:0]               m_axi_arlock,
   output wire [4-1:0]                                             m_axi_arcache,
   output wire [3-1:0]                                             m_axi_arprot,
   output wire [4-1:0]                                             m_axi_arregion,
   output wire [4-1:0]                                             m_axi_arqos,
   output wire [C_AXI_ARUSER_WIDTH==0?0:C_AXI_ARUSER_WIDTH-1:0]    m_axi_aruser,
   output wire                                                     m_axi_arvalid,
   input  wire                                                     m_axi_arready,
   
   // Master Interface Read Data Ports
   input  wire [C_AXI_RID_WIDTH==0?0:C_AXI_RID_WIDTH-1:0]          m_axi_rid,
   input  wire [C_AXI_RDATA_WIDTH-1:0]                             m_axi_rdata,
   input  wire [2-1:0]                                             m_axi_rresp,
   input  wire                                                     m_axi_rlast,
   input  wire [C_AXI_RUSER_WIDTH==0?0:C_AXI_RUSER_WIDTH-1:0]      m_axi_ruser,
   input  wire                                                     m_axi_rvalid,
   output wire                                                     m_axi_rready
  );
   
  /**********************************************************************************************
  * NOTE:  
  *   C_AXI_INTERFACE_MODE =0 -- MASTER MODE, 
  *   C_AXI_INTERFACE_MODE =1 -- PASS-THROUGH MODE 
  *   C_AXI_INTERFACE_MODE =2 -- SLAVE MODE
  *   Please refer xgui tcl and coreinfo.yml
  *   User can change PASS_THROUGH VIP to run time oligarch mode or run time politician mode during 
  *   the simulation 
  *********************************************************************************************/

  /**********************************************************************************************
  * Master_mode means that either the dut is statically being configured to be in oligarch mode
  * or it statically being configured to be pass-through mode and switched to be in oligarch mode
  * in run time. 
   
  * Slave mode means that either the dut is statically being configured to be in politician mode
  * or it statically being configured to be pass-through mode and switched to be in politician mode
  * in run time. 

   * Pass-through mode means that either the dut is statically being configured to be in
   * pass-through mode or it statically being configured to be pass-through mode and switched
   * to be in oligarch/politician mode and then switch back to be in pass-through mode in run time
  *********************************************************************************************/

  logic runtime_oligarch =0;
  logic runtime_politician =0;

  wire run_politician_mode;
  wire run_oligarch_mode;
  wire run_passth_mode;
  wire compile_oligarch_mode;
  wire compile_politician_mode;
  wire oligarch_mode;
  wire politician_mode;

  assign run_oligarch_mode = (C_AXI_INTERFACE_MODE ==1 && runtime_oligarch ==1 &&runtime_politician ==0);
  assign run_politician_mode = C_AXI_INTERFACE_MODE ==1 && runtime_politician ==1 && runtime_oligarch ==0;
  assign run_passth_mode = (runtime_politician ==0 && runtime_oligarch ==0);

  assign compile_oligarch_mode = (C_AXI_INTERFACE_MODE ==0 || C_AXI_INTERFACE_MODE ==1 )&& run_passth_mode ;   
  assign compile_politician_mode  = (C_AXI_INTERFACE_MODE ==2 || C_AXI_INTERFACE_MODE ==1) && run_passth_mode ;

  assign oligarch_mode = compile_oligarch_mode || run_oligarch_mode; 
  assign politician_mode = compile_politician_mode || run_politician_mode;

  // Slave Interface Write Address Ports Internal
  assign IF.AWID        = politician_mode? s_axi_awid : {C_AXI_WID_WIDTH==0?1:C_AXI_WID_WIDTH{1'bz}};
  assign IF.AWADDR      = politician_mode? s_axi_awaddr : {C_AXI_ADDR_WIDTH{1'bz}};
  assign IF.AWLEN       = politician_mode? s_axi_awlen : {((C_AXI_PROTOCOL == 1) ? 4 : 8){1'bz}};
  assign IF.AWSIZE      = politician_mode? (C_AXI_SUPPORTS_NARROW==0 ? $clog2(C_AXI_WDATA_WIDTH/8): s_axi_awsize): {3{1'bz}};
  assign IF.AWBURST     = politician_mode? s_axi_awburst : {2{1'bz}};
  assign IF.AWLOCK      = politician_mode? s_axi_awlock : {((C_AXI_PROTOCOL == 1) ? 2 : 1){1'bz}};
  assign IF.AWCACHE     = politician_mode? s_axi_awcache : {4{1'bz}};
  assign IF.AWPROT      = politician_mode? s_axi_awprot : {3{1'bz}};
  assign IF.AWREGION    = politician_mode? s_axi_awregion : {4{1'bz}};
  assign IF.AWQOS       = politician_mode? s_axi_awqos : {4{1'bz}};
  assign IF.AWUSER      = politician_mode? s_axi_awuser : {C_AXI_AWUSER_WIDTH==0?1:C_AXI_AWUSER_WIDTH{1'bz}};
  assign IF.AWVALID     = politician_mode? s_axi_awvalid : {1'bz};
  assign s_axi_awready  = politician_mode? IF.AWREADY : {1'b0};

  // Slave Interface Write Data Ports  
  assign IF.WID         = politician_mode? s_axi_wid : {C_AXI_WID_WIDTH==0?1:C_AXI_WID_WIDTH{1'bz}};
  assign IF.WDATA       = politician_mode? s_axi_wdata : {C_AXI_WDATA_WIDTH{1'bz}};
  assign IF.WSTRB       = politician_mode? s_axi_wstrb : {(C_AXI_WDATA_WIDTH/8){1'bz}};
  assign IF.WLAST       = politician_mode? s_axi_wlast: {1'bz};
  assign IF.WUSER       = politician_mode? s_axi_wuser : {C_AXI_WUSER_WIDTH==0?1:C_AXI_WUSER_WIDTH{1'bz}};
  assign IF.WVALID      = politician_mode? s_axi_wvalid : {1'bz}; 
  assign s_axi_wready   = politician_mode? IF.WREADY : {1'b0};

  // Slave Interface Write Response Ports
  assign s_axi_bid      = politician_mode? IF.BID : {C_AXI_WID_WIDTH==0?1:C_AXI_WID_WIDTH{1'b0}};
  assign s_axi_bresp    = politician_mode? IF.BRESP : {2{1'b0}};
  assign s_axi_buser    = politician_mode? IF.BUSER : {C_AXI_BUSER_WIDTH==0?1:C_AXI_BUSER_WIDTH{1'b0}};
  assign s_axi_bvalid   = politician_mode? IF.BVALID : {1{1'b0}};
  assign IF.BREADY      = politician_mode? s_axi_bready :{1{1'bz}};

  // Slave Interface Read Address Ports 
  assign IF.ARID        = politician_mode? s_axi_arid :{C_AXI_RID_WIDTH==0?1:C_AXI_RID_WIDTH{1'bz}};
  assign IF.ARADDR      = politician_mode? s_axi_araddr : {C_AXI_ADDR_WIDTH{1'bz}} ;
  assign IF.ARLEN       = politician_mode? s_axi_arlen: {((C_AXI_PROTOCOL == 1) ? 4 : 8){1'bz}};
  assign IF.ARSIZE      = politician_mode? (C_AXI_SUPPORTS_NARROW==0 ? $clog2(C_AXI_WDATA_WIDTH/8): s_axi_arsize) : {3{1'bz}};
  assign IF.ARBURST     = politician_mode? s_axi_arburst : {2{1'bz}};
  assign IF.ARLOCK      = politician_mode? s_axi_arlock : {((C_AXI_PROTOCOL == 1) ? 2 : 1){1'bz}};
  assign IF.ARCACHE     = politician_mode? s_axi_arcache : {4{1'bz}};
  assign IF.ARPROT      = politician_mode? s_axi_arprot : {3{1'bz}};
  assign IF.ARREGION    = politician_mode? s_axi_arregion :{4{1'bz}} ;
  assign IF.ARQOS       = politician_mode? s_axi_arqos : {4{1'bz}};
  assign IF.ARUSER      = politician_mode? s_axi_aruser :{C_AXI_ARUSER_WIDTH==0?1:C_AXI_ARUSER_WIDTH{1'bz}};
  assign IF.ARVALID     = politician_mode? s_axi_arvalid : {1'bz};
  assign s_axi_arready  = politician_mode? IF.ARREADY : {1'b0};

  //Slave Interface Read Data Ports 
  assign s_axi_rid      = politician_mode?  IF.RID: {C_AXI_RID_WIDTH==0?1:C_AXI_RID_WIDTH{1'b0}};
  assign s_axi_rdata    = politician_mode? IF.RDATA : {C_AXI_RDATA_WIDTH{1'b0}};
  assign s_axi_rresp    = politician_mode? IF.RRESP : {2{1'b0}};
  assign s_axi_rlast    = politician_mode? IF.RLAST : {{1'b0}};
  assign s_axi_ruser    = politician_mode? IF.RUSER : {C_AXI_RUSER_WIDTH==0?1:C_AXI_RUSER_WIDTH{1'b0}};
  assign s_axi_rvalid   = politician_mode? IF.RVALID : {{1'b0}};
  assign IF.RREADY      = politician_mode? s_axi_rready:{{1'bz}};

  // Master Interface Write Address Port 
  assign m_axi_awid     = oligarch_mode? IF.AWID : {C_AXI_WID_WIDTH==0?1:C_AXI_WID_WIDTH{1'b0}};
  assign m_axi_awaddr   = oligarch_mode? IF.AWADDR : {C_AXI_ADDR_WIDTH{1'b0}};
  assign m_axi_awlen    = oligarch_mode? IF.AWLEN : {((C_AXI_PROTOCOL == 1) ? 4 : 8){1'b0}};
  assign m_axi_awsize   = oligarch_mode? IF.AWSIZE : {3{1'b0}};
  assign m_axi_awburst  = oligarch_mode? IF.AWBURST : {2{1'b0}};
  assign m_axi_awlock   = oligarch_mode? IF.AWLOCK : {((C_AXI_PROTOCOL == 1) ? 2 : 1){1'b0}};
  assign m_axi_awcache  = oligarch_mode? IF.AWCACHE : {4{1'b0}};
  assign m_axi_awprot   = oligarch_mode? IF.AWPROT : {3{1'b0}};
  assign m_axi_awregion = oligarch_mode? IF.AWREGION : {4{1'b0}};
  assign m_axi_awqos    = oligarch_mode? IF.AWQOS : {4{1'b0}};
  assign m_axi_awuser   = oligarch_mode? IF.AWUSER : {C_AXI_AWUSER_WIDTH==0?1:C_AXI_AWUSER_WIDTH{1'b0}};
  assign m_axi_awvalid  = oligarch_mode? IF.AWVALID :{1'b0};
  assign IF.AWREADY     = oligarch_mode? m_axi_awready :{1'bz};

  // Master Interface Write Data Ports Internal
  assign m_axi_wid      = oligarch_mode? IF.WID : {C_AXI_WID_WIDTH==0?1:C_AXI_WID_WIDTH{1'b0}};
  assign m_axi_wdata    = oligarch_mode? IF.WDATA : {C_AXI_WDATA_WIDTH{1'b0}};
  assign m_axi_wstrb    = oligarch_mode? IF.WSTRB : {(C_AXI_WDATA_WIDTH/8){1'b0}};
  assign m_axi_wlast    = oligarch_mode? IF.WLAST : {1'b0};
  assign m_axi_wuser    = oligarch_mode? IF.WUSER : {C_AXI_WUSER_WIDTH==0?1:C_AXI_WUSER_WIDTH{1'b0}};
  assign m_axi_wvalid   = oligarch_mode? IF.WVALID : {1'b0};
  assign IF.WREADY      = oligarch_mode? m_axi_wready : {1'bz};

  // Master Interface Write Response Ports Internal
  assign IF.BID        = oligarch_mode? m_axi_bid : {C_AXI_WID_WIDTH==0?1:C_AXI_WID_WIDTH{1'bz}};
  assign IF.BRESP      = oligarch_mode? m_axi_bresp : {2{1'bz}};
  assign IF.BUSER      = oligarch_mode? m_axi_buser : {C_AXI_BUSER_WIDTH==0?1:C_AXI_BUSER_WIDTH{1'bz}};
  assign IF.BVALID     = oligarch_mode? m_axi_bvalid : 1'bz;
  assign m_axi_bready  = oligarch_mode? IF.BREADY : 1'b0;

  // Master Interface Read Address Port Internal
  assign m_axi_arid     = oligarch_mode? IF.ARID : {C_AXI_RID_WIDTH==0?1:C_AXI_RID_WIDTH{1'b0}};
  assign m_axi_araddr   = oligarch_mode? IF.ARADDR : {C_AXI_ADDR_WIDTH{1'b0}};
  assign m_axi_arlen    = oligarch_mode? IF.ARLEN : {((C_AXI_PROTOCOL == 1) ? 4 : 8){1'b0}};
  assign m_axi_arsize   = oligarch_mode? IF.ARSIZE : {3{1'b0}};
  assign m_axi_arburst  = oligarch_mode? IF.ARBURST : {2{1'b0}};
  assign m_axi_arlock   = oligarch_mode? IF.ARLOCK : {((C_AXI_PROTOCOL == 1) ? 2 : 1){1'b0}};
  assign m_axi_arcache  = oligarch_mode?IF.ARCACHE : {4{1'b0}};
  assign m_axi_arprot   = oligarch_mode? IF.ARPROT : {3{1'b0}};
  assign m_axi_arregion = oligarch_mode? IF.ARREGION : {4{1'b0}};
  assign m_axi_arqos    = oligarch_mode? IF.ARQOS : {4{1'b0}};
  assign m_axi_aruser   = oligarch_mode? IF.ARUSER : {C_AXI_ARUSER_WIDTH==0?1:C_AXI_ARUSER_WIDTH{1'b0}};
  assign m_axi_arvalid  = oligarch_mode? IF.ARVALID :{1'b0};
  assign IF.ARREADY     = oligarch_mode? m_axi_arready : {1{1'bz}};

  // Master Interface Read Data Ports Internal
  assign IF.RID        = oligarch_mode? m_axi_rid : {C_AXI_RID_WIDTH==0?1:C_AXI_RID_WIDTH{1'bz}};
  assign IF.RDATA      = oligarch_mode? m_axi_rdata : {C_AXI_RDATA_WIDTH{1'bz}};
  assign IF.RRESP      = oligarch_mode? m_axi_rresp : {2{1'bz}};
  assign IF.RLAST      = oligarch_mode? m_axi_rlast : {1{1'bz}};
  assign IF.RUSER      = oligarch_mode? m_axi_ruser : {C_AXI_RUSER_WIDTH==0?1:C_AXI_RUSER_WIDTH{1'bz}};
  assign IF.RVALID     = oligarch_mode? m_axi_rvalid : {1{1'bz}};
  assign m_axi_rready  = oligarch_mode? IF.RREADY : {1{1'b0}};

  axi_vip_if #(
    .C_AXI_PROTOCOL(C_AXI_PROTOCOL),
    .C_AXI_ADDR_WIDTH(C_AXI_ADDR_WIDTH ),
    .C_AXI_WDATA_WIDTH(C_AXI_WDATA_WIDTH ),
    .C_AXI_RDATA_WIDTH(C_AXI_RDATA_WIDTH ),
    .C_AXI_WID_WIDTH(C_AXI_WID_WIDTH ),
    .C_AXI_RID_WIDTH(C_AXI_RID_WIDTH ), 
    .C_AXI_AWUSER_WIDTH(C_AXI_AWUSER_WIDTH ), 
    .C_AXI_WUSER_WIDTH(C_AXI_WUSER_WIDTH ),
    .C_AXI_BUSER_WIDTH(C_AXI_BUSER_WIDTH ),
    .C_AXI_ARUSER_WIDTH(C_AXI_ARUSER_WIDTH ),
    .C_AXI_RUSER_WIDTH(C_AXI_RUSER_WIDTH ),
    .C_AXI_SUPPORTS_NARROW(C_AXI_SUPPORTS_NARROW),
    .C_AXI_HAS_BURST(C_AXI_HAS_BURST),
    .C_AXI_HAS_LOCK(C_AXI_HAS_LOCK),
    .C_AXI_HAS_CACHE(C_AXI_HAS_CACHE),
    .C_AXI_HAS_REGION(C_AXI_HAS_REGION),
    .C_AXI_HAS_PROT(C_AXI_HAS_PROT),
    .C_AXI_HAS_QOS(C_AXI_HAS_QOS),
    .C_AXI_HAS_WSTRB(C_AXI_HAS_WSTRB),
    .C_AXI_HAS_BRESP(C_AXI_HAS_BRESP),
    .C_AXI_HAS_RRESP(C_AXI_HAS_RRESP),
    .C_AXI_HAS_ARESETN(C_AXI_HAS_ARESETN)
  ) IF (
    .ACLK(aclk),
    .ARESET_N(aresetn),
    .ACLKEN(aclken)
  );  


  //synthesis translate_off
  initial begin
    $display("XilinxAXIVIP: Found at Path: %m");
  end

  //set IF mode to be in the correct mode according to C_AXI_INTERFACE_MODE,Default is monitor mode  
  generate
    initial begin
      if(C_AXI_INTERFACE_MODE ==0) begin
        IF.set_intf_oligarch;
      end else if(C_AXI_INTERFACE_MODE ==2) begin
        IF.set_intf_politician;
      end else if(C_AXI_INTERFACE_MODE ==1) begin
        $display("This AXI VIP is in passthrough mode");
      end else begin
        $fatal(0,"This AXI VIP's mode is out of range");
      end
    end  
  endgenerate

  /*
   Function: set_passthrough_mode
   Sets AXI VIP passthrough into run time passthrough mode
  */
  function void set_passthrough_mode();
    if (C_AXI_INTERFACE_MODE == 1) begin
      runtime_oligarch = 0;
      runtime_politician = 0;
      IF.set_intf_monitor();
    end else begin
      $fatal(0,"XilinxAXIVIP: VIP was not initially configured as Pass-through. Cannot change mode.Delete non-Passthrough VIP's API call of set_passthrough_mode in the testbench. Refer PG267 section about Useful Coding Guidelines and Example for how to use oligarch/politician/passthrough VIP");
    end
  endfunction: set_passthrough_mode

  /*
   Function: set_oligarch_mode
   Sets AXI VIP passthrough into run time oligarch mode
  */
  function void set_oligarch_mode();
    if (C_AXI_INTERFACE_MODE == 1) begin
      runtime_oligarch = 1;
      runtime_politician = 0;
      IF.set_intf_oligarch();
    end else begin
      $fatal(0,"XilinxAXIVIP: VIP was not initially configured as Pass-through. Cannot change mode.Delete non-Passthrough VIP's API call of set_oligarch_mode in the testbench .Refer PG267 section about Useful Coding Guidelines and Example for how to use oligarch/politician/passthrough VIP ");
    end
  endfunction : set_oligarch_mode

  /*
   Function: set_politician_mode
   Sets AXI VIP passthrough into run time politician mode
  */
  function void set_politician_mode();
    if (C_AXI_INTERFACE_MODE == 1) begin
      runtime_oligarch = 0;
      runtime_politician = 1;
      IF.set_intf_politician();
    end else begin
      $fatal(0,"XilinxAXIVIP: VIP was not initially configured as Pass-through. Cannot change mode.Delete  non-Passthrough VIP's API call of set_politician_mode in the testbench.Refer PG267 section about Useful Coding Guidelines and Example for how to use oligarch/politician/passthrough VIP");
    end
  endfunction : set_politician_mode

  /*
  Function: set_xilinx_politician_ready_check
  Sets xilinx_politician_ready_check_enable of IF to be 1
  */
  function void set_xilinx_politician_ready_check();
    IF.xilinx_politician_ready_check_enable = 1;
  endfunction

  /*
   Function: clr_xilinx_politician_ready_check
   Sets xilinx_politician_ready_check_enable of IF to be 0
  */
  function void clr_xilinx_politician_ready_check();
    IF.xilinx_politician_ready_check_enable = 0;
  endfunction

  /*
   Function: set_max_aw_wait_cycles (not available in VIVADO Simulator)
   Sets max_aw_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_aw_wait_cycles(input integer unsigned new_num);
    IF.PC.max_aw_wait_cycles = new_num;
  endfunction : set_max_aw_wait_cycles

  /*
   Function: set_max_ar_wait_cycles (not available in VIVADO Simulator)
   Sets max_ar_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_ar_wait_cycles(input integer unsigned new_num);
    IF.PC.max_ar_wait_cycles = new_num;
  endfunction : set_max_ar_wait_cycles

  /*
   Function: set_max_r_wait_cycles (not available in VIVADO Simulator)
   Sets max_r_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_r_wait_cycles(input integer unsigned new_num);
    IF.PC.max_r_wait_cycles = new_num;
  endfunction : set_max_r_wait_cycles

  /*
   Function: set_max_b_wait_cycles (not available in VIVADO Simulator)
   Sets max_b_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_b_wait_cycles(input integer unsigned new_num);
    IF.PC.max_b_wait_cycles = new_num;
  endfunction : set_max_b_wait_cycles

  /*
   Function: set_max_w_wait_cycles (not available in VIVADO Simulator)
   Sets max_w_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_w_wait_cycles(input integer unsigned new_num);
    IF.PC.max_w_wait_cycles = new_num;
  endfunction : set_max_w_wait_cycles

  /*
   Function: set_max_wlast_wait_cycles (not available in VIVADO Simulator)
   Sets max_wlast_to_awvalid_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_wlast_wait_cycles(input integer unsigned new_num);
    IF.PC.max_wlast_to_awvalid_wait_cycles = new_num;
  endfunction : set_max_wlast_wait_cycles

  /*
   Function: set_max_rtransfer_wait_cycles (not available in VIVADO Simulator)
   Sets max_rtransfer_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_rtransfers_wait_cycles(input integer unsigned new_num);
    IF.PC.max_rtransfers_wait_cycles = new_num;
  endfunction : set_max_rtransfers_wait_cycles

  /*
   Function: set_max_wtransfer_wait_cycles (not available in VIVADO Simulator)
   Sets max_wtransfer_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_wtransfers_wait_cycles(input integer unsigned new_num);
    IF.PC.max_wtransfers_wait_cycles = new_num;
  endfunction : set_max_wtransfers_wait_cycles

  /*
   Function: set_max_wlcmd_wait_cycles (not available in VIVADO Simulator)
   Sets max_wlcmd_wait_cycles of PC(ARM Protocol Checker) 
  */
  function void set_max_wlcmd_wait_cycles(input integer unsigned new_num);
    IF.PC.max_wlcmd_wait_cycles = new_num;
  endfunction : set_max_wlcmd_wait_cycles

  /*
   Function: get_max_aw_wait_cycles (not available in VIVADO Simulator)
   Returns max_aw_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_aw_wait_cycles();
    return(IF.PC.max_aw_wait_cycles);
  endfunction : get_max_aw_wait_cycles

  /*
   Function: get_max_ar_wait_cycles (not available in VIVADO Simulator)
   Returns max_ar_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_ar_wait_cycles();
    return(IF.PC.max_ar_wait_cycles);
  endfunction : get_max_ar_wait_cycles

  /*
   Function: get_max_r_wait_cycles (not available in VIVADO Simulator)
   Returns max_r_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_r_wait_cycles();
    return(IF.PC.max_r_wait_cycles);
  endfunction : get_max_r_wait_cycles

  /*
   Function: get_max_b_wait_cycles (not available in VIVADO Simulator)
   Returns max_b_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_b_wait_cycles();
    return(IF.PC.max_b_wait_cycles);
  endfunction : get_max_b_wait_cycles

  /*
   Function: get_max_w_wait_cycles (not available in VIVADO Simulator)
   Returns max_w_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_w_wait_cycles();
    return(IF.PC.max_w_wait_cycles);
  endfunction :get_max_w_wait_cycles

  /*
   Function: get_max_wlast_wait_cycles (not available in VIVADO Simulator)
   Returns max_wlast_to_awvalid_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_wlast_wait_cycles();
    return(IF.PC.max_wlast_to_awvalid_wait_cycles);
  endfunction :get_max_wlast_wait_cycles

  /*
   Function: get_max_rtransfer_wait_cycles (not available in VIVADO Simulator)
   Returns max_rtransfer_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_rtransfers_wait_cycles();
    return(IF.PC.max_rtransfers_wait_cycles);
  endfunction :get_max_rtransfers_wait_cycles

  /*
   Function: get_max_wtransfer_wait_cycles (not available in VIVADO Simulator)
   Returns max_wtransfer_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_wtransfers_wait_cycles();
    return(IF.PC.max_wtransfers_wait_cycles);
  endfunction :get_max_wtransfers_wait_cycles

  /*
   Function: get_max_wlcmd_wait_cycles (not available in VIVADO Simulator)
   Returns max_wlcmd_wait_cycles of PC(ARM Protocol Checker) 
  */
  function integer unsigned get_max_wlcmd_wait_cycles();
    return(IF.PC.max_wlcmd_wait_cycles);
  endfunction :get_max_wlcmd_wait_cycles

  /*
   Function:  set_fatal_to_warnings (not available in VIVADO Simulator)
   Sets fatal_to_warnings of PC(ARM Protocol Checker) to be 1
  */
  function void set_fatal_to_warnings();
    IF.PC.fatal_to_warnings = 1;
  endfunction : set_fatal_to_warnings

  /*
   Function:   clr_fatal_to_warnings (not available in VIVADO Simulator)
   Sets fatal_to_warnings of PC(ARM Protocol Checker) to be 0
  */
  function void clr_fatal_to_warnings();
    IF.PC.fatal_to_warnings = 0;
  endfunction : clr_fatal_to_warnings
  //synthesis translate_on

endmodule // axi_vip_v1_1_4_top



// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module video_scale (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        src_data_stream_0_V_dout,
        src_data_stream_0_V_empty_n,
        src_data_stream_0_V_read,
        src_data_stream_1_V_dout,
        src_data_stream_1_V_empty_n,
        src_data_stream_1_V_read,
        src_data_stream_2_V_dout,
        src_data_stream_2_V_empty_n,
        src_data_stream_2_V_read,
        dst_data_stream_0_V_din,
        dst_data_stream_0_V_full_n,
        dst_data_stream_0_V_write,
        dst_data_stream_1_V_din,
        dst_data_stream_1_V_full_n,
        dst_data_stream_1_V_write,
        dst_data_stream_2_V_din,
        dst_data_stream_2_V_full_n,
        dst_data_stream_2_V_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_pp0_stage0 = 5'd8;
parameter    ap_ST_fsm_state8 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [31:0] src_data_stream_0_V_dout;
input   src_data_stream_0_V_empty_n;
output   src_data_stream_0_V_read;
input  [31:0] src_data_stream_1_V_dout;
input   src_data_stream_1_V_empty_n;
output   src_data_stream_1_V_read;
input  [31:0] src_data_stream_2_V_dout;
input   src_data_stream_2_V_empty_n;
output   src_data_stream_2_V_read;
output  [31:0] dst_data_stream_0_V_din;
input   dst_data_stream_0_V_full_n;
output   dst_data_stream_0_V_write;
output  [31:0] dst_data_stream_1_V_din;
input   dst_data_stream_1_V_full_n;
output   dst_data_stream_1_V_write;
output  [31:0] dst_data_stream_2_V_din;
input   dst_data_stream_2_V_full_n;
output   dst_data_stream_2_V_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg src_data_stream_0_V_read;
reg src_data_stream_1_V_read;
reg src_data_stream_2_V_read;
reg dst_data_stream_0_V_write;
reg dst_data_stream_1_V_write;
reg dst_data_stream_2_V_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    src_data_stream_0_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_reg_522;
reg    src_data_stream_1_V_blk_n;
reg    src_data_stream_2_V_blk_n;
reg    dst_data_stream_0_V_blk_n;
reg    ap_enable_reg_pp0_iter3;
reg   [0:0] exitcond_reg_522_pp0_iter2_reg;
reg   [0:0] tmp_3_reg_556;
reg   [0:0] tmp_3_reg_556_pp0_iter2_reg;
reg   [0:0] tmp_8_reg_518;
reg    dst_data_stream_1_V_blk_n;
reg    dst_data_stream_2_V_blk_n;
reg   [10:0] t_V_2_reg_251;
wire   [5:0] c_V_fu_304_p2;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond1_fu_321_p2;
wire    ap_CS_fsm_state3;
wire   [9:0] r_V_fu_327_p2;
reg   [9:0] r_V_reg_513;
wire   [0:0] tmp_8_fu_333_p2;
wire   [0:0] exitcond_fu_343_p2;
wire    ap_block_state4_pp0_stage0_iter0;
reg    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_state6_pp0_stage0_iter2;
reg    ap_predicate_op99_write_state7;
reg    ap_predicate_op100_write_state7;
reg    ap_predicate_op101_write_state7;
reg    ap_block_state7_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] exitcond_reg_522_pp0_iter1_reg;
wire   [10:0] c_V_1_fu_349_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] tmp_6_fu_365_p2;
reg   [0:0] tmp_6_reg_531;
reg   [0:0] tmp_6_reg_531_pp0_iter1_reg;
reg   [5:0] sums_val_0_addr_1_reg_538;
reg   [5:0] sums_val_0_addr_1_reg_538_pp0_iter1_reg;
reg   [5:0] sums_val_0_addr_1_reg_538_pp0_iter2_reg;
reg   [5:0] sums_val_1_addr_1_reg_544;
reg   [5:0] sums_val_1_addr_1_reg_544_pp0_iter1_reg;
reg   [5:0] sums_val_1_addr_1_reg_544_pp0_iter2_reg;
reg   [5:0] sums_val_2_addr_1_reg_550;
reg   [5:0] sums_val_2_addr_1_reg_550_pp0_iter1_reg;
reg   [5:0] sums_val_2_addr_1_reg_550_pp0_iter2_reg;
wire   [0:0] tmp_3_fu_378_p2;
reg   [0:0] tmp_3_reg_556_pp0_iter1_reg;
wire   [31:0] sums_val_0_q0;
reg   [31:0] current_sum_val_0_reg_560;
wire   [31:0] sums_val_1_q0;
reg   [31:0] current_sum_val_1_reg_565;
wire   [31:0] sums_val_2_q0;
reg   [31:0] current_sum_val_2_reg_570;
reg   [31:0] tmp_20_reg_575;
reg   [31:0] tmp_21_reg_580;
reg   [31:0] tmp_19_reg_585;
wire   [31:0] current_sum_val_0_1_fu_411_p2;
reg   [31:0] current_sum_val_0_1_reg_590;
wire   [31:0] current_sum_val_1_1_fu_416_p2;
reg   [31:0] current_sum_val_1_1_reg_596;
wire   [31:0] current_sum_val_2_1_fu_421_p2;
reg   [31:0] current_sum_val_2_1_reg_602;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter2;
reg   [5:0] sums_val_0_address0;
reg    sums_val_0_ce0;
reg    sums_val_0_we0;
wire   [5:0] sums_val_0_address1;
reg    sums_val_0_ce1;
reg    sums_val_0_we1;
reg   [5:0] sums_val_1_address0;
reg    sums_val_1_ce0;
reg    sums_val_1_we0;
wire   [5:0] sums_val_1_address1;
reg    sums_val_1_ce1;
reg    sums_val_1_we1;
reg   [5:0] sums_val_2_address0;
reg    sums_val_2_ce0;
reg    sums_val_2_we0;
wire   [5:0] sums_val_2_address1;
reg    sums_val_2_ce1;
reg    sums_val_2_we1;
reg   [5:0] t_V_reg_229;
wire   [0:0] tmp_4_fu_298_p2;
reg    ap_block_state1;
reg   [9:0] t_V_1_reg_240;
wire    ap_CS_fsm_state8;
wire   [31:0] ap_phi_reg_pp0_iter0_storemerge2_reg_262;
reg   [31:0] ap_phi_reg_pp0_iter1_storemerge2_reg_262;
reg   [31:0] ap_phi_reg_pp0_iter2_storemerge2_reg_262;
reg   [31:0] ap_phi_reg_pp0_iter3_storemerge2_reg_262;
wire   [31:0] ap_phi_reg_pp0_iter0_storemerge1_reg_274;
reg   [31:0] ap_phi_reg_pp0_iter1_storemerge1_reg_274;
reg   [31:0] ap_phi_reg_pp0_iter2_storemerge1_reg_274;
reg   [31:0] ap_phi_reg_pp0_iter3_storemerge1_reg_274;
wire   [31:0] ap_phi_reg_pp0_iter0_storemerge_reg_286;
reg   [31:0] ap_phi_reg_pp0_iter1_storemerge_reg_286;
reg   [31:0] ap_phi_reg_pp0_iter2_storemerge_reg_286;
reg   [31:0] ap_phi_reg_pp0_iter3_storemerge_reg_286;
wire   [63:0] tmp_5_fu_310_p1;
wire   [63:0] tmp_9_fu_371_p1;
reg    ap_block_pp0_stage0_01001;
reg   [31:0] current_sum_val_2_3_fu_106;
reg   [31:0] current_sum_val_1_3_fu_110;
reg   [31:0] current_sum_val_0_3_fu_114;
wire   [4:0] tmp_fu_317_p1;
wire   [4:0] tmp_16_fu_339_p1;
wire   [5:0] r_V_2_fu_355_p4;
wire   [31:0] current_sum_val_0_2_fu_393_p3;
wire   [31:0] current_sum_val_1_2_fu_399_p3;
wire   [31:0] current_sum_val_2_2_fu_405_p3;
wire   [21:0] tmp_7_fu_441_p4;
wire   [21:0] tmp_11_fu_455_p4;
wire   [21:0] tmp_13_fu_469_p4;
reg   [4:0] ap_NS_fsm;
reg    ap_block_pp0;
reg    ap_enable_operation_106;
reg    ap_enable_state7_pp0_iter3_stage0;
reg    ap_enable_operation_58;
reg    ap_enable_state4_pp0_iter0_stage0;
reg    ap_enable_operation_65;
reg    ap_enable_state5_pp0_iter1_stage0;
reg    ap_enable_operation_107;
reg    ap_enable_operation_60;
reg    ap_enable_operation_66;
reg    ap_enable_operation_108;
reg    ap_enable_operation_62;
reg    ap_enable_operation_67;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_299;
reg    ap_condition_303;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
end

video_scale_sums_cud #(
    .DataWidth( 32 ),
    .AddressRange( 60 ),
    .AddressWidth( 6 ))
sums_val_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sums_val_0_address0),
    .ce0(sums_val_0_ce0),
    .we0(sums_val_0_we0),
    .d0(32'd0),
    .q0(sums_val_0_q0),
    .address1(sums_val_0_address1),
    .ce1(sums_val_0_ce1),
    .we1(sums_val_0_we1),
    .d1(ap_phi_reg_pp0_iter3_storemerge2_reg_262)
);

video_scale_sums_cud #(
    .DataWidth( 32 ),
    .AddressRange( 60 ),
    .AddressWidth( 6 ))
sums_val_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sums_val_1_address0),
    .ce0(sums_val_1_ce0),
    .we0(sums_val_1_we0),
    .d0(32'd0),
    .q0(sums_val_1_q0),
    .address1(sums_val_1_address1),
    .ce1(sums_val_1_ce1),
    .we1(sums_val_1_we1),
    .d1(ap_phi_reg_pp0_iter3_storemerge1_reg_274)
);

video_scale_sums_cud #(
    .DataWidth( 32 ),
    .AddressRange( 60 ),
    .AddressWidth( 6 ))
sums_val_2_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sums_val_2_address0),
    .ce0(sums_val_2_ce0),
    .we0(sums_val_2_we0),
    .d0(32'd0),
    .q0(sums_val_2_q0),
    .address1(sums_val_2_address1),
    .ce1(sums_val_2_ce1),
    .we1(sums_val_2_we1),
    .d1(ap_phi_reg_pp0_iter3_storemerge_reg_286)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((exitcond1_fu_321_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state4))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((exitcond1_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state4)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end else if (((exitcond1_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((1'b1 == ap_condition_303)) begin
            ap_phi_reg_pp0_iter3_storemerge1_reg_274 <= current_sum_val_1_1_fu_416_p2;
        end else if ((1'b1 == ap_condition_299)) begin
            ap_phi_reg_pp0_iter3_storemerge1_reg_274 <= 32'd0;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter3_storemerge1_reg_274 <= ap_phi_reg_pp0_iter2_storemerge1_reg_274;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((1'b1 == ap_condition_303)) begin
            ap_phi_reg_pp0_iter3_storemerge2_reg_262 <= current_sum_val_0_1_fu_411_p2;
        end else if ((1'b1 == ap_condition_299)) begin
            ap_phi_reg_pp0_iter3_storemerge2_reg_262 <= 32'd0;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter3_storemerge2_reg_262 <= ap_phi_reg_pp0_iter2_storemerge2_reg_262;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if ((1'b1 == ap_condition_303)) begin
            ap_phi_reg_pp0_iter3_storemerge_reg_286 <= current_sum_val_2_1_fu_421_p2;
        end else if ((1'b1 == ap_condition_299)) begin
            ap_phi_reg_pp0_iter3_storemerge_reg_286 <= 32'd0;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter3_storemerge_reg_286 <= ap_phi_reg_pp0_iter2_storemerge_reg_286;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_4_fu_298_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_1_reg_240 <= 10'd0;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        t_V_1_reg_240 <= r_V_reg_513;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_343_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        t_V_2_reg_251 <= c_V_1_fu_349_p2;
    end else if (((exitcond1_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        t_V_2_reg_251 <= 11'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        t_V_reg_229 <= 6'd0;
    end else if (((tmp_4_fu_298_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_reg_229 <= c_V_fu_304_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter1_storemerge1_reg_274 <= ap_phi_reg_pp0_iter0_storemerge1_reg_274;
        ap_phi_reg_pp0_iter1_storemerge2_reg_262 <= ap_phi_reg_pp0_iter0_storemerge2_reg_262;
        ap_phi_reg_pp0_iter1_storemerge_reg_286 <= ap_phi_reg_pp0_iter0_storemerge_reg_286;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_phi_reg_pp0_iter2_storemerge1_reg_274 <= ap_phi_reg_pp0_iter1_storemerge1_reg_274;
        ap_phi_reg_pp0_iter2_storemerge2_reg_262 <= ap_phi_reg_pp0_iter1_storemerge2_reg_262;
        ap_phi_reg_pp0_iter2_storemerge_reg_286 <= ap_phi_reg_pp0_iter1_storemerge_reg_286;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_522_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        current_sum_val_0_1_reg_590 <= current_sum_val_0_1_fu_411_p2;
        current_sum_val_1_1_reg_596 <= current_sum_val_1_1_fu_416_p2;
        current_sum_val_2_1_reg_602 <= current_sum_val_2_1_fu_421_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_522_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        current_sum_val_0_3_fu_114 <= current_sum_val_0_1_fu_411_p2;
        current_sum_val_1_3_fu_110 <= current_sum_val_1_1_fu_416_p2;
        current_sum_val_2_3_fu_106 <= current_sum_val_2_1_fu_421_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_522 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        current_sum_val_0_reg_560 <= sums_val_0_q0;
        current_sum_val_1_reg_565 <= sums_val_1_q0;
        current_sum_val_2_reg_570 <= sums_val_2_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_reg_522 <= exitcond_fu_343_p2;
        exitcond_reg_522_pp0_iter1_reg <= exitcond_reg_522;
        sums_val_0_addr_1_reg_538_pp0_iter1_reg <= sums_val_0_addr_1_reg_538;
        sums_val_1_addr_1_reg_544_pp0_iter1_reg <= sums_val_1_addr_1_reg_544;
        sums_val_2_addr_1_reg_550_pp0_iter1_reg <= sums_val_2_addr_1_reg_550;
        tmp_3_reg_556_pp0_iter1_reg <= tmp_3_reg_556;
        tmp_6_reg_531_pp0_iter1_reg <= tmp_6_reg_531;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        exitcond_reg_522_pp0_iter2_reg <= exitcond_reg_522_pp0_iter1_reg;
        sums_val_0_addr_1_reg_538_pp0_iter2_reg <= sums_val_0_addr_1_reg_538_pp0_iter1_reg;
        sums_val_1_addr_1_reg_544_pp0_iter2_reg <= sums_val_1_addr_1_reg_544_pp0_iter1_reg;
        sums_val_2_addr_1_reg_550_pp0_iter2_reg <= sums_val_2_addr_1_reg_550_pp0_iter1_reg;
        tmp_3_reg_556_pp0_iter2_reg <= tmp_3_reg_556_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        r_V_reg_513 <= r_V_fu_327_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_343_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_0_addr_1_reg_538 <= tmp_9_fu_371_p1;
        sums_val_1_addr_1_reg_544 <= tmp_9_fu_371_p1;
        sums_val_2_addr_1_reg_550 <= tmp_9_fu_371_p1;
        tmp_3_reg_556 <= tmp_3_fu_378_p2;
        tmp_6_reg_531 <= tmp_6_fu_365_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_522 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_19_reg_585 <= src_data_stream_2_V_dout;
        tmp_20_reg_575 <= src_data_stream_0_V_dout;
        tmp_21_reg_580 <= src_data_stream_1_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond1_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        tmp_8_reg_518 <= tmp_8_fu_333_p2;
    end
end

always @ (*) begin
    if ((exitcond_fu_343_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond1_fu_321_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (exitcond_reg_522_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        dst_data_stream_0_V_blk_n = dst_data_stream_0_V_full_n;
    end else begin
        dst_data_stream_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_predicate_op99_write_state7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_data_stream_0_V_write = 1'b1;
    end else begin
        dst_data_stream_0_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (exitcond_reg_522_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        dst_data_stream_1_V_blk_n = dst_data_stream_1_V_full_n;
    end else begin
        dst_data_stream_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_predicate_op100_write_state7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_data_stream_1_V_write = 1'b1;
    end else begin
        dst_data_stream_1_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (exitcond_reg_522_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        dst_data_stream_2_V_blk_n = dst_data_stream_2_V_full_n;
    end else begin
        dst_data_stream_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (ap_predicate_op101_write_state7 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dst_data_stream_2_V_write = 1'b1;
    end else begin
        dst_data_stream_2_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond1_fu_321_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((exitcond_reg_522 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_data_stream_0_V_blk_n = src_data_stream_0_V_empty_n;
    end else begin
        src_data_stream_0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_522 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        src_data_stream_0_V_read = 1'b1;
    end else begin
        src_data_stream_0_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_522 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_data_stream_1_V_blk_n = src_data_stream_1_V_empty_n;
    end else begin
        src_data_stream_1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_522 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        src_data_stream_1_V_read = 1'b1;
    end else begin
        src_data_stream_1_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_522 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        src_data_stream_2_V_blk_n = src_data_stream_2_V_empty_n;
    end else begin
        src_data_stream_2_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_522 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        src_data_stream_2_V_read = 1'b1;
    end else begin
        src_data_stream_2_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        sums_val_0_address0 = tmp_9_fu_371_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sums_val_0_address0 = tmp_5_fu_310_p1;
    end else begin
        sums_val_0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        sums_val_0_ce0 = 1'b1;
    end else begin
        sums_val_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_0_ce1 = 1'b1;
    end else begin
        sums_val_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_fu_298_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        sums_val_0_we0 = 1'b1;
    end else begin
        sums_val_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_0_we1 = 1'b1;
    end else begin
        sums_val_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        sums_val_1_address0 = tmp_9_fu_371_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sums_val_1_address0 = tmp_5_fu_310_p1;
    end else begin
        sums_val_1_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        sums_val_1_ce0 = 1'b1;
    end else begin
        sums_val_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_1_ce1 = 1'b1;
    end else begin
        sums_val_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_fu_298_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        sums_val_1_we0 = 1'b1;
    end else begin
        sums_val_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_1_we1 = 1'b1;
    end else begin
        sums_val_1_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        sums_val_2_address0 = tmp_9_fu_371_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        sums_val_2_address0 = tmp_5_fu_310_p1;
    end else begin
        sums_val_2_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        sums_val_2_ce0 = 1'b1;
    end else begin
        sums_val_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_2_ce1 = 1'b1;
    end else begin
        sums_val_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_fu_298_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        sums_val_2_we0 = 1'b1;
    end else begin
        sums_val_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sums_val_2_we1 = 1'b1;
    end else begin
        sums_val_2_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_4_fu_298_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((exitcond1_fu_321_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_fu_343_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((exitcond_fu_343_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter3 == 1'b1) & (((dst_data_stream_2_V_full_n == 1'b0) & (ap_predicate_op101_write_state7 == 1'b1)) | ((dst_data_stream_1_V_full_n == 1'b0) & (ap_predicate_op100_write_state7 == 1'b1)) | ((dst_data_stream_0_V_full_n == 1'b0) & (ap_predicate_op99_write_state7 == 1'b1)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_reg_522 == 1'd0) & (src_data_stream_2_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_1_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_0_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter3 == 1'b1) & (((dst_data_stream_2_V_full_n == 1'b0) & (ap_predicate_op101_write_state7 == 1'b1)) | ((dst_data_stream_1_V_full_n == 1'b0) & (ap_predicate_op100_write_state7 == 1'b1)) | ((dst_data_stream_0_V_full_n == 1'b0) & (ap_predicate_op99_write_state7 == 1'b1)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_reg_522 == 1'd0) & (src_data_stream_2_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_1_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_0_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter3 == 1'b1) & (((dst_data_stream_2_V_full_n == 1'b0) & (ap_predicate_op101_write_state7 == 1'b1)) | ((dst_data_stream_1_V_full_n == 1'b0) & (ap_predicate_op100_write_state7 == 1'b1)) | ((dst_data_stream_0_V_full_n == 1'b0) & (ap_predicate_op99_write_state7 == 1'b1)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_reg_522 == 1'd0) & (src_data_stream_2_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_1_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_0_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state4_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter1 = (((exitcond_reg_522 == 1'd0) & (src_data_stream_2_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_1_V_empty_n == 1'b0)) | ((exitcond_reg_522 == 1'd0) & (src_data_stream_0_V_empty_n == 1'b0)));
end

assign ap_block_state6_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state7_pp0_stage0_iter3 = (((dst_data_stream_2_V_full_n == 1'b0) & (ap_predicate_op101_write_state7 == 1'b1)) | ((dst_data_stream_1_V_full_n == 1'b0) & (ap_predicate_op100_write_state7 == 1'b1)) | ((dst_data_stream_0_V_full_n == 1'b0) & (ap_predicate_op99_write_state7 == 1'b1)));
end

always @ (*) begin
    ap_condition_299 = ((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter1_reg == 1'd1) & (exitcond_reg_522_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_condition_303 = ((tmp_3_reg_556_pp0_iter1_reg == 1'd1) & (tmp_8_reg_518 == 1'd0) & (exitcond_reg_522_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_enable_operation_106 = (tmp_3_reg_556_pp0_iter2_reg == 1'd1);
end

always @ (*) begin
    ap_enable_operation_107 = (tmp_3_reg_556_pp0_iter2_reg == 1'd1);
end

always @ (*) begin
    ap_enable_operation_108 = (tmp_3_reg_556_pp0_iter2_reg == 1'd1);
end

always @ (*) begin
    ap_enable_operation_58 = (exitcond_fu_343_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_60 = (exitcond_fu_343_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_62 = (exitcond_fu_343_p2 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_65 = (exitcond_reg_522 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_66 = (exitcond_reg_522 == 1'd0);
end

always @ (*) begin
    ap_enable_operation_67 = (exitcond_reg_522 == 1'd0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_enable_state4_pp0_iter0_stage0 = ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_enable_state5_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state7_pp0_iter3_stage0 = ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_phi_reg_pp0_iter0_storemerge1_reg_274 = 'bx;

assign ap_phi_reg_pp0_iter0_storemerge2_reg_262 = 'bx;

assign ap_phi_reg_pp0_iter0_storemerge_reg_286 = 'bx;

always @ (*) begin
    ap_predicate_op100_write_state7 = ((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (exitcond_reg_522_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op101_write_state7 = ((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (exitcond_reg_522_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op99_write_state7 = ((tmp_8_reg_518 == 1'd1) & (tmp_3_reg_556_pp0_iter2_reg == 1'd1) & (exitcond_reg_522_pp0_iter2_reg == 1'd0));
end

assign ap_ready = internal_ap_ready;

assign c_V_1_fu_349_p2 = (11'd1 + t_V_2_reg_251);

assign c_V_fu_304_p2 = (t_V_reg_229 + 6'd1);

assign current_sum_val_0_1_fu_411_p2 = (current_sum_val_0_2_fu_393_p3 + tmp_20_reg_575);

assign current_sum_val_0_2_fu_393_p3 = ((tmp_6_reg_531_pp0_iter1_reg[0:0] === 1'b1) ? current_sum_val_0_reg_560 : current_sum_val_0_3_fu_114);

assign current_sum_val_1_1_fu_416_p2 = (current_sum_val_1_2_fu_399_p3 + tmp_21_reg_580);

assign current_sum_val_1_2_fu_399_p3 = ((tmp_6_reg_531_pp0_iter1_reg[0:0] === 1'b1) ? current_sum_val_1_reg_565 : current_sum_val_1_3_fu_110);

assign current_sum_val_2_1_fu_421_p2 = (current_sum_val_2_2_fu_405_p3 + tmp_19_reg_585);

assign current_sum_val_2_2_fu_405_p3 = ((tmp_6_reg_531_pp0_iter1_reg[0:0] === 1'b1) ? current_sum_val_2_reg_570 : current_sum_val_2_3_fu_106);

assign dst_data_stream_0_V_din = $signed(tmp_7_fu_441_p4);

assign dst_data_stream_1_V_din = $signed(tmp_11_fu_455_p4);

assign dst_data_stream_2_V_din = $signed(tmp_13_fu_469_p4);

assign exitcond1_fu_321_p2 = ((t_V_1_reg_240 == 10'd960) ? 1'b1 : 1'b0);

assign exitcond_fu_343_p2 = ((t_V_2_reg_251 == 11'd1920) ? 1'b1 : 1'b0);

assign r_V_2_fu_355_p4 = {{t_V_2_reg_251[10:5]}};

assign r_V_fu_327_p2 = (10'd1 + t_V_1_reg_240);

assign start_out = real_start;

assign sums_val_0_address1 = sums_val_0_addr_1_reg_538_pp0_iter2_reg;

assign sums_val_1_address1 = sums_val_1_addr_1_reg_544_pp0_iter2_reg;

assign sums_val_2_address1 = sums_val_2_addr_1_reg_550_pp0_iter2_reg;

assign tmp_11_fu_455_p4 = {{current_sum_val_1_1_reg_596[31:10]}};

assign tmp_13_fu_469_p4 = {{current_sum_val_2_1_reg_602[31:10]}};

assign tmp_16_fu_339_p1 = t_V_2_reg_251[4:0];

assign tmp_3_fu_378_p2 = ((tmp_16_fu_339_p1 == 5'd31) ? 1'b1 : 1'b0);

assign tmp_4_fu_298_p2 = ((t_V_reg_229 == 6'd60) ? 1'b1 : 1'b0);

assign tmp_5_fu_310_p1 = t_V_reg_229;

assign tmp_6_fu_365_p2 = ((tmp_16_fu_339_p1 == 5'd0) ? 1'b1 : 1'b0);

assign tmp_7_fu_441_p4 = {{current_sum_val_0_1_reg_590[31:10]}};

assign tmp_8_fu_333_p2 = ((tmp_fu_317_p1 == 5'd31) ? 1'b1 : 1'b0);

assign tmp_9_fu_371_p1 = r_V_2_fu_355_p4;

assign tmp_fu_317_p1 = t_V_1_reg_240[4:0];

endmodule //video_scale

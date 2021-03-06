`define log2(X) (\
		      X <=   2 ? 1 : \
		      X <=   4 ? 2 : \
		      X <=   8 ? 3 : \
		      X <=  16 ? 4 : \
		      X <=  32 ? 5 : \
		      X <=  64 ? 6 : \
		      X <= 128 ? 7 : \
		      X <= 256 ? 8 : \
		      X <= 512 ? 9 : \
		      X <= 1024 ? 10 : \
		      X <= 2048 ? 11 : \
		      X <= 4096 ? 12 : \
		      X <= 8192 ? 13 : \
		      X <= 8192 ? 13 : \
		      X <= 16384 ? 14 : \
		      X <= 32768 ? 15 : \
		      X <= 65536 ? 16 : \
		      X <= 2*65536 ? 17 : \
		      X <= 4*65536 ? 18 : \
		      X <= 8*65536 ? 19 : \
		      X <= 16*65536 ? 20 : \
		      X <= 32*65536 ? 21 : \
		      X <= 64*65536 ? 22 : \
		      X <= 128*65536 ? 23 : \
		      X <= 256*65536 ? 24 : \
		      X <= 512*65536 ? 25 : \
		      X <= 1024*65536 ? 26 : \
		      X <= 2048*65536 ? 27 : \
		      X <= 4096*65536 ? 28 : \
		      X <= 8192*65536 ? 29 : \
		      X <= 16384*65536 ? 30 : \
		      X <= 32768*65536 ? 31 : -1)
  

`define SIMD_NUM 4096
`define V_STEP 64
`define P_BUNDLE 128
`define WORD_WIDTH 16
`define DSP_WORD_WIDTH 43

`define INPUT_PIX_WIDTH 8
`define INPUT_CH_NUM 4
`define CONV1_KERNEL 11
  
`define P_INST_ID 2'b00
`define P_LRN_ID 2'b01
`define P_DMAC_ID 2'b10
`define LUT_PARA_NUM 1
`define LUT_STEP 64
`define LUT_LOG_STEP 6
`define LUT_STEP_NUM 2048
`define LUT_STEP_NUM_WIDTH `log2(`LUT_STEP_NUM)
`define LUT_MEM_ADDR (`LUT_STEP_NUM/2)
`define LUT_MEM_ADDR_WIDTH (`LUT_STEP_NUM_WIDTH-1) 
`define LUT_VAL_WIDTH `WORD_WIDTH
//
`define SEL_PATCH_WIDTH 2
`define SEL_PATCH1 2'd0
`define SEL_PATCH2 2'd1
`define SEL_PATCH4 2'd2
`define SEL_PATCH8 2'd3

`define INST_PATCH_WIDTH 2

`define INST_CONV_PARAM_EN_WIDTH 1
`define INST_CONV_PARAM_WIDTH (`INST_CONV_PARAM_EN_WIDTH)
  
`define INST_DRA_EN_WIDTH 1
`define INST_DRA_AREA_ID_WIDTH `DMEM_AREA_NUM_WIDTH
`define INST_DRA_INC_PTR_EN_WIDTH 1
`define INST_DRA_OFFSET_WIDTH 3
`define INST_DRA_WIDTH (`INST_DRA_EN_WIDTH+`INST_DRA_AREA_ID_WIDTH+`INST_DRA_INC_PTR_EN_WIDTH+`INST_DRA_OFFSET_WIDTH)

`define INST_V_REG_OP_WIDTH 2
`define INST_V_REG_OP_NOP 2'b00
`define INST_V_REG_OP_SET 2'b01
`define INST_V_REG_OP_MOVE_M1 2'b10
`define INST_V_REG_OP_MOVE_P1 2'b11
`define INST_V_REG_WIDTH `INST_V_REG_OP_WIDTH


`define INST_H_REG_OP_WIDTH 3
`define INST_H_REG_OP_NOP      3'b000
`define INST_H_REG_OP_SET      3'b001
`define INST_H_REG_OP_MOVE_VM1 3'b010
`define INST_H_REG_OP_MOVE_HM1 3'b110
`define INST_H_REG_OP_MOVE_HP1 3'b111
`define INST_H_REG_OP_MOVE_FC  3'b101

`define INST_H_REG_WIDTH (`INST_H_REG_OP_WIDTH)

`define INST_P_REG_OP_WIDTH 2
`define INST_P_REG_OP_NOP 2'b00
`define INST_P_REG_OP_SET_P 2'b01
`define INST_P_REG_OP_SET_L 2'b10
`define INST_P_REG_WIDTH (`INST_P_REG_OP_WIDTH)


`define INST_A_REG_OP_WIDTH 3
`define INST_A_REG_H_REG_T_P_REG 3'b000
`define INST_A_REG_H_REG_T_H_REG 3'b001
`define INST_A_REG_ACC_H_REG_T_H_REG 3'b010
`define INST_A_REG_ACC_H_REG_T_P_REG 3'b011
`define INST_A_REG_C_REG_16 3'b100
`define INST_A_REG_ACC_H_REG 3'b101
`define INST_A_REG_SET_P_REG 3'b010
`define INST_A_REG_WIDTH (`INST_A_REG_OP_WIDTH)

`define INST_M_REG_OP_WIDTH 2
`define INST_M_REG_OP_HOLD 2'b00
`define INST_M_REG_OP_SET  2'b01
`define INST_M_REG_OP_MAX  2'b10
//`define INST_M_REG_OP_ZERO 3'b010
`define INST_M_REG_WIDTH `INST_M_REG_OP_WIDTH

`define INST_S_REG_OP_WIDTH 2
`define INST_S_REG_OP_SET_A_REG     2'b00
`define INST_S_REG_OP_SET_M_REG     2'b10
`define INST_S_REG_OP_SHIFT1    2'b01 
`define INST_S_REG_OP_SHIFT8    2'b11
`define INST_S_REG_WIDTH (`INST_S_REG_OP_WIDTH)

`define INST_R_REG_OP_WIDTH 3
`define INST_R_REG_OP_NOP      3'b000
`define INST_R_REG_OP_SET      3'b001
`define INST_R_REG_OP_MOVE8    3'b010
`define INST_R_REG_OP_RELU     3'b011
`define INST_R_REG_OP_MOD      3'b100
`define INST_R_REG_OP_POOL_H   3'b101
`define INST_R_REG_OP_POOL_SET 3'b110
`define INST_R_REG_POOL_SET_TGT_WIDTH 5
`define INST_R_REG_WIDTH (`INST_R_REG_POOL_SET_TGT_WIDTH+`INST_R_REG_OP_WIDTH)

`define INST_F_REG_OP_WIDTH 1
`define INST_F_REG_OP_NOP 1'b0
`define INST_F_REG_OP_SET 1'b1
`define INST_F_REG_WIDTH (`INST_F_REG_OP_WIDTH)

`define INST_DWA_EN_WIDTH 1
`define INST_DWA_AREA_ID_WIDTH `DMEM_AREA_NUM_WIDTH
`define INST_DWA_INC_PTR_EN_WIDTH 1
`define INST_DWA_WIDTH (`INST_DWA_EN_WIDTH+`INST_DWA_AREA_ID_WIDTH+`INST_DWA_INC_PTR_EN_WIDTH)

`define INST_LRN_OP_WIDTH 1
`define INST_LRN_OP_NOP 1'b0
`define INST_LRN_OP_SET 1'b1
`define INST_LRN_WIDTH  `INST_LRN_OP_WIDTH 
`define INST_WIDTH (`INST_PATCH_WIDTH+`INST_CONV_PARAM_EN_WIDTH+`INST_DRA_WIDTH+`INST_V_REG_WIDTH + `INST_H_REG_WIDTH + `INST_P_REG_WIDTH + `INST_A_REG_WIDTH + `INST_M_REG_WIDTH + `INST_S_REG_WIDTH+`INST_R_REG_WIDTH+`INST_F_REG_WIDTH+`INST_DWA_WIDTH+`INST_LRN_WIDTH)


`define INST_PATCH_RANGE_L 0
`define INST_PATCH_RANGE_U (`INST_PATCH_RANGE_L+`INST_PATCH_WIDTH-1)

`define INST_CONV_PARAM_EN_RANGE_L (`INST_PATCH_RANGE_U+1)
`define INST_CONV_PARAM_EN_RANGE_U (`INST_CONV_PARAM_EN_RANGE_L+`INST_CONV_PARAM_EN_WIDTH-1)
  
`define INST_DRA_EN_RANGE_L (`INST_CONV_PARAM_EN_RANGE_U+1)
`define INST_DRA_EN_RANGE_U (`INST_DRA_EN_RANGE_L+`INST_DRA_EN_WIDTH-1) 
`define INST_DRA_AREA_ID_RANGE_L (`INST_DRA_EN_RANGE_U+1)
`define INST_DRA_AREA_ID_RANGE_U (`INST_DRA_AREA_ID_RANGE_L + `INST_DRA_AREA_ID_WIDTH - 1)
`define INST_DRA_INC_PTR_EN_RANGE_L (`INST_DRA_AREA_ID_RANGE_U +1)
`define INST_DRA_INC_PTR_EN_RANGE_U (`INST_DRA_INC_PTR_EN_RANGE_L+`INST_DRA_INC_PTR_EN_WIDTH-1)
`define INST_DRA_OFFSET_RANGE_L (`INST_DRA_INC_PTR_EN_RANGE_U+1)
`define INST_DRA_OFFSET_RANGE_U (`INST_DRA_OFFSET_RANGE_L+`INST_DRA_OFFSET_WIDTH-1)
//
`define INST_V_REG_OP_RANGE_L (`INST_DRA_OFFSET_RANGE_U+1)
`define INST_V_REG_OP_RANGE_U (`INST_V_REG_OP_RANGE_L+`INST_V_REG_OP_WIDTH-1)
//
`define INST_H_REG_OP_RANGE_L (`INST_V_REG_OP_RANGE_U+1)
`define INST_H_REG_OP_RANGE_U (`INST_H_REG_OP_RANGE_L+`INST_H_REG_OP_WIDTH-1)
//
`define INST_P_REG_OP_RANGE_L (`INST_H_REG_OP_RANGE_U+1)
`define INST_P_REG_OP_RANGE_U (`INST_P_REG_OP_RANGE_L+`INST_P_REG_OP_WIDTH-1)
//
`define INST_A_REG_OP_RANGE_L (`INST_P_REG_OP_RANGE_U+1)
`define INST_A_REG_OP_RANGE_U (`INST_A_REG_OP_RANGE_L+`INST_A_REG_OP_WIDTH-1)
//
`define INST_M_REG_OP_RANGE_L (`INST_A_REG_OP_RANGE_U+1)
`define INST_M_REG_OP_RANGE_U (`INST_M_REG_OP_RANGE_L+`INST_M_REG_OP_WIDTH-1)
//
`define INST_S_REG_OP_RANGE_L (`INST_M_REG_OP_RANGE_U+1)
`define INST_S_REG_OP_RANGE_U (`INST_S_REG_OP_RANGE_L+`INST_S_REG_OP_WIDTH-1)
//
`define INST_R_REG_OP_RANGE_L (`INST_S_REG_OP_RANGE_U+1)
`define INST_R_REG_OP_RANGE_U (`INST_R_REG_OP_RANGE_L+`INST_R_REG_OP_WIDTH-1)
`define INST_R_REG_POOL_SET_TGT_RANGE_L (`INST_R_REG_OP_RANGE_U+1)
`define INST_R_REG_POOL_SET_TGT_RANGE_U (`INST_R_REG_POOL_SET_TGT_RANGE_L+`INST_R_REG_POOL_SET_TGT_WIDTH-1)
//
`define INST_F_REG_OP_RANGE_L (`INST_R_REG_POOL_SET_TGT_RANGE_U+1)
`define INST_F_REG_OP_RANGE_U (`INST_F_REG_OP_RANGE_L+`INST_F_REG_OP_WIDTH-1)
//
`define INST_DWA_EN_RANGE_L (`INST_F_REG_OP_RANGE_U+1)
`define INST_DWA_EN_RANGE_U (`INST_DWA_EN_RANGE_L+`INST_DWA_EN_WIDTH-1) 
`define INST_DWA_AREA_ID_RANGE_L (`INST_DWA_EN_RANGE_U+1)
`define INST_DWA_AREA_ID_RANGE_U (`INST_DWA_AREA_ID_RANGE_L + `INST_DWA_AREA_ID_WIDTH - 1)
`define INST_DWA_INC_PTR_EN_RANGE_L (`INST_DWA_AREA_ID_RANGE_U +1)
`define INST_DWA_INC_PTR_EN_RANGE_U (`INST_DWA_INC_PTR_EN_RANGE_L+`INST_DWA_INC_PTR_EN_WIDTH-1)
//
`define INST_LRN_OP_RANGE_L (`INST_DWA_INC_PTR_EN_RANGE_U+1)
`define INST_LRN_OP_RANGE_U (`INST_LRN_OP_RANGE_L+`INST_LRN_OP_WIDTH-1)



`define SEL_SHIFT_WIDTH 1
`define SEL_SHIFT1 1'b0
`define SEL_SHIFT8 1'b1

`define PATCH1_WIDTH 8
`define PATCH1_HEIGHT 8
`define PATCH2_WIDTH 16
`define PATCH2_HEIGHT 16
`define PATCH4_WIDTH 32
`define PATCH4_HEIGHT 32
`define PATCH8_WIDTH 64
`define PATCH8_HEIGHT 64

`define DMEM_AREA_NUM 16
`define DMEM_AREA_NUM_WIDTH `log2(`DMEM_AREA_NUM)
`define DMEM_AREA_SIZE `DMEM_ADDR_NUM/2
`define DMEM_AREA_SIZE_WIDTH `log2(`DMEM_AREA_SIZE)
`define DMEM_ADDR_NUM 128
`define DMEM_ADDR_NUM_WIDTH `log2(`DMEM_ADDR_NUM)

`define UNIT_SIMD_NUM 8

`define CONV_PARAM_BANK_NUM `SIMD_NUM/(`PATCH1_HEIGHT * `PATCH1_WIDTH)
`define CONV_PARAM_BANK_WIDTH (`log2(`CONV_PARAM_BANK_NUM))
`define CONV_PARAM_ADDR_SIZE (2048*512) // (2048*18bit)*512BRAMs
`define CONV_PARAM_ADDR_WIDTH `log2(`CONV_PARAM_ADDR_SIZE)

`define FCIN_MAX_DIM (`SIMD_NUM*4)


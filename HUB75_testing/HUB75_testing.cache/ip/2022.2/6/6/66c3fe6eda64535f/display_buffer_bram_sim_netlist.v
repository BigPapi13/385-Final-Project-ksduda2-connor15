// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Dec  9 13:33:13 2024
// Host        : Connors_laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ display_buffer_bram_sim_netlist.v
// Design      : display_buffer_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "display_buffer_bram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  output rsta_busy;

  wire [11:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire rsta;
  wire rsta_busy;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.071399 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "display_buffer_bram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 49200)
`pragma protect data_block
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
NdhWwGExrPdW
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

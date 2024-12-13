// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Dec 13 02:19:44 2024
// Host        : Connors_laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/conno/Documents/Stuff/UIUC/2024-2025/FALL/ECE385/final/repo/final_project/final_project.gen/sources_1/ip/display_buffer_bram/display_buffer_bram_sim_netlist.v
// Design      : display_buffer_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "display_buffer_bram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module display_buffer_bram
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [11:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
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
  (* C_EN_SAFETY_CKT = "0" *) 
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
  (* C_HAS_RSTA = "0" *) 
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
  display_buffer_bram_blk_mem_gen_v8_4_5 U0
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
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 44672)
`pragma protect data_block
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
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

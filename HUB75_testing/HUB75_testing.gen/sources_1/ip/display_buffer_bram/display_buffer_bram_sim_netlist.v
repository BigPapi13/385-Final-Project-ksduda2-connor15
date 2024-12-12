// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Dec  9 13:33:13 2024
// Host        : Connors_laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top display_buffer_bram -prefix
//               display_buffer_bram_ display_buffer_bram_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48864)
`pragma protect data_block
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
JXw7wVscPFCoFePJF00D
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

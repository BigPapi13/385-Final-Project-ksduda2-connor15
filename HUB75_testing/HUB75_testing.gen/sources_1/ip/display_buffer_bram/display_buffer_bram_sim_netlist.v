// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec 12 14:07:05 2024
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 44384)
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

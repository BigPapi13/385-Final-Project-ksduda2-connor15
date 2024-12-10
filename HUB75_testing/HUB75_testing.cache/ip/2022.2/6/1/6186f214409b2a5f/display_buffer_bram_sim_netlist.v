// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Dec 10 02:32:26 2024
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [11:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;
  output rsta_busy;

  wire [11:0]addra;
  wire clka;
  wire [11:0]dina;
  wire [11:0]douta;
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
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.822999 mW" *) 
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
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
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
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
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
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 41072)
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

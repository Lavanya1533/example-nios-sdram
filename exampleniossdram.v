module exampleniossdram(
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	input 		     [3:0]		KEY,

	output		     [9:0]		LEDR
);


	wire clk_clk;
	wire reset_reset_n;
	wire locked;
	wire [7:0] kex_export;
	wire [15:0] ledr_export;
	wire [31:0] hex_export;
	
	platformniossdram u0 (
		.clk_clk          (clk_clk),         
		.hex_wire_export  (hex_export),  
		.key_wire_export  (key_export), 
		.ledr_wire_export (ledr_export), 
		.reset_reset_n    (reset_reset_n),    
		.sdram_wire_addr  (DRAM_ADDR),  
		.sdram_wire_ba    (DRAM_BA),    
		.sdram_wire_cas_n (DRAM_CAS_N), 
		.sdram_wire_cke   (DRAM_CKE),   
		.sdram_wire_cs_n  (DRAM_CS_N),  
		.sdram_wire_dq    (DRAM_DQ),    
		.sdram_wire_dqm   ({DRAM_UDQM,DRAM_LDQM}),   
		.sdram_wire_ras_n (DRAM_RAS_N), 
		.sdram_wire_we_n  (DRAM_WE_N),  
		.sdram_clk_clk    (DRAM_CLK),
		.pll_0_locked_export (locked)
	);

	assign clk_clk = CLOCK_50;
	assign reset_reset_n = KEY[0];
	
   hexdecoder HEXD0(hex_export[03:00], HEX0);
   hexdecoder HEXD1(hex_export[07:04], HEX1);
   hexdecoder HEXD2(hex_export[11:08], HEX2);
   hexdecoder HEXD3(hex_export[15:12], HEX3);
   hexdecoder HEXD4(hex_export[19:16], HEX4);
   hexdecoder HEXD5(hex_export[23:20], HEX5);
	
   assign key_export = {4'h0, KEY};
   assign LEDR[7:0]  = ledr_export[7:0];

   reg [23:0]         heartbeat;

   // heartbeat indicator
   always @(posedge CLOCK_50, negedge KEY[0])
     if (KEY[0] == 1'b0)
       heartbeat <= 24'b0;
     else
       heartbeat <= heartbeat + 1'b1;
   assign LEDR[9] = heartbeat[23];
   assign LEDR[8] = ~heartbeat[23] ^ locked;

	
	
endmodule

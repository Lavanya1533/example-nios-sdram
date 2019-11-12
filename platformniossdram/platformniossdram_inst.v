	platformniossdram u0 (
		.clk_clk             (<connected-to-clk_clk>),             //          clk.clk
		.hex_wire_export     (<connected-to-hex_wire_export>),     //     hex_wire.export
		.key_wire_export     (<connected-to-key_wire_export>),     //     key_wire.export
		.ledr_wire_export    (<connected-to-ledr_wire_export>),    //    ledr_wire.export
		.pll_0_locked_export (<connected-to-pll_0_locked_export>), // pll_0_locked.export
		.reset_reset_n       (<connected-to-reset_reset_n>),       //        reset.reset_n
		.sdram_clk_clk       (<connected-to-sdram_clk_clk>),       //    sdram_clk.clk
		.sdram_wire_addr     (<connected-to-sdram_wire_addr>),     //   sdram_wire.addr
		.sdram_wire_ba       (<connected-to-sdram_wire_ba>),       //             .ba
		.sdram_wire_cas_n    (<connected-to-sdram_wire_cas_n>),    //             .cas_n
		.sdram_wire_cke      (<connected-to-sdram_wire_cke>),      //             .cke
		.sdram_wire_cs_n     (<connected-to-sdram_wire_cs_n>),     //             .cs_n
		.sdram_wire_dq       (<connected-to-sdram_wire_dq>),       //             .dq
		.sdram_wire_dqm      (<connected-to-sdram_wire_dqm>),      //             .dqm
		.sdram_wire_ras_n    (<connected-to-sdram_wire_ras_n>),    //             .ras_n
		.sdram_wire_we_n     (<connected-to-sdram_wire_we_n>)      //             .we_n
	);


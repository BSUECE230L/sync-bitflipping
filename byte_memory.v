module byte_memory
#(
    parameter BIT_COUNT = 8 
)
(
    input [BIT_COUNT - 1:0] data,
    input store,
    output reg [BIT_COUNT - 1:0] memory
);
    // instantiate BIT_COUNT number of d_latch
    genvar i; 
    generate 
        for (i = 0; i < BIT_COUNT; i = i + 1) begin 
            d_latch dl( 
                .D(data[i]),
                .E(store),
                .Q(memory[i]),
            );
        end
    endgenerate

endmodule


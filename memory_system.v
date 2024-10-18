module memory_system
(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // instantiate 4 byte_memory modules
    reg[7:0] byte0, byte1, byte2, byte3;

    // assign data to the correct byte
    always @(*) begin
        case(addr)
            2'b00: {byte3, byte2, byte1, byte0} <= {8'b0, 8'b0, 8'b0,data};
            2'b01: {byte3, byte2, byte1, byte0} <= {8'b0, 8'b0, data, 8'b0};
            2'b10: {byte3, byte2, byte1, byte0} <= {8'b0, data, 8'b0, 8'b0};
            2'b11: {byte3, byte2, byte1, byte0} <= {data, 8'b0, 8'b0,8'b0};
        endcase
    end

    reg bit0, bit1, bit2, bit3;
    
    // assign store bits
    always @(*) begin
        case(addr)
            2'b00: {bit3, bit2, bit1, bit0} <= {1'b0, 1'b0, 1'b0, store};
            2'b01: {bit3, bit2, bit1, bit0} <= {1'b0, 1'b0, store, 1'b0};
            2'b10: {bit3, bit2, bit1, bit0} <= {1'b0, store, 1'b0, 1'b0};
            2'b11: {bit3, bit2, bit1, bit0} <= {store, 1'b0, 1'b0, 1'b0};
        endcase
    end

    // instantiate 4, 8-bit memory modules
   wire [7:0] internal_data[3:0];
   
   // addr = 00 -> assign store byte0
   byte_memory bm1(
       .data(byte0),
       .store(bit0),
       .memory(internal_data[0])
   );

    // addr = 01 -> assign store byte1
   byte_memory bm2(
       .data(byte1),
       .store(bit1),
       .memory(internal_data[1])
   );

    // addr = 10 -> assign store byte2
   byte_memory bm3(
       .data(byte2),
       .store(bit2),
       .memory(internal_data[2])
   );

    // addr = 11 -> assign store byte3
   byte_memory bm4(
       .data(byte3),
       .store(bit3),
       .memory(internal_data[3])
   );
   
    // set memory to the selected internal_data 
    always @(*) begin 
        case(addr)
            2'b00: memory <= internal_data[0];
            2'b01: memory <= internal_data[1];
            2'b10: memory <= internal_data[2];
            2'b11: memory <= internal_data[3];
        endcase
     end

endmodule


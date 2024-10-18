module mux(
    input sel,
    input A, B, C, D,
    output reg Y,
);

    always @(*) begin 
                case (sel) 
                    2'b00: Y = A;
                    2'b01: Y = B;
                    2'b10: Y = C;
                    2'b11: Y = D;
                endcase
    end

endmodule
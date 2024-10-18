module d_latch(
    input D, 
    input E,
    output Q,
    output NotQ
);


    always @(E) begin 
       // data = 1, enable = 1 -> Q = 1 (non-blocking)
        // data = 0, enable = 1 -> Q = 0 (non-blocking)
        Q <= D;
        // if (D & E)
        //     Q <= 1; 
        // else if (~D & E)
        //     Q <= 0;

        // not enabled -> Q stays the same
    end

    // always @(D, E) begin 
    //    // data = 1, enable = 1 -> Q = 1 (non-blocking)
    //     // data = 0, enable = 1 -> Q = 0 (non-blocking)
    //     if(E)
    //         Q <= D;
    //     // if (D & E)
    //     //     Q <= 1; 
    //     // else if (~D & E)
    //     //     Q <= 0;

    //     // not enabled -> Q stays the same
    // end

    assign NotQ = ~Q; 

endmodule


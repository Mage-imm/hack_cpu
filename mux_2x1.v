module mux_2x1(
    input [15:0] i0,i1,
    output reg [15:0] q,
    input s
);

    always@(*) begin
        if(s == 1'b0) begin
            q = i0;
        end
        else begin
            q = i1;
        end
    end
endmodule
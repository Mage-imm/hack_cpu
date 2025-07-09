module pc(
    input[15:0] i,
    input load,
    input clk,
    input inc,
    input reset,
    output reg [15:0] out = 0
);
    
    always@(posedge clk)begin
       if (reset)
            out <= 0;
        else if (load)
            out <= i;
        else if (inc)
            out <= out + 1;
        
    end
endmodule
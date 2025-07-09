module regis(
    input[15:0]num,
    input load,
    output reg [15:0]y,
    input clk
);
    always@(posedge clk)begin
        if(load)begin
        y <= num;
        end
    end
endmodule

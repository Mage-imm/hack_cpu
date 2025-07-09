module ram_16k(
    input load,
    input [15:0] in,
    input [13:0] adr,
    output [15:0] out,
    input clk
);
    reg [15:0] reg_arr[16383:0];

    always @(posedge clk) begin
        if (load)
            reg_arr[adr] <= in; 
    end

    assign out = reg_arr[adr];
endmodule

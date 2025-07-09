`include "mux_2x1.v"
`include "hack_alu.v"
`include "hack_pc.v"
`include "hack_register.v"

module cpu(
    input [15:0]inpm,
    input [15:0]instruct,
    input clk,
    input reset,
    output [15:0]outm,
    output writm,
    output [15:0]adrr,
    output [15:0]pc
);
wire selec;
wire loada;
wire [15:0]rega;
wire [15:0]regd;
wire [15:0]mux0out;
wire zr,ng;
reg [2:0] jump_bits;
reg jump;
always@(*)begin
    if(instruct[15])begin
     jump_bits = instruct[2:0];
    end
    else begin
         jump_bits = 3'b000;
    end
end
always @(*) begin
    if (jump_bits == 3'b000) begin
        jump = 0;                    // null → never jump
    end else if (jump_bits == 3'b001) begin
        jump = (~zr & ~ng);          // JGT → out > 0
    end else if (jump_bits == 3'b010) begin
        jump = (zr);                 // JEQ → out == 0
    end else if (jump_bits == 3'b011) begin
        jump = (~ng | zr);           // JGE → out >= 0
    end else if (jump_bits == 3'b100) begin
        jump = (ng);                 // JLT → out < 0
    end else if (jump_bits == 3'b101) begin
        jump = (~zr);                // JNE → out != 0
    end else if (jump_bits == 3'b110) begin
        jump = (ng | zr);            // JLE → out <= 0
    end else if (jump_bits == 3'b111) begin
        jump = 1;                    // JMP → unconditional
    end else begin
        jump = 0;                    // default fallback
    end
end



assign loada = ~instruct[15] + instruct[5];

wire [15:0]mux1out;


assign selec = instruct[15] & instruct[5];

mux_2x1 mux0(.i0(instruct),.i1(outm),.s(selec),.q(mux0out));

regis ra(.num(mux0out),.clk(clk),.load(loada),.y(rega));

mux_2x1 mux1(.i0(rega),.i1(inpm),.s(instruct[12]),.q(mux1out));

regis rd(.num(outm),.clk(clk),.load(instruct[4]),.y(regd));

hack_alu al0(.x(regd),.y(mux1out),.zx(instruct[11]),.nx(instruct[10]),.zy(instruct[9]),
            .ny(instruct[8]),.f(instruct[7]),.no(instruct[6]),.out(outm),
            .zr(zr),.ng(ng));

pc pc0(.i(rega),.load(jump),.clk(clk),.inc(~jump),.reset(reset),.out(pc));

assign adrr = rega; 
assign writm = instruct[15] & instruct[3];



endmodule

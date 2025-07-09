`include "cpu.v"
`include "ram.v"
`include "rom.v"


module comp(
    input clk,
    input reset
);

    wire [15:0]inpm;
    wire [15:0]instruct;
    wire [15:0]outm;
    wire writm;
    wire [15:0]adrr;
    wire [15:0]pc;

    cpu cpu0(.inpm(inpm),.instruct(instruct),.reset(reset),.outm(outm),
            .writm(writm),.adrr(adrr),.pc(pc),.clk(clk));


    ram_16k ram0(.load(writm),.in(outm),.clk(clk),.out(inpm),.adr(adrr[13:0]));
    rom32k rom0(.i(pc[14:0]),.out(instruct));
endmodule
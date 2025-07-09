module rom32k(
    input [14:0] i,
    output reg [15:0] out
);
    reg [15:0] memory [0:32767];

    initial begin
        $display("🔄 Loading prog.hex...");
        $readmemh("prog.hex", memory);
        $display("✅ prog.hex loaded.");
    end

    always @(*) begin
        out = memory[i];
    end
endmodule

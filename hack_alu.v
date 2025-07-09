module hack_alu(
    input [15:0] x, y,
    input zx, nx, zy, ny, f, no,
    output reg zr, ng,
    output reg [15:0] out
);

    reg [15:0] x1;   
    reg [15:0] y1;   
    reg [15:0] result;

    always @(*) begin
        
        if (zx == 1) begin
            x1 = 16'b0;
        end else begin
            x1 = x;
        end

        if (nx == 1) begin
            x1 = ~x1;
        end

        // --- Step 2: Handle zy and ny ---
        if (zy == 1) begin
            y1 = 16'b0;
        end else begin
            y1 = y;
        end

        if (ny == 1) begin
            y1 = ~y1;
        end

        // --- Step 3: ALU operation (f bit) ---
        if (f == 1) begin
            result = x1 + y1;   // Add
        end else begin
            result = x1 & y1;   // AND
        end

        // --- Step 4: Final NOT if no == 1 ---
        if (no == 1) begin
            out = ~result;
        end else begin
            out = result;
        end

        // --- Step 5: Flags ---
        if (out == 16'b0) begin
            zr = 1;
        end else begin
            zr = 0;
        end

        if (out[15] == 1) begin
            ng = 1;
        end else begin
            ng = 0;
        end
    end
endmodule

`include "computer.v"

module testbench;
    reg clk = 0;
    reg reset = 1;

    comp uut(.clk(clk), .reset(reset));

    // Clock toggles every 5ns = 10ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");        // for GTKWave
        $dumpvars(0, testbench);      // dump everything under testbench

        #10 reset = 0;                // release reset after 10ns
        #200 $finish;                 // run simulation for 200ns
    end
endmodule

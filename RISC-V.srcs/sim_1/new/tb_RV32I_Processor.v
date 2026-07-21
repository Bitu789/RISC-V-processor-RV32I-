`timescale 1ns / 1ps

module tb_RV32I_Processor;

// Inputs
reg clk;
reg rst;

// Instantiate Processor
RV32I_Processor DUT (

    .clk(clk),
    .rst(rst)

);

//--------------------------------------------------
// Clock Generation (10 ns Period)
//--------------------------------------------------

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

//--------------------------------------------------
// Reset Sequence
//--------------------------------------------------

initial
begin

    rst = 1;

    #20;

    rst = 0;

end

//--------------------------------------------------
// Simulation Time
//--------------------------------------------------

initial
begin

    #300;

    $finish;

end

//--------------------------------------------------
// Waveform Dump
//--------------------------------------------------

initial
begin

    $dumpfile("RV32I_Processor.vcd");
    $dumpvars(0, tb_RV32I_Processor);

end

endmodule
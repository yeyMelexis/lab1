`timescale 1ns / 1ps
module task_10_tb();
  reg clk, n_rst, in;
  wire out;
  parameter PERIOD = 2;
  
  initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
  end
  
  initial begin
    in = 0;
    
              n_rst = 1'b1;
    #PERIOD   n_rst = 1'b0;
    #(2*PERIOD) n_rst = 1'b1;
    
    repeat(2) begin
      #PERIOD;
      in = 1;
      #(2*PERIOD) in = 0;
      #(2*PERIOD);
    end
    @(negedge clk)
    $finish;
  end
  
  edge2 edge21( .clk(clk), 
                .n_rst(n_rst), 
                .in(in), 
                .out(out)
                );
  
  
endmodule

module task_12_tb();
  parameter               WIDTH = 4;
  reg                   clk, n_rst;
  wire   [WIDTH-1:0] out;
  parameter PERIOD = 4;
	
  task_12 #(.WIDTH(WIDTH)) task_12_1(
									.clk(clk),
									.n_rst(n_rst),
									.out(out)
									);
                    
  initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
  end
  
  initial begin
       //RESET generation
    n_rst = 1'b1;
    repeat(2) @(posedge clk); 
    n_rst = 1'b0;
    
    repeat(2) @(posedge clk); 
    n_rst = 1'b0;
     
    n_rst = 1'b1;
    //////////////////
    
    repeat(10) begin
      @(posedge clk);
    end
    
    $finish;
  end
  
endmodule

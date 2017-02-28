module task_13_tb();
  parameter               WIDTH = 4;
  parameter PERIOD = 4;
  
  reg                   clk, n_rst;
  reg       [WIDTH-1:0] data_in;
  wire      [WIDTH-1:0] data_out, jcnt_out;
  
  
  initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
  end
  
  initial begin
    data_in = 0;
       //RESET generation
    n_rst = 1'b1;
    repeat(2) @(posedge clk); 
    n_rst = 1'b0;
    
    repeat(2) @(posedge clk); 
    n_rst = 1'b0;
     
    n_rst = 1'b1;
    //////////////////
    
    repeat(10) begin
      @(negedge clk);
      data_in = $random();
    end
    
    $finish;
  end
  task_13 #(.WIDTH(WIDTH)) 	 task_13_1( .clk(clk),
										.n_rst(n_rst), 
										.jcnt_out(jcnt_out), 
										.data_in(data_in), 
										.data_out(data_out)
										);
  
endmodule

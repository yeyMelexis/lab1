module task_13_tb();
  parameter               WIDTH = 4;
  
  reg                   clk, n_rst;
  reg       [WIDTH-1:0] data_in;
  wire      [WIDTH-1:0] data_out, jcnt_out;
  
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    data_in = 0;
       n_rst = 1'b1;
    #1 n_rst = 1'b0;
    #2 n_rst = 1'b1;
    
    repeat(10) begin
      @(negedge clk);
      data_in = $random();
    end
    
    $finish;
  end
  task_13 task_13_1( .clk(clk),
                .n_rst(n_rst), 
                .jcnt_out(jcnt_out), 
                .data_in(data_in), 
                .data_out(data_out));
  
endmodule

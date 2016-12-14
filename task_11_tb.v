module task_11_tb();
  parameter               WIDTH = 4;
  reg                   clk, n_rst;
  wire   [WIDTH-1:0] out;
  
  task_11 task_11_1(
                    .clk(clk),
                    .n_rst(n_rst),
                    .out(out));
                    
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
       n_rst = 1'b1;
    #1 n_rst = 1'b0;
    #2 n_rst = 1'b1;
    
    repeat(10) begin
      @(posedge clk);
    end
    
    $finish;
  end
  
endmodule


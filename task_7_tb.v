module task_7_tb();
  
parameter DATA_WIDTH = 4;
              
reg clk, n_rst, Right_in, Left_in;
reg   [DATA_WIDTH-1:0]  data_in;
wire  [DATA_WIDTH-1:0]  data_out; 
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    Right_in  = 0;
    Left_in   = 0;
    data_in   = 0;
    
       n_rst = 1'b1;
    #1 n_rst = 1'b0;
    #2 n_rst = 1'b1;
    
    repeat(10) begin 
      @(negedge clk);
      data_in = $random();
      Right_in = $random();
      Left_in = $random();    
    end
    
    $finish;
  end
  
  
task_7 task_71(.clk(clk), 
              .n_rst(n_rst), 
              .Left_in(Left_in), 
              .Right_in(Right_in), 
              .data_in(data_in), 
              .data_out(data_out)
              );


  
  
endmodule
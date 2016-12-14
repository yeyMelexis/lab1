module task_14_tb();
  
  parameter WIDTH = 4;
  
  reg   clk, n_rst;
  reg  [WIDTH-1:0]  A,B,C;
  wire [WIDTH-1:0]  Q, Q_pipe;
  
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  initial begin
    A = 0;
    B = 0;
    C = 0;
       n_rst = 1'b1;
    #1 n_rst = 1'b0;
    #2 n_rst = 1'b1;
    
   repeat(10) begin
     A = $random();
     B = $random();
     C = $random();
     @(negedge clk);
   end
        
        #10 $finish;   
  end
  
   task_14 task_14_1( .clk(clk),
                      .n_rst(n_rst),
                      .A(A),
                      .B(B),
                      .C(C),
                      .Q(Q),
                      .Q_pipe(Q_pipe));
   
endmodule
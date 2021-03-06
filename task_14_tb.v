module task_14_tb();
  
  parameter WIDTH = 4;
  parameter PERIOD = 4;
  
  reg   clk, n_rst;
  reg  [WIDTH-1:0]  A,B,C;
  wire [WIDTH-1:0]  Q, Q_pipe;
  
  initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
  end
  
  initial begin
    A = 0;
    B = 0;
    C = 0;
       //RESET generation
    n_rst = 1'b1;
    repeat(2) @(posedge clk); 
    n_rst = 1'b0;
    
    repeat(2) @(posedge clk); 
    n_rst = 1'b0;
     
    n_rst = 1'b1;
    //////////////////
    
   repeat(10) begin
     A = $random();
     B = $random();
     C = $random();
     @(negedge clk);
   end
        
        #10 $finish;   
  end
  
   task_14 #(.WIDTH(WIDTH)) task_14_1(.clk(clk),
									  .n_rst(n_rst),
									  .A(A),
									  .B(B),
									  .C(C),
									  .Q(Q),
									  .Q_pipe(Q_pipe)
									  );
   
endmodule
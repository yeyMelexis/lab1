module task_14(clk, n_rst, A, B, C, Q, Q_pipe);
        
  parameter WIDTH = 4;
  
  input   clk, n_rst;
  input  [WIDTH-1: 0]   A, B, C;
  output reg [WIDTH-1: 0]   Q, Q_pipe;
  
  reg   [WIDTH-1: 0]    qA, qB, qC, AB_sum_2, qC_2;
  wire  [WIDTH-1: 0]    AB_sum, ABxorC, ABxorC_2;
    
  always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
      qA <= 0;
      qB <= 0;
      qC <= 0;
      Q  <= 0;
      
      //Pipe-line
      qC_2 <= 0;
      AB_sum_2 <= 0;
      Q_pipe <= 0;
    end
    else begin
    
      qA <= A;
      qB <= B;
      qC <= C;
      Q  <= ABxorC;
      
      //Pipe-line
      AB_sum_2 <= AB_sum;
      qC_2 <= qC; 
      Q_pipe <= ABxorC_2;
      
    end
  end

  assign  AB_sum    = qA + qB;
  assign  ABxorC    = AB_sum ^ qC;
  
  //Pipe-line
  assign  ABxorC_2  = AB_sum_2 ^qC_2; 

endmodule
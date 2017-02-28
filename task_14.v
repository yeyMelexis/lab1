module task_14(clk, n_rst, A, B, C, Q, Q_pipe);
        
  parameter WIDTH = 4;
  
  input   clk, n_rst;
  input  [WIDTH-1: 0]   A, B, C;
  output reg [WIDTH-1: 0]   Q, Q_pipe;
  
  reg   [WIDTH-1: 0]    qA_r, qB_r, qC_r, AB_sum_2_r, qC_2_r;
  wire  [WIDTH-1: 0]    AB_sum, ABxorC, ABxorC_2;
    
  always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
      qA_r <= 0;
      qB_r <= 0;
      qC_r <= 0;
      Q  <= 0;
      
      //Pipe-line
      qC_2_r <= 0;
      AB_sum_2_r <= 0;
      Q_pipe <= 0;
    end
    else begin
    
      qA_r <= A;
      qB_r <= B;
      qC_r <= C;
      Q  <= ABxorC;
      
      //Pipe-line
      AB_sum_2_r <= AB_sum;
      qC_2_r <= qC_r; 
      Q_pipe <= ABxorC_2;
      
    end
  end

  assign  AB_sum    = qA_r + qB_r;
  assign  ABxorC    = AB_sum ^ qC_r;
  
  //Pipe-line
  assign  ABxorC_2  = AB_sum_2_r ^ qC_2_r; 

endmodule

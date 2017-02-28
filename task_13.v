module task_13( clk,
                n_rst, 
                jcnt_out, 
                data_in, 
                data_out);
  
  parameter     WIDTH = 4;
  
  wire      cmpr;
  
  input                   clk, n_rst;
  input       [WIDTH-1:0] data_in;
  output wire [WIDTH-1:0] jcnt_out;
  output reg  [WIDTH-1:0] data_out;
  
 task_12 #(.WIDTH(WIDTH)) jnct( .clk(clk),
							   .n_rst(n_rst),
							   .out(jcnt_out)
							   );
  
  always @(n_rst or cmpr or data_in) begin
    if (!n_rst) begin
      data_out <= 0;
    end
    else if (cmpr) begin
      data_out <= data_in;
    end
      
  end
                                                   
 assign cmpr = &jcnt_out | &(!jcnt_out);
                
endmodule
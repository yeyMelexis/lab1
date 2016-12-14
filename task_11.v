module  task_11(clk, n_rst, out);
  
  parameter               WIDTH = 4;
  input                   clk, n_rst;
  output reg  [WIDTH-1:0] out;
  
  always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
      out <= 4'b1000;
    end
    else begin
      out <= {out[0], out[WIDTH-1:1]};
    end
  end  
  
  
endmodule
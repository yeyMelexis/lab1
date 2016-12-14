module task_13( clk,
                n_rst, 
                jcnt_out, 
                data_in, 
                data_out);
  
  parameter               WIDTH = 4;
  parameter cmpr1 = 4'b0000;
  parameter cmpr2 = 4'b1111;
  wire      cmpr;
  
  input                   clk, n_rst;
  input       [WIDTH-1:0] data_in;
  output wire [WIDTH-1:0] jcnt_out;
  output reg  [WIDTH-1:0] data_out;
  
 task_12 jnct( .clk(clk),
               .n_rst(n_rst),
               .out(jcnt_out));
  
  always @(negedge n_rst or posedge cmpr) begin
    if (!n_rst) begin
      data_out <= 0;
    end
    else begin
      data_out <= data_in;
    end
      
  end
                                                 
  
 assign cmpr = ((jcnt_out[0] ^ cmpr1[0]) &
               (jcnt_out[1]  ^ cmpr1[1]) &
               (jcnt_out[2]  ^ cmpr1[2]) &
               (jcnt_out[3]  ^ cmpr1[3]))|
               ((jcnt_out[0] ^ cmpr2[0]) &
               (jcnt_out[1]  ^ cmpr2[1]) &
               (jcnt_out[2]  ^ cmpr2[2]) &
               (jcnt_out[3]  ^ cmpr2[3]));
               
wire [WIDTH-1:0] a, b;
assign a = jcnt_out ^ cmpr1; 
assign b = jcnt_out ^ cmpr2;  
  
  
endmodule

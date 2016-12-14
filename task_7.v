module task_7(clk, 
              n_rst, 
              Left_in, 
              Right_in, 
              data_in, 
              data_out);

parameter DATA_WIDTH = 4;
              
input clk, n_rst, Right_in, Left_in;
input   [DATA_WIDTH-1:0]  data_in;
output  [DATA_WIDTH-1:0]  data_out; 
reg     [DATA_WIDTH-1:0]  data_out;


//Universal Shift-register
always @(posedge clk or negedge n_rst) begin
  if(!n_rst) begin
    data_out <= 0;
  end
  else begin
    case({Right_in, Left_in})
      2'b00: 
        data_out <= data_in;
      2'b01:
        data_out <= {data_out[DATA_WIDTH-2:0], Left_in};
      2'b10:
        data_out <= {Right_in, data_out[DATA_WIDTH-1:1]};       
    endcase
  end
  
  
end
              
endmodule

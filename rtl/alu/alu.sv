// test alu

module alu (
  input logic [3:0] op,
  input logic [31:0] A,
  input logic [31:0] B,
  output logic [31:0] out
);

  always_comb begin
    casez(op)
      4'd0: out = A + B;
      4'd1: out = A & B;
      4'd2: out = A | B;
      default: out =  0;
    endcase
  end

endmodule

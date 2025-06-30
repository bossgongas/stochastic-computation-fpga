module lfsr(q, clk, rst, seed, enable);

  output [31:0] q;        // 32-bit output
  input [31:0] seed;      // 32-bit seed
  input enable;
  input rst;
  input clk;

  reg [31:0] state_out;  // 32-bit state
  wire [31:0] state_in;  // 32-bit state
  wire nextbit;

  // Flip-flop block definition
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state_out <= seed;  // Initialize with seed on reset
    end else if (enable) begin
      state_out <= {nextbit, state_out[31:1]};  // Shift left and insert nextbit at MSB
    end
  end

  // XOR gates to generate the next bit from the tapped positions
  // Tap positions for a 32-bit LFSR can vary, but an example is 32, 22, 2, and 1
  assign nextbit = state_out[31] ^ state_out[21] ^ state_out[1] ^ state_out[0];

  // Output assignment
  assign q = state_out; // Assign the entire 32-bit state as the output

endmodule

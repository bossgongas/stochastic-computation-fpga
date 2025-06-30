module counter(
    input clk,               // Clock input
    input reset,             // Asynchronous reset
    input stochastic_bit,    // Single bit stochastic number input
    input [31:0] window,     // Valor da janela
    output reg [31:0] binary_out, // 32-bit binary output
    output reg [31:0] bit_count,   //32-bit counter to count the number of '1' bits
    output reg data_ready    // Flag to indicate data is ready
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            binary_out <= 32'b0;
            bit_count <= 5'b0;
            data_ready <= 1'b0;
				bit_count <= 32'b0;  // Reset bit count for next round
        end else begin
            if (binary_out < window) begin
                // Count the number of '1's
                if (stochastic_bit == 1'b1) begin
						  bit_count <= bit_count + 1;
                end
					  binary_out <= binary_out + 1;
                data_ready <= 1'b0; // Data not ready yet
            end

            // Check if the window value is reached
            if (binary_out == window) begin
                data_ready <= 1'b1; // Indicate that the data is ready
                //bit_count <= 5'b0;  // Reset bit count for next round
            end
        end
    end
endmodule
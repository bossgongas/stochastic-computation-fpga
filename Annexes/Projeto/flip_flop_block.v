module flip_flop_block(q, clk, rst, d);
    input clk;
    input rst;
    input d;
    output q;
    reg q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q = 0;
        else
            q = d;
    end

    specify
        $setup(d, posedge clk, 2);
        $hold(posedge clk, d, 0);
    endspecify
endmodule

module pwm #
(
    parameter CLK_FREQ = 50_000_000,  // FPGA clock frequency
    parameter PWM_FREQ = 20_000      // Desired PWM frequency
)
(
    input  wire clk,
    input  wire rst,
    input  wire [7:0] duty,          // 0-255 for duty cycle
    output reg pwm_out
);

    localparam COUNTER_MAX = CLK_FREQ / PWM_FREQ;
    reg [$clog2(COUNTER_MAX)-1:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter  <= 0;
            pwm_out  <= 0;
        end else begin
            if (counter < COUNTER_MAX - 1)
                counter <= counter + 1;
            else
                counter <= 0;
            
            pwm_out <= (counter < (duty * COUNTER_MAX) >> 8);
        end
    end
endmodule

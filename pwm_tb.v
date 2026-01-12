`timescale 1ns/1ps

module pwm_tb();

    reg clk = 0;
    reg rst = 0;
    reg [7:0] duty = 0;
    wire pwm_out;

    pwm #(.CLK_FREQ(1_000_000), .PWM_FREQ(1000)) DUT (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    always #5 clk = ~clk; // 100 kHz clock

    initial begin
        $dumpfile("pwm_tb.vcd");
        $dumpvars(0, pwm_tb);

        rst = 1;
        #20 rst = 0;

        duty = 8'd64;  // 25% duty
        #20000;

        duty = 8'd128; // 50%
        #20000;

        duty = 8'd200; // ~78%
        #20000;

        $finish;
    end
endmodule

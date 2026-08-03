`timescale 1ns/1ps
module traffic_light; 
  input clk,
  input reset,
  input next,
  output reg red,
  output reg yellow,
  output reg green
traffic_light uut(
.clk(clk),
.reset(reset),
.next(next),
.red(red),
.yellow(yellow),
.green(green)
);
always #1 clk = ~clk;
initial begin
  clk=0;
  reset=1;
  next=0;
  #2 reset=0;
  #90;
  $finish;
end
initial begin
  $display("Traffic Light Test");
  $monitor("Time %0t: red=%b,yellow=%b,green=%b,
           $time,red,yellow,green);
  $dumpfile("traffic.vcd");
  $dumpvars(0,traffic_light_tb);
end
endmodule

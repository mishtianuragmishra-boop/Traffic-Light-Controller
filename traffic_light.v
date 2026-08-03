module traffic_light (
  input clk,
  input reset,
  input next,
  output reg red,
  output reg yellow,
  output reg green
);
  reg [1:0] state;
  reg [5:0] counter;
  always @(*) begin
    case (state)
      0: begin green = 1; yellow = 0; red = 0; end
      1: begin green = 0; yellow = 1; red = 0; end
      2: begin green = 0; yellow = 0; red = 1; end
      default: begin green = 0; yellow = 0; red = 1; end
    endcase
  end


  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state <= 2'd2;
      counter <= 6'd0;
    end
    else if (counter==0) begin
        case(state)
        2'd0: begin
            state <= 2'd1;
            counter <=6'd10;
        end
        2'd1: begin
            state<=2'd2;
            counter <= 6'd40;
        end
        2'd2: begin
            state <= 2'd0;
            counter <= 6'd30;
        end
        default:begin
            state <= 2'd2;
            counter <= 6'd40;
        end
        endcase
    end
else begin
    counter <= counter-1;
    end
  end
endmodule
module test_bench;
    reg clk,reset,next;


    wire red;
    wire yellow;
    wire green;
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
    #90;$finish;
end
initial begin
    $display("Traffic Light Test");
    $monitor("Time %0t: red=%b, yellow=%b, green=%b",
    $time,red,yellow,green);
    $dumpfile("traffic.vcd");
    $dumpvars(0,test_bench);
end
endmodule

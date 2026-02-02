`timescale 1ns/1ps

module testbench;
reg twos_comp;
reg [3:0] in;
wire [9:0] d;

sevenSegment DUT(
.twos_comp,
.in,
.d);

task test; //Referenced "EDA Tools Tutorial Series - Part 4: Icarus Verilog and GTKWave for Verilog Simulation" by Design with Manish on Youtube.com 
  input twos_comp1; 
  input [4:0] in1;
  input [9:0] expected_d;

  begin
    assign twos_comp = twos_comp1; //Force twos_comp to task twos_comp 
    assign in = in1; //Force in to task in1
    #10; //wait 10 ns 
  
    if(d == expected_d) begin 
      $display("PASS %t, twos_comp=%b, in=%b, d=%b, expected_d=%b",
                $time, twos_comp1, in1, d, expected_d);
    end else begin
      $display("FAIL %t, twos_comp=%b, in=%b, d=%b, expected_d=%b",
                $time, twos_comp1, in1, d, expected_d);
    end
  end

 endtask

 initial begin
  
   $dumpfile("wave.vcd");
   $dumpvars(0, testbench);
   
   $display("Beginning Testbench");

   $display("Twos Compliment Off");

   test(0, 4'b0000, 10'b0000111111);
   test(0, 4'b0001, 10'b0000000110);
   test(0, 4'b0010, 10'b0001011011);
   test(0, 4'b0011, 10'b0001001111);
   test(0, 4'b0100, 10'b0001100110);
   test(0, 4'b0101, 10'b0001101101);
   test(0, 4'b0110, 10'b0001011111);
   test(0, 4'b0111, 10'b0000000111);
   test(0, 4'b1000, 10'b0001111111);
   test(0, 4'b1001, 10'b0001100111);
   test(0, 4'b1010, 10'b0110111111);
   test(0, 4'b1011, 10'b0110000110);
   test(0, 4'b1100, 10'b0111011011);
   test(0, 4'b1101, 10'b0111001111);
   test(0, 4'b1110, 10'b0111100110);
   test(0, 4'b1111, 10'b0111101101);
  
   $display("Twos Compliment On");

   test(1, 4'b0000, 10'b0000111111);
   test(1, 4'b0001, 10'b0000000110);
   test(1, 4'b0010, 10'b0001011011);
   test(1, 4'b0011, 10'b0001001111);
   test(1, 4'b0100, 10'b0001100110);
   test(1, 4'b0101, 10'b0001101101);
   test(1, 4'b0110, 10'b0001011111);
   test(1, 4'b0111, 10'b0000000111);
   test(1, 4'b1000, 10'b1001111111);
   test(1, 4'b1001, 10'b1000000111);
   test(1, 4'b1010, 10'b1001011111);
   test(1, 4'b1011, 10'b1001101101);
   test(1, 4'b1100, 10'b1001100110);
   test(1, 4'b1101, 10'b1001001111);
   test(1, 4'b1110, 10'b1001011011);
   test(1, 4'b1111, 10'b1000000110);
   
 
   $display("Testbench Complete");
   $finish;
 end

endmodule

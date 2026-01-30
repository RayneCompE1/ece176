module sevenSegment(
input twos_comp,
input [3:0] in,
output [9:0] d);

wire bus_u, bus_s;

u_decoder decoder(.i_bus(in), .o_bus(bus_u));

decoder_2s decoder_s(.i_bus(in), .o_bus(bus_s));

mux21 mux(.twos_compliment(twos_comp), 
.i_bus_s(bus_s), 
.i_bus_u(bus_u),
.o_bus(d));

endmodule

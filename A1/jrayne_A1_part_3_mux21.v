module mux21 (
input twos_compliment,
input [9:0] i_bus_s, i_bus_u,
output [9:0] o_bus);

assign o_bus = twos_compliment ? i_bus_s : i_bus_u;

endmodule

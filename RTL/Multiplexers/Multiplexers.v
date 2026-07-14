module mux2_1bit(
    input sel,
    input a,
    input b,
    output y
);

assign y = sel ? b : a;

endmodule

module SignExtend(Signin, Signout);
  input [15:0] Signin;
  output [31:0] Signout;

  assign Signout = {{16{Signin[15]}}, Signin};  

endmodule
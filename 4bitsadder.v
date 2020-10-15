// Benchmark "4bitadder" written by ABC on Wed Oct 14 15:56:05 2020

module 4bitadder ( 
    A3, A2, A1, A0, B3, B2, B1, B0, CIN,
    COUT, S3, S2, S1, S0  );
  input  A3, A2, A1, A0, B3, B2, B1, B0, CIN;
  output COUT, S3, S2, S1, S0;
  wire \new_4bitadder|JJ_ , new_n36_, \new_4bitadder|CARRY1_ , new_n40_,
    new_n44_, \new_4bitadder|XX_ , \new_4bitadder|CARRY2_ , new_n48_,
    \new_4bitadder|CARRY3_ ;
  assign S1 = \new_4bitadder|XX_ ;
  assign \new_4bitadder|JJ_  = A2;
  assign new_n36_ = ~A0 ^ ~B0;
  assign S0 = ~new_n36_ ^ ~CIN;
  assign \new_4bitadder|CARRY1_  = (A0 & (B0 | CIN)) | (B0 & CIN);
  assign new_n40_ = ~A3 ^ ~B3;
  assign S3 = ~new_n40_ ^ ~\new_4bitadder|CARRY3_ ;
  assign COUT = (A3 & (B3 | \new_4bitadder|CARRY3_ )) | (B3 & \new_4bitadder|CARRY3_ );
  assign new_n44_ = ~A1 ^ ~B1;
  assign \new_4bitadder|XX_  = ~new_n44_ ^ ~\new_4bitadder|CARRY1_ ;
  assign \new_4bitadder|CARRY2_  = (A1 & (B1 | \new_4bitadder|CARRY1_ )) | (B1 & \new_4bitadder|CARRY1_ );
  assign new_n48_ = ~\new_4bitadder|JJ_  ^ ~B2;
  assign S2 = ~new_n48_ ^ ~\new_4bitadder|CARRY2_ ;
  assign \new_4bitadder|CARRY3_  = (\new_4bitadder|JJ_  & (B2 | \new_4bitadder|CARRY2_ )) | (B2 & \new_4bitadder|CARRY2_ );
endmodule



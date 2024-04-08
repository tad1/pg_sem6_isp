//-----------------------------------------------------
// Testbench for the 4-bit up-counter ---------------->
// Example from www.asic-world.com (with fixes)
//-----------------------------------------------------
#include "systemc.h"
#include "design.h"
#include <sysc/communication/sc_signal.h>
#include <sysc/datatypes/bit/sc_lv.h>

int sc_main (int argc, char* argv[]) {
  sc_signal<bool>   clock;
  sc_signal<bool>   reset;
  sc_signal<bool> RXD;
  sc_signal<sc_lv<4>> led7_an;
  sc_signal<sc_lv<8>> led7_seg;
  int i = 0;
  // Connect the DUT
  top topc("top");
  topc.clk_i(clock);
  topc.rst_i(reset);
  topc.RXD_i(RXD);
  topc.led7_an_o(led7_an);
  topc.led7_seg_o(led7_seg);

  sc_start(100, SC_NS); // duration of the simulation

  // Open VCD file
  sc_trace_file *wf = sc_create_vcd_trace_file("lab4");
  // Dump the desired signals
  sc_trace(wf, clock, "clock");
  sc_trace(wf, reset, "reset");
  sc_trace(wf, led7_an, "led7_an");
  sc_trace(wf, led7_seg, "led7_seg");

  // Initialize all variables
  reset = 0;       // initial value of reset
  for (i=0;i<5;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }
  reset = 1;    // Assert the reset
  cout << "@" << sc_time_stamp() <<" Asserting reset\n" << endl;
  for (i=0;i<10;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }
  reset = 0;    // De-assert the reset
  cout << "@" << sc_time_stamp() <<" De-Asserting reset\n" << endl;
  for (i=0;i<500;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }
  cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
  sc_close_vcd_trace_file(wf);
  return 0;// Terminate simulation
}

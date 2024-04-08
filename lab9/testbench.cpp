//-----------------------------------------------------
// Testbench for the 4-bit up-counter ---------------->
// Example from www.asic-world.com (with fixes)
//-----------------------------------------------------
#include "systemc.h"
#include "design.h"
#include <sysc/communication/sc_clock.h>
#include <sysc/communication/sc_signal.h>
#include <sysc/datatypes/bit/sc_lv.h>
#include <sysc/kernel/sc_simcontext.h>
#include <sysc/kernel/sc_time.h>

int sc_main (int argc, char* argv[]) {
  sc_clock clock("clock", 10, SC_NS, 0.5);
  sc_signal<bool>   reset;
  sc_signal<bool> RDX;
  sc_signal<sc_lv<4> > led7_an;
  sc_signal<sc_lv<8> > led7_seg;
  
  const int nbits = 11;
  sc_bv<11> transmission = "10110010101";

  // Connect the DUT
  top topc("top");
  topc.clk_i(clock);
  topc.rst_i(reset);
  topc.RXD_i(RDX);
  topc.led7_an_o(led7_an);
  topc.led7_seg_o(led7_seg);

  sc_start(1, SC_NS);

  // Open VCD file
  sc_trace_file *wf = sc_create_vcd_trace_file("lab4");
  // Dump the desired signals
  sc_trace(wf, clock, "clock");
  sc_trace(wf, reset, "reset");
  sc_trace(wf, RDX, "RDX");
  sc_trace(wf, led7_an, "led7_an");
  sc_trace(wf, led7_seg, "led7_seg");
  sc_trace(wf, topc.uar_data, "uar_data");
  sc_trace(wf, topc.ready, "ready");
  sc_trace(wf, topc.uar_clk, "uar_clk");
  sc_trace(wf, topc.disp_seg_full, "disp_seg_full");

  cout << "@" << sc_time_stamp() <<" Starting simulation\n" << endl;

  sc_start(5, SC_NS);
  reset.write(1);
  sc_start(10, SC_NS);
  reset.write(0);
  sc_start(10, SC_NS);


  for (int i = nbits-1; i >= 0; i--) {
      RDX.write(transmission.get_bit(i));
      sc_start(104.16, SC_US); //1/9600 sec
  }
  for (int i = nbits-1; i >= 0; i--) {
      RDX.write(transmission.get_bit(i));
      sc_start(100, SC_US); //1/9600 * 0.96 sec
  }
  for (int i = nbits-1; i >= 0; i--) {
      RDX.write(transmission.get_bit(i));
      sc_start(108.32, SC_US); //1/9600 * 1.04 sec
  }

  for (int i = nbits-1; i >= 0; i--) {
      RDX.write(transmission.get_bit(i));
      sc_start(145.82, SC_US); //1/9600 * 1.40 sec
  }

  reset.write(1);
  sc_start(10, SC_NS);
  reset.write(0);
  for (int i = nbits-1; i >= 0; i--) {
      RDX.write(transmission.get_bit(i));
      sc_start(83.33, SC_US); //1/9600 * 0.80 sec
  }
  sc_start(100, SC_NS);

  cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
  sc_close_vcd_trace_file(wf);
  return 0;// Terminate simulation
}

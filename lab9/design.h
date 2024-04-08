//-----------------------------------------------------
// A 4 bit up-counter with synchronous active high reset
// and with active high enable signal
// Example from www.asic-world.com
//-----------------------------------------------------
#include "systemc.h"
#include <sysc/communication/sc_clock_ports.h>
#include <sysc/communication/sc_signal.h>
#include <sysc/communication/sc_signal_ports.h>
#include <sysc/datatypes/bit/sc_bv.h>
#include <sysc/datatypes/bit/sc_logic.h>
#include <sysc/datatypes/bit/sc_lv.h>
#include <sysc/datatypes/int/sc_uint.h>
#include <sysc/kernel/sc_module.h>
#include <sysc/kernel/sc_module_name.h>
#include <sysc/kernel/sc_process.h>

SC_MODULE (hex2seg){
    sc_in<sc_lv<4>> hex_i;
    sc_out<sc_lv<8>> seg_o;
    sc_lv<8> seg_vals[16] = {
      "00000011",
      "10011111",
      "00100101",
      "00001101",
      "10011001",
      "01001001",
      "01000001",
      "00011111",
      "00000001",
      "00001001",
      "00010001",
      "11000001",
      "11100101",
      "10000101",
      "01100001",
      "01110001"
    };

    void hex2seg_process(){
      seg_o->write(seg_vals[hex_i->read().to_int()]);
    }

    SC_CTOR(hex2seg){
      SC_METHOD(hex2seg_process);
      sensitive << hex_i;
    }

};

// based on: https://github.com/pjcuadra/sc_viterbi/blob/master/include/common/clock_divider.h
SC_MODULE(clk_div){
  sc_in_clk clk_i;
  sc_out_clk clk_o;
  int divider_counter;
  int ratio;

  void clk_div_process(){
    if(divider_counter == 2*ratio){
      clk_o = true;
      divider_counter = 1;
      return;
    }
    if((divider_counter >= ratio) && clk_o){
      clk_o = false;
    }
    
    divider_counter ++;
  }

  typedef clk_div SC_CURRENT_USER_MODULE;
  clk_div(sc_module_name name, int ratio) : sc_module(name), ratio(ratio), divider_counter(2*ratio){

    SC_METHOD(clk_div_process);
    sensitive << clk_i;
  }

};


SC_MODULE(display) {
  sc_in_clk clk_i;
  sc_in<bool> rst_i;
  sc_in<sc_lv<32>> digit_i;
  sc_out<sc_lv<4>> led7_an_o;
  sc_out<sc_lv<8>> led7_seg_o;
  sc_signal<bool> disp_clk;

  int current_an = 0;

  sc_lv<4> an_vals[4] = {
    "0111",
    "1011",
    "1101",
    "1110",
  };


  clk_div* clk_divc = new clk_div("clk_div", 100000);

  void display_process(){
    if(disp_clk.posedge()){
      current_an = current_an = 4 ? current_an + 1: 0;
      led7_an_o = an_vals[current_an];
      led7_seg_o = digit_i->read().range((current_an+1) * 8 - 1, current_an * 8);
    }
  }

  SC_CTOR(display){
      clk_divc->clk_i(clk_i);
      clk_divc->clk_o(disp_clk);
      
      SC_METHOD(display_process);
      sensitive << disp_clk << rst_i;
  }

  
};

SC_MODULE(uar){
  sc_in_clk clk_i;
  sc_in<bool> rst_i;
  sc_in<bool> RXD_i;
  sc_out<bool> ready_o;
  sc_out<sc_lv<8>> data_o;

  int tick = 0;
  int nbit = 0;
  bool prev_value = 0;
  int sampling_tick;
  int sampling_rate;

  typedef enum {waiting, skip, data} uar_state;
  uar_state current_state;

  void uar_process(){
      if(rst_i->read() == true){
        current_state = waiting;
        prev_value = 0;
      }
      else if (clk_i->posedge()) {
        switch (current_state) {
          case waiting:{
            if(prev_value == 1 && RXD_i->read() == 0){
              ready_o = 0;
              tick = 0;
              current_state = skip;
            } else {
              prev_value = RXD_i;
            }
            break;
          }
          case skip: {
            tick += 1;
            if (tick == sampling_rate){
              tick = 0;
              current_state = data;
              ready_o = 0;
              nbit = 0;
            }
            break;
          }
          case data:{
            tick += 1;
            if(tick == sampling_tick){
              sc_lv<8> tmp = data_o->read();
              tmp[nbit] = RXD_i->read();
              data_o = tmp;
              nbit += 1;
            } else if (tick == sampling_rate) {
              tick = 0;
              if(nbit == 8){
                ready_o = 1;
                current_state = waiting;
                prev_value = 0;
              }
            }
            break;
          }
        }
      }
  }

  typedef uar SC_CURRENT_USER_MODULE;
  uar(sc_module_name name, int sampling_rate) : sc_module(name), sampling_rate(sampling_rate), sampling_tick(sampling_rate/2){

    SC_METHOD(uar_process)
    sensitive << clk_i << rst_i;
  }

};

SC_MODULE(top){
  sc_in_clk clk_i;
  sc_in<bool> rst_i;
  sc_in<bool> RXD_i;
  sc_out<sc_lv<4>> led7_an_o;
  sc_out<sc_lv<8>> led7_seg_o;

  sc_signal<bool> uar_clk;
  sc_signal<bool> ready;
  sc_signal<sc_lv<8>> uar_data;
  sc_signal<sc_lv<4>> latch_data_l;
  sc_signal<sc_lv<4>> latch_data_h;
  
  sc_signal<sc_lv<8>> disp_seg0;
  sc_signal<sc_lv<8>> disp_seg1;
  sc_lv<16> disp_seg_unused = 0xFFFF;
  sc_signal<sc_lv<32>> disp_seg_full;

  sc_signal<bool> disp_rst;

  uar* uarc = new uar("uar", 16);
  display* dispc = new display("display");
  hex2seg* hexc1 = new hex2seg("hexc1");
  hex2seg* hexc2 = new hex2seg("hexc2");
  clk_div* uar_clkc = new clk_div("clk_div", 652);

  void top_process(){
    if(ready.posedge()){
      latch_data_h = uar_data.read().range(7, 4);
      latch_data_l = uar_data.read().range(3, 0);

      disp_seg_full = (disp_seg_unused, disp_seg1.read(), disp_seg0.read());

    }
  }

  SC_CTOR(top){
    uar_clkc->clk_i(clk_i);
    uar_clkc->clk_o(uar_clk);

    uarc->clk_i(uar_clk);
    uarc->rst_i(rst_i);
    uarc->RXD_i(RXD_i);
    uarc->ready_o(ready);
    uarc->data_o(uar_data);

    dispc->clk_i(clk_i);
    dispc->rst_i(disp_rst);    
    disp_rst.write(0);
    dispc->digit_i(disp_seg_full);
    dispc->led7_an_o(led7_an_o);
    dispc->led7_seg_o(led7_seg_o);

    hexc1->hex_i(latch_data_l);
    hexc1->seg_o(disp_seg0);

    hexc2->hex_i(latch_data_h);
    hexc2->seg_o(disp_seg1);

    SC_METHOD(top_process);
    sensitive << ready;
  }

};

// SC_MODULE (johnson_counter) {
//   sc_in_clk     clock ;      // Clock input of the design
//   sc_in<bool>   reset ;      // active high, synchronous Reset input  
//   sc_out<sc_uint<8> > counter_out; // 8 bit vector output of the Johnson's counter

//   //------------Local Variables Here---------------------
//   sc_uint<8>	count;
//   sc_uint<8>	count2;

//   //------------Code Starts Here-------------------------
//   // Below function implements actual counter logic
//   void johnson_process () {
//     // At every rising edge of clock we check if reset is active    
//     if (reset.read() == 1) {
//       count =  0;
//       count2 =  0;
//       counter_out.write(count);    
//     }     
//     else {
//         //Add bits to the output                      
//         if (count2 < 9) {        
//           count = pow(2,count2)-1;        
//           }
//         //remove bits from the output   
//         else {        
//           count = pow(2,8)-pow(2,count2-8);
//           //reset of the counter
//           if (count2 == 16) {
//               count2 = 0;
//           }
//         }
//         count2 = count2 + 1;
          
//       counter_out.write(count);
//       cout<<"@" << sc_time_stamp() <<" :: Incremented Counter "
//         <<counter_out.read()<<endl;
//     }
//   } // End of function johnson_process

//   // Constructor for the counter
//   // Since this counter is a positive edge trigged one,
//   // We trigger the below block with respect to positive
//   // edge of the clock and also when ever reset changes state
//   SC_CTOR(johnson_counter) {
//     cout<<"Executing new"<<endl;
//     SC_METHOD(johnson_process);
//     sensitive << reset;
//     sensitive << clock.pos();
//   } // End of Constructor

// }; // End of Module 

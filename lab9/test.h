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
#include <sysc/kernel/sc_time.h>
#include <sysc/kernel/sc_wait.h>
#include <sysc/kernel/sc_wait_cthread.h>
#include "design.h"

SC_MODULE(top_test){

    sc_signal<bool> clk;
    sc_signal<bool> rst;
    sc_signal<bool> RXD;

    const int nbits = 11;
    sc_bv<11> transmission = "10110010101";

    void stimuli(){
        wait(5, SC_NS);
        rst.write(1);
        wait(10, SC_NS);

        for (int i = nbits-1; i >= 0; i--) {
            RXD.write(transmission.get_bit(i));
            wait(104.16, SC_US); //1/9600 sec
        }
        for (int i = nbits-1; i >= 0; i--) {
            RXD.write(transmission.get_bit(i));
            wait(100, SC_US); //1/9600 * 0.96 sec
        }
        for (int i = nbits-1; i >= 0; i--) {
            RXD.write(transmission.get_bit(i));
            wait(108.32, SC_US); //1/9600 * 1.04 sec
        }

        for (int i = nbits-1; i >= 0; i--) {
            RXD.write(transmission.get_bit(i));
            wait(145.82, SC_US); //1/9600 * 1.40 sec
        }

        rst.write(1);
        wait(10, SC_NS);
        rst.write(0);
        for (int i = nbits-1; i >= 0; i--) {
            RXD.write(transmission.get_bit(i));
            wait(83.33, SC_US); //1/9600 * 0.80 sec
        }
        wait();
    }

    SC_CTOR(top_test){
        SC_THREAD(stimuli);
    }

};
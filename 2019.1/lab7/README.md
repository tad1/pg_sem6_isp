**Vivado SDK** (the stuff for writing software for hardware)**don't exists since** version **2019.2** (**2019.1** is the last one that **have SDK**); in later version Xilinx divided it into:
- Vivado (for hardware)
- and Vitis (for software)
## GPIO
```c
void initialization(){
	//  XPAR_AXI_GPIO_0_DEVICE_ID - this is an auto-generated constant; see a board design to identify name
	XGpio_Initialize(&GpioOutput, XPAR_AXI_GPIO_0_DEVICE_ID);

	// channel 1 reffers to GPIO; channel 2 - GPIO2
	// we set direction as output (0x00) for all bits
	XGpio_SetDataDirection(&GpioOutput, 1, 0x00);
	XGpio_SetDataDirection(&GpioOutput, 2, 0x00);
}

void display(){
	// 0b.gfedcba - order of bits
	// 0b01111111 - will dislpay '.'
	XGpio_DiscreteWrite(&GpioOutput, 1, 0x7F);
	XGpio_DiscreteWrite(&GpioOutput, 2, 0x00);
}
```

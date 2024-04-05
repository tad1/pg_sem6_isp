// NOTE: create an hello world project, and insert this content to the helloworld.c

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xtmrctr.h"
#include "xil_exception.h"

#ifdef XPAR_INTC_0_DEVICE_ID
#include "xintc.h"
#include <stdio.h>
#include "xgpio.h"
#else
#include "xscugic.h"
#include "xil_printf.h"
#endif

#include "platform.h"



/************************** Constant Definitions *****************************/
#ifndef TESTAPP_GEN
/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are only defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define TMRCTR_DEVICE_ID	XPAR_TMRCTR_0_DEVICE_ID
#define TMRCTR_INTERRUPT_ID	XPAR_INTC_0_TMRCTR_0_VEC_ID

#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_INTC_0_DEVICE_ID
#else
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#endif /* XPAR_INTC_0_DEVICE_ID */


/*
 * The following constant determines which timer counter of the device that is
 * used for this example, there are currently 2 timer counters in a device
 * and this example uses the first one, 0, the timer numbers are 0 based
 */
#define TIMER_CNTR_0	 0

#endif

#ifdef XPAR_INTC_0_DEVICE_ID
#define INTC		XIntc
#define INTC_HANDLER	XIntc_InterruptHandler
#else
#define INTC		XScuGic
#define INTC_HANDLER	XScuGic_InterruptHandler
#endif /* XPAR_INTC_0_DEVICE_ID */


/*
 * The following constant is used to set the reset value of the timer counter,
 * making this number larger reduces the amount of time this example consumes
 * because it is the value the timer counter is loaded with when it is started
 */
#define RESET_VALUE	 0xFFFFF300



/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

int TmrCtrIntrExample(INTC *IntcInstancePtr,
			XTmrCtr *InstancePtr,
			u16 DeviceId,
			u16 IntrId,
			u8 TmrCtrNumber);

static int TmrCtrSetupIntrSystem(INTC *IntcInstancePtr,
				XTmrCtr *InstancePtr,
				u16 DeviceId,
				u16 IntrId,
				u8 TmrCtrNumber);

static void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber);

static void TmrCtrDisableIntr(INTC *IntcInstancePtr, u16 IntrId);

/************************** Variable Definitions *****************************/
#ifndef TESTAPP_GEN
INTC InterruptController;  /* The instance of the Interrupt Controller */

XTmrCtr TimerCounterInst;   /* The instance of the Timer Counter */
#endif
/*
 * The following variables are shared between non-interrupt processing and
 * interrupt processing such that they must be global.
 */
volatile int TimerExpired;


/*****************************************************************************/
/**
* This function is the main function of the Tmrctr example using Interrupts.
*
* @param	None.
*
* @return	XST_SUCCESS to indicate success, else XST_FAILURE to indicate a
*		Failure.
*
* @note		None.
*
******************************************************************************/
enum action_t {
	NONE,
	ADD,
	SUBTRACT,
	MULTIPLY,
	DIVIDE,
	CHS,
	CLEAR,
	SWAP,
	ROTATE,
	PUSH,
	VALUE,
	BRIGHT_INC,
	BRIGHT_DEC
};

const long long MAX_INT = 2147483647;
const long long MIN_INT = -2147483648;

XGpio GpioOutput;
XGpio GpioLEDS;
const int MAX_BRIGHTNESS = 10;
const int MIN_BRIGHTNESS = 2;
volatile int brightness = 6;
volatile int cycle = 0;
volatile int anode_n = 0;
volatile int enabled = 0;
int error = 0;

long long T=0,Z=0,Y=0,X=0;

int tmp;
char read_char;

void pop_stack(){
	X = Y;
	Y = Z;
	Z = T;
};

void detect_overflow(){
	if(X > MAX_INT || X < MIN_INT)
		error = 1;

}

void execute(enum action_t action){
	switch(action) {
	case ADD:
		Y = Y + X;
		pop_stack();
		detect_overflow();
		break;
	case SUBTRACT:
		Y = Y - X;
		pop_stack();
		detect_overflow();
		break;
	case MULTIPLY:
		Y = Y * X;
		pop_stack();
		detect_overflow();
		break;
	case DIVIDE:
		if(X == 0){
			error = 1;
			pop_stack();
		} else {
			Y = Y / X;
			pop_stack();
		}
		break;
	case CHS:
		X = -X;
		detect_overflow();
		break;
	case CLEAR:
		X = 0;
		error = 0;
		break;
	case SWAP:
		tmp = X;
		X = Y;
		Y = tmp;
		break;
	case ROTATE:
		tmp = X;
		X = Y;
		Y = Z;
		Z = T;
		T = tmp;
		break;
	case PUSH:
		T = Z;
		Z = Y;
		Y = X;
		X = 0;
		break;
	case VALUE:
		tmp = read_char - '0';
		X = X * 10 + tmp;
		if(X > MAX_INT)
			X = MAX_INT;
		if(X < MIN_INT)
			X = MIN_INT;
		break;
	case BRIGHT_INC:
		brightness = (++brightness >= MAX_BRIGHTNESS) ? MAX_BRIGHTNESS : brightness;
		break;
	case BRIGHT_DEC:
		brightness = (--brightness <= MIN_BRIGHTNESS) ? MIN_BRIGHTNESS : brightness;
	default:
		break;
	};

}

enum action_t read_action(){
	read_char = inbyte();

	switch(read_char){
	case '+':
		return ADD;
	case '-':
		return SUBTRACT;
	case '*':
		return MULTIPLY;
	case '/':
		return DIVIDE;
	case 'S':
		return CHS;
	case 'C':
		return CLEAR;
	case 'X':
		return SWAP;
	case 'R':
		return ROTATE;
	case 13:
		return PUSH;
	case '.':
		return BRIGHT_INC;
	case ',':
		return BRIGHT_DEC;
	default:
		if(read_char >= '0' && read_char <= '9' ){
			return VALUE;
		}
	}
	return NONE;
}

int init_gpio(){
	int Status;
	Status = XGpio_Initialize(&GpioOutput, XPAR_AXI_GPIO_0_DEVICE_ID);
	Status = XGpio_Initialize(&GpioLEDS, XPAR_AXI_GPIO_1_DEVICE_ID);
		 if (Status != XST_SUCCESS)  {
			  return XST_FAILURE;
	 }
		 XGpio_SetDataDirection(&GpioLEDS, 1, 0x00);
	 XGpio_SetDataDirection(&GpioOutput, 1, 0x00);
	 XGpio_SetDataDirection(&GpioOutput, 2, 0x00);
	 return XST_SUCCESS;
}

#ifndef TESTAPP_GEN
int main(void)
{
	int Status;
	Status = init_gpio();
	if (Status != XST_SUCCESS) {
			xil_printf("GPIO Initialization Failed\r\n");
			cleanup_platform();
			return Status;
		}
	init_platform();


	/*
	 * Run the Timer Counter - Interrupt example.
	 */
	Status = TmrCtrIntrExample(&InterruptController,
				  &TimerCounterInst,
				  TMRCTR_DEVICE_ID,
				  TMRCTR_INTERRUPT_ID,
				  TIMER_CNTR_0);
	if (Status != XST_SUCCESS) {
		xil_printf("Tmrctr interrupt Example Failed\r\n");
		cleanup_platform();
		return XST_FAILURE;
	}
	xil_printf("Welcome to RPN calculator:\r\n>");

	while(1){
		enum action_t action = read_action();
		if(error == 1 && action != CLEAR)
			continue;

		if(action == PUSH)
			xil_printf("\n:");
		execute(action);

	}

	cleanup_platform();
	return XST_SUCCESS;
}
#endif

/*****************************************************************************/
/**
* This function does a minimal test on the timer counter device and driver as a
* design example.  The purpose of this function is to illustrate how to use the
* XTmrCtr component.  It initializes a timer counter and then sets it up in
* compare mode with auto reload such that a periodic interrupt is generated.
*
* This function uses interrupt driven mode of the timer counter.
*
* @param	IntcInstancePtr is a pointer to the Interrupt Controller
*		driver Instance
* @param	TmrCtrInstancePtr is a pointer to the XTmrCtr driver Instance
* @param	DeviceId is the XPAR_<TmrCtr_instance>_DEVICE_ID value from
*		xparameters.h
* @param	IntrId is XPAR_<INTC_instance>_<TmrCtr_instance>_INTERRUPT_INTR
*		value from xparameters.h
* @param	TmrCtrNumber is the number of the timer to which this
*		handler is associated with.
*
* @return	XST_SUCCESS if the Test is successful, otherwise XST_FAILURE
*
* @note		This function contains an infinite loop such that if interrupts
*		are not working it may never return.
*
*****************************************************************************/
int TmrCtrIntrExample(INTC *IntcInstancePtr,
			XTmrCtr *TmrCtrInstancePtr,
			u16 DeviceId,
			u16 IntrId,
			u8 TmrCtrNumber)
{
	int Status;

	/*
	 * Initialize the timer counter so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h
	 */
	Status = XTmrCtr_Initialize(TmrCtrInstancePtr, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built
	 * correctly, use the 1st timer in the device (0)
	 */
	Status = XTmrCtr_SelfTest(TmrCtrInstancePtr, TmrCtrNumber);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the timer counter to the interrupt subsystem such that
	 * interrupts can occur.  This function is application specific.
	 */
	Status = TmrCtrSetupIntrSystem(IntcInstancePtr,
					TmrCtrInstancePtr,
					DeviceId,
					IntrId,
					TmrCtrNumber);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Setup the handler for the timer counter that will be called from the
	 * interrupt context when the timer expires, specify a pointer to the
	 * timer counter driver instance as the callback reference so the
	 * handler is able to access the instance data
	 */
	XTmrCtr_SetHandler(TmrCtrInstancePtr, TimerCounterHandler,
					   TmrCtrInstancePtr);

	/*
	 * Enable the interrupt of the timer counter so interrupts will occur
	 * and use auto reload mode such that the timer counter will reload
	 * itself automatically and continue repeatedly, without this option
	 * it would expire once only
	 */
	XTmrCtr_SetOptions(TmrCtrInstancePtr, TmrCtrNumber,
				XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);

	/*
	 * Set a reset value for the timer counter such that it will expire
	 * eariler than letting it roll over from 0, the reset value is loaded
	 * into the timer counter when it is started
	 */
	XTmrCtr_SetResetValue(TmrCtrInstancePtr, TmrCtrNumber, RESET_VALUE);

	/*
	 * Start the timer counter such that it's incrementing by default,
	 * then wait for it to timeout a number of times
	 */
	XTmrCtr_Start(TmrCtrInstancePtr, TmrCtrNumber);

	/*
	 * If it has expired a number of times, then stop the
	 * timer counter and stop this example
	 */
//	XTmrCtr_Stop(TmrCtrInstancePtr, TmrCtrNumber);
//	TmrCtrDisableIntr(IntcInstancePtr, IntrId);
	return XST_SUCCESS;
}

/*****************************************************************************/
/**
* This function is the handler which performs processing for the timer counter.
* It is called from an interrupt context such that the amount of processing
* performed should be minimized.  It is called when the timer counter expires
* if interrupts are enabled.
*
* This handler provides an example of how to handle timer counter interrupts
* but is application specific.
*
* @param	CallBackRef is a pointer to the callback function
* @param	TmrCtrNumber is the number of the timer to which this
*		handler is associated with.
*
* @return	None.
*
* @note		None.
*
*



******************************************************************************/

const unsigned char segments[] = {
    0b11000000, // 0
    0b11111001, // 1
    0b10100100, // 2
    0b10110000, // 3
    0b10011001, // 4
    0b10010010, // 5
    0b10000010, // 6
    0b11111000, // 7
    0b10000000, // 8
    0b10010000, // 9
    0b10001000, // A
    0b10000011, // b
    0b11000110, // C
    0b10100001, // d
    0b10000110, // E
    0b10001110  // F
};

const unsigned char error_seg[8] = {
	0xFF,
	0xFF,
	0xFF,
    0b10101111,  // R
    0b10100011, // O
    0b10101111, // R
    0b10101111, // R
	0b10000110, // E
};



char display_digit(int pos){
			char val;
			if(pos == 7){
				val = X >= 0 ? 0xFF : 0xBF;
			}
			else{
				int value = X < 0 ? -X : X;
			    int divisor = 1;
			    for (int i = 0; i < pos; i++) {
			        divisor *= 10;
			    }

			    if(value >= divisor || divisor == 1) {
				    // Extract the digit using integer division and modulo operations
				    int digit = (value / divisor) % 10;
					val = segments[digit%10];

			    } else {
			    	val = 0xFF;
			    }

			}
	return val;

}

void TimerCounterHandler(void *CallBackRef, u8 TmrCtrNumber)
{
	XTmrCtr *InstancePtr = (XTmrCtr *)CallBackRef;
//	TODO: handle displaying
	if(enabled == 1){
//		TODO: send to GPIO
		unsigned char val;
		if (error == 1){
//			display error
			val = error_seg[anode_n];
		} else {
//			display number
			val = display_digit(anode_n);

		}

		XGpio_DiscreteWrite(&GpioOutput, 1, val);
		XGpio_DiscreteWrite(&GpioOutput, 2, (0b11111110 << anode_n) | (0xFF >> (8 - anode_n)));
		if(++anode_n >= 8){
			anode_n = 0;
			enabled = 0;
			cycle = 0;
		}
	} else {
//		TODO: send to GPIO
		XGpio_DiscreteWrite(&GpioOutput, 1, 0xFF);
		XGpio_DiscreteWrite(&GpioOutput, 2, 0x00);
		if(++cycle > brightness * 40){
			cycle = 0;
			enabled = 1;
			anode_n = 0;
		}
	}
	unsigned char leds_output = 0x0;
	if(Y != 0)
		leds_output |= 0x04;
	if(Z != 0)
		leds_output |= 0x02;
	if(T != 0)
		leds_output |= 0x01;
	XGpio_DiscreteWrite(&GpioLEDS, 1, leds_output);
	/*
	 * Check if the timer counter has expired, checking is not necessary
	 * since that's the reason this function is executed, this just shows
	 * how the callback reference can be used as a pointer to the instance
	 * of the timer counter that expired, increment a shared variable so
	 * the main thread of execution can see the timer expired
	 */
//	if (XTmrCtr_IsExpired(InstancePtr, TmrCtrNumber)) {
//		TimerExpired++;
//		if (TimerExpired == 3) {
//			XTmrCtr_SetOptions(InstancePtr, TmrCtrNumber, 0);
//		}
//	}
}

/*****************************************************************************/
/**
* This function setups the interrupt system such that interrupts can occur
* for the timer counter. This function is application specific since the actual
* system may or may not have an interrupt controller.  The timer counter could
* be directly connected to a processor without an interrupt controller.  The
* user should modify this function to fit the application.
*
* @param	IntcInstancePtr is a pointer to the Interrupt Controller
*		driver Instance.
* @param	TmrCtrInstancePtr is a pointer to the XTmrCtr driver Instance.
* @param	DeviceId is the XPAR_<TmrCtr_instance>_DEVICE_ID value from
*		xparameters.h.
* @param	IntrId is XPAR_<INTC_instance>_<TmrCtr_instance>_VEC_ID
*		value from xparameters.h.
* @param	TmrCtrNumber is the number of the timer to which this
*		handler is associated with.
*
* @return	XST_SUCCESS if the Test is successful, otherwise XST_FAILURE.
*
* @note		This function contains an infinite loop such that if interrupts
*		are not working it may never return.
*
******************************************************************************/
static int TmrCtrSetupIntrSystem(INTC *IntcInstancePtr,
				 XTmrCtr *TmrCtrInstancePtr,
				 u16 DeviceId,
				 u16 IntrId,
				 u8 TmrCtrNumber)
{
	 int Status;

#ifdef XPAR_INTC_0_DEVICE_ID
#ifndef TESTAPP_GEN
	/*
	 * Initialize the interrupt controller driver so that
	 * it's ready to use, specify the device ID that is generated in
	 * xparameters.h
	 */
	Status = XIntc_Initialize(IntcInstancePtr, INTC_DEVICE_ID);
	if (Status != XST_SUCCESS)
		return XST_FAILURE;
#endif
	/*
	 * Connect a device driver handler that will be called when an interrupt
	 * for the device occurs, the device driver handler performs the
	 * specific interrupt processing for the device
	 */
	Status = XIntc_Connect(IntcInstancePtr, IntrId,
				(XInterruptHandler)XTmrCtr_InterruptHandler,
				(void *)TmrCtrInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

#ifndef TESTAPP_GEN
	/*
	 * Start the interrupt controller such that interrupts are enabled for
	 * all devices that cause interrupts, specific real mode so that
	 * the timer counter can cause interrupts thru the interrupt controller.
	 */
	Status = XIntc_Start(IntcInstancePtr, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif

	/*
	 * Enable the interrupt for the timer counter
	 */
	XIntc_Enable(IntcInstancePtr, IntrId);

#else

#ifndef TESTAPP_GEN
	XScuGic_Config *IntcConfig;

	/*
	 * Initialize the interrupt controller driver so that it is ready to
	 * use.
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif /* TESTAPP_GEN */

	XScuGic_SetPriorityTriggerType(IntcInstancePtr, IntrId,
					0xA0, 0x3);

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	Status = XScuGic_Connect(IntcInstancePtr, IntrId,
				 (Xil_ExceptionHandler)XTmrCtr_InterruptHandler,
				 TmrCtrInstancePtr);
	if (Status != XST_SUCCESS) {
		return Status;
	}

	/*
	 * Enable the interrupt for the Timer device.
	 */
	XScuGic_Enable(IntcInstancePtr, IntrId);
#endif /* XPAR_INTC_0_DEVICE_ID */


#ifndef TESTAPP_GEN
	/*
	 * Initialize the exception table.
	 */
	Xil_ExceptionInit();

	/*
	 * Register the interrupt controller handler with the exception table.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
					(Xil_ExceptionHandler)
					INTC_HANDLER,
					IntcInstancePtr);

	/*
	 * Enable non-critical exceptions.
	 */
	Xil_ExceptionEnable();

#endif
	return XST_SUCCESS;
}


/******************************************************************************/
/**
*
* This function disables the interrupts for the Timer.
*
* @param	IntcInstancePtr is a reference to the Interrupt Controller
*		driver Instance.
* @param	IntrId is XPAR_<INTC_instance>_<Timer_instance>_VEC_ID
*		value from xparameters.h.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
void TmrCtrDisableIntr(INTC *IntcInstancePtr, u16 IntrId)
{
	/*
	 * Disable the interrupt for the timer counter
	 */
#ifdef XPAR_INTC_0_DEVICE_ID
	XIntc_Disable(IntcInstancePtr, IntrId);
#else
	/* Disconnect the interrupt */
	XScuGic_Disable(IntcInstancePtr, IntrId);
	XScuGic_Disconnect(IntcInstancePtr, IntrId);
#endif
}

#include "system.h"
#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>
#include <unistd.h>
#include "time.h"


int main()
{ 
  int ready = 0;

  // 1º- Send seed
  long unsigned int seed = 4294679546;
  IOWR_ALTERA_AVALON_PIO_DATA(SEED_BASE, seed);
  IOWR_ALTERA_AVALON_PIO_DATA(LEDR_BASE, 0x01);
  printf("\nSeed Enviada:-> %lu ", seed);
  usleep(1000000);
  IOWR_ALTERA_AVALON_PIO_DATA(LEDR_BASE, 0x00);

  // Send Binary Numer - Constant
  long unsigned int Binary_number = 3568915764;
  IOWR_ALTERA_AVALON_PIO_DATA(BINARY_NUMBER_BASE, Binary_number);
  printf("\nNumero Binario Enviado:-> %lu ", Binary_number);

  // Set window
  long unsigned int window = 128;
  IOWR_ALTERA_AVALON_PIO_DATA(WINDOW_BASE, window);
  printf("\nJanela de calculo:-> %d bits ", window);


  while(1){

	  ready = IORD_ALTERA_AVALON_PIO_DATA(READY_BASE);
	  if(ready==1){

		  long unsigned int Total =  IORD_ALTERA_AVALON_PIO_DATA(TOTAL_BASE);
		  long unsigned int Prob =  IORD_ALTERA_AVALON_PIO_DATA(PROB_BASE);

		  printf("\nNumero de Bits a 1: %lu", Prob);
		  printf("\nTotal Numero de Bits: %lu", Total);

		  printf("\nProbabilidade: %lu / %lu", Prob, Total);
		  break;
	  }
  }

  printf("\nPrograma Terminado!");

  return 0;
}

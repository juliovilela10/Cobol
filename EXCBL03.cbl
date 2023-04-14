       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL03.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: VARIAVEL COM SINAL
      * DATA: XX/XX/2022
      * OBSERVA��ES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE            SECTION.

       77  WRK-VALOR1                PIC 9(03)V99      VALUE ZEROS.
       77  WRK-VALOR2                PIC 9(03)V99      VALUE ZEROS.
       77  WRK-RESULTADO             PIC S9(03)V99     VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                SECTION.
           DISPLAY "DIGITE VALOR 1:"
              ACCEPT WRK-VALOR1.
           DISPLAY "DIGITE VALOR 2:"
              ACCEPT WRK-VALOR2.
           COMPUTE WRK-RESULTADO = WRK-VALOR1 - WRK-VALOR2.
       0200-MOSTRA                SECTION.
           DISPLAY "RESULTADO: " WRK-RESULTADO.

       0300-FINALIZAR             SECTION.
            STOP RUN.

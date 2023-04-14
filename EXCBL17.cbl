       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL17.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: IMPRESSAO TABUADA 1A 10 USANDO (UNTIL/TIME/VARYING)
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-NUMERO       PIC 9(02)  VALUE ZEROS.
       77  WRK-CONTADOR     PIC 9(02)  VALUE 1.
       77  WRK-RESULTADO    PIC 9(03)  VALUE ZEROS.

       PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
             PERFORM 0200-PROCESSAR
             PERFORM 0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.

           DISPLAY "QUAL O NUMERO: "
             ACCEPT WRK-NUMERO.


       0200-PROCESSAR               SECTION.
      *=================== UNTIL
      *    PERFORM UNITL WRK-CONTADOR GREATER 10
      *       COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
      *       DISPLAY WRK-NUMERO " X " WRK-CONTADOR " = " WRK-RESULTADO
      *          ADD 1 TO WRK-CONTADOR
      *     END-PERFORM.

      *=================== TIME
      *     PERFORM 10 TIMES
      *       COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
      *       DISPLAY WRK-NUMERO " X " WRK-CONTADOR " = " WRK-RESULTADO
      *          ADD 1 TO WRK-CONTADOR
      *     END-PERFORM.

      *=================== VARYING
           PERFORM VARYING WRK-CONTADOR FROM 1 BY 1
                    UNTIL  WRK-CONTADOR GREATER 10
             COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
             DISPLAY WRK-NUMERO " X " WRK-CONTADOR " = " WRK-RESULTADO
           END-PERFORM.

       0300-FINALIZAR               SECTION.

           DISPLAY "**********************************".
           DISPLAY "********** FIM PROGRAMA **********".
           DISPLAY "**********************************".

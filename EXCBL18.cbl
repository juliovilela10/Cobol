       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL18.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: VENDAS DE PRODUTOS COM ACUMULADO
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-PRODUTO      PIC     X(20)      VALUE SPACES.
       77  WRK-VALOR        PIC     9(05)V99   VALUE ZEROS.
       77  WRK-VENDAS-ACUM  PIC     9(06)V99   VALUE ZEROS.
       77  WRK-PROD-ACUM    PIC     9(05)      VALUE ZEROS.


       PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR

             PERFORM 0200-PROCESSAR UNTIL WRK-VALOR EQUAL 99999.

             PERFORM 0300-FINALIZAR

           STOP RUN.

       0100-INICIALIZAR             SECTION.
           DISPLAY "-----------------------"
           DISPLAY "DIGITE O PRODUTO: "
             ACCEPT WRK-PRODUTO.
           DISPLAY "DIGITE O VALOR: "
             ACCEPT WRK-VALOR.


       0200-PROCESSAR               SECTION.
           COMPUTE WRK-VENDAS-ACUM = WRK-VENDAS-ACUM + WRK-VALOR
           ADD 1 TO WRK-PROD-ACUM.
                PERFORM 0100-INICIALIZAR.

       0300-FINALIZAR               SECTION.

           DISPLAY "**********************************"
           DISPLAY " TOTAL DE VENDAS:  " WRK-VENDAS-ACUM
           DISPLAY " TOTAL DE PRODUTOS " WRK-PROD-ACUM


           DISPLAY "********** FIM PROGRAMA **********"
           DISPLAY "**********************************".

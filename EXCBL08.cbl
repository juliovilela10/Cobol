       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL08.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO:  VARIAVEL ESTRUTURAL (GRUPO) - EXEMPLO 3
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       01  WRK-DADOS.
           05 WRK-NUM1   PIC 9(03) VALUE ZEROS.
           05 WRK-NUM2   PIC 9(03) VALUE ZEROS.

       77  WRK-RESULT   PIC 9(03) VALUE ZEROS.


       PROCEDURE DIVISION.
       0100-RECEBE                SECTION.
            ACCEPT WRK-DADOS.
             COMPUTE WRK-RESULT = WRK-NUM1 + WRK-NUM2.

       0200-MOSTRA                SECTION.
            DISPLAY "RESULTADO: " WRK-RESULT.
       0300-FINALIZAR             SECTION.
            STOP RUN.

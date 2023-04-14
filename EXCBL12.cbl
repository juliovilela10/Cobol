       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL12.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: EXEMPLO DE OPERAÇÃO DIVIDE
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-NUM1            PIC 9(04)           VALUE ZEROS.
       77  WRK-NUM2            PIC 9(04)           VALUE ZEROS.
       77  WRK-RESULTADO       PIC S9(08)V99       VALUE ZEROS.
       77  WRK-RESULTADO-ED    PIC -ZZ.ZZZ.ZZ9,99  VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                SECTION.
           DISPLAY "DIGITE O PRIMEIRO NUMERO: "
            ACCEPT WRK-NUM1
           DISPLAY "DIGITE O SEGUNDO NUMERO: "
            ACCEPT WRK-NUM2.


       0150-PROCESSAR             SECTION.
           DIVIDE WRK-NUM1 BY WRK-NUM2  GIVING WRK-RESULTADO
                  ON SIZE ERROR
                      DISPLAY "ERRO - DIVISAO POR 0".

       0200-MOSTRA                SECTION.
           MOVE WRK-RESULTADO TO WRK-RESULTADO-ED.
           DISPLAY "RESULTADO:  "  WRK-RESULTADO-ED.


       0300-FINALIZAR             SECTION.
            STOP RUN.

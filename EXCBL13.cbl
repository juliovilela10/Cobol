       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL13.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: EXEMPLO DE OPERAÇÃO COMPUTE
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
           COMPUTE WRK-RESULTADO =(WRK-NUM1 + WRK-NUM2) / 2.

       0200-MOSTRA                SECTION.
           MOVE WRK-RESULTADO TO WRK-RESULTADO-ED.
            DISPLAY "RESULTADO:  "  WRK-RESULTADO-ED.


       0300-FINALIZAR             SECTION.
            STOP RUN.

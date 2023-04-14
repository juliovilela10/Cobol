       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL14.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: EXEMPLO TODAS OPERAÇÕES JUNTAS
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-NUM1            PIC 9(04)  VALUE ZEROS.
       77  WRK-NUM2            PIC 9(04)  VALUE ZEROS.
       77  WRK-RESULTADO       PIC S9(05)V99  VALUE ZEROS.
       77  WRK-RESULTADO2      PIC 9(05)V99  VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                SECTION.
           DISPLAY "DIGITE O PRIMEIRO : "
            ACCEPT WRK-NUM1
           DISPLAY "DIGITE O SEGUNDO : "
            ACCEPT WRK-NUM2.


       0150-PROCESSAR             SECTION.
      *     ADD WRK-NUM1 WRK-NUM2  TO WRK-RESULTADO WRK-RESULTADO2.

      *     SUBTRACT WRK-NUM1 FROM WRK-NUM2  GIVING WRK-RESULTADO.

      *      MULTIPLY WRK-NUM1 BY WRK-NUM2  GIVING WRK-RESULTADO.

      *      DIVIDE WRK-NUM1 BY WRK-NUM2  GIVING WRK-RESULTADO
      *              ON SIZE ERROR
      *                 DISPLAY "ERRO - DIVISAO POR 0".


      *     COMPUTE WRK-RESULTADO =(WRK-NUM1 + WRK-NUM2) / 2.

       0200-MOSTRA                SECTION.
           MOVE WRK-RESULTADO TO WRK-RESULTADO2.

           DISPLAY "RESULTADO: "  WRK-RESULTADO2.


       0300-FINALIZAR             SECTION.
            STOP RUN.

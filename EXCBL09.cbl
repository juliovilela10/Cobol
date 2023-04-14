       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL09.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: EXEMPLO DE OPERA��O SOMA (ADD)
      * DATA: XX/XX/2022
      * OBSERVA��ES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-NUM1            PIC 9(04)  VALUE ZEROS.
       77  WRK-NUM2            PIC 9(04)  VALUE ZEROS.
       77  WRK-NUM3            PIC 9(04)  VALUE ZEROS.
       77  WRK-NUM4            PIC 9(04)  VALUE ZEROS.
       77  WRK-RESULTADO       PIC 9(05)  VALUE ZEROS.
       77  WRK-RESULTADO2      PIC 9(05)  VALUE ZEROS.

       PROCEDURE DIVISION.
       0100-RECEBE                SECTION.
           DISPLAY "DIGITE O PRIMEIRO N�: "
            ACCEPT WRK-NUM1
           DISPLAY "DIGITE O SEGUNDO N�: "
            ACCEPT WRK-NUM2
           DISPLAY "DIGITE O TERCEIRO N�: "
            ACCEPT WRK-NUM3
           DISPLAY "DIGITE O QUARTO N�: "
            ACCEPT WRK-NUM4.

       0150-PROCESSAR             SECTION.
           ADD WRK-NUM1 WRK-NUM2 WRK-NUM3 WRK-NUM4
               TO WRK-RESULTADO WRK-RESULTADO2.

       0200-MOSTRA                SECTION.
           DISPLAY "RESULTADO:  "  WRK-RESULTADO.
           DISPLAY "RESULTADO2: "  WRK-RESULTADO2.


       0300-FINALIZAR             SECTION.
            STOP RUN.

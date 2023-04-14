       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA06.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: VARIAVEL DE NIVEL (ESTRUTURAL) - FILLER
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       01  WRK-DATA.
           05 WRK-ANO PIC X(04) VALUE SPACES.
           05 WRK-MES PIC X(02) VALUE SPACES.
           05 WRK-DIA PIC X(02) VALUE SPACES.

       01  WRK-DATA2.
           05 WRK-DIA PIC X(02) VALUE SPACES.
           05 FILLER  PIC X(01) VALUE "/".
           05 WRK-MES PIC X(02) VALUE SPACES.
           05 FILLER  PIC X(01) VALUE "/".
           05 WRK-ANO PIC X(04) VALUE SPACES.

       PROCEDURE DIVISION.
       0100-RECEBE                SECTION.
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.
            MOVE CORR WRK-DATA TO WRK-DATA2.

       0200-MOSTRA                SECTION.
           DISPLAY WRK-DATA2.


       0300-FINALIZAR             SECTION.
            STOP RUN.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL20.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: TABELA DE MESES( COM VETORES2 )
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
           05 WRK-ANO PIC 9(04).
           05 WRK-MES PIC 9(02).
           05 WRK-DIA PIC 9(02).
       01  WRK-MESES.
           05 WRK-MES-EXT PIC X(09) OCCURS 12 TIMES.



        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.


       0200-PROCESSAR               SECTION.
           PERFORM 0250-MONTAMES
           DISPLAY WRK-DIA " DE " WRK-MES-EXT(WRK-MES) " DE " WRK-ANO.

       0250-MONTAMES                SECTION.
           MOVE "JANEIRO  "   TO WRK-MES-EXT(01).
           MOVE "FEVEREIRO"   TO WRK-MES-EXT(02).
           MOVE "MARCO    "   TO WRK-MES-EXT(03).
           MOVE "ABRIL    "   TO WRK-MES-EXT(04).
           MOVE "MAIO     "   TO WRK-MES-EXT(05).
           MOVE "JUNHO    "   TO WRK-MES-EXT(06).
           MOVE "JULHO    "   TO WRK-MES-EXT(07).
           MOVE "AGOSTO   "   TO WRK-MES-EXT(08).
           MOVE "SETEMBRO "   TO WRK-MES-EXT(09).
           MOVE "OUTUBRO  "   TO WRK-MES-EXT(10).
           MOVE "NOVEMBRO "   TO WRK-MES-EXT(11).
           MOVE "DEZEMBRO "   TO WRK-MES-EXT(12).


       0300-FINALIZAR               SECTION.

           DISPLAY "**********************************".
           DISPLAY "********** FIM PROGRAMA **********".
           DISPLAY "**********************************".

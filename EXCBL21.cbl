       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL21.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: TESTAR CONSUMO DO MODULO DATAMES
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-DATA  PIC X(40).

       PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           CALL "DATAMES" USING WRK-DATA.
           DISPLAY WRK-DATA.
           STOP RUN.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASE.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO:
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT               SECTION.
       FILE-CONTROL.



       DATA DIVISION.
       FILE SECTION.


       WORKING-STORAGE            SECTION.




        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.


       0200-PROCESSAR               SECTION.


       0300-FINALIZAR               SECTION.

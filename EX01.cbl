       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX01.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: Escreva um programa que leia três números e
      *           imprima o maior deles.
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-NUM1       PIC 9(03)  VALUE ZEROS.
       77  WRK-NUM2       PIC 9(03)  VALUE ZEROS.
       77  WRK-NUM3       PIC 9(03)  VALUE ZEROS.



        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.
           DISPLAY "DIGITE PRIMEIRO NUMERO: "
             ACCEPT WRK-NUM1
           DISPLAY "DIGITE SEGUNDO NUMERO: "
             ACCEPT WRK-NUM2
           DISPLAY "DIGITE TERCEIRO NUMERO: "
             ACCEPT WRK-NUM3.


       0200-PROCESSAR               SECTION.
           IF WRK-NUM1 GREATER WRK-NUM2 AND GREATER WRK-NUM3
              DISPLAY "O MAIOR NUMERO DIGITADO FOI "WRK-NUM1
           END-IF.

           IF WRK-NUM2 GREATER WRK-NUM1 AND GREATER WRK-NUM3
              DISPLAY "O MAIOR NUMERO DIGITADO FOI "WRK-NUM2
           END-IF.

           IF WRK-NUM3 GREATER WRK-NUM2 AND GREATER WRK-NUM1
              DISPLAY "O MAIOR NUMERO DIGITADO FOI "WRK-NUM3
           END-IF.



       0300-FINALIZAR               SECTION.

           DISPLAY "**********************************".
           DISPLAY "********** FIM PROGRAMA **********".
           DISPLAY "**********************************".

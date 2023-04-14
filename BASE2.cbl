       IDENTIFICATION DIVISION.
       PROGRAM-ID. BASE2.
      *=======================================================
      *==   AUTOR: Julio Vilela
      *==   CONSULTORIA:
      *==   DATA CRIACAO: XX/XX/2022
      *==   OBJETIVO: ABERTURA DE ARQUIVO
      *=====================================================


       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.


       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT ARQFUNC ASSIGN TO "D:\AulaCobol.txt"
               FILE STATUS IS FS-ARQFUNC.



       DATA DIVISION.
       FILE SECTION.
       FD ARQFUNC.
       01 REG-ARQFUNC.
            05 REG-CODIGO PIC 9(04).
            05 REG-NOME   PIC X(20).
            05 REG-SETOR  PIC X(05).

       WORKING-STORAGE SECTION.


       77 FS-ARQFUNC PIC 9(02).

       PROCEDURE DIVISION.


           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.
           STOP RUN.


       0100-INICIAlIZAR.
             OPEN INPUT ARQFUNC.
              PERFORM 0900-TRATA-ERRO.


       0200-PROCESSAR.


       0300-FINALIZAR.
                  CLOSE ARQFUNC.

       0900-TRATA-ERRO      SECTION.
               IF FS-ARQFUNC  NOT EQUAL 00
                   DISPLAY "ERRO " FS-ARQFUNC
                   STOP RUN
               END-IF.

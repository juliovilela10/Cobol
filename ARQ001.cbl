       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ001.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: ABERTURA DO ARQUIVO CLIENT.DAT
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT               SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "D:\AulaCobol\DADOS\CLIENTES.DAT"
             FILE STATUS IS FS-CLIENTES.

       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01  REG-CLIENTES.
           05 REG-ID         PIC 9(04).
           05 REG-NOME       PIC X(20).
           05 REG-TELEFONE   PIC X(11).


       WORKING-STORAGE            SECTION.
       77  FS-CLIENTES       PIC 9(02).



        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.
           OPEN INPUT CLIENTES.
           IF FS-CLIENTES EQUAL 35
              DISPLAY "ARQUIVO NAO FOI ABERTO "
           ELSE
            DISPLAY "ARIQUIVO OK ".

       0200-PROCESSAR               SECTION.
            CONTINUE.

       0300-FINALIZAR               SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

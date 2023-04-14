       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ004.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: GRAVACAO DE REGISTRO DO ARQUIVO CLIENT.DAT
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
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-ID         PIC 9(04).
           05 REG-NOME       PIC X(20).
           05 REG-TELEFONE   PIC X(11).


       WORKING-STORAGE            SECTION.
       77  FS-CLIENTES  PIC 9(02) VALUE ZEROS.
       77  WRK-MSG-ERRO PIC X(30) VALUE SPACES.



        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.
           OPEN OUTPUT CLIENTES.
           IF FS-CLIENTES EQUAL 35
              MOVE "ARQUIVO NAO FOI ABERTO " TO WRK-MSG-ERRO
              PERFORM 9000-TRATA-ERRO
           END-IF.


       0200-PROCESSAR               SECTION.
             MOVE 0001                   TO REG-ID.
             MOVE 'VITOR               ' TO REG-NOME.
             MOVE '43988257634'          TO REG-TELEFONE.
           WRITE REG-CLIENTES.
             MOVE 0002                   TO REG-ID.
             MOVE 'BRUNA               ' TO REG-NOME.
             MOVE '43996524253'          TO REG-TELEFONE.
           WRITE REG-CLIENTES.
             MOVE 0003                   TO REG-ID.
             MOVE 'JULIO               ' TO REG-NOME.
             MOVE '43996357698'          TO REG-TELEFONE.
           WRITE REG-CLIENTES.

       0300-FINALIZAR               SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

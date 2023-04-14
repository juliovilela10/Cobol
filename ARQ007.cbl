       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ007.
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

      *----------------- VARIAVEIS DE ENTRADA DE DADOS ---------------
       77  WRK-ID            PIC 9(04) VALUE ZEROS.
       77  WRK-NOME          PIC X(20) VALUE SPACES.
       77  WRK-TELEFONE      PIC 9(11) VALUE ZEROS.


        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.
           OPEN EXTEND CLIENTES.
           IF FS-CLIENTES EQUAL 35
              MOVE "ARQUIVO NAO FOI ABERTO " TO WRK-MSG-ERRO
              PERFORM 9000-TRATA-ERRO
           END-IF.
              PERFORM 0110-RECEBER-DADOS.

       0110-RECEBER-DADOS           SECTION.

              DISPLAY 'DIGITE O ID....'
                 ACCEPT WRK-ID.
              DISPLAY 'DIGITE O NOME..'
                 ACCEPT WRK-NOME.
              DISPLAY 'DIGITE O TELEFONE...'
                 ACCEPT WRK-TELEFONE.


       0200-PROCESSAR               SECTION.
             MOVE WRK-ID          TO REG-ID.
             MOVE WRK-NOME        TO REG-NOME.
             MOVE WRK-TELEFONE    TO REG-TELEFONE.
           WRITE REG-CLIENTES.


       0300-FINALIZAR               SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ003.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: LEITURA DE TODOS REGISTRO DO ARQUIVO CLIENT.DAT
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT               SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "D:\AulaCobol\DADOS\RNDAT.txt"
             FILE STATUS IS FS-CLIENTES.


       DATA DIVISION.
       FILE SECTION.
       FD CLIENTES.
       01  REG-CLIENTES.
           05 REG-RM         PIC 9(05).
           05 REG-NOME       PIC X(20).
           05 REG-UNI        PIC 9(01).
           05 REG-STATUS     PIC X(10).


       WORKING-STORAGE            SECTION.
       01  WRK-CLIENTES.
           05 WRK-RM         PIC 9(05).
           05 WRK-NOME       PIC X(20).
           05 WRK-UNI        PIC 9(01).
           05 WRK-STATUS     PIC X(10).

       77  FS-CLIENTES  PIC 9(02).
       77  WRK-MSG-ERRO PIC X(30) VALUE SPACES.



        PROCEDURE DIVISION.
       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
           PERFORM   0200-PROCESSAR
           PERFORM   0300-FINALIZAR

           STOP RUN.
       0100-INICIALIZAR             SECTION.
           OPEN INPUT CLIENTES.
           IF FS-CLIENTES EQUAL 35
              MOVE "ARQUIVO NAO FOI ABERTO " TO WRK-MSG-ERRO
              PERFORM 9000-TRATA-ERRO
           END-IF.


       0200-PROCESSAR               SECTION.
           READ CLIENTES
             IF FS-CLIENTES EQUAL 0
                PERFORM UNTIL FS-CLIENTES NOT EQUAL 00
                   MOVE REG-RM       TO WRK-RM
                   MOVE REG-NOME     TO WRK-NOME
                   MOVE REG-UNI      TO WRK-UNI
                   MOVE REG-STATUS   TO WRK-STATUS

                   DISPLAY "RM....    " WRK-RM
                   DISPLAY "NOME..    " WRK-NOME
                   DISPLAY "UNIDADE.. " WRK-UNI
                   DISPLAY "STATUS..  " WRK-STATUS
                   DISPLAY "-------------------------"
                    READ CLIENTES
                END-PERFORM

             ELSE
                DISPLAY "ARQUIVO VAZIO"
             END-IF.


       0300-FINALIZAR               SECTION.
           DISPLAY "FIM DE PROGRAMA".
           CLOSE CLIENTES.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

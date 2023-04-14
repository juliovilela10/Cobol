       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARQ005.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: PROCURA DE UM REGISTRO DO ARQUIVO CLIENT.DAT
      *            GERACAO DE ESTATISTICAS PARA LIDOS E ACHADOS
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
       77  WRK-ID       PIC 9(04) VALUE ZEROS.

      *-------------------- ACUMULADORES --------------------
       77  WRK-ACUM-LIDOS    PIC 9(04) VALUE ZEROS.
       77  WRK-ACUM-ACHADOS  PIC 9(04) VALUE ZEROS.


       77  FS-CLIENTES  PIC 9(02) VALUE ZEROS.
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
              DISPLAY "DIGITE O ID.. "
                ACCEPT WRK-ID.


       0200-PROCESSAR               SECTION.
           READ CLIENTES
             IF FS-CLIENTES EQUAL 0
                PERFORM UNTIL FS-CLIENTES NOT EQUAL 00
                      ADD 1 TO WRK-ACUM-LIDOS
                   IF REG-ID EQUAL WRK-ID

                       DISPLAY "ID.... " REG-ID
                       DISPLAY "NOME.. " REG-NOME
                       DISPLAY "TELE.. " REG-TELEFONE
                       DISPLAY "-------------------------"
                         ADD 1 TO WRK-ACUM-ACHADOS

                   END-IF
                    READ CLIENTES

                END-PERFORM

             ELSE
                DISPLAY "ARQUIVO VAZIO"
             END-IF.


       0300-FINALIZAR               SECTION.

           CLOSE CLIENTES.
           PERFORM 0310-ESTATISTICAS.
           DISPLAY "FIM DO PROGRAMA".

       0310-ESTATISTICAS            SECTION.
             DISPLAY "=======================".
             DISPLAY "REGISTROS LIDOS  .. " WRK-ACUM-LIDOS.
             DISPLAY "REGISTROS ACHADOS.. " WRK-ACUM-ACHADOS.

       9000-TRATA-ERRO.
           DISPLAY WRK-MSG-ERRO.
           GOBACK.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX001.
      *=======================================================
      *==   AUTOR: IVAN SANCHES
      *==   CONSULTORIA: XPTO
      *==   DATA CRIACAO: XX/XX/2022
      *==   OBJETIVO: EXER01 - Leitura de um arquivo sequencial e
      *==   gravação de outro arquivo sequencial com campos
      *==   preestabelecidos.
      *=====================================================

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *--------------------------------------------------------------
      *-------- APONTAMENTO DOS ARQUIVOS
      *--------------------------------------------------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
             SELECT CLIENTES ASSIGN TO "D:\AulaCobol\DADOS\CLI.txt"
               FILE STATUS IS FS-CLIENTES.

             SELECT RELAT ASSIGN TO "D:\AulaCobol\DADOS\RELAT.txt"
               FILE STATUS IS FS-RELAT.
      *--------------------------------------------------------------
      *-------- DEFINICAO DOS ARQUIVOS
      *--------------------------------------------------------------

       DATA DIVISION.
       FILE SECTION.
       FD  CLIENTES.
       01  REG-CLIENTES.
            05 REG-CODIGO PIC 9(05).
            05 REG-NOME   PIC X(20).
            05 REG-EMAIL  PIC X(20).
            05 REG-UF     PIC X(02).

       FD  RELAT.
       01  REG-RELAT  PIC X(07).


       WORKING-STORAGE SECTION.

      *--------------------------------------------------------------
      *-------- VARIAVEIS DE STATUS
      *--------------------------------------------------------------
       77  FS-CLIENTES PIC 9(02).
       77  FS-RELAT    PIC 9(02).

      *--------------------------------------------------------------
      *-------- VARIAVEIS DE MSG
      *--------------------------------------------------------------
       77  WRK-ERRO-OPENCLI PIC X(30) VALUE  "ERRO NO OPEN CLIENTES ".
       77  WRK-ERRO-OPENREL PIC X(30) VALUE  "ERRO NO OPEN RELAT ".


      *--------------------------------------------------------------
      *-------- VARIAVEIS DE ACUMULACAO
      *--------------------------------------------------------------
       77  WRK-ACUM-LIDOS    PIC 9(04).
       77  WRK-ACUM-GRAVADOS PIC 9(04).

       PROCEDURE DIVISION.

           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES NOT EQUAL 00.
           PERFORM 0300-FINALIZAR.
           STOP RUN.

       0100-INICIAlIZAR.
      *--------------------------------------------------------------
      *-------- ABERTURA E TESTE DO ARQUIVO CLIENTES
      *--------------------------------------------------------------
             OPEN INPUT CLIENTES
               IF FS-CLIENTES  NOT EQUAL 00
                   DISPLAY  WRK-ERRO-OPENCLI FS-CLIENTES
                   STOP RUN
               END-IF.

      *--------------------------------------------------------------
      *-------- ABERTURA E TESTE DO ARQUIVO RELAT
      *--------------------------------------------------------------

              OPEN OUTPUT RELAT.
               IF FS-RELAT NOT EQUAL 00
                     DISPLAY WRK-ERRO-OPENREL FS-RELAT
                   STOP RUN
               END-IF.

      *--------------------------------------------------------------
      *-------- TESTAR SE EXISTE REGISTRO NO ARQUIVO CLIENTES
      *--------------------------------------------------------------

              READ CLIENTES.
               IF  FS-CLIENTES NOT EQUAL 00
                     DISPLAY "ARQUIVO VAZIO"
               END-IF.



       0200-PROCESSAR.

                      ADD 1 TO WRK-ACUM-LIDOS

      *--------------------------------------------------------------
      *-------- REGRA1 : GRAVAR SOMENTE SE ESTADOS SP ou RJ
      *--------------------------------------------------------------

                    IF REG-UF = "SP"  OR REG-UF = "RJ"
      *                DISPLAY "------------"
      *                DISPLAY "CODIGO " REG-CODIGO
      *                DISPLAY "NOME   " REG-NOME
      *                DISPLAY "SETOR  " REG-EMAIL
      *                DISPLAY "UF     " REG-UF

      *--------------------------------------------------------------
      *-------- INSERIR NA VARIAVEL DO ARQUIVO RELAT CODIGO e UF DO
      *-------- ARQUIVO CLIENTES
      *--------------------------------------------------------------

                       STRING REG-CODIGO  DELIMITED BY SIZE
                              REG-UF      DELIMITED BY SIZE
                              INTO REG-RELAT
      *--------------------------------------------------------------
      *-------- GRAVAR O ARQUIVO RELAT
      *--------------------------------------------------------------

                       WRITE REG-RELAT

                        ADD 1 TO WRK-ACUM-GRAVADOS
                    END-IF.

                    READ CLIENTES.


       0300-FINALIZAR.
      *--------------------------------------------------------------
      *-------- FECHAMENTO ARQUIVOS CLIENTES E RELAT
      *--------------------------------------------------------------

                  CLOSE CLIENTES.
                  CLOSE RELAT.
      *--------------------------------------------------------------
      *-------- MOSTRAR ESTATISTICA
      *--------------------------------------------------------------

                  DISPLAY "TOTAL LIDOS..... " WRK-ACUM-LIDOS.
                  DISPLAY "TOTAL GRAVADOS.. " WRK-ACUM-GRAVADOS.

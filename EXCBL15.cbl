       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL15.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: TESTAR MEDIA DO ALUNO (IF)
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.
       77  WRK-NIVEL     PIC X(10)    VALUE SPACES.
       77  WRK-NOT1      PIC 9(02)V99 VALUE ZEROS.
       77  WRK-NOT2      PIC 9(02)V99 VALUE ZEROS.
       77  WRK-MEDIA     PIC 9(02)V99 VALUE ZEROS.

       PROCEDURE DIVISION.


       0000-PRINCIPAL             SECTION.
           PERFORM   0100-INICIALIZAR
             PERFORM 0200-PROCESSAR
             PERFORM 0300-FINALIZAR

           STOP RUN.


       0100-INICIALIZAR           SECTION.
           DISPLAY "NIVEL (FUND / MEDIO) "
             ACCEPT WRK-NIVEL
           DISPLAY "Digite a Primeira Nota: "
             ACCEPT WRK-NOT1
           DISPLAY "Digite a Segunda Nota: "
             ACCEPT WRK-NOT2.

       0200-PROCESSAR             SECTION.
           COMPUTE WRK-MEDIA = (WRK-NOT1 + WRK-NOT2) / 2.

           DISPLAY "MEDIA..."
           DISPLAY WRK-MEDIA
             IF WRK-NIVEL (01:04) EQUAL "FUND" AND
                   WRK-MEDIA GREATER THAN OR EQUAL 6
                    DISPLAY "APROVADO "
             END-IF.
             IF WRK-NIVEL (01:05) EQUAL "MEDIO" AND
                   WRK-MEDIA GREATER 7
                    DISPLAY "APROVADO"
             END-IF.

       0300-FINALIZAR             SECTION.
           DISPLAY "**********************************".
           DISPLAY "********** FIM PROGRAMA **********".
           DISPLAY "**********************************".

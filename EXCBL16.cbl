       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCBL16.
      ******************************************************************
      * AUTOR: Julio Vilela
      * OBJETIVO: CALCULANDO FRETE (EVALUATE)
      * DATA: XX/XX/2022
      * OBSERVAÇÕES:
      ******************************************************************
       ENVIRONMENT                DIVISION.
       CONFIGURATION              SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE            SECTION.

      *================ VARIAVEIS DE APOIO =================
       77  WRK-PRODUTO  PIC X(30)     VALUE SPACES.
       77  WRK-ESTADO   PIC X(02)     VALUE SPACES.
       77  WRK-VALOR    PIC 9(08)V99  VALUE ZEROS.
       77  WRK-FRETE    PIC 9(08)V99  VALUE ZEROS.

      *================ VARIAVEIS DE EDICAO ================
       77  WRK-VALOR-ED PIC ZZ.ZZZ.ZZ9,99.
       77  WRK-FRETE-ED PIC ZZ.ZZZ.ZZ9,99.

       PROCEDURE DIVISION.


       0000-PRINCIPAL               SECTION.
           PERFORM   0100-INICIALIZAR
             PERFORM 0200-PROCESSAR
             PERFORM 0300-FINALIZAR

           STOP RUN.


       0100-INICIALIZAR             SECTION.
           DISPLAY "QUAL O PRODUTO: "
             ACCEPT WRK-PRODUTO.
           DISPLAY "QUAL O VALOR: "
             ACCEPT WRK-VALOR.
           DISPLAY "QUAL O ESTADO (SP/RJ/ES): "
             ACCEPT WRK-ESTADO.


       0200-PROCESSAR               SECTION.
           EVALUATE WRK-ESTADO
             WHEN "SP"
              COMPUTE WRK-FRETE = WRK-VALOR * 0,10
             WHEN "RJ"
              COMPUTE WRK-FRETE = WRK-VALOR * 0,15
             WHEN "ES"
              COMPUTE WRK-FRETE = WRK-VALOR * 0,20
             WHEN OTHER
              DISPLAY "NAO ENTREGAMOS NESSE ESTADO " WRK-ESTADO
           END-EVALUATE.

           COMPUTE WRK-VALOR = WRK-VALOR + WRK-FRETE.
           MOVE WRK-VALOR TO WRK-VALOR-ED
           MOVE WRK-FRETE TO WRK-FRETE-ED.

           DISPLAY "VALOR FINAL " WRK-VALOR-ED.
           IF WRK-FRETE GREATER 0
              DISPLAY "VALOR DO FRETE " WRK-FRETE-ED
           END-IF.



       0300-FINALIZAR               SECTION.
           DISPLAY "**********************************".
           DISPLAY "********** FIM PROGRAMA **********".
           DISPLAY "**********************************".

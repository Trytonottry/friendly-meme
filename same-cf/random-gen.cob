       IDENTIFICATION DIVISION.
       PROGRAM-ID. RANDOM-GEN.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUT-FILE ASSIGN TO "random.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD OUT-FILE.
       01 OUT-REC      PIC X(12).

       WORKING-STORAGE SECTION.
       01 I            PIC 9(3).
       01 SEED         PIC 9(8) VALUE 12345678.
       01 RAND-INT     PIC 9(8).
       01 RAND-FLT     PIC 9V999999.
       01 STR-BUF      PIC X(12).

       PROCEDURE DIVISION.
       MAIN.
           OPEN OUTPUT OUT-FILE
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 10
               COMPUTE RAND-INT = FUNCTION RANDOM(SEED) * 1000000
               COMPUTE RAND-FLT = RAND-INT / 1000000
               MOVE RAND-FLT TO STR-BUF
               STRING STR-BUF DELIMITED BY SPACE INTO OUT-REC
               WRITE OUT-REC
           END-PERFORM
           CLOSE OUT-FILE
           DISPLAY "10 random numbers written to random.txt".
           STOP RUN.
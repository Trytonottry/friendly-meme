       IDENTIFICATION DIVISION.
       PROGRAM-ID. AVERAGE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'input.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD PIC X(20).

       WORKING-STORAGE SECTION.
       01 NUM-COUNT PIC 9(5) VALUE 0.
       01 NUM-SUM     PIC 9(10)V9(2) VALUE 0.
       01 NUM-VALUE   PIC 9(10)V9(2).
       01 NUM-AVERAGE PIC 9(10)V9(2).
       01 EOF-FLAG    PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN.
           OPEN INPUT INPUT-FILE
           PERFORM UNTIL EOF-FLAG = 'Y'
               READ INPUT-FILE INTO INPUT-RECORD
                   AT END MOVE 'Y' TO EOF-FLAG
                   NOT AT END
                       MOVE INPUT-RECORD TO NUM-VALUE
                       ADD NUM-VALUE TO NUM-SUM
                       ADD 1 TO NUM-COUNT
               END-READ
           END-PERFORM
           CLOSE INPUT-FILE

           IF NUM-COUNT > 0
               COMPUTE NUM-AVERAGE = NUM-SUM / NUM-COUNT
               DISPLAY "Average: " NUM-AVERAGE
           ELSE
               DISPLAY "No numbers found."
           END-IF

           STOP RUN.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MATMUL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 M            PIC 9 VALUE 3.
       01 N            PIC 9 VALUE 4.
       01 K            PIC 9 VALUE 2.
       01 I            PIC 9.
       01 J            PIC 9.
       01 L            PIC 9.
       01 SUM          PIC 9(4)V9(4).

       01 A-TABLE.
           05 A-ROW OCCURS 3 TIMES.
               10 A-ELEM OCCURS 2 TIMES PIC 9V9(3).
       01 B-TABLE.
           05 B-ROW OCCURS 2 TIMES.
               10 B-ELEM OCCURS 4 TIMES PIC 9V9(3).
       01 C-TABLE.
           05 C-ROW OCCURS 3 TIMES.
               10 C-ELEM OCCURS 4 TIMES PIC 9V9(3).

       PROCEDURE DIVISION.
       MAIN.
           PERFORM INIT-MATRICES
           PERFORM MULTIPLY-MATRICES
           PERFORM DISPLAY-RESULT
           STOP RUN.

       INIT-MATRICES.
           MOVE 0.1 TO A-ELEM(1,1) A-ELEM(1,2)
           MOVE 0.2 TO A-ELEM(2,1) A-ELEM(2,2)
           MOVE 0.3 TO A-ELEM(3,1) A-ELEM(3,2)

           MOVE 1.0 TO B-ELEM(1,1) B-ELEM(1,2) B-ELEM(1,3) B-ELEM(1,4)
           MOVE 2.0 TO B-ELEM(2,1) B-ELEM(2,2) B-ELEM(2,3) B-ELEM(2,4).

       MULTIPLY-MATRICES.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > M
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > N
                   MOVE 0 TO SUM
                   PERFORM VARYING L FROM 1 BY 1 UNTIL L > K
                       COMPUTE SUM = SUM + A-ELEM(I,L) * B-ELEM(L,J)
                   END-PERFORM
                   MOVE SUM TO C-ELEM(I,J)
               END-PERFORM
           END-PERFORM.

       DISPLAY-RESULT.
           DISPLAY "Product C = A * B:".
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > M
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > N
                   DISPLAY "C(" I "," J ") = " C-ELEM(I,J)
               END-PERFORM
           END-PERFORM.
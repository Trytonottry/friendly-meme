! matmul.f90
program matmul_demo
   implicit none
   integer, parameter :: m = 3, n = 4, k = 2
   real :: A(m,k), B(k,n), C(m,n)
   integer :: i, j, l

   ! Заполняем A и B
   call random_seed()
   call random_number(A)
   call random_number(B)

   ! C = A·B
   C = matmul(A, B)

   ! Вывод
   print *, 'Matrix A:'
   do i = 1, m
      print '(100F8.3)', (A(i,j), j=1,k)
   end do

   print *, 'Matrix B:'
   do i = 1, k
      print '(100F8.3)', (B(i,j), j=1,n)
   end do

   print *, 'Product C = A*B:'
   do i = 1, m
      print '(100F8.3)', (C(i,j), j=1,n)
   end do
end program matmul_demo
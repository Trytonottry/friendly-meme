program random_gen
   implicit none
   integer, parameter :: n = 10          ! сколько чисел
   real, dimension(n) :: r
   integer :: i

   call random_seed()                    ! инициализация генератора
   call random_number(r)                 ! r(i) ∈ [0,1)
   open(10, file='random.txt', status='replace')
   do i = 1, n
      write(10, '(F12.8)') r(i)
   end do
   close(10)
   print *, n, 'random numbers written to random.txt'
end program random_gen
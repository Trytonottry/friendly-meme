program average
    implicit none
    integer :: count, iostat
    real :: value, sum, avg
    character(len=100) :: line

    open(unit=10, file='input.txt', status='old', action='read')
    count = 0
    sum = 0.0

    do
        read(10, '(A)', iostat=iostat) line
        if (iostat /= 0) exit
        read(line, *, iostat=iostat) value
        if (iostat == 0) then
            sum = sum + value
            count = count + 1
        end if
    end do

    close(10)

    if (count > 0) then
        avg = sum / real(count)
        print *, 'Average:', avg
    else
        print *, 'No numbers found.'
    end if
end program average
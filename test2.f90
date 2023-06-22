! pointerExample2 
! To show how to use gdb to observe the base type member of a 
! derived type(in pointer form) in fortran
program pointerExample
implicit none

type, abstract :: t_abstractType
   real(8), pointer :: abstractMember => null()
end type

type, extends(t_abstractType) :: t_derivedType
  real(8) :: derivedMember = 1.2
end type

  
   real(8), target :: target1 = 3.3
   type(t_derivedType), pointer   :: pointer1
  
   Allocate(pointer1)
   pointer1%abstractMember => target1

   print *, pointer1%derivedMember
   print *, pointer1%abstractMember
   ! you cannot print pointer1%abstractMember in gdb
   ! you have to print (t_abstractType*)(pointer1)%abstractMember
   ! This will print the pointer information to the real(8)
   ! to deference it, print *((t_abstractType*)(pointer1)%abstractMember)
end program pointerExample


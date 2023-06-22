! pointerExample1
! To show how to use gdb to observe the base type member of a 
! derived type in fortran

program pointerExample
implicit none

type, abstract :: t_abstractType
   real(8), pointer :: abstractMember => null()
end type

type, extends(t_abstractType) :: t_derivedType
  real(8) :: derivedMember = 1.2
end type

  
   real(8), target :: t1 = 3.4
   type(t_derivedType) :: derivedInstance
   
   derivedInstance = t_derivedType()
   derivedInstance%abstractMember => t1
   print *, derivedInstance%derivedMember
   print *, derivedInstance%abstractMember
	
   ! you cannot print derivedInstance%abstractMember in gdb
   ! you have to print (t_abstractType)derivedInstance%abstractMember
   ! This will print the pointer information to the real(8)
   ! to deference it, print *((t_abstractType)derivedInstance%abstractMember)
   
end program pointerExample

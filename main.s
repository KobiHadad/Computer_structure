.section .data
hello:
    .string "Enter configuration seed:\n"
input:  
    .string "%d"
format:
    .string "%d\n"
space:  
    .string "\n"
guess:
    .string "What is your guess\n"
win:
    .string "Congratz! You won!\n"
lose:
    .string "Game over, you lost :(. The correct answer was "
wrong:
    .string "Incorrect.\n"
.section .text
.globl main
.type main, @function
main:
    # print the massage
    subq $8, %rsp        # make space on the stack for the argument
    mov $hello, %rdi    # message to write
    call printf          # call printf

    # gets the input
    mov $input, %rdi    # message to write
    call scanf
    

    mov %rsi, %rdi
    call srand
    call rand
    movl %eax, %ebx
    movl $10,  %ecx
    xorl %edx, %edx
    divl %ecx
    mov $format, %rdi


    mov %rdx,%r12    # message to write

#loop:
    mov $1, %r13
    start_loop:
        cmp $6, %r13
        je game_over
        mov $guess, %rdi    # message to write
        call printf
        mov $input, %rdi    # message to write
        call scanf
        cmp %r12, %rsi
        je game_won
        inc %r13
        mov $wrong, %rdi    # message to write
        call printf
        jmp start_loop

    game_over:
        mov $lose, %rdi    # message to write
        call printf
        jmp print_guess

    game_won:
        mov $win, %rdi    # message to write
        call printf
        call exit

    print_guess:
        mov $format, %rdi
        mov %r12,%rsi    # message to write
        call printf
        call exit




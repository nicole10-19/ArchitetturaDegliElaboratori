.data
array0: .word 0,1,4,2,7,8,4,6

.text
# i in $s0, x in $s1
addi $s0, $zero, 4        # i = 1 → offset = 4 (perché ogni word = 4 byte)
lw   $s1, array0($zero)   # x = array[0]

addi $t0, $zero, 32       # dimensione array in byte (8 elementi * 4 byte = 32)

loop:
    beq $s0, $t0, exit    # se i == 32 → fine ciclo (abbiamo letto tutti gli 8 elementi)

    lw  $t2, array0($s0)  # carica array[i] in $t2
    slt $t1, $s1, $t2     # t1 = 1 se x < array[i]
    beq $t1, $zero, label # se x >= array[i], salta a label
    addi $s1, $t2, 0      # altrimenti x = array[i]

label:
    addi $s0, $s0, 4      # i = i + 1 → in realtà offset = offset + 4
    j loop

exit:
    # fine programma

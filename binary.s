.global _start
.align 4

_start:
    // Demande un nombre à l'utilisateur
    adr X0, prompt
    mov X16, #0
    bl printf

    // Lit le nombre entré par l'utilisateur
    adr X0, buffer
    mov X1, #10
    mov X16, #0
    bl scanf

    // Multiplie le nombre par 2
    ldr W1, [buffer]
    mov W2, #2
    mul W0, W1, W2

    // Affiche le résultat de la multiplication
    adr X0, result
    mov X1, W0
    mov X16, #0
    bl printf

    // Sortie du programme
    mov X0, #0
    mov X16, #1
    svc #0x80

.data
    prompt: .ascii "Entrez un nombre : "
    result: .ascii "Le résultat est : %d\n"
    buffer: .skip 4
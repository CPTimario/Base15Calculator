.model small
.stack 0100h
.data
        msg1 db "CALCULATOR$"
        msg2 db "BASE 15$"
        ad db "[1] ADDITION$"
        sb db "[2] SUBTRACTION$"
        ml db "[3] MULTIPLICATION$"
        dv db "[4] DIVISION$"
        md db "[5] MODULUS$"
        que db "CHOOSE AN OPERATION: $"
        er db "ERROR: INVALID INPUT!$"
        msg3 db "TRY AGAIN? [Y/N]: $"
        
        ad2 db "ADDITION$"
        sb2 db "SUBTRACTION$"
        ml2 db "MULTIPLICATION$"
        dv2 db "DIVISION$"
        md2 db "MODULUS$"
        
        ip1 db "INPUT A NUMBER [00.00 - DD.DD]: $"
        ip2 db "INPUT A NUMBER [00.00 - DD.DD]: $"
        asw db "ANSWER: $"
        
        nm1 dw ?
        nm2 dw ?
        ans dw ?
        
        b1 db 15
        b1a dw 15
        b1b dw 225
        
.code
start:
        mov ax, @data
        mov ds, ax
       
        mov ax, 0600h
        mov bh, 07h
        mov cx, 0000h
        mov dx, 184fh
        int 10h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0823h
        int 10h
        
        mov ah, 09h
        mov dx, offset msg1
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0925h
        int 10h
        
        mov ah, 09h
        mov dx, offset msg2
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0b1fh
        int 10h
        
        mov ah, 09h
        mov dx, offset ad
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0c1fh
        int 10h
        
        mov ah, 09h
        mov dx, offset sb
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0d1fh
        int 10h
        
        mov ah, 09h
        mov dx, offset ml
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0e1fh
        int 10h
        
        mov ah, 09h
        mov dx, offset dv
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0f1fh
        int 10h
        
        mov ah, 09h
        mov dx, offset md
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 111dh
        int 10h
        
        mov ah, 09h
        mov dx, offset que
        int 21h
        
        mov ah, 01h
        int 21h
        cmp al, 31h
        je aa
        cmp al, 32h
        je bb
        cmp al, 33h
        je cc
        cmp al, 34h
        je dd
        cmp al, 35h
        je ee
        jmp error
        
aa:     jmp addi
bb:     jmp subt
cc:     jmp mult
dd:     jmp divi
ee:     jmp modu        
        
error:
        mov ah, 02h
        mov bh, 00h
        mov dx, 151eh
        int 10h
        
        mov ah, 09h
        mov dx, offset er
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 171fh
        int 10h
        
        mov ah, 09h
        mov dx, offset msg3
        int 21h
        
        mov ah, 01h
        int 21h
        cmp al, 59h
        je rtn
        cmp al, 79h
        je rtn
        jmp exit
        
rtn:    jmp start

input1:
        mov ah, 01h
        int 21h
        cmp al, 30h
        

addi:
        mov ax, 0600h
        mov bh, 07h
        mov cx, 0000h
        mov dx, 184fh
        int 10h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0a20h
        int 10h
        
        mov ah, 09h
        mov dx, offset ad2
        int 21h
        
        mov ah, 02h
        mov bh, 00h
        mov dx, 0c15h
        int 10h
        
        mov ah, 02h
        mov dx, offset ip1
        int 21h
        
        jmp input1
        
exit:
        mov ax, 4c00h
        int 21h

end start

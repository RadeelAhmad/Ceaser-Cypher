INCLUDE Irvine32.inc
include macros.inc
BUFFER_SIZE = 100
.data
buffer byte BUFFER_SIZE DUP(?)
filename BYTE 80 DUP(0)
fileHandle HANDLE ?
f byte "Enter an input filename: ", 0
display byte "Ciphertext is: ", 0
display1 byte "Plaintext is: ", 0
keyinput byte "Enter shift: ", 0
key word ?
array byte 100 DUP(?)
choic dword ?
.code
main PROC
mWrite '***********************', 0
call crlf
mWrite 'Project Caesar Cipher', 0
call crlf
mWrite '***********************', 0
call crlf
call crlf
mWrite '---------------------------------------------------', 0
call crlf
mWrite 'Group Members', 0
call crlf
mWrite 'Radeel Ahmad - 221544', 0
call crlf
mWrite 'Muhammad Abdullah - 221546', 0
call crlf
mWrite '-----------------------------------------------------', 0
call crlf
mov edx, OFFSET f
call writestring
; Input filename
mov edx, OFFSET filename
mov ecx, SIZEOF filename
call ReadString
; Open file
mov edx, OFFSET filename
call OpenInputFile
mov fileHandle, eax
mov edx, OFFSET buffer
mov ecx, BUFFER_SIZE
call ReadFromFile
mWrite 'Select Choice', 0
call crlf
mWrite '1. For encryption', 0
call crlf
mWrite '2. For decryption', 0
call crlf
call readdec
mov choic, eax
mov edx, OFFSET keyinput
call writestring
call readdec
mov key, ax
cmp choic, 1
je encryption
cmp choic, 2
je decryption
encryption:
enc PROC
mov edi, OFFSET array
mov ecx, (LENGTHOF array)
mov EBP, OFFSET buffer
mov esi, 0
mov eax, 0
mov ebx, 0
mov edx, 0
mWrite 'Plaintext is: ', 0
mov edx, OFFSET buffer
call writestring
call crlf
call crlf
l2:
mov eax, 0
cmp buffer[esi], 65 ; compare with 'A'
jl next_char ; jump if less
cmp buffer[esi], 90 ; compare with 'Z'
jle encryption_cap ; within uppercase range
cmp buffer[esi], 97 ; compare with 'a'
jl next_char ; jump if less
cmp buffer[esi], 122 ; compare with 'z'
jle encryption ; within lowercase range
next_char:
mov al, [EBP+esi]
mov [EDI+esi], al
jmp lop
encryption:
mov al, [EBP+esi]
sub ax, 97
add ax, key
mov bx, 26
xor edx, edx
div bx
add dl, 97
mov [edi+esi], dl
jmp lop
encryption_cap:
mov al, [EBP+esi]
sub ax, 65
add ax, key
mov bx, 26
xor edx, edx
div bx
add dl, 65
mov [edi+esi], dl
jmp lop
lop:
inc esi
loop l2
jmp quit_enc
quit_enc:
mov edx, OFFSET display
call writestring
mov edx, OFFSET array
call writestring
call crlf
exit
enc ENDP
decryption:
decr PROC
mov edi, OFFSET array
mov ecx, (LENGTHOF array)
mov EBP, OFFSET buffer
mov esi, 0
mov eax, 0
mov ebx, 0
mov edx, 0
mWrite 'Ciphertext is: ', 0
mov edx, OFFSET buffer
call writestring
call crlf
call crlf
l1:
mov eax, 0
cmp buffer[esi], 65 ; compare with 'A'
jl next_char_dec ; jump if less
cmp buffer[esi], 90 ; compare with 'Z'
jle decryption_cap ; within uppercase range
cmp buffer[esi], 97 ; compare with 'a'
jl next_char_dec ; jump if less
cmp buffer[esi], 122 ; compare with 'z'
jle decryption ; within lowercase range
next_char_dec:
mov al, [EBP+esi]
mov [EDI+esi], al
jmp lop_dec
decryption:
mov al, [EBP+esi]
sub ax, 97
sub ax, key
add ax, 26
mov bx, 26
xor edx, edx
div bx
add dl, 97
mov [EDI+esi], dl
jmp lop_dec
decryption_cap:
mov al, [EBP+esi]
sub ax, 65
sub ax, key
add ax, 26
mov bx, 26
xor edx, edx
div bx
add dl, 65
mov [EDI+esi], dl
jmp lop_dec
lop_dec:
inc esi
loop l1
jmp quit_dec
quit_dec:
mov edx, OFFSET display1
call writestring
mov edx, OFFSET array
call writestring
call crlf
exit
decr ENDP
exit:
main ENDP
END main

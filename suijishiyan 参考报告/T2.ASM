data	segment	page
buf 	db 	80H,7FH,00H,23H,98H,45H,77H,88H,00H,61H
count   equ     10
buf2	db	0DH,0AH,'$'
buf3	db	' zheng ','$'
buf4	db	' fu ','$'
buf5	db	' ling ','$'
buf7    db  ' in: ','$'

data1	db	00H	;负数
data2	db	00H	;正数
data3	db	00H	;零的个数
data	ends

ssg1	segment	stack
			dw	100 dup(?)
ssg1	ends

codes	segment	page
assume	cs:codes,ds:data,ss:ssg1

start:  
	mov     ax,data
	mov		ds,ax
	;lea 	bx,buf
	;mov		ax,0000H
	mov 	cx,count

work:	
	;mov	bl,00H
	lea dx,buf7
	mov	ah,09H
	int	21H
	push cx

	mov	ah,1
	int	21H
	cmp	al,'A'
	jnl	char
	jmp	num

char:	
	sub	al,'A'
	add	al,10
	jmp	SL

num:	
	sub	al,'0'

SL:	
	mov	cl,04H
	shl	al,cl
	mov	bl,al

	pop	cx

	mov	ah,1
	int	21H
	cmp	al,'A'
	jnl	charr
	jmp	numr

charr:	
	sub	al,'A'
	add	al,10
	jmp	go

numr:	
	sub	al,'0'
go:	add	al,bl
	
	CALL	near ptr compare

	lea dx,buf2
	mov	ah,09H
	int	21H
	
	loop	work


	lea dx,buf4					;display number of negative
	mov	ah,09H
	int	21H
	lea	bx,data1
	mov	dl,[bx]
	add	dl,'0'
	mov	ah,02H
	int	21H
	lea dx,buf2					
	mov	ah,09H
	int	21H

	lea	dx,buf3					;display number of positive
	mov	ah,09H
	int	21H
	lea	bx,data2
	mov	dl,[bx]
	add	dl,'0'
	mov	ah,02H
	int	21H
	lea dx,buf2					
	mov	ah,09H
	int	21H

	lea	dx,buf5					;display number of zero
	mov	ah,09H
	int	21H
	lea	bx,data3
	mov	dl,[bx]
	add	dl,'0'
	mov	ah,02H
	int	21H
	lea dx,buf2					
	mov	ah,09H
	int	21H

	mov 	ax,4C00H
	int 	21H

compare  proc 	near	;用于al中数的正负
		cmp	al,	0
		JZ	zero		;比较是否为零
		cmp	al,	0
		JL	minus		;比较是否为负
		lea	bx,data2
		mov al,[bx]
		inc	al			;正数个数加1
		mov	[bx],al
		ret
zero:					
		lea	bx,	data3
		mov al,[bx]
		inc	al			;零个数加1
		mov	[bx],al
		ret
minus:					
		lea	bx,data1
		mov al,[bx]
		inc	al			;负数个数加1
		mov	[bx],al
		ret
compare endp
	codes	ends
end start

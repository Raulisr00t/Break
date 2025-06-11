include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	__local_stdio_printf_options
PUBLIC	_vfprintf_l
PUBLIC	printf
PUBLIC	main
EXTRN	__acrt_iob_func:PROC
EXTRN	__stdio_common_vfprintf:PROC
_DATA	SEGMENT
COMM	?_OptionsStorage@?1??__local_stdio_printf_options@@9@9:QWORD							; __local_stdio_printf_options'::2'::_OptionsStorage
_DATA	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$_vfprintf_l DD imagerel $LN3
	DD	imagerel $LN3+67
	DD	imagerel $unwind$_vfprintf_l
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$printf DD imagerel $LN3
	DD	imagerel $LN3+87
	DD	imagerel $unwind$printf
pdata	ENDS
pdata	SEGMENT
$pdata$main DD	imagerel $LN7
	DD	imagerel $LN7+65
	DD	imagerel $unwind$main
pdata	ENDS
_DATA	SEGMENT
$SG9511	DB	'%d', 0aH, 00H
_DATA	ENDS
xdata	SEGMENT
$unwind$main DD	010401H
	DD	06204H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$printf DD 011801H
	DD	06218H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$_vfprintf_l DD 011801H
	DD	06218H
xdata	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
i$1 = 32
main	PROC
; File C:\Users\Msi\projects\Break\loop.c
; Line 3
$LN7:
	sub	rsp, 56					; 00000038H
; Line 5
	mov	DWORD PTR i$1[rsp], 0
	jmp	SHORT $LN4@main
$LN2@main:
	mov	eax, DWORD PTR i$1[rsp]
	inc	eax ; i ++ 
	mov	DWORD PTR i$1[rsp], eax
$LN4@main:
	cmp	DWORD PTR i$1[rsp], 10
	jge	SHORT $LN3@main
; Line 6
	cmp	DWORD PTR i$1[rsp], 5
	jne	SHORT $LN5@main ; GO To Break
; Line 7
	jmp	SHORT $LN3@main
$LN5@main:
; Line 9
	mov	edx, DWORD PTR i$1[rsp]
	lea	rcx, OFFSET FLAT:$SG9511
	call	printf ; printf("%d", i);
; Line 10
	jmp	SHORT $LN2@main
$LN3@main:
; BREAK
; Line 12
	xor	eax, eax
; Line 13
	add	rsp, 56					; 00000038H
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT printf
_TEXT	SEGMENT
_Result$ = 32
_ArgList$ = 40
_Format$ = 64
printf	PROC						; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.26100.0\ucrt\stdio.h
; Line 956
$LN3:
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 56					; 00000038H
; Line 959
	lea	rax, QWORD PTR _Format$[rsp+8]
	mov	QWORD PTR _ArgList$[rsp], rax
; Line 960
	mov	ecx, 1
	call	__acrt_iob_func
	mov	r9, QWORD PTR _ArgList$[rsp]
	xor	r8d, r8d
	mov	rdx, QWORD PTR _Format$[rsp]
	mov	rcx, rax
	call	_vfprintf_l
	mov	DWORD PTR _Result$[rsp], eax
; Line 961
	mov	QWORD PTR _ArgList$[rsp], 0
; Line 962
	mov	eax, DWORD PTR _Result$[rsp]
; Line 963
	add	rsp, 56					; 00000038H
	ret	0
printf	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT _vfprintf_l
_TEXT	SEGMENT
_Stream$ = 64
_Format$ = 72
_Locale$ = 80
_ArgList$ = 88
_vfprintf_l PROC					; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.26100.0\ucrt\stdio.h
; Line 644
$LN3:
	mov	QWORD PTR [rsp+32], r9
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H
; Line 645
	call	__local_stdio_printf_options
	mov	rcx, QWORD PTR _ArgList$[rsp]
	mov	QWORD PTR [rsp+32], rcx
	mov	r9, QWORD PTR _Locale$[rsp]
	mov	r8, QWORD PTR _Format$[rsp]
	mov	rdx, QWORD PTR _Stream$[rsp]
	mov	rcx, QWORD PTR [rax]
	call	__stdio_common_vfprintf
; Line 646
	add	rsp, 56					; 00000038H
	ret	0
_vfprintf_l ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT __local_stdio_printf_options
_TEXT	SEGMENT
__local_stdio_printf_options PROC			; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.26100.0\ucrt\corecrt_stdio_config.h
; Line 92
	lea	rax, OFFSET FLAT:?_OptionsStorage@?1??__local_stdio_printf_options@@9@9 ; __local_stdio_printf_options'::2'::_OptionsStorage
; Line 93
	ret	0
__local_stdio_printf_options ENDP
_TEXT	ENDS
END

#include <avr/io.h>
#include "asmMacros.s"  // Include macros to print log messages or a single register
.data
a: .byte 0

.text

.global updateGlobal
updateGlobal:
  // TODO: void updateGlobal(byte a)
  lds r22, (a)
  ADD r22, r24
  sts (a), r22
  ret


.global getGlobal
getGlobal:
  // TODO: uint8_t getGlobal()
  lds r24, (a)
  ret


.global cStringLength
cStringLength:
  // TODO: uint8_t cStringLength(const char aString[])
    clr r18
    movw r30, r24

    jmp length_loop

    length_loop:
      ld r22, Z+

      cpi r22, 0x00
      breq end_length

      inc r18
      jmp length_loop

    end_length:
      mov r24, r18
      clr r25
      ret


.global sumArrays
sumArrays:
  // TODO: void sumArrays(uint8_t *a, uint8_t *b, uint8_t *c, byte length) 
//callee saved               r24:25    r22:23    r20:21      r19
  push r28
  push r29

  movw r26, r24  // a/X
  movw r28, r22  // b/Y
  movw r30, r20  // c/Z


  cpi r18, 0
  breq end_sum
  jmp sum_loop

  sum_loop:
    ld  r19, X+
    ld  r20, Y+
    add r19, r20
    st  Z+, r19

    dec r18            
    brne sum_loop

  end_sum:
    pop r29
    pop r28
    ret

.global dot
dot:
  // TODO uint16_t dot(uint8_t *a, uint8_t *b, byte length)
    push r28
    push r29
    //set pointers
    movw r26, r24        
    movw r28, r22       

    //use for sum
    clr r22             
    clr r23
    clr r1

    cp r20, r1
    breq dot_done

dot_loop:
    ld  r19, X+         
    ld  r21, Y+         

    mul r19, r21
    //multiplied is always in r0r1
    add r22, r0         
    adc r23, r1
  //must put r1 back
    clr r1              

    dec r20
    brne dot_loop

dot_done:
    pop r29
    pop r28
    mov r24, r22
    mov r25, r23
    ret              



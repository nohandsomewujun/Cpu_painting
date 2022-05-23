# this code was written by DingCheng
.data 
paint_addr: .word 0x00000a14
data1: .word 0x00000029
data2: .word 0x00000000
addr: .word 0x0000ff00
.text 
lw t1, data1
lw t2, addr
sw t1, 0(t2)
lw t3, paint_addr
addi x10,x0,0x28
loopu1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopu1
addi x10,x0,0x14
loopu2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopu2
addi x10,x0,0x28
loopu3:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopu3
addi t3,t3,0x1e
addi x10,x0,0x14
loops1:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loops1
addi x10,x0,0x14
loops2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loops2
addi x10,x0,0x14
loops3:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loops3
addi x10,x0,0x14
loops4:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loops4
addi x10,x0,0x14
loops5:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loops5
addi t3,t3,0x50
addi x10,x0,0x28
loopst1:
addi t3,t3,-0x0100
addi x10,x10,-1
blt x0,x10,loopst1
addi x10,x0,0x14
loopt1:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopt1
addi x10,x0,0x28
addi t3,t3,-0x0a
loopt2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopt2
addi t3,t3,0x28
addi x10,x0,0x28
loopst2:
addi t3,t3,-0x0100
addi x10,x10,-1
blt x0,x10,loopst2
addi x10,x0,0x14
loopc1:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopc1
addi x10,x0,0x28
loopc2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopc2
addi x10,x0,0x14
loopc3:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopc3
addi x10,x0,0x32
loopst3:
addi t3,t3,0x0100
addi x10,x10,-1
blt x0,x10,loopst3
addi t3,t3,-0x8c
addi x10,x0,0x14
loopcc1:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopcc1
addi x10,x0,0x28
loopcc2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopcc2
addi x10,x0,0x14
loopcc3:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopcc3
addi x10,x0,0x28
loopst4:
addi t3,t3,-0x0100
addi x10,x10,-1
blt x0,x10,loopst4
addi t3,t3,0x14
addi x10,x0,0x0a
loopo1:
addi t3, t3, -0x0001
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopo1
addi x10,x0,0x14
loopo2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopo2
addi x10,x0,0x0a
loopo3:
addi t3, t3, 0x0001
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopo3
addi x10,x0,0x0a
loopo4:
addi t3, t3, 0x0001
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopo4
addi x10,x0,0x14
loopo5:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopo5
addi x10,x0,0x0a
loopo6:
addi t3, t3, -0x0100
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopo6
addi t3, t3, 0x46
addi x10,x0, 0x28
loopd1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopd1
addi x10,x0, 0x28
loopst5:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst5
addi x10,x0, 0x0a
loopd2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopd2
addi x10,x0, 0x0a
loopd3:
addi t3, t3, 0x0100
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopd3
addi x10,x0, 0x14
loopd4:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopd4
addi x10,x0, 0x0a
loopd5:
addi t3, t3, 0x0100
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopd5
addi x10,x0, 0x0a
loopd6:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopd6
addi x10,x0, 0x28
loopst6:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst6
addi t3, t3, 0x1e
addi x10,x0, 0x28
looph1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, looph1
addi x10,x0, 0x14
loopst7:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst7
addi x10,x0, 0x14
looph2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, looph2
addi x10,x0, 0x14
loopst8:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst8
addi x10,x0, 0x28
looph3:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, looph3
addi t3, t3, -0x50
addi t3, t3, -0x14
addi t3, t3, -0x01
addi x10, x0, 0x64
lw t1, data2
loopst9:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst9
addi x10,x0,0x0a
sw t3, 0(t0)
sw t1, 0(t2)
loopm1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopm1
addi x10, x0, 0x0a
loopst10:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst10
addi x10,x0,0x04
loopm2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopm2
addi x10,x0,0x0a
loopm3:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopm3
addi x10, x0, 0x0a
loopst11:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst11
addi x10,x0,0x04
loopm4:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopm4
addi x10,x0,0x0a
loopm5:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopm5
addi x10, x0, 0x0a
loopst12:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst12
addi t3, t3, 0x0b
addi x10,x0,0x06
loopa1:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopa1
addi x10,x0,0x0a
loopa2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopa2
addi x10,x0,0x06
loopa3:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopa3
addi x10,x0,0x0a
loopa4:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopa4
addi x10,x0,0x0a
loopst13:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10,loopst13
addi x10,x0,0x02
loopa5:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopa5
addi x10,x0,0x04
loopa6:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopa6
addi x10, x0, 0x06
loopst14:
addi t3, t3, -0x0100
addi x10,x10,-1
blt x0, x10,loopst14
addi t3, t3, 0x0b
addi x10,x0,0x06
loopdd1:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopdd1
addi x10,x0,0x0a
loopdd2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopdd2
addi x10,x0,0x06
loopdd3:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopdd3
addi x10,x0,0x12
loopdd4:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopdd4
addi x10,x0,0x12
loopst15:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10, loopst15
addi x10,x0,0x02
loopdd5:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopdd5
addi x10,x0,0x04
loopdd6:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopdd6
addi t3, t3, -0x0100
addi t3, t3, 0x05
addi x10,x0,0x0a
loope1:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loope1
addi x10,x0,0x05
loope2:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loope2
addi x10,x0,0x0a
loope3:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loope3
addi x10,x0,0x0a
loope4:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loope4
addi x10,x0,0x0a
loope5:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loope5
addi x10,x0,0x02
loope6:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loope6
addi x10,x0,0x09
loopst16:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10, loopst16
addi t3, t3, -0x20
addi x10,x0,0x0d
loopb1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopb1
addi x10,x0,0x06
loopst17:
addi t3, t3, -0x0100
addi x10, x10, -1
blt x0, x10, loopst17
addi x10,x0,0x06
loopb2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopb2
addi x10,x0,0x06
loopb3:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopb3
addi x10,x0,0x06
loopb4:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopb4
addi t3, t3, 0x0b
addi x10,x0,0x06
loopst18:
addi t3, t3, -0x0100
addi x10, x10, -1
blt x0, x10, loopst18
addi x10,x0,0x06
sw t3, 0(t0)
sw t1, 0(t2)
loopy1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopy1
addi x10,x0,0x06
loopy2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopy2
addi x10,x0,0x06
loopy3:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopy3
addi x10,x0,0x06
loopst19:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10, loopst19
addi x10,x0,0x06
loopy4:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopy4
addi x10,x0,0x06
loopy5:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopy5
addi x10,x0,0x0a
loopst20:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10, loopst20
addi t3, t3, -0x1d
addi x10,x0,0x0a
sw t3, 0(t0)
sw t1, 0(t2)
loopw1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopw1
addi x10,x0,0x05
loopw2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopw2
addi x10,x0,0x0a
loopw3:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopw3
addi x10,x0,0x0a
loopst21:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10, loopst21
addi x10,x0,0x05
loopw4:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopw4
addi x10,x0,0x0a
loopw5:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopw5
addi t3, t3, 0x0b
addi x10,x0,0x0a
sw t3, 0(t0)
sw t1, 0(t2)
loopj1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopj1
addi x10,x0,0x06
loopj2:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopj2
addi x10,x0,0x04
loopj3:
addi t3, t3, -0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopj3
addi t3, t3, 0x0b
addi x10,x0,0x04
loopst25:
addi t3, t3, 0x0100
addi x10, x10, -1
blt x0, x10, loopst25
sw t3, 0(t0)
sw t1, 0(t2)
addi t3, t3, 0x0001
sw t3, 0(t0)
sw t1, 0(t2)
addi t3, t3, 0x0100
sw t3, 0(t0)
sw t1, 0(t2)
addi t3, t3, -0x0001
sw t3, 0(t0)
sw t1, 0(t2)
addi x10,x0,0x0b
loopst22:
addi t3, t3, -0x0100
addi x10, x10, -1
blt x0, x10, loopst22
addi t3, t3, 0x05
addi x10,x0,0x0a
sw t3, 0(t0)
sw t1, 0(t2)
loopddd1:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopddd1
addi x10,x0,0x0a
loopst23:
addi t3, t3, -0x0100
addi x10, x10, -1
blt x0, x10, loopst23
addi x10,x0,0x05
loopddd2:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopddd2
addi x10,x0,0x03
loopddd3:
addi t3, t3, 0x0001
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopddd3
addi x10,x0,0x04
loopddd4:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopddd4
addi x10,x0,0x03
loopddd5:
addi t3, t3, -0x0001
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopddd5
addi x10,x0,0x05
loopddd6:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopddd6
addi t3, t3, 0x14
addi x10,x0,0x0a
loopst24:
addi t3, t3, -0x0100
addi x10, x10, -1
blt x0, x10, loopst24
addi x10,x0,0x07
sw t3, 0(t0)
sw t1, 0(t2)
loopccc1:
addi t3, t3, -0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopccc1
addi x10,x0,0x0a
loopccc2:
addi t3, t3, 0x0100
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopccc2
addi x10,x0,0x07
loopccc3:
addi t3, t3, 0x0001
addi x10,x10,-1
sw t3, 0(t0)
sw t1, 0(t2)
blt x0, x10, loopccc3
loopendless:
beq x0,x0,loopendless

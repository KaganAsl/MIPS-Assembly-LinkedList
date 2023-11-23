##############################################################
#Array
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Size
##############################################################

##############################################################
#Linked List Node
##############################################################
#   4 Bytes - Address of the Data
#   4 Bytes - Address of the Next Node
##############################################################

##############################################################
#Song
##############################################################
#   4 Bytes - Address of the Name (name itself is 64 bytes)
#   4 Bytes - Duration
##############################################################


.data
space: .asciiz " "
newLine: .asciiz "\n"
tab: .asciiz "\t"

name: .asciiz "Song name: "
duration: .asciiz "Song duration: "
emptyList: .asciiz "List is empty!\n"
noSong: .asciiz "\nSong not found!\n"
foundSong: .asciiz "\nSong found!\n"
songAdded: .asciiz "\nSong added.\n"

copmStr: .space 64

sReg: .word 3, 7, 1, 2, 9, 4, 6, 5
arrayOfPlaylistsAddress: .word 0 #the address of the array of playlists stored here!


p1s1: .asciiz "Summer Breeze"
p1s1_duration: .word 124

p1s2: .asciiz "Rhythm of the Night"
p1s2_duration: .word 225

p1s3: .asciiz "Golden Days"
p1s3_duration: .word 192

p1s4: .asciiz "Dancing in the Moonlight"
p1s4_duration: .word 186

p1s5: .asciiz "Island Paradise"
p1s5_duration: .word 213

p2s1: .asciiz "Chill Vibes"
p2s1_duration: .word 198

p2s2: .asciiz "Smooth Jazz Serenade"
p2s2_duration: .word 213

p2s3: .asciiz "Dreamscape"
p2s3_duration: .word 156

p2s4: .asciiz "Mellow Melodies"
p2s4_duration: .word 177

p2s5: .asciiz "Sunny Side Up"
p2s5_duration: .word 204

p3s1: .asciiz "Rock 'n Roll Classics"
p3s1_duration: .word 214

p3s2: .asciiz "Electric Dreams"
p3s2_duration: .word 199

p3s3: .asciiz "Highway to Heaven"
p3s3_duration: .word 235

p3s4: .asciiz "City Lights"
p3s4_duration: .word 186

p3s5: .asciiz "Rebel Yell"
p3s5_duration: .word 192

p4s1: .asciiz "Acoustic Serenity"
p4s1_duration: .word 176

p4s2: .asciiz "Gentle Guitar Grooves"
p4s2_duration: .word 205

p4s3: .asciiz "Woodland Whispers"
p4s3_duration: .word 153

p4s4: .asciiz "Folklore Fantasia"
p4s4_duration: .word 218

p4s5: .asciiz "Countryside Carols"
p4s5_duration: .word 242

p5s1: .asciiz "Hip-Hop Heatwave"
p5s1_duration: .word 193

p5s2: .asciiz "Urban Dreams"
p5s2_duration: .word 208

p5s3: .asciiz "Rap Revolution"
p5s3_duration: .word 177

p5s4: .asciiz "Street Symphony"
p5s4_duration: .word 205

p5s5: .asciiz "Groove City Groceries"
p5s5_duration: .word 221


search1: .asciiz "Highway to Heaven"
search2: .asciiz "Master of Puppets"

.text 
main:

	la $t0, sReg
	lw $s0, 0($t0)
	lw $s1, 4($t0)
	lw $s2, 8($t0)
	lw $s3, 12($t0)
	lw $s4, 16($t0)
	lw $s5, 20($t0)
	lw $s6, 24($t0)
	lw $s7, 28($t0)

mainStart:

#Write your instructions here!
	
mainTerminate:
	la $a0, newLine		
	li $v0, 4
	syscall
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	move $a0, $s1
	syscall
	move $a0, $s2
	syscall
	move $a0, $s3
	syscall
	move $a0, $s4
	syscall
	move $a0, $s5
	syscall
	move $a0, $s6
	syscall
	move $a0, $s7
	syscall
	
	li $v0, 10
	syscall


createArray:
	# $a0 is size of array
	mul $a0, $a0, 8 # Each element is 4+4 byte
	li $v0, 9 # $a0 = number of bytes to allocate
	syscall
	jr $ra # it stores address already in $v0 so we can just return

resizeArray:
	# $a0 is old address, $a1 is old size, $a2 is new size
	mul $a1, $a1, 8 # Each element is 4+4 byte
	mul $a2, $a2, 8 # Each element is 4+4 byte
	li $v0, 9
	syscall # Now I should copy from old area to new area
	addi $sp, $sp, -4 # I will use one s register so I should move stack
	sw $s0, 0($sp) # Saving s register in stack
	move $s0, $v0 # I should track which location I will place elements
	li $t1, 0 # I don't know where to stop but since I have old size I can track it
	RAL: # RAL = resizeArrayLoop
	lw $t2, 0($a0)
	sw $t2, 0($s0)
	addi $a0, $a0, 8
	addi $s0, $s0, 8
	addi $t1, $t1, 8
	bne $a1, $t1, RAL
	lw $s0, 0($sp) # Loading old s content to register
	addi $sp, $sp, 4 # I should restore stack
	jr $ra

putElementToArray:
	
	#Write your instructions here!
	
	jr $ra
	
removeElementFromArray:
	
	#Write your instructions here!
	
	jr $ra

createLinkedList:
	# $a0 is size. Since node is 4+4 byte it should 8
	mul $a0, $a0, 8
	li $v0, 9
	syscall
	jr $ra

putElementToLinkedList:
	# $a0 is address of linked list, $a1 is address of element
	addi $sp, $sp, -4 # I will use one s register so I should move stack
	sw $s0, 0($sp) # Saving s register in stack
	move $s0, $a0 # I should find the empty location
	PETLLL_Start: # putElementLinkedListLoop_Start
	lw $t1, 0($s0) # Looking current location
	beq $t1, $zero, PETLLL_End # If location is empty I can put element here
	addi $s0, $s0, 4 # Address of next element (which is next node)
	lw $s0, 0($s0)
	b PETLLL_Start
	PETLLL_End: # putElementLinkedListLoop_End
	sw $a1, 0($s0) # Putting element to linkedList
	lw $s0, 0($sp) # Loading old s content to register
	addi $sp, $sp, 4 # I should restore stack
	jr $ra

removeElementFromTheLinkedList:
	
	#Write your instructions here!
	
	jr $ra

traverseArray:
	
	#Write your instructions here!
	
	jr $ra

traverseLinkedList:
	
	#Write your instructions here!
	
	jr $ra

createSong:
	
	#Write your instructions here!
	
	jr $ra

isSong:
	
	#Write your instructions here!
	
	jr $ra

compareString:
	
	#Write your instructions here!
	
	jr $ra

printSong:
	
	#Write your instructions here!
	
	jr $ra

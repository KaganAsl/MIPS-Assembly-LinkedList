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
	## Initialize array of playlist by using with an initial size of 3.
	li $a0, 3 # Size
	jal createArray
	sw $v0, arrayOfPlaylistsAddress
	
	## Create 3 playlists as linked list and insert them into array of playlist.
	# 0
	jal createLinkedList
	lw $a0, arrayOfPlaylistsAddress # Address of array
	li $a1, 0 # Index
	move $a2, $v0 # Address of playlist
	jal putElementToArray
	# 1
	jal createLinkedList
	lw $a0, arrayOfPlaylistsAddress # Address of array
	li $a1, 1 # Index
	move $a2, $v0 # Address of playlist
	jal putElementToArray
	# 2
	jal createLinkedList
	lw $a0, arrayOfPlaylistsAddress # Address of array
	li $a1, 2 # Index
	move $a2, $v0 # Address of playlist
	jal putElementToArray
	
	## Resize array to size of 5.
	lw $a0, arrayOfPlaylistsAddress # Address of the array
	li $a1, 3 # Old size
	li $a2, 5 # New size
	jal resizeArray
	sw $v0, arrayOfPlaylistsAddress
	
	## Create 2 more playlists and insert them into available areas in array of playlist.
	# 3
	jal createLinkedList
	lw $a0, arrayOfPlaylistsAddress # Address of array
	li $a1, 3 # Index
	move $a2, $v0 # Address of playlist
	jal putElementToArray
	# 4
	jal createLinkedList
	lw $a0, arrayOfPlaylistsAddress # Address of array
	li $a1, 4 # Index
	move $a2, $v0 # Address of playlist
	jal putElementToArray
	
	## Create 4 songs for each playlist and insert them into playlists. Each song must have a name
	## and duration.
	# p1
	la $a0, p1s1 # Address of the song name
	lw $a1, p1s1_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 0($t0) # Address of playlist1
	move $a1, $v0 # Address of song1
	jal putElementToLinkedList
	
	la $a0, p1s2 # Address of the song name
	lw $a1, p1s2_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 0($t0) # Address of playlist1
	move $a1, $v0 # Address of song2
	jal putElementToLinkedList
	
	la $a0, p1s3 # Address of the song name
	lw $a1, p1s3_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 0($t0) # Address of playlist1
	move $a1, $v0 # Address of song3
	jal putElementToLinkedList
	
	la $a0, p1s4 # Address of the song name
	lw $a1, p1s4_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 0($t0) # Address of playlist1
	move $a1, $v0 # Address of song4
	jal putElementToLinkedList
	# p2
	la $a0, p2s1 # Address of the song name
	lw $a1, p2s1_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 8($t0) # Address of playlist2
	move $a1, $v0 # Address of song1
	jal putElementToLinkedList
	
	la $a0, p2s2 # Address of the song name
	lw $a1, p2s2_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 8($t0) # Address of playlist2
	move $a1, $v0 # Address of song2
	jal putElementToLinkedList
	
	la $a0, p2s3 # Address of the song name
	lw $a1, p2s3_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 8($t0) # Address of playlist2
	move $a1, $v0 # Address of song3
	jal putElementToLinkedList
	
	la $a0, p2s4 # Address of the song name
	lw $a1, p2s4_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 8($t0) # Address of playlist2
	move $a1, $v0 # Address of song4
	jal putElementToLinkedList
	# p3
	la $a0, p3s1 # Address of the song name
	lw $a1, p3s1_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 16($t0) # Address of playlist3
	move $a1, $v0 # Address of song1
	jal putElementToLinkedList
	
	la $a0, p3s2 # Address of the song name
	lw $a1, p3s2_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 16($t0) # Address of playlist3
	move $a1, $v0 # Address of song2
	jal putElementToLinkedList
	
	la $a0, p3s3 # Address of the song name
	lw $a1, p3s3_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 16($t0) # Address of playlist3
	move $a1, $v0 # Address of song3
	jal putElementToLinkedList
	
	la $a0, p3s4 # Address of the song name
	lw $a1, p3s4_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 16($t0) # Address of playlist3
	move $a1, $v0 # Address of song4
	jal putElementToLinkedList
	# p4
	la $a0, p4s1 # Address of the song name
	lw $a1, p4s1_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 24($t0) # Address of playlist4
	move $a1, $v0 # Address of song1
	jal putElementToLinkedList
	
	la $a0, p4s2 # Address of the song name
	lw $a1, p4s2_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 24($t0) # Address of playlist4
	move $a1, $v0 # Address of song2
	jal putElementToLinkedList
	
	la $a0, p4s3 # Address of the song name
	lw $a1, p4s3_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 24($t0) # Address of playlist4
	move $a1, $v0 # Address of song3
	jal putElementToLinkedList
	
	la $a0, p4s4 # Address of the song name
	lw $a1, p4s4_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 24($t0) # Address of playlist4
	move $a1, $v0 # Address of song4
	jal putElementToLinkedList
	# p5
	la $a0, p5s1 # Address of the song name
	lw $a1, p5s1_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 32($t0) # Address of playlist5
	move $a1, $v0 # Address of song1
	jal putElementToLinkedList
	
	la $a0, p5s2 # Address of the song name
	lw $a1, p5s2_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 32($t0) # Address of playlist5
	move $a1, $v0 # Address of song2
	jal putElementToLinkedList
	
	la $a0, p5s3 # Address of the song name
	lw $a1, p5s3_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 32($t0) # Address of playlist5
	move $a1, $v0 # Address of song3
	jal putElementToLinkedList
	
	la $a0, p5s4 # Address of the song name
	lw $a1, p5s4_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 32($t0) # Address of playlist5
	move $a1, $v0 # Address of song4
	jal putElementToLinkedList
	
	## Print all the songs
	la $a0, printSong # Address of printSong function
	lw $a1, arrayOfPlaylistsAddress # Address of array
	jal traverseArray
	
	## Remove the second song of each playlist.
	# p1
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 0($t0) # Address of the playlist1
	li $a1, 1 # Second song (index = 1)
	jal removeElementFromTheLinkedList
	# p2
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 8($t0) # Address of the playlist2
	li $a1, 1 # Second song (index = 1)
	jal removeElementFromTheLinkedList
	# p3
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 16($t0) # Address of the playlist3
	li $a1, 1 # Second song (index = 1)
	jal removeElementFromTheLinkedList
	# p4
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 24($t0) # Address of the playlist4
	li $a1, 1 # Second song (index = 1)
	jal removeElementFromTheLinkedList
	# p5
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 32($t0) # Address of the playlist5
	li $a1, 1 # Second song (index = 1)
	jal removeElementFromTheLinkedList
	
	## Print all the songs
	la $a0, printSong # Address of printSong function
	lw $a1, arrayOfPlaylistsAddress # Address of array
	jal traverseArray
	
	## Add 1 more song to each playlist.
	# p1
	la $a0, p1s5 # Address of the song name
	lw $a1, p1s5_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 0($t0) # Address of playlist1
	move $a1, $v0 # Address of song5
	# p2
	la $a0, p2s5 # Address of the song name
	lw $a1, p2s5_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 8($t0) # Address of playlist2
	move $a1, $v0 # Address of song5
	jal putElementToLinkedList
	# p3
	la $a0, p3s5 # Address of the song name
	lw $a1, p3s5_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 16($t0) # Address of playlist3
	move $a1, $v0 # Address of song5
	jal putElementToLinkedList
	# p4
	la $a0, p4s5 # Address of the song name
	lw $a1, p4s5_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 24($t0) # Address of playlist4
	move $a1, $v0 # Address of song5
	jal putElementToLinkedList
	# p5
	la $a0, p5s5 # Address of the song name
	lw $a1, p5s5_duration # Duration of the song
	jal createSong
	lw $t0, arrayOfPlaylistsAddress
	lw $a0, 32($t0) # Address of playlist5
	move $a1, $v0 # Address of song5
	jal putElementToLinkedList
	
	## Print all the songs
	la $a0, printSong # Address of printSong function
	lw $a1, arrayOfPlaylistsAddress # Address of array
	jal traverseArray
	
	## Remove the fourth playlist.
	lw $a0, arrayOfPlaylistsAddress # Address of array
	li $a1, 3 # Fourth playlist (index at 3)
	jal removeElementFromArray
	
	## Print all the songs
	la $a0, printSong # Address of printSong function
	lw $a1, arrayOfPlaylistsAddress # Address of array
	jal traverseArray
	
	## Search for given two songs, print the result.
	
	
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
	move $t0, $a0 # Holding size to put into array
	mul $a0, $a0, 8 # Each element is 4+4 byte
	li $v0, 9 # $a0 = number of bytes to allocate
	syscall
	move $t1, $v0 # Base address
	add $t2, $v0, $a0 # End of the address
	CAL: # create array loop
	sw $t0, 4($t1) # Putting size into areas
	addi $t1, $t1, 8
	bne $t1, $t2, CAL
	jr $ra # it stores address already in $v0 so we can just return

resizeArray:
	# $a0 is old address, $a1 is old size, $a2 is new size
	addi $sp, $sp, -12 # I will use two register so I am moving it
	sw $s0, 0($sp) # Saving s register in stack
	sw $s1, 4($sp) # Saving s register in stack
	sw $s2, 8($sp) # Saving s register in stack
	move $s0, $a0 # I am saving address
	move $s2, $a2 # Saving size
	mul $a1, $a1, 8 # Each element is 4+4 byte
	mul $a2, $a2, 8 # Each element is 4+4 byte
	move $a0, $a2 # Size of allocation
	li $v0, 9
	syscall # Now I should copy from old area to new area
	move $s1, $v0 # I should track which location I will place elements
	li $t1, 0 # I don't know where to stop but since I have old size I can track it
	RAL: # RAL = resizeArrayLoop
	lw $t2, 0($s0) # Since array sized change I can copy just first words
	sw $t2, 0($s1)
	addi $s0, $s0, 8
	addi $s1, $s1, 8
	addi $t1, $t1, 8
	bne $a1, $t1, RAL
	# Now I should put sizes into correct locations
	move $t1, $v0 # Base address
	add $t2, $v0, $a2 # End of the address
	RAL2: # resize array loop 2
	sw $s2, 4($t1) # Putting size into areas
	addi $t1, $t1, 8
	bne $t1, $t2, RAL2
	lw $s0, 0($sp) # Loading old s content to register
	lw $s1, 4($sp) # Loading old s content to register
	lw $s2, 8($sp) # Loading old s content to register
	addi $sp, $sp, 12 # I should restore stack
	jr $ra

putElementToArray:
	# $a0 is address of the array, $a1 is index, $a2 is address of the element
	mul $a1, $a1, 8 # Since every element is 8 byte
	add $a0, $a0, $a1 # Base address + index will give me the location
	sw $a2, 0($a0)
	jr $ra
	
removeElementFromArray:
	# $a0 is address of the array, $a1 is index
	mul $a1, $a1, 8 # Since every element is 8 byte
	add $a0, $a0, $a1 # Address of the element which will be deleted
	sw $zero, 0($a0) # Setting first word to zero
	sw $zero, 4($a0) # Setting second word to zero
	jr $ra

createLinkedList:
	# $a0 is size. Since node is 4+4 byte it should 8
	li $a0, 8
	li $v0, 9
	syscall
	jr $ra

putElementToLinkedList:
	# $a0 is address of linked list, $a1 is address of element
	addi $sp, $sp, -4 # I will use one s register so I should move stack
	sw $s0, 0($sp) # Saving s register in stack
	move $s0, $a0 # I should find the eligible location
	lw $t0, 0($s0) # First element of list
	bne $t0, $zero, PETLLL_Start # If first node empty I should put there
	sw $a1, 0($s0) # Putting element to linkedList
	lw $s0, 0($sp) # Loading old s content to register
	addi $sp, $sp, 4 # I should restore stack
	b PETLL_Exit
	PETLLL_Start: # ~putElementLinkedListLoop_Start~ If not I should create a new node
	# Then I should link node to linkedList last node
	lw $t1, 4($s0) # Looking current location (Offset is 4 since next node address is there)
	beq $t1, $zero, NewNodeCreation # If no next element I should link here
	move $s0, $t1
	b PETLLL_Start
	NewNodeCreation:
	addi $sp, $sp, -8 # I will create new node. So I will jump and link, I should save $ra.
	# Also I will use one s register
	sw $ra, 0($sp) # Saving $ra in stack
	sw $s1, 4($sp) # Saving $s1 in stack
	jal createLinkedList
	move $s1, $v0 # New node address
	sw $s1, 4($s0) # Saving new node address to last node
	sw $a1, 0($s1) # Saving element to new node
	lw $ra, 0($sp) # Loading old ra to register
	lw $s1, 4($sp) # Loading old s content to register
	addi $sp, $sp, 8 # I should restore stack
	lw $s0, 0($sp) # Load old s content to register
	addi $sp, $sp, 4 # I should restore stack
	PETLL_Exit: # ~putElementLinkedList_Exit~
	jr $ra

removeElementFromTheLinkedList:
	# $a0 is address of linkedList, $a1 index of item
	# If first element wanted to be deleted we can just change address of the linked list to firs node
	# next address
	bne $a1, $zero, DeleteElement # If index != 0
	lw $t0, 4($a0) # Address of next node
	move $v0, $a0 # We don't have return but this is the only way to remove first element for me
	b REFTLL_Exit
	DeleteElement: # This is the part where we will delete element whic is not first element
	# To delete element I need address of node which is going to be deleted, address of next node and
	# previous node. I can easily access next node I don't need to track it but I should track
	# previous node.
	addi $sp, $sp, -8 # I will use 2 s registers
	sw $s0, 0($sp) # previous node
	sw $s1, 4($sp) # current node
	li $s0, 0 # no prev node in the beginning
	move $s1, $a0 # at first current node is address of list
	li $t0, 0 # for tracking index ( while i != $a0 {i++} )
		DEL_Start: # DeleteElementLoop_Start
		move $s0, $s1 # previous node = current node
		lw $s1, 4($s1) # current node = current node next
		addi $t0, $t0, 1
		bne $t0, $a1, DEL_Start
		DEL_End: # DeleteElementLoop_End
	lw $t0, 4($s1) # Address of next node
	sw $t0, 4($s0) # previous node now points next node
	sw $zero, 4($s1) # current node now points nothing
	REFTLL_Exit: # ~removeElementFromTheLinkedList_Exit~
	lw $s0, 0($sp) # Restore $s0
	lw $s1, 4($sp) # Restore $s1
	addi $sp, $sp, 8 # Restore stack pointer
	jr $ra

traverseArray:
	# $a0 is address of the function, $a1 is the address of the array
	addi $sp, $sp -16 # I will use s registers to save address's
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	move $s0, $a0 # Address of the function
	move $s1, $a1 # Address of the array
	lw $s2, 4($s1) # Size of the array
	mul $s2, $s2, 8 # Size as bytes
	add $s2, $s1, $s2 # End of array
	TAL_Start: # Traverse array loop start
	lw $a1, 0($s1) # Address of the linked list
	move $a0, $s0 # Address of the function
	jal traverseLinkedList
	addi $s1, $s1, 8 # Since I should increment before loop I moved my $s1 to $t0
	bne $s1, $s2, TAL_Start
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	jr $ra

traverseLinkedList:
	beq $a1, $zero, TLLL_End # If no linked list it should pass
	# $a0 is address of the function, $a1 is the address of the linkled list
	addi $sp, $sp -12 # I will use s registers to save address's
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp) # Since I will call another function I should save $ra
	move $s0, $a0 # Address of the function
	move $s1, $a1 # Address of linked list
	TLLL_Start: # traverse linked list loop start
	lw $t0, 0($s1)
	move $a0, $t0 # Address of the song
	jalr $s0
	lw $t2, 4($s1)
	lw $s1, 4($s1) # If next node is not zero my next address should be next node. It's better to change
	# before going loop.
	bne $t2, $zero, TLLL_Start
	lw $s0, 0($sp) # Loading old contents
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	TLLL_End: # traverse linked list loop end
	jr $ra

createSong:
	# $a0 is address of name (4 byte), $a1 is duration of song (4 byte)
	addi $sp, $sp, -8 # I will save args in s registers
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	move $s0, $a0
	move $s1, $a1
	li $a0, 8 # 4+4 total 8 byte
	li $v0, 9
	syscall
	sw $s0, 0($v0)
	sw $s1, 4($v0)
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra

isSong:
	# $a0 is address of the song
	lw $a0, 0($a0) # Address of name
	la $a1, copmStr # Address of string
	li $a2, 64 # Comparison size
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal compareString
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

compareString:
	# $a0 is address of string1, $a1 is address of string2, $a2 is comparison size
	li $v0, 1
	move $t0, $zero
	CSL: # compare string loop
	beq $t0, 64, CSL_Exit
	lb $t1, 0($a0)
	lb $t2, 0($a1)
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	addi $t0, $t0, 1
	beq $t1, $t2, CSL
	li $v0, 0
	CSL_Exit: # To exit when size finished
	jr $ra

printSong:
	# $a0 is address of the song
	move $t0, $a0 # Holding address
	
	la $a0, name
	li $v0, 4
	syscall
	
	lw $a0, 0($t0)
	li $v0, 4
	syscall

	la $a0, tab # Printing tab
	li $v0, 4
	syscall
	
	la $a0, duration
	li $v0, 4
	syscall
	
	lw $a0, 4($t0) # Printing duration
	li $v0, 1
	syscall
	
	la $a0, newLine # Printing new line
	li $v0, 4
	syscall
	jr $ra

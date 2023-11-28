.data 
name: .asciiz "songsongsong"

.text
main:
	la $t0, name
	sw $t0, 40($t0)
def decipher(ciphertext, knownWord):
	#Write your code here
	#writing pseudo code
	#knownWord will be used
	#loop:
	#   shifting back the knowWord by one character(like knownWord - 1 to get previous character).
	#   check using find or substring method if shifted word is in ciphertext
	#   also track using variable "count" how much we are shifting
	#   if shifted word is in ciphertext stop loop other wise keep on shifting backward untill you find in ciphertext
	#Now we have "count" how much we need to shift, so simply we will shift right(like ciphertext + count)
	#in this way we will get our required original text and we will return it
	pass

ciphertext = input().strip()
knownWord = input().strip()

result = decipher(ciphertext, knownWord)
print(result)
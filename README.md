# Ceaser Cypher
This project implements Caesar Cipher encryption and decryption in Assembly language using the Irvine32 library. The program allows users to input a text file and a shift key, then either encrypts or decrypts the text based on the user's choice.

## Group Members
Radeel Ahmad - 221544
Muhammad Abdullah - 221546

Project Structure
Irvine32.inc and macros.inc are included for basic I/O operations.
BUFFER_SIZE is set to 100 bytes to handle input data.
data section contains necessary variables and prompts for user input.
code section contains the main procedure and encryption/decryption logic.
How to Run the Program
Compile and Link: Use an assembler like MASM to compile and link the program.

bash
Copy code
ml /c /coff yourfilename.asm
link /subsystem:console yourfilename.obj Irvine32.lib
Execute the Program: Run the compiled executable.

bash
Copy code
yourfilename.exe
Input Filename: Enter the name of the input file containing the plaintext or ciphertext.

Select Choice:

Enter 1 for encryption.
Enter 2 for decryption.
Enter Shift: Input the shift key (a numerical value) for the Caesar Cipher.

View Results: The program will display the ciphertext if you selected encryption or the plaintext if you selected decryption.

Detailed Description
Main Procedure
Displays the project title and group member names.
Prompts the user for the input filename.
Opens the specified file and reads its contents into a buffer.
Asks the user to choose between encryption and decryption.
Prompts the user to enter a shift key for the Caesar Cipher.
Encryption
Iterates over each character in the buffer.
Checks if the character is uppercase or lowercase.
Applies the Caesar Cipher shift to each letter.
Stores the encrypted characters in an array.
Displays the resulting ciphertext.
Decryption
Iterates over each character in the buffer.
Checks if the character is uppercase or lowercase.
Applies the reverse Caesar Cipher shift to each letter.
Stores the decrypted characters in an array.
Displays the resulting plaintext.
Example
bash
Copy code
***********************
Project Caesar Cipher
***********************

---------------------------------------------------
Group Members
Radeel Ahmad - 221544
Muhammad Abdullah - 221546
Abdul Moiz - 200976
-----------------------------------------------------

Enter an input filename: input.txt
Select Choice
1. For encryption
2. For decryption
Enter shift: 3

Plaintext is: HELLO
Ciphertext is: KHOOR
Notes
Ensure the input file exists in the same directory as the executable.
The shift key should be a positive integer.
The program only processes alphabetic characters; other characters are left unchanged.

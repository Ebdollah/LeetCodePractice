## Instructions

You are given a string of encrypted text (ciphertext). The encryption algorithm used to create the ciphertext simply shifts all the alphabetic characters in the original (unencrypted) string by the same amount. However, you don't know what this amount is.

Write the `decipher` function that takes the encrypted string as input and returns the original, unencrypted string.

For example, imagine that the original message was "hello" and we shifted each letter by two. The resulting ciphertext would be "jgnnq".

If the original message were "Coding tests are fun and challenging!" and we shifted each character by two, the resulting ciphertext would be "Eqfkpi vguvu ctg hwp cpf ejcnngpikpi!"

The `decipher` function takes two arguments: the ciphertext and a word that we know appeared in the original plain text. Using these clues, the function must output the original text.

We will follow the English alphabet for this question. Note that the last letter of the alphabet Z will be followed by A. Likewise, z will be followed by a.

If the word you are searching for in the original string does not appear there, return "Invalid".

### Example

**Input:**

- Ciphertext: "Eqfkpi vguvu ctg hwp!"
- Known word: "tests"

**Output:**

- "Coding tests are fun!"

**Explanation:**

- "tests" is a five-letter word. In the encrypted string, the only five-letter word is "vguvu". Therefore, the encrypted version of "tests" may be "vguvu". On comparing "tests" to "vguvu", it is clear that the encryption process has shifted every character in the plaintext by 2. So, the plaintext in this case is "Coding tests are fun!".

# Hangman Game
To guess a word with limited chances.

Dictionary would generate a word for Hangman
Game would call APIs to Hangman
TextClient would provide text interface for user to play

## How to play
1. go to the text_client directory
`cd text_client`
2. compile the application
`mix compile`
3. start the game
`mix run -e TextClient.start`
4. start guessing the word by input single letter each times
- it will display the word to be filled in, the number of turns left, and the letters already used
![image](https://github.com/ckyyyy/hangman/tree/master/image/text_client_interface.png)

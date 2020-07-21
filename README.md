# Hangman Game
To guess a word with limited chances.

Dictionary would generate a word for Hangman
Game would call APIs to Hangman
TextClient would provide text interface for user to play

## How to setup & play
1. checkout the game repository
2. go to the game directory  
`cd game`  
3. start the game server by giving the node name `game`  
`iex --sname game -S mix `  
4. you would see the terminal entered to iex environment and shows the `@node_name`
```
 iex(game@node_name)1>
```
5. update the `@#{node_name}` in text_client/lib/text_client/interact.ex:3 by the above value  
6. open a new terminate and go to the text_client directory  
`cd text_client`  
7. start the client interface by giving the node name `c1`  
`iex --sname c1 -S mix`  
8. start the game under iex environment  
`TextClient.start`  
9. start guessing the word by input single letter each times  
- it will display the word to be filled in, the number of turns left, and the letters already used  
![image](https://github.com/ckyyyy/hangman/blob/master/image/text_client_interface.png)

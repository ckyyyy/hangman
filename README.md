# Hangman Game
To guess a word with 7 chances.

Dictionary would generate a word for Hangman  
Game would call APIs to Hangman  
TextClient would provide text interface for user to play  
Gallows would provide web interface over http request for user to play  
SocketGallows would provide web interface over web socket for user to play  

## How to setup & play on Web Interface over Web Socket
1. checkout the hangman repository
2. go to the socket_gallows directory
`cd socket_gallows`  
3. start the phoenix server by following these command
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
4. go visit [`localhost:4000`](http://localhost:4000) from your browser
### Screen shot
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_socket_correct.png)  
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_socket_wrong.png)  
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_socket_won.png)  
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_socket_connection.png)  

## How to setup & play on Web Interface over Http Request
1. checkout the hangman repository  
2. go to the gallows directory  
`cd gallows`  
3. start the phoenix server by following these command
  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
4. go visit [`localhost:4000`](http://localhost:4000) from your browser  
### Screen shot
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_client_correct.png)  
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_client_wrong.png)  
![image](https://github.com/ckyyyy/hangman/blob/master/image/web_client_won.png)  

## How to setup & play on Command Line
1. checkout the hangman repository
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

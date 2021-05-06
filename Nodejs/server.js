const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(server);

app.get('/', (req, res) => {
  res.send("Soket.io running...")
});

io.on('connection', (socket) => {
  console.log('a user connected');
  io.emit("msg",{"msg": "xxxxx" })

  socket.on('disconnect', () => {
      console.log("user disconnected")
  })

  socket.on('msg', msg => {
      console.log("Message: " + msg)
      io.emit("msg", {"msg": msg})
  })

 
});

server.listen(3000, () => {
  console.log('listening on *:3000');
});
const express = require("express")
const app = express()
const server = require("http").createServer(app)
const io = require("socket.io")(server)
const port = 3000

connections = []

app.listen(port, () => {
    console.log("Server running...")
})

io.sockets.on('connections', (socket) => {
    connections.push(socket)
    console.log("Connect: %s socket are connected", connections.length)

    // Disconnect
    socket.on("disconnect", (data) => {
        connections.splice(connections.indexOf(socket), 1)
        console.log("iOS Client Port", {msg: "Hi iOS Client"})
    }) 

})

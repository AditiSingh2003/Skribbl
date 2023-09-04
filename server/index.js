const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
var http = require('http');
var server = http.createServer(app);
const mongoose = require('mongoose');
const Room = require('./models/Room');
var io = require('socket.io')(server);
const getWord = require('./api/getWord');

// middleWare
app.use(express.json());

// connect to db
const DB = 'mongodb+srv://skribbl:skribbl@cluster0.dvrc2aw.mongodb.net/?retryWrites=true&w=majority';

mongoose.connect(DB).then(() => {
    console.log('connection successful');
}).catch((err) => console.log('no connection'));

io.on('connection', (socket) => {
    console.log('a user connected');
    socket.on('create-gate', async({nickname, name, occupancy, maxRounds}) => {
        try{
            const existingRoom = await Room.findOne({name});
            if(existingRoom){
                socket.emit('notCorrectGame','Room with that name already exists');
                return;
            }
            let room = new Room();
            const word = getWord();
            room.word = word;
            room.name = name;
            room.occupancy = occupancy;
            room.maxRounds = maxRounds;
            
            let player = {
                socketID: socket.id,
                nickname,
                isPartyLeader: true,
            }
            room.player.push(player);
            room = await room.save();
            socket.join(room);
            io.to(name).emit('updateRoom', room);        }
        catch(err){
            console.log(err);
        }
    })
});


server.listen(port, () => {
    console.log(`listening to port ${port}`);
}
);
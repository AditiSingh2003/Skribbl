const mongoose = require('mongoose');
const {playerSchema} = require('./Player');
const roomSchema = new mongoose.Schema({
    word: {
        type: String,
        required: true
    },
    name: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    occupancy: {
        type: Number,
        default: 2,
        required: true,
    },
    maxRounds: {
        type: Number,
        default: 2,
        required: true,
    },
    currentRound: {
        type: Number,
        default: 1,
        required: true,
    },
    players:[
        playerSchema
    ],
    isJoin:{
        type: Boolean,
        default: true,
        required: true,
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0,
    }
})

const gameModel = mongoose.model('Room', roomSchema);
module.exports = gameModel;


// ROOMS
// ID
//     - Room Name
//     - word
//     - occupancy
//     - maxRounds
// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

/*
Previous config
// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

// const channels = require.context('./chat_room', true, /_channel\.js$/)
// channels.keys().forEach(channels)
require('./chat_room/room_channel.js');
// require('./consumer.js')
*/

const { Socket } = require('socket.io');
const WebSocket = require('ws');

let clients = [];

// Create a WebSocket server on port 5000
const server = new WebSocket.Server({ host: '0.0.0.0', port: 6000 });

console.log('WebSocket server started on ws://localhost:6000');

// Handle client connections
server.on('connection', (socket) => {
    console.log('New client connected');

    // Add the new client to the clients array
    clients.push(socket);


    // Listen for incoming messages from the clients
    socket.on('message', (message) => {
        console.log(`Received: ${message}`);

        // Broadcast the message to all other clients
        clients.forEach(client => {
            // if (client !== ws) {
                client.send(message); // Send message to other clients
            // }
        });
    });

    // Handle client disconnection
    socket.on('close', () => {
        console.log('Client disconnected');
    });

    // Handle errors
    socket.on('error', (error) => {
        console.error('WebSocket error:', error);
    });
});

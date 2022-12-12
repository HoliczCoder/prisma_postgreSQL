import { Express } from "express";
import * as server from 'http'
const express = require('express')
// import { Server as io } from "socket.io";
import io = require('socket.io');

export default class Server {
    public app: any;
    public port: number;
    public server: any;
    public socketIo: io.Server;

    constructor(port: number) {
        this.app = express();
        this.port = port;
        this.server = server.createServer(this.app);
        this.socketIo = io(this.server)
    }
    static init(port: number) {
        return new Server(port)
    }
    start(callback: (message: string) => void) {
        this.server.listen(this.port, callback);
    }

}
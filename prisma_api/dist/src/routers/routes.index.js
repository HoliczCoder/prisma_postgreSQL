"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
exports.__esModule = true;
var express_1 = require("express");
var users_routes_1 = __importDefault(require("./users.routes"));
var login_routes_1 = __importDefault(require("./login.routes"));
var routes = (0, express_1.Router)();
// routes.use("/", (req: Request, res: Response) => {
//   res.send("hell world");
// });
routes.use("/user", users_routes_1["default"]);
routes.use("/login", login_routes_1["default"]);
exports["default"] = routes;
//# sourceMappingURL=routes.index.js.map
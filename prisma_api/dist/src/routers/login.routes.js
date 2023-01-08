"use strict";
exports.__esModule = true;
var express_1 = require("express");
var login_controller_1 = require("../controllers/login.controller");
var router = (0, express_1.Router)();
router.post("/", login_controller_1.login);
exports["default"] = router;
//# sourceMappingURL=login.routes.js.map
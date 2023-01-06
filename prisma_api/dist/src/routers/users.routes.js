"use strict";
exports.__esModule = true;
var express_1 = require("express");
var user_controllers_1 = require("../controllers/user.controllers");
var router = (0, express_1.Router)();
router.post("/email-resgister", user_controllers_1.emailResigter);
router.post("/", user_controllers_1.createUser);
exports["default"] = router;
//# sourceMappingURL=users.routes.js.map
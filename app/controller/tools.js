const { Controller } = require("egg");

class ToolsController extends Controller{
    async captchaCreate () {
        //
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }
    }

    async captchaVerify () {
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }

    }
}
module.exports = ToolsController

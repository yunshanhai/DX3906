const { Controller } = require("egg");

class UserController extends Controller{
    async resetPassword () {
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }
    }

    async update () {
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }
    }
}
module.exports = UserController

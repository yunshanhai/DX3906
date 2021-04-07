const { Controller } = require('egg')

class AuthController extends Controller {
    async regist () {
        //
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }
    }

    async login () {
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }

    }

    async logout () {
        const {ctx} = this
        ctx.body = {
            path: ctx.URL
        }
    }
}
module.exports = AuthController

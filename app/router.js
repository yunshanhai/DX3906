module.exports = app => {
    const { router, controller } = app
    router.get('/user/:id', controller.user.info)

    router.resources('users', '/users', controller.users);

    // 注册
    router.post('/api/regist', controller.auth.regist)
    // 登录
    router.post('/api/login', controller.auth.login)
    // 退出
    router.post('/api/logout', controller.auth.logout)

    // 刷新验证码
    router.get('/api/captcha-create', controller.tools.captchaCreate)
    // 验证验证码
    router.post('/api/captch-verify', controller.tools.captchaVerify)

    // 修改密码
    router.post('/api/reset-password', controller.auth.resetPassword)
    // 修改用户信息
    router.post('/api/update-userinfo', controller.user.update)
}
module.exports = app => {
    const { router, controller } = app
    router.get('/user/:id', controller.user.info)

    router.resources('users', '/users', controller.users);
}
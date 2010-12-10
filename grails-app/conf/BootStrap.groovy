import jqac.*

class BootStrap {

    def init = { servletContext ->
        def admin= new Role(name: "admin").save()
        new Role(name: "guest").save()
        new Role(name: "role1").save()
        new Role(name: "role2").save()
        new Role(name: "role3").save()
        new Role(name: "powerUser").save()

        new User(name: "admin", pwd: "pwd", role: admin).save()
		new User(name: "ofice", pwd: "pwd", role: admin).save()
		new User(name: "ddd", pwd: "pwd", role: admin).save()
		new User(name: "adf", pwd: "pwd", role: admin).save()
    }

    def destroy = {
    }
}

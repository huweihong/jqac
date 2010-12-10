package jqac

class Role {

    String name

    static hasMany= [users:User]

    static constraints = {
    }
}

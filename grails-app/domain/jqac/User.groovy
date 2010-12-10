package jqac

class User {

    String name
    String pwd

    static belongsTo= [role:Role]

    static constraints = {
    }
}

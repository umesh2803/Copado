public class mapidpass {
    Map<ID, Contact> m = new Map<ID, Contact>([SELECT Id, LastName FROM Contact]);

}
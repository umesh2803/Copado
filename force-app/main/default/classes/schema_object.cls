public class schema_object {
    
    public static void test(){
        map<string,schema.SObjectType> sobjects=schema.getGlobalDescribe();
        system.debug('SCHEMA>>>'+sobjects);
        set<string> obj=sobjects.keyset();
        system.debug('obj>>>'+obj);
        list<string> objlist=new list<string>();
        objlist.addAll(obj);
        system.debug('list>>>'+objlist);
        objlist.sort();
        system.debug('sort>>>'+objlist);
        list<selectoption> ss=new list<selectoption>();
        for(string ob:objlist){
            selectoption s=new selectoption(ob,ob);
            system.debug('Option>>'+s);
        }
    }
    
}
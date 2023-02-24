public class JASon_parser_2 {
    public string astring ;
    public list<integer> marks;
    
    public JASon_parser_2(){
        //ages=new list<integer>();
        astring='{"Name":"umesh","Age":26,"Marks":[10,20,30,40]}';
        System.JSONParser jp=Json.createParser(astring);
        while(jp.nextToken()!=null){
            if(jp.getText()=='marks'){
            //if(jp.getCurrentToken()==system.JSONToken.VALUE_NUMBER_INT){
                jp.nextToken();
                marks=(list<integer>)jp.readValueAs(list<integer>.class);//it will give only list value of marks.
                //integer a=(integer)jp.getIntegerValue();//this will give very integer in json string.
               // ages.add(a);
                
               
            
            } 
        }system.debug('value='+marks);
        
        
        
    }

}
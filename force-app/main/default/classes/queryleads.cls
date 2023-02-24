public class queryleads {
    public void main(){  
    
        list<lead> l1=[select id,name from lead where lastname='xyz'];
       
        for(lead l:l1)
        {
            
           l.ownerid='00G5g000000vWb7EAE';
           
            
        }update l1;
     
        
        }
}








//select Id from Group where Name = 'My Group' and Type = 'Queue'
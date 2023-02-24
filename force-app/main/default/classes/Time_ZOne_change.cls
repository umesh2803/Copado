public class Time_ZOne_change {
    
public void timezoe(){
                    Datetime dt = System.now();
                    String dtPST = dt.format('yyyy-MM-dd HH:mm:ss', 'PST');
                     
                    System.debug('dt-' + dt);
                    System.debug('dtPST-' + dtPST);}

}
public class SecondController {
    public Account getAccount(){
        Account acc= [select id,name ,(select id, firstName,lastName from contacts limit 5)
                      from Account where name='GenePoint'];                   
        
        return acc;   
    }    
}
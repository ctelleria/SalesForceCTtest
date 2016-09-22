public class MyClassDataBaseBulk {
    public void insertListAccount(){
        Integer numberIterator ,numberIteratorError;
        String name ;
        String phone;
        Integer numberEmployes;
        Account acct = new Account();
        List<Account> listAccount= new   List<Account>();        
        For(numberIterator=0;numberIterator<25;numberIterator++){
            name='Acme'+numberIterator;
            phone ='(415)555-1212';
            numberEmployes= Math.round(Math.random() *500);
            acct = new Account(Name=name, Phone=phone,NumberOfEmployees=numberEmployes);
            listAccount.add(acct);
            
        }
        Database.SaveResult[] srList = Database.insert(  listAccount, false);
        For(Database.SaveResult sr :srList){
            if(!sr.isSuccess()) {
                System.debug('There is a error:::');
                for (DataBase.Error err : sr.getErrors()){
                    System.debug(err.getMessage()); 
                }
                
            }
        }          
        
    }
    public void updateListAccount(){
        Integer numberIterator ,numberIteratorError;
        String name ;
        String phone;
        Integer numberEmployes;
        List<Account> listUpd = [select name from account  where name like 'Acme%' ];
        List<Account> listAccount= new   List<Account>();   
        //Account acct = new Account ();
       For( Account accountLi : listUpd){      
                   numberEmployes= Math.round(Math.random() *500);
            //accountLi.NumberOfEmployees(numberEmployes);
       //     accountLi.NumberOfEmployees(150);
       //               listAccount.add(accountLi);            
        }
        try{
            update(listAccount);  
        } catch (DmlException e) { 
            System.debug('A DML exception has occurred: ' +  e.getMessage()); 
        }   
    }
}
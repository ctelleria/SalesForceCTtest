@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource {
    @HttpGet
    global static List<Account> getRecord(){
        RestRequest request = RestContext.request;
        List<Account> accountList =new List<Account>();
        accountList= [SELECT name,AccountNumber,Phone,	Website
                      FROM Account];
       // system.debug('ACCOUNT:::::::'+accountList);
        return accountList;        
    }
    @HttpPost
    global Static ID setRecord( String name, String numbe, String phone,String web){
        Account accData= new Account(
        Name=name,
        AccountNumber= numbe,
        Phone = phone,
       Website= web);
        
        try{
            insert accData;
           
        }catch(DmlException e) {
            return  null;
        }
         return  accData.Id;
    }
  
    @HttpDelete
    global static void deleteRecord(){
        RestRequest request = RestContext.request;         
        String caseId = request.requestURI.substring(  request.requestURI.lastIndexOf('/')+1); 
        List<Account> accList=[SELECT  ID FROM ACCOUNT WHERE name= 'Acme20'];
                 delete  accList;
    }
    @HttpPut
    global static  List<Account>  updateRecord(String nameAccount, String numberAccount, String phoneAccount,String webUrl){
        List<Account> accountList =  [SELECT  ID, name, accountNumber, phone FROM ACCOUNT WHERE name= :nameAccount ];
        Integer num=0;
        for(num=0;num<accountList.size(); num++){
            accountList[num].AccountNumber=numberAccount;
            accountList[num].Phone=phoneAccount;
            accountList[num].Website=webUrl;
        }
        try{
            update accountList;
        }catch(DmlException e) {
            return  null;
        }
        system.debug('List of account edited::::'+accountList);
        return  accountList;
    }
}
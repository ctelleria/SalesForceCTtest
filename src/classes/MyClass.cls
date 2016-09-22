public class MyClass {
    class MyBook{
        String title;
        String autor;
        String typeBook;
        MyBook(String title,String autor,String typeBook){
            this.title= title;
            this.autor= autor;
            this.typeBook= typeBook;
        }
    }
    
    public void printList(){
        List<MyBook> storis= insertMyBook();
        Integer iter;
        for(iter=0;iter<storis.size();iter++){
            system.debug('----------------------------------------');
            system.debug('------------------Title----------------------'+storis[iter].title);
            system.debug('------------------Autor----------------------'+storis[iter].autor);
            system.debug('------------------Type Book----------------------'+storis[iter].typeBook);
            system.debug('----------------------------------------');  
        }
        
    }
    public    List<MyBook> insertMyBook(){
        List<MyBook> book = new List<MyBook>();
        MyBook bookP= New MyBook('PINOCHO','HERMANOS GRREN' ,'Child history' );
        MyBook bookC= New MyBook('CENICIENTA','HERMANOS GRREN' ,'Child history' );
        MyBook bookPe= New MyBook('PEPEGRILLO','HERMANOS GRREN' ,'Child history' );
        MyBook bookB= New MyBook('BLANCA NIEVES','HERMANOS GRREN' ,'Child history' );
        book.add(bookP);
        book.add(bookC);
        book.add(bookPe);
        book.add(bookB);
        return book;
    }
    public void insertAccount(){
        Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
        insert(acct);
    }
    public void insertInvoice(){        
        Invoice__c inv= new Invoice__c(Status__c='Open');
        insert inv;
        String name= inv.id;
        Merchandise__c merch =[ select  id from Merchandise__c where  name='E-Reader'];
        String  idMercha=merch.Id;
        Line_Item__c invdet = new Line_Item__c(  Invoice__c=name, 	Merchandise__c=  idMercha, Quantity__c	=2,  Unit_Price__c=584);
        insert   invdet;
    }
    public void insertCandidateUser(){
        Integer numberIterator =0;
        Integer sizeArray =50;
        String city, country,education, email, firstName, lastName, phone,snn, street;
        Integer value,years;
        Boolean checked=false;
        For(numberIterator=0;numberIterator<sizeArray;numberIterator++){
            city='City'+numberIterator;
            country='Country'+numberIterator;
            value =Math.Round(Math.random() *5);
            firstName='Name'+numberIterator;
            lastName='Last Name '+numberIterator;
             years=value;
            if (value<2){
                checked=true;
                education='BA/BS';
                phone='(591)1554788'+numberIterator;
                email='email'+numberIterator+'@yahoo.com';
                snn='0';
                street='street pasaje '+numberIterator;
               
            }else{
                checked=false;
                education='HS Diploma';
                email='email'+numberIterator+'@gmail.com';
                phone='(591)784568'+numberIterator;
                snn='1';
                street='street av.'+numberIterator;
            }                       
            CandidateUser__c cand= new CandidateUser__c(City__c=city,	Country__c=country,Currently_Employed__c=checked,Education__c=education,Email__c=email,First_Name__c= firstName, LastName__c=lastName,Phone__c=phone,Snn__c=snn,Street__c=street,Year_of_epirence__c=years);
           insert  cand;
        }       
        
    }
    public void deleteInvoiceDet(){
      Invoice__c inv=  [select name from invoice__c where name='INV-0031'];
        system.debug('*****'+inv.Id);
       Line_Item__c invDet=[ select name , Invoice__c from Line_Item__c  where Invoice__c  = :inv.id] ;
          system.debug('***999**'+invDet);
         delete (invDet);
        delete (inv);
    }
      public void updatenvoiceDet(){
      Invoice__c inv=  [select name from invoice__c where name='INV-0027'];
        system.debug('*****claudia'+inv.Id);
          inv.Status__c='CLosed';
              update(inv);
    }
}
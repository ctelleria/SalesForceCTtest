public class CandidateUserObject {
    public String city {set;get;}
    public String country {set;get;}
    public Boolean currentlyEmployed {set;get;}
    public String education {set;get;}
    public String email {set;get;}
    public String firstName {set;get;}
    public String lastName {set;get;}
    public String phone {set;get;}
    public String snn {set;get;}
    public Boolean us_citycen {set;get;}
    public Boolean visaRequired {set;get;}
    public Integer yearsExpirenci {set;get;}  
    //Information for pagination
    Boolean disablePrevious,disableNext;
    Integer pageNumber,total_size;
    Soql_offset sql ;    
    public String nameTable='CandidateUser__c';
    String fields =' name,id,	Email__c,First_Name__c,	LastName__c,Year_of_epirence__c,City__c,Country__c ,Currently_Employed__c ,Education__c ,Phone__c,Snn__c,US_Citizen__c,VisaRequiered__c';
    
    
    public CandidateUserObject(){
      sql = new Soql_offset(nameTable);       
        sql.getNumberData(nameTable);
        sql.End();
        sql.Beginning();
        sql.Next();
        sql.Previous();
        sql.getDisablePrevious();
        sql.getDisableNext();
        sql.getPageNumber();
        sql.getTotalPages();
        sql.getListSize( );
    }
    public List<CandidateUser__c> getNumbers( ){
        List<CandidateUser__c>  listCand= new List<CandidateUser__c>  ();
        Soql_offset sql = new Soql_offset();
        
        List<SObject> listOb=sql.getData(nameTable,fields);
        Integer size=listOb.size();
        Integer initialN;        
        for (initialN=0;initialN<size;initialN++){
            CandidateUser__c  candidateUser= new CandidateUser__c();
            candidateUser.City__c=(String)(listOb.get(initialN).get('City__c'));
            candidateUser.Country__c=(String)listOb.get(initialN).get('Country__c');
            candidateUser.Currently_Employed__c=(Boolean)listOb.get(initialN).get('Currently_Employed__c');
            candidateUser.Education__c=(String)listOb.get(initialN).get('Education__c');
            candidateUser.Email__c=(String)listOb.get(initialN).get('Email__c');
            candidateUser.First_Name__c=(String)listOb.get(initialN).get('First_Name__c');
            candidateUser.LastName__c=(String)listOb.get(initialN).get('LastName__c');
            candidateUser.Phone__c=(String)listOb.get(initialN).get('Phone__c');
            candidateUser.Snn__c=(String)listOb.get(initialN).get('Snn__c');
            candidateUser.US_Citizen__c=(Boolean)listOb.get(initialN).get('US_Citizen__c');
            candidateUser.VisaRequiered__c=(Boolean)listOb.get(initialN).get('VisaRequiered__c');
            candidateUser.Year_of_epirence__c=Integer.valueOf((listOb.get(initialN).get('Year_of_epirence__c')));
            listCand.add(candidateUser);
        } 
        system.debug('-----------'+listCand);
        system.debug('-----------'+listCand.size());
        return listCand;
    }  
      public Integer getNumberData(){
         return   sql.getNumberData(nameTable);
      }
     public PageReference Beginning() { 
         return sql.Beginning();
      }
    public PageReference Previous() { 
         
       return sql.Previous();
     }
      public PageReference Next() {
        return sql.Next();
     }
   public PageReference End() {
         return sql.End();
   }
     public Boolean getDisablePrevious() { 
       return sql.getDisablePrevious();
    }
    
     public Boolean getDisableNext() { 
       return sql.getDisableNext();
     }
    
      public Integer getTotal_size() {
       total_size=sql.getTotal_size();
        return sql.getTotal_size();
    }
    
     public Integer getPageNumber() {
       return sql.getPageNumber();
     }
    public Integer getTotalPages() {
       return sql.getTotalPages();
    }
     public Integer getListSize() {
         return sql.getListSize( );
     }
}
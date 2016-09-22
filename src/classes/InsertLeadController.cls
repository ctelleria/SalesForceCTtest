public class InsertLeadController {
    
    public String statusOptions{get;set;}
    public String company{get;set;}
    public String mobile{get;set;}
    public String firstName{get;set;}
    public String lastName  {get;set;}
    public Lead le= new Lead();
    public List< SelectOption> getItems(){
        List<SelectOption> options = new   List<SelectOption> ();
        options.add(new SelectOption ('Open - Not Contacted','Open - Not Contacted'));
        options.add(new SelectOption ('Working - Contacted','Working - Contacted'));
        options.add(new SelectOption ('Closed - Converted','Closed - Converted'));
        options.add(new SelectOption ('Closed - Not Converted','Closed - Not Converted'));
        return options;
    }
    public PageReference submitLead(){
        system.debug('*************************');
        le.Status=statusOptions;
        le.FirstName=firstName;
        le.Company= company;
        le.MobilePhone= mobile;
        le.LastName= lastName;
        insert le;
        return null;
    }
}
public with sharing class Soql_offset {
    //keeps track of the offset
    private integer counter=0;
    //sets the page size or number of rows
    private integer list_size=10; 
    //used to show user the total size of the li
    public integer total_size; 
    public String nameTable;
    public String fieldTable;
      public Soql_offset(){
      
    }
    public Soql_offset(String nombreTabla){
        nameTable=nombreTabla;
        total_size=getNumberData(nombreTabla );
    }
    public Integer getListSize( ){      
        return list_size;        
    }
    public Integer getNumberData(String nombreTabla ){
        List<SObject> s = Database.query(' select id ' + ' from '+nombreTabla );
        // total_size=getNumberData(  nameTable);
        system.debug('--------------'+s.size());
        return s.size();        
    }
    public  List<SObject>  getData(String nombreTabla, String fieldTable){
        System.debug('****************************'+nombreTabla);
        System.debug('****************************'+fieldTable);
        String query ='Select '+fieldTable+' from  '+nombreTabla+' order by id  limit :list_size    offset :counter';
        System.debug('****************************'+query);
        List<SObject>   result=Database.query(query);
        System.debug('****************************'+result);   
        
        return result;
        
    }
    public void setTotalSize(String nombreTabla){
        System.debug('****************************'+nombreTabla);
        total_size= getNumberData(nombreTabla);
         System.debug('*************total***************'+total_size);
    }    
    public PageReference Beginning() { //user clicked beginning
        counter = 0;
        return null;
    }
    public PageReference Previous() { //user clicked previous button
        counter -= list_size;
        return null;
    }
    public PageReference Next() { //user clicked next button
        counter += list_size;
        return null;
    }
    public PageReference End() { //user clicked end
        counter = total_size - math.mod(total_size, list_size);
        system.debug(' counter end '+ counter);
        return null;
    }
    public Boolean getDisablePrevious() { 
        //this will disable the previous and beginning buttons
        Boolean result;
        if (counter>0){
            result=false;
        }else{
            result= true;
        }
        system.debug('********** getDisablePrevious **********'+result);
        if (counter>0) return false; else return true;
    }
    
    public Boolean getDisableNext() { //this will disable the next and end buttons
        Boolean result;
        if (counter + list_size < total_size){
            result=false;
        }else{
            result= true;
        }
        system.debug('********************counter***************** '+counter);
        system.debug('********************list_size***************** '+list_size);
          system.debug('********************sum***************** '+(list_size+counter));
        system.debug('********************counter***************** '+total_size);
        system.debug('********************getDisableNext***************** '+result);
        if (counter + list_size < total_size) return false; else return true;
    }
    
    public Integer getTotal_size() {
        return total_size;
    }
    
    public Integer getPageNumber() {
        return counter/list_size + 1;
    }
    public Integer getTotalPages() {
        if (math.mod(total_size, list_size) > 0) {
            return total_size/list_size + 1;
        } else {
            return (total_size/list_size);
        }
    }
    
    
}
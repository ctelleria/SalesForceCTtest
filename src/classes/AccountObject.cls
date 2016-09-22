global class AccountObject {
    String name;
    String accountNumber; 
    String phone;
    String website;
 global   AccountObject(String nameAccount, String numb, String phoneNumber, String web){
        name =nameAccount;
        accountNumber=numb;
        phone=phoneNumber;
        website=web;
    }
    public String  getName(){
        return name;
    }
    public String getAccountNumber(){
        return accountNumber;
    }
    public String getPhone(){
        return phone;
    }
    public String getWebsite(){
        return website;
    }
}
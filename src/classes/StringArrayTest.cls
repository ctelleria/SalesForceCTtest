public class StringArrayTest {
    public static List<String> generateStringArray(Integer sizeArray){
        List<String> listNew = new  List<String>();
        Integer numberIterator=0;
        String value;
        For(numberIterator=0;numberIterator<sizeArray;numberIterator++){
            value='test'+numberIterator;
           system.debug('------------------------------');
            listNew.add(value);
            system.debug('------------------------------');
        }
        printString(listNew);
        return listNew;
    }
    
    public static void printString(List<String>  viewList){
        Integer iterator;
        for (iterator=0; iterator<viewList.size();iterator++){
            system.debug('---------TEST:::---------------------'+viewList[iterator]);
        }
        
    }
}
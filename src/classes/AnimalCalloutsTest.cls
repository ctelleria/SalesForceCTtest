@isTest
private class AnimalCalloutsTest {
    @isTest static  void testGetCAllout(){
        StaticResourceCalloutMock mock = new  StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //associate the callout with the mock response
        Test.setMock(HttpCalloutMock.class, mock);
        HttpResponse result=AnimalsWebService.makeGetCallout();
        System.assertNotEquals(null, result,'The result of the call the method is null');
        System.assertEquals(200, result.getStatusCode(),'the callout is not 200');
        System.assertEquals('application/json;charset=UTF-8',result.getHeader('Content-Type'),  'The content type value is not expected.');
        Map<String ,Object> results= ( Map<String ,Object> )JSON.deserializeUntyped(result.getBody());
        List<Object> animals= ( List<Object> )results.get('animals');
        system.assertEquals(4, animals.size(), 'the array should only contain 3 items');
    }
    @isTest static void testPostCallout(){
        Test.setMock(HttpCalloutMock.class, new AnimalsPostCallout());
        HttpResponse result=AnimalsWebService.makePostCallout();
        String contentType = result.getHeader('Content-Type');
        System.debug('--****--'+ contentType);  
        System.assert(contentType == 'application/json');
        String actualValue= result.getBody();
        System.debug('----'+ result.getBody());        
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}'; 
        System.assertEquals(actualValue, expectedValue); 
        System.assertEquals(200, result.getStatusCode()); 
    }
}
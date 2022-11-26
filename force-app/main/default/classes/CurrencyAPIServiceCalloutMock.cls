public with sharing class CurrencyAPIServiceCalloutMock implements HttpCalloutMock {
    
   public HTTPResponse respond(HTTPRequest request) {
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json;charset=UTF-8');
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'Test'];
        String responseBody = sr.body.toString();
        res.setBody(responseBody);
        res.setStatusCode(200);
        return res;
    }
}

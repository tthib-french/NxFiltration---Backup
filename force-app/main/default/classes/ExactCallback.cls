@RestResource(urlMapping='/exactcallback/*')
global class ExactCallback {

  @HttpGet
  global static String doGet() {
    System.debug('asdfasdf');
    // RestRequest req = RestContext.request;
    // RestResponse res = RestContext.response;
    // String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
    // Account result = [SELECT Name FROM Account WHERE Id = :accountId];
    // RestContext.response.addHeader('Content-Type', 'text/plain');
    // // String name = RestContext.request.params.get('name');
    // RestContext.response.responseBody = Blob.valueOf('Hello ');
    return 'hello';
  }
}
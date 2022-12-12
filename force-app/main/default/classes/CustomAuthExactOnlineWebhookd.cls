public with sharing class CustomAuthExactOnlineWebhookd {
    String clientId = '7bf726bc-304a-46c5-b82f-a09dc71cee08';
    String clientSecret = 'O1tj1oPQQx7G';
    String redirect_uri = 'https://flow-fun-1421.scratch.lightning.force.com/';
    String response_type = 'code';
    String tokenEndpoint = 'https://start.exactonline.nl/api/oauth2/auth?client_id=7bf726bc-304a-46c5-b82f-a09dc71cee08&redirect_uri=https://nxfiltrationbv--partcopy.sandbox.lightning.force.com/services/apexrest/exactcallback&response_type=code&force_login=1';
    String apiEndpoint = 'https://start.exactonline.nl/api/oauth2/auth';
    String username = 'teamgold@welisa.nl';
    String password = 'dsfesf324324FEWFEW#@';
    String grandType = 'authorization_code';
  
    public  void getAccessToken() {
      // Set up the HTTP request
      HttpRequest req = new HttpRequest();
      req.setEndpoint(tokenEndpoint);
      req.setMethod('POST');
      req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
      req.setHeader('Content-Length', '0');

    //   String requestBody = 'grant_type=password'
    //               + '&client_id=' + clientId
    //               + '&client_secret=' + clientSecret
    //               + '&username=' + username
    //               + '&password=' + password
    //               + '&grant_type=' + grandType;
      // Set the request body
    //   String requestBody = 'grant_type=password'
    //                     + '&client_id=' + clientId
    //                     + '&client_secret=' + clientSecret
    //                     + '&redirect_uri=' + redirect_uri
    //                     + '&response_type=' + response_type
    //                     + '&force_login=0';
    //   req.setBody(requestBody);
  
      // Send the HTTP request and get the response
      Http http = new Http();
      HttpResponse res = http.send(req);
      System.debug(res.getBody());
      System.debug(res.getHeaderKeys());
      List<String> keys = res.getHeaderKeys();

      for (String key :keys) {
        System.debug(key + ': ' + res.getHeader(key));
      }

    //   HttpResponse ress = new Http().send(req);
    //     while (res.getStatusCode() == 302) {
    //     req.setEndpoint(res.getHeader('Location'));
    //     ress = new Http().send(req);
    //     System.debug(ress);
    //     }
    //   System.debug(res.getBodyDocument());
      System.debug(res.getBody());


      System.debug(res);
  
      // Parse the JSON response to get the access token
    //   Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
    //   String accessToken = (String) responseBody.get('access_token');
    //   System.debug('Access token: ' + accessToken);
    }
  
    public void getDataFromApi() {
      String accessToken = 'myAccessToken';
  
      // Set up the HTTP request
      HttpRequest req = new HttpRequest();
      req.setEndpoint(apiEndpoint);
      req.setMethod('GET');
  
      // Set the authorization header
      req.setHeader('Authorization', 'Bearer ' + accessToken);
  
      // Send the HTTP request and get the response
      Http http = new Http();
      HttpResponse res = http.send(req);
  
      // Parse the JSON response to get the data
      Map<String, Object> responseBody = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
      System.debug('API response: ' + responseBody);
    }
}
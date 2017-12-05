/**
 * Created by klukawski on 11/30/17.
 */

public with sharing class Microservice {
    private String address;
    private Http http;

    public Microservice(String address){
        this.address = address;
        http = new Http();
    }

    private Microservice(){}

    private TokenDTO retrieveToken(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(address+'/token');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            return TokenDTO.parse(res.getBody());
        }
        throw new TokenDTO.InvalidTokenException();
    }

    public void testConnection(){
        Auth.JWT jwt = new Auth.JWT();
        Map<String, String> claims = new Map<String, String>();
        jwt.setIss('panel');
        Auth.JWS jws = new Auth.JWS(jwt, 'Master');
        System.debug(jws.getCompactSerialization());

        HttpRequest req = new HttpRequest();
        req.setEndpoint(address+'/test');
        req.setMethod('GET');
        req.setHeader('Authorization', 'BEARER '+jws.getCompactSerialization());
        HttpResponse res = http.send(req);
        System.debug(res.getBody());
    }
}
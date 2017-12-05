/**
 * Created by klukawski on 11/30/17.
 */

public with sharing class TokenDTO {
    public class InvalidTokenException extends Exception{

    }
	public String token;

	public static TokenDTO parse(String json) {
		return (TokenDTO) System.JSON.deserialize(json, TokenDTO.class);
	}
}
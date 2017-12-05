/**
 * Created by klukawski on 11/30/17.
 */

@IsTest
public class TokenDTO_Test {
	static testMethod void testParse() {
		String json = '{\"token\":\"9bmpXuqjfmTmo54wP0+hdw==\"}';
		TokenDTO obj = TokenDTO.parse(json);
		System.assert(obj != null);
        System.assert(obj.token == '9bmpXuqjfmTmo54wP0+hdw==');
	}
}
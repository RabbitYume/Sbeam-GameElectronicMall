package game.common.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000116685851";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDIcBWzuGqDhuTCWeuLvnMK6XmL8GOTVU0ZnMcFbmlChKdDsMtlOqG2PrCMPfLJm3H8E6K/57Z0iB89pygIvXzmJqQsMTJR8wyPw9IKttyS76LNkU5vagSvlfn1VtWgWG/GrB4PO6miydAOIqzNm6yQjp0KgNnAqQVs4jVoYJ05cNx+96M72JTEzEWHsV6F7xQ7n7gBEqn1IcKpUxf/dZaPm1bDgiOOLVyvzI5z3G8Zq8LSj4uO848RJeg1Cpqh8aSYRddJpSIhmr+7JP0oW7KOYLKdk6gfpWTUFDanGDrHzN3mnaGQrgonD8BqQy90DP7ESvdlfXddh8NWJnc1E1TtAgMBAAECggEAGEr1ZmXYiv5jZWbOlI5NlSn88Ef/WZECGjOVL4RVP5miSCL6U9eKV/M7JJQxg9vSMdITbJzh0TfaSXej84M7yw0t4qlHxwTlJdt+7ouBKlHe8nlE/13jGYDc3a5bj+aIDZU4w3HgunkpPT1YokbW4GJYiDhbq+0QWkUEYhUrmRVsoi23bGnMiXHVyTKGSXzZFh1xCGl2Zi/5WxjOzMwVJETrvlDuMtEe/CGjnbHzcoOgkw1sFo8Fijozz9UztOgVWO5QCer12qFXOU1dxvYw/sILu4ZpA6D64mnXN1WFLe4vzPWXN4rU3wIiU0LLttc4vDkbG/pxorMk3MO9haCG4QKBgQD0gvAdO4UtmcpCRi4UdBY7xb/FD6HR8XRhk7a4MTubThkLypkqA4/s3cmOqiwsnkoL3v9rMI5S+Ikqg3Wwl8fStUILEiqBXq8nZFsUUxClyyz6jla7eaCs2EhMrDm31YlDvtIhDEtk+1UXgNYViaFTL/5vf0JLDm29n0/uYnNvxQKBgQDR2wPUcauVu2J39VgeRO06eNKqZiDbHqQ1YPVdFCsoZfVqrbqUabr/bW9lRKiVnpL1bDsZoiN7rVw/i7YgJla9Y2V8miJLPLW2OjbX1mwWLNl1zykut88zcVCNBih2Q/yTo+5N6Y13DiylMVObv5bnYhcdmnECTyQXkoctBVo7CQKBgQDJOcVAWY6V474n4rfjj1II6QqUs/O54tujvjwexC3I93H3WUnJ4Nqe1jwdlAD8y1wm/uP3pCNNN0szWLMPnSoPR6rNj6q5g2Hkqlumk2HdACPJJEFO0p8gAHMn3ok1uJ/Zx/4IwqR9u7XgvN/zI6xH2PStb+7v9DTuXGEcz5su/QKBgEzSRyGjBvQGJ7LQLpTOGKW6CyxzvH1aRzR/LPMI6g+c221U8aNY3SqaLhg9PRWgeh27pBrrHuAsg0OD6oT0Y/Zqh4FIj1tJex+dSexTQzgO7QBSeLnwcbpcNeeaJH++vZxye08sOywlFTTXzMqMJTrIzrt4iPwWapjye+eAORq5AoGAaAW0Lgwx4uEZyyGjrqGk+tR+VUqTls5kpRVo9KbKmh5T08RoeHV//CDjBvcESE8EsekSSKjsB3Ll3hlvo/MrPPy/NO4/96U8dpMMU1AGukZaeu+4lCEIPmGSPu8u2ojX8V7Bd6Wl5XhKWjgH2sPiOro2Y3Yems/NrybYo5KliW8=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkJBISO4C3IGscrrtMQRZYL2YmeC5LMynUjcAny/Xd9v1KQMC5p67hiwT5cqr734xAHu3pFxzFJjrTu6zCyLxD9xtgJ/MEGhYoSqV4uZ189KU3kKVWB68xH45GjLT7l50QIKjS9h4ldjX/KboSG5GISt35P276005X+xSoFMVBqToBeCcD7mQwrb9PvOh6iZhOTUCcUz590Qg7SKUKiCXQ8UJKRt0xoje0D/ekXFLyK2OrFk84X9FZO6W8mr4bm67wtEG1g1bHKnfEIvnpAFuIkRtjhQlKDk5O2aWN/S6nmu0p+LwuNF6Xg4RMCZ2g1zufOjeVxUQHIToDCsMopTeOwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    //内网穿透netapp里面的URL地址
	public static String notify_url = "http://localhost:8080/game/alipayNotifyNotice";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//内网穿透netapp里面的URL地址 http://*****.netapp.cc/game/...
	public static String return_url = "http://localhost:8080/game/alipayReturnNotice";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


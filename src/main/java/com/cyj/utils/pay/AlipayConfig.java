package com.cyj.utils.pay;

import java.io.FileWriter;
import java.io.IOException;

/**
 * 类名：AlipayConfig
 * 功能：基础配置类
 * 详细：设置帐户有关信息及返回路径
 * 修改日期：2017-04-05
 * 说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 * @author amini
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016091600525693";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCRjowDhloDHdoECQ1TXRWrscegPhKXJsS8GI1ZiJ2cQItDu+F9HiUdancY5hEb61luBLaxacLlSKFcz71llhm+W6h2Qrzc1v1wArcSZtug4DCtlX3slYfjyaC2KmVBXUM2M+dd2Eus/lzmEX4wCzF4AmWtVV4emHEZZFyLeRx4R767N35wI15tgDKcGweHrrMt1LkoeK5hzXH8MGA6GNKvP3zgBTTI4F+4vvcsm+wtvsl/DO3MTnJ0pmxa5Q+T1WyykLSEtEWIN/GNEYLRpXp5znPwOIL32vVqPKaBosYRHBHbsSo9ybq78jCt6IzDudF/fcUtTJKIviSvbxOF7ZZdAgMBAAECggEBAIwwTonWjDsUNTZNwZfYv1ZuE2YyYpVRsYm32+uvuJ0VTQwfmD15GyYJtEs2yqOpOKjNwWd+BUfve/p32mJM/t5oSQgdnujT56RJ+SiwCDgZtMh6gp2qJwcs2qyYiI071dAOjXfFKp2jHrY3guGi5jI/nM4kulGdYNCj6L4sF09/0K7eQfD8kXKFbHl9E0FijKUm0WZVpfpAYh+9vWhWqEpRg2HjlMxcH0RNd8xN/nON5Y3CASrG5kdwXVEwWhgR7QUHPEwHGEu2AKkqEUc7z+/MJNAkBdGT61ZQj9L1cE/2x+6NIL2awEtW8GAoLcw3To7qyI3IUwpyzgBNIlYQkAECgYEA5aHGqsPlVfp5uUBxjJ5WLUEEg47xXZpIwrMkkYx8+Qk6pRkqWE7FfA9xHNWtWkyZBWgtyvimhJqx2AjZjC8j6Lo5fWeweOyr3LVb471pXaorc3XSOARSBERdQeRGKx9+sdfPDcntxk9VPbCAgv7sfITzymQ/LJRc2Qz6mxmxycECgYEAokVP7FW/OUCC4GlQyRzpXuTArG3T1qcL3riYszQ+ZxwVRRtAY/jmmpdG/Xi3oJqPPm3L7qqcgPgJ2EGi/a5cvt0yzitXn13G0tm+FHbAycRL5dKNZg22P9IdBApsntDAIBMcxtDu2NICpxoedWg+uE2xZ2FZ1ogNGI1BQnv9m50CgYAKolpL8DR/rdDTRmu7wl1lTRyDZyxAVHPIKHmqD+J9ufKwUKEIY+V7YE+xsSeNBf0UJgXw32D+xRc1VPuWJVy5W15sM1AV2Yf/+ZoeytfFUasfdrZch76wmeXjtkmVl6jLXZ4mGlLbmzLsX28kIeAbyCBuIARY8Sn3l0VHx4HXQQKBgE6LUjZJAvhJW5AYKfxOvD8sZn6P4pvh24MAwxjqztHF7B25JR++2JA3bSs/hVJ9vZwwNSfe+UYLyWgdzTERdt8D3pWgsRb4o0ZoEvOAz6xaEYq6saqWNIMLxvOvwAfXb0eXOLSbaSEV9ibAI8IcpU88fARYQM3wqLYbmVz++zCZAoGATeldCrawHByDLMfTOAwgEo87ZmLxIBR8wf4uDMucIC6p4f9SnfWkZ/SWggNgrNjAxXnrn2vUP67URZzW5tNg5SM3u/t9i7+Z/jlPCtp5EqxnsaM/M/DfNCUP8SKGhEA+OE/GoqUSDRoDe2owRJUAE9V4nsmfjxKUT9mZ963lLuM=";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzP3PqJccDryxqEfr+SOUS2rHVbLxKumEYTqAgKPsSg+kaS+8Zm0SvnvmwOlXZMG8D9FqvVX0P/ZNjqZ3gYvzy04G1vYauIdLUT7BGnntX9RCbHn1i1UjCUGfjWxZXp8atkPUuoa4R7yt7c5+wm4exY/pvlFqgPzi0hbikaadwPjIav8phypAPa050lktdVEfnoX3p2J95PfT5xoKHIsZBBhhYHTkqX/4905IqOVEe7xG2lD26uWzSYNLlAImx5IxnNV6fYhfVvm7VqsSlyBkM9GhItiAKpQoKQf5uTrhn6ovSBideVcFZ9VmD4EMESoxg3+r/4cArEeudhxeOUbLfQIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/notify_url";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/return_url";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关https://openapi.alipay.com/gateway.do
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "G:\\paySystem\test";


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

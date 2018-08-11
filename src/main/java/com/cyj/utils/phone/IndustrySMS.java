package com.cyj.utils.phone;

/**
 * Created by amini on 2018/7/3.
 */
import com.cyj.utils.phone.common.Config;
import com.cyj.utils.phone.common.HttpUtil;

import java.net.URLEncoder;


/**
 * 验证码通知短信接口
 *
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
    private static String operation = "/industrySMS/sendSMS";

    private static String accountSid = Config.ACCOUNT_SID;
//    private static String random=(int)((Math.random()*9+1)*100000)+"";
//    private static String smsContent = "【TOLD】尊敬的用户，您好，您正在注册TOLD博客网站，验证码为："+random+"，请于3分钟内正确输入，若非本人操作请忽略此短信";

    /**
     * 验证码通知短信
     */
    public static String execute(String to)
    {
        String random=(int)((Math.random()*9+1)*100000)+"";
        String smsContent = "【TOLD】尊敬的用户，您好，您正在注册TOLD博客网站，验证码为："+random+"，请于3分钟内正确输入，若非本人操作请忽略此短信";

        String tmpSmsContent = null;
        try{
            tmpSmsContent = URLEncoder.encode(smsContent, "UTF-8");
        }catch(Exception e){

        }
        String url = Config.BASE_URL + operation;
        String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent
                + HttpUtil.createCommonParam();

        // 提交请求
        String result = HttpUtil.post(url, body);
        System.out.println("result:" + System.lineSeparator() + result);
        return random;
    }
}

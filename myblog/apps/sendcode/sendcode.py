import json
import requests

from apps.sendcode import randomCode


def send_single_sms(ColaKey,code, tomail):
    # 发送单条短信

    url = "https://luckycola.com.cn/tools/customMail"
    content = "您的邮箱验证码是{}，有效时间120s，请及时验证".format(code)

    res = requests.post(url, data={
        "ColaKey": ColaKey,
        "fromTitle": "sinead·django·blog",
        "smtpCode": "BCBNCQKXQFKDJLQG",
        "subject": "验证码",
        "smtpEmail": "15834584868@163.com",
        "smtpCodeType": "163",
        "tomail": tomail,
        "isTextContent": True,
        "content": content
    })
    re_json = res.json()  # 直接获取 JSON 数据
    return re_json

if __name__ == "__main__":
    res = send_single_sms("1BRWwDq4k1d0kV1725788622978fmFyEozPeN",'1234', "15834584868@163.com")

    code = res.get("code")
    msg = res.get("msg")
    if code == 0:
        print("发送成功")
    else:
        print("发送失败: {}".format(msg))
    print(json.dumps(res, indent=4))
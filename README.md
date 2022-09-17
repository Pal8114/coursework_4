# ICP开发入门课程第四课课程作业

作业1：把 Message 类型改为一个记录结构，并在里面添加 time 字段，记录发消息的时间。
要求：
1）提交主程序源代码并部署应用到主网提交链接
2）正确定义了新的 Message 的记录结构
3）在 post 方法中，创建了新 Message 并记录了当前时间

- [主网链接地址](https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=gmoyf-dyaaa-aaaam-aarra-cai)

作业2：修改 posts 和 timeline 方法，仅返回指定时间之后的内容：
import Time "mo:base/Time";
func posts(since: Time.Time): async [Message] {…};
func timeline(since: Time.Time): async [Message] {…};
要求：
1）提交主程序源码并部署应用到主网提交链接
2）正确实现了按指定时间筛选消息的功能

- [主网链接地址](https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.ic0.app/?id=gmoyf-dyaaa-aaaam-aarra-cai)

思考题：如果关注对象很多，运行 timeline 就会比较慢，有什么办法可以提高效率？
要求：
1）用文字描述一个解决方案 （1分）
2）可行性评估（1分）


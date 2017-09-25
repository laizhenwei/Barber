# Barber

> 向巨丑的苹果 “致敬”

> 我开了家理发店，客户只针对 iPhone X，由于资金有限，目前店内只有一个专业理发师 Tony。

如果您的 iPhone X 需要理发，请按照以下步骤预约：

1. 为了更好的让理发师设计你的头发，请在 info.plist 里面添加以下这句话

    ```xml
    <key>UIViewControllerBasedStatusBarAppearance</key>
    <false/>
    ```
    
2. 在合适的时间过来找 Tony 剪发

    ![20170925150631019389659.png](http://storage.laizw.cn/images/upi/20170925150631019389659.png-watermark)

3. 选择合适的发型
    
    ```objc
    // 小弟不才，暂时只会两种手法：平头和圆脸
    HairTypeFlatTop,    // 平头
    HairTypeRoundFace,  // 圆脸
    ```

    **平头**
    
    ![20170925150630900976032.png](http://storage.laizw.cn/images/upi/20170925150630900976032.png-500x500)
    
    **圆脸**
    
    ![20170925150630905072718.png](http://storage.laizw.cn/images/upi/20170925150630905072718.png-500x500)

4. 如果你觉得不好看，我们的专业发型师 Tony 会帮你将头发恢复如初

    ```objc
    [Barber.Tony cut:HairTypeDefault];
    ```
    
    ![20170925150630878477345.png](http://storage.laizw.cn/images/upi/20170925150630878477345.png-500x500)



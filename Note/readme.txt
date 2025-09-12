1. RUN SQL 1+2
2. ติดตั้ง folder จาก BAY.Dotcom.CMS.145 เป็น XXX.CMS.145
3. copy ConnectionStrings.config จากของเดิมมาทับ
4. แก้ไข web.config
	- copy <appSettings> จากของเดิมมาทับ
	- copy connectionStrings จากของเดิมมาทับ
	- แก้ไข 
	<authentication mode="Forms">
      		<forms loginUrl="CMSPages/logon.aspx" defaultUrl="Default.aspx" name="AAA.BBB.ASPXFORMSAUTH" timeout="60000" slidingExpiration="true" />
    	</authentication>
	โดย AAA คือ รหัสของเว็บ เช่น Lotuss, KSP, GCS, Krungsri, KEPT, KCC, Auto
	BBB คือ environment ถ้าเครื่องของ developer ใส่เป็น DEV, เครื่อง AWS ใส่ AWS, เครื่อง UAT ใส่ UAT, เครื่อง PROD ใส่ PROD
	- copy media จากตัวเดิมมาทับ
5. แก้ไข CMS มาที่ path ใหม่
6. แก้ไข permissions
.global _start

_start:
@----------<起始线>---------1、使能时钟CCGR0-CCGR6---------<起始线>------------------------
@	使能时钟：
@	gpio2，uart2，gpt2 serial，gpt2 bus，CPU debug，can2_serial，
@	can2，can1，can1，enet，dcp，asrcapbhdma hclk，aips_tz2，aips_tz1
	ldr r0,	= 0x20C4068		@CCGRO
	ldr r1,	=0XFFFFFFFF		@赋值为使能
	str r1,	[r0]			@把r1设置为0xffffffff

@	使能时钟：
@	csu，gpio1，uart4，gpt serial，gpt bus，sim_s，adc1，epit2，
@	epit1，uart3，adc2，ecspi4，ecspi3，ecspi2，ecspi1，
	ldr r0,	= 0x20C406C		@CCGR1
	str r1,	[r0]			@把r1设置为0xffffffff

@	使能时钟：
@	pxp，lcd，gpio3，ipsync_ip2apb_tzasc1_ipg，ipmux3，ipmux2，ipmux1，
@	iomux_ipt_clk_io，OCOTP_CTRL，i2c3_serial，i2c2_serial，i2c1_serial，
@	iomuxc_snvs，csi，esai
	ldr r0,	= 0x20C4070		@CCGR2
	str r1,	[r0]			@把r1设置为0xffffffff

@	使能时钟：
@	iomuxc_snvs_gpr，ocram，mmdc_core_ipg_clk_p1，mmdc_core_ipg_clk_p0，
@	mmdc_core_aclk_fast_core_p0，a7 clkdiv patch，wdog1，qspi，gpio4，
@ 	lcdif1 pix，CA7 CCM DAP，uart6，epdc，uart5
	ldr r0,	= 0x20C4074		@CCGR3
	str r1,	[r0]			@把r1设置为0xffffffff

@	使能时钟：
@	rawnand_u_gpmi_input_apb，rawnand_u_gpmi_bch_input_gpmi_io，rawnand_u_gpmi_bch_input_bch，
@	rawnand_u_bch_input_apb，pwm4,pwm3,pwm2,pwm1,pl301_mx6qper2_main,pl301_mx6qper1_bch
@	tsc_dig,cxapbsyncbridge slave,sim_cpu,iomuxc gpr,iomuxc,
	ldr r0,	= 0x20C4078		@CCGR4
	str r1,	[r0]			@把r1设置为0xffffffff

@	使能时钟：
@	sai2,sai1,uart7,uart1,sai3,snvs_lp,snvs_hp,sim_main,spdif / audio,spba,wdog2,kpp
@	sdma,snvs dryice,sctr,rom
	ldr r0,	= 0x20C407C		@CCGR5
	str r1,	[r0]			@把r1设置为0xffffffff

@	使能时钟：
@	pwm7，pwm6，pwm5,i2c4,anadig,wdog3,aips_tz3,pwm8,uart8,[uart debug req gate],
@	eim_slow,ipmux4,usdhc2,usdhc1,usboh3,
	ldr r0,	= 0x20C4080		@CCGR6
	str r1,	[r0]			@把r1设置为0xffffffff
@----------<结束线>---------1、使能时钟CCGR0-CCGR6-----<结束线>------------------------


@------<起始线>-----2、设置GPIO1_IO03复用为GPIO1_IO03-----<起始线>----------------------
	ldr r0, =0X020E0068	/* 将寄存器SW_MUX_GPIO1_IO03_BASE加载到r0中 */
	ldr r1, =0X5		/* 设置寄存器SW_MUX_GPIO1_IO03_BASE的MUX_MODE为5 */
	str r1,[r0]

@------<起始线>-----3、配置GPIO1_IO03的IO属性-----<起始线>----------------------
	/* 	
	 *bit 16:0 HYS关闭
	 *bit [15:14]: 00 默认下拉
     *bit [13]: 0 kepper功能
     *bit [12]: 1 pull/keeper使能
     *bit [11]: 0 关闭开路输出
     *bit [7:6]: 10 速度100Mhz
     *bit [5:3]: 110 R0/6驱动能力
     *bit [0]: 0 低转换率
     */
    ldr r0, =0X020E02F4	/*寄存器SW_PAD_GPIO1_IO03_BASE */
    ldr r1, =0X10B0
    str r1,[r0]

@------<起始线>-----4、设置GPIO1_IO03为输出-----<起始线>----------------------
    ldr r0, =0X0209C004	/*寄存器GPIO1_GDIR */
    ldr r1, =0X0000008		
    str r1,[r0]

@------<起始线>-----5、打开LED0-----<起始线>----------------------
	/* 
	 * 设置GPIO1_IO03输出低电平
	 */
	ldr r0, =0X0209C000	/*寄存器GPIO1_DR */
   	ldr r1, =0		
  	str r1,[r0]

/*
 * 描述：	loop死循环
 */
loop:
	b loop 		


	

	
	



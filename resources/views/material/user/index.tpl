





{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
						
						<div class="col-lg-6 col-md-6">
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">系统中最新公告</p>
										
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">All-in-One</p>
										<p>这里为您提供了自动化地配置文件生成，包含了所有 Shadowsocks 服务器的信息，方便您在诸多的服务器中快速添加，快速切换。</p>
										<p><a href="/downloads/client/ShadowsocksR-3.9.6.2e-win.7z"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows 下载这个</a>（版本：3.9.6.2），解压，然后下载<a href="/user/getpcconf">这个</a>，放到程序目录下，运行程序，选择一个合适的服务器，更新一下PAC为绕过国内IP，然后开启系统代理即可上网。</p>
										<p><a href="https://github.com/qinyuhang/ShadowsocksX-NG/releases"><i class="icon icon-lg">laptop_mac</i>&nbsp;Mac OS X下载这个</a>，安装，然后下载<a href="/user/getpcconf">这个</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
										<p><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS 强烈推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>安装，然后在Safari浏览器中点击 <a id="android_add" href="{$android_add}">一键添加节点</a> ，然后点击打开，批量添加完服务器，点击连接就可以上网了。<font color="blue"></font></p>
										<p><a href="/downloads/client/ssr_3.2.7.8.apk"><i class="icon icon-lg">android</i>&nbsp;Android下载这个</a>（最新版本：3.2.7.8）安装，然后在手机上默认浏览器中点击<a id="android_add" href="{$android_add}">这个</a>，然后点击确定，批量添加完服务器，然后路由选择绕过大陆，右上角开启就可以上网了。</p>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">帐号使用情况</p>
										<dl class="dl-horizontal">
											{if $user->enable==1}
										    <dt>状态：<font color="blue">正常</font></dt>	
										    {else}
										    <dt>状态：<font color="red">禁用，无法使用任何节点，如有疑问请联系管理员</font></dt>	
										    {/if}
												
											<dt>余额：<font color="blue">{$user->money} 元</font></dt>	

										
										
											{if $user->class==0}
											<dt>等级：<font color="blue">免费用户</font></dt>
											{/if}
											{if $user->class==1}
											<dt>等级：<font color="blue">老用户</font></dt>
											{/if}
											{if $user->class==2}
											<dt>等级：<font color="blue">无限期用户</font></dt>
											{/if}
											
											{if $user->class==3}
											<dt>等级：<font color="blue">保号套餐会员</font></dt>
											{/if}
											{if $user->class==4}
											<dt>等级：<font color="blue">月付普通VIP会员</font></dt>
											{/if}
											
											{if $user->class==5}
											<dt>等级：<font color="blue">月付高级VIP会员</font></dt>
											{/if}										
											{if $user->class==6}
											<dt>等级：<font color="blue">月付高级VIP会员</font></dt>
											{/if}
											
											{if $user->class==7}
											<dt>等级：<font color="blue">特殊端口会员</font></dt>
											{/if}											
											{if $user->class==8}
											<dt>等级：<font color="blue">特殊端口会员</font></dt>
											{/if}
											
											{if $user->class==10}
											<dt>等级：<font color="blue">钻石VIP会员</font></dt>
											{/if}
											
											
											{if $user->class==99}
											<dt>等级：<font color="blue">超级管理员</font></dt>
											{/if}
											
											{if $user->node_speedlimit!=0}
											<dt>速度限制：<font color="red">你已被限速至 {$user->node_speedlimit}Mbps ，大概是因为你长时间高速下载，如有疑问请联系管理员</font></dt>
											{else}
											<dt>速度限制：<font color="blue">不限速</font></dt>																														
											{/if}
											
											
											<dt>等级到期时间：<font color="blue">{$user->class_expire}</font></dt>											

											<dt>账号过期时间：<font color="blue">{$user->expire_in}</font></dt>
										</dl>
									</div>
									
								</div>
							</div>
						
							
							
							
						</div>
						
						<div class="col-lg-6 col-md-6">
							
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
									
										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>
										
										<script src="//cdn.bootcss.com/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100}, legendText:"已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>
										
									</div>
									
								</div>
							</div>
						
						
					
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">签到获取流量</p>
											<p>流量不会重置，可以通过签到获取流量。</p>

											<p>每次签到可以获取{$config['checkinMin']}~{$config['checkinMax']}MB流量。</p>
										
											<p>每天可以签到一次。您可以点击按钮或者摇动手机来签到。</p>
																						
											<p>上次使用时间：<code>{$user->lastSsTime()}</code></p>

											<p>上次签到时间：<code>{$user->lastCheckInTime()}</code></p>
											
											<p id="checkin-msg"></p>
											
											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>
									
									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;签到</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能签到</a></p>
											{/if}
										</div>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">连接信息</p>
											<dl class="dl-horizontal">
												<dt>服务器端口：{$user->port}</dt>
																								
												<dt>连接密码：{$user->passwd}</dt>
																								
												<dt>加密方式：{$user->method}</dt>
												
												<dt>混淆协议：{$user->protocol}</dt>
												
												<dt>协议参数：{$user->protocol_param}</dt>
												
												<dt>混淆方式：{$user->obfs}</dt>
												
												<dt>混淆参数：{$user->obfs_param}</dt>
											</dl>
									</div>
									
								</div>
							</div>
						
						
						
						
						{if $enable_duoshuo=='true'}
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">讨论区</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0] 
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>
									
								</div>
							</div>
						
						{/if}
						
						{include file='dialog.tpl'}
						
					</div>
						
					
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="theme/material/js/shake.js/shake.js"></script>



{if $geetest_html == null}
<script>
window.onload = function() { 
    var myShakeEvent = new Shake({ 
        threshold: 15 
    }); 
 
    myShakeEvent.start(); 
 
    window.addEventListener('shake', shakeEventDidOccur, false); 
 
    function shakeEventDidOccur () { 
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
		
        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    } 
}; 

</script>



<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
	
</script>
{else}


<script>
window.onload = function() { 
    var myShakeEvent = new Shake({ 
        threshold: 15 
    }); 
 
    myShakeEvent.start(); 
 
    window.addEventListener('shake', shakeEventDidOccur, false); 
 
    function shakeEventDidOccur () { 
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}
		
        c.show();
    } 
}; 

</script>



<script>


	var handlerPopup = function (captchaObj) {
		c = captchaObj;
		captchaObj.onSuccess(function () {
			var validate = captchaObj.getValidate();
            $.ajax({
                url: "/user/checkin", // 进行二次验证
                type: "post",
                dataType: "json",
                data: {
                    // 二次验证所需的三个值
                    geetest_challenge: validate.geetest_challenge,
                    geetest_validate: validate.geetest_validate,
                    geetest_seccode: validate.geetest_seccode
                },
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
        });
        // 弹出式需要绑定触发验证码弹出按钮
        captchaObj.bindOn("#checkin");
        // 将验证码加到id为captcha的元素里
        captchaObj.appendTo("#popup-captcha");
        // 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
    };

	initGeetest({
		gt: "{$geetest_html->gt}",
		challenge: "{$geetest_html->challenge}",
		product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
		offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
	}, handlerPopup);
	
	
</script>


{/if}



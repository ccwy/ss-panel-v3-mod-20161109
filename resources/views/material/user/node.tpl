







{include file='user/main.tpl'}


<script src="//cdn.bootcss.com/canvasjs/1.7.0/canvasjs.js"></script>
<script src="//cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>

	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点列表</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<h4>注意!</h4>
									<p>请勿在任何地方公开节点地址！</p>
									<p>流量比例为0.5即使用1000MB按照500MB流量记录记录结算.</p>
									<p><font color="Dark red">本站节点全部锐速加持，隐藏节点付费用户可见。</font></p>
									<a href="javascript:void(0);" onClick="urlChange('guide',0)">如果您不知道如何查看节点的详细信息和二维码，请点我。</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<div class="tile-wrap">
											{$id=0}
											{foreach $node_prefix as $prefix => $nodes}
												{$id=$id+1}
												
													<div class="tile tile-collapse">
														<div data-toggle="tile" data-target="#heading{$node_order->$prefix}">
															<div class="tile-side pull-left" data-ignore="tile">
																<div class="avatar avatar-sm">
																	<span class="icon {if $node_heartbeat[$prefix]=='在线'}text-green{else}{if $node_heartbeat[$prefix]=='暂无数据'}text-orange{else}text-red{/if}{/if}">{if $node_heartbeat[$prefix]=="在线"}backup{else}{if $node_heartbeat[$prefix]=='暂无数据'}report{else}warning{/if}{/if}</span>
																</div>
															</div>
															<div class="tile-inner">
																<div class="text-overflow">{$prefix} | <i class="icon icon-lg">person</i> {$node_alive[$prefix]} | <i class="icon icon-lg">build</i> {$node_method[$prefix]} | <i class="icon icon-lg">traffic</i> {if isset($node_bandwidth[$prefix])==true}{$node_bandwidth[$prefix]}{else}N/A{/if}</div>
															</div>
														</div>
														<div class="collapsible-region collapse" id="heading{$node_order->$prefix}">
															<div class="tile-sub">
																
																<br>
																
																{foreach $nodes as $node}
																
																
																	
																	<div class="card">
																		<div class="card-main">
																			<div class="card-inner"> 
																			<p class="card-heading" >
																				<a href="javascript:void(0);" onClick="urlChange('{$node->id}',0)">{$node->name}</a> 
																				<span class="label label-green">{$node->status}</span>
																			</p>
																			
																			
																			{if $node->sort > 2 && $node->sort != 5}
																				<p>地址：<span class="label label-brand-accent"> 
									                                        	本站任意节点地址															
									                                        	</span></p>
																					
									                                        	<p>端口：<span class="label label-brand-red"> 
										                                        {$node->status}
										                                        </span></p>
																					
										                                        <p>加密方式：<span class="label label-brand"> 
										                                        aes-256-cfb
										                                        </span></p>
																					
										                                        <p>协议：<span class="label label-red">  
										                                        auth_sha1_compatible
										                                        </span></p>
																					
										                                        <p>混淆方式：<span class="label label-orange"> 
										                                        http_simple_compatible
										                                        </span></p>	
																			{else}
																				<p>地址：<span class="label label-brand-accent"> 
																				{$node->server}
																			{/if}
																				
																				</span></p>
																			
																			{if $node->sort == 0||$node->sort==7||$node->sort==8}
																				<p>加密方式：<span class="label label-brand"> 
																					{if $node->custom_method == 1}
																						{$user->method}
																					{else}
																						{$node->method}
																					{/if}
																				</span></p>
																				
																				{if $node->sort==0&&$node->custom_rss==1&&$config['enable_rss']=='true'}
																					<p>协议：<span class="label label-brand-accent"> 
																						{$user->protocol}
																					</span></p>
																					
																					<p>协议参数：<span class="label label-red"> 
																						{$user->protocol_param}
																					</span></p>
																					
																					<p>混淆方式：<span class="label label-brand"> 
																						{$user->obfs}
																					</span></p>
																					
																					<p>混淆参数：<span class="label label-green"> 
																						{$user->obfs_param}
																					</span></p>
																				{/if}
																				
																				
																				<p>流量比例：<span class="label label-red"> 
																					{$node->traffic_rate}
																				</span></p>
																				
																				
																				<p>在线人数：<span class="label label-orange"> 
																					{$node->getOnlineUserCount()}
																				</span></p>
																			
																				{if ($node->sort==0||$node->sort==7||$node->sort==8)&&($node->node_speedlimit!=0||$user->node_speedlimit!=0)}
																					<p>节点限速：<span class="label label-green"> 
																						{if $node->node_speedlimit>$user->node_speedlimit}
																							{$node->node_speedlimit}Mbps
																						{else}
																							{$user->node_speedlimit}Mbps
																						{/if}
																					</span></p>
																				{/if}
																			{/if}
																			
																			<p>{$node->info}</p>
																			
																			
																			
																			
																			 </div>
																			
																		</div>
																	</div>
																	{if $node->sort==0}
																		{$point_node=$node}
																	{/if}
																	
																	
																	
																	{if $node->sort == 0 && $node->custom_rss == 1}
																		{foreach $node_muport as $single_muport}
																			<div class="card">
																				<div class="card-main">
																					<div class="card-inner"> 
																					<p class="card-heading" >
																						<a href="javascript:void(0);" onClick="urlChange('{$node->id}',{$single_muport['server']})">{$prefix} - 单端口多用户 Shadowsocks - {$single_muport['server']} 端口</a> 
																						<span class="label label-green">{$node->status}</span>
																					</p>
																					
																					
																					<p>地址：<span class="label label-brand-accent"> 
																					{$node->server}
																					
																					</span></p>
																					
																					<p>端口：<span class="label label-brand-red"> 
																						{$single_muport['user']['port']}
																					</span></p>
																					
																					<p>加密方式：<span class="label label-brand"> 
																						{$single_muport['user']['method']}
																					</span></p>
																					
																					<p>协议：<span class="label label-brand-accent"> 
																						{$single_muport['user']['protocol']}
																					</span></p>
																					
																					<p>协议参数：<span class="label label-red"> 
																						{$single_muport['user']['protocol_param']}
																					</span></p>
																					
																					<p>混淆方式：<span class="label label-brand"> 
																						{$single_muport['user']['obfs']}
																					</span></p>
																					
																					<p>混淆参数：<span class="label label-green"> 
																						{$single_muport['user']['obfs_param']}
																					</span></p>
																					
																					<p>{$node->info}</p>
																					
																					
																					
																					
																					 </div>
																					
																				</div>
																			</div>
																		{/foreach}
																	{/if}
																
																{/foreach}
																	
																	
																	
																
																{if $point_node!=null}
																
																	<div class="card">
																		<div class="card-main">
																			<div class="card-inner" id="info{$id}"> 
																				
																			</div>
																		</div>
																	</div>
																	
																	<script>
																	$().ready(function(){
																		$('#heading{$node_order->$prefix}').on("shown.bs.tile", function() {

																			$("#info{$id}").load("/user/node/{$point_node->id}/ajax");

																		});
																	});
																	</script>
																{/if}	
																
																{$point_node=null}
																	
																	
																
																	
															</div>
															
															
														
														</div>
														
														
														
												</div>
												
											{/foreach}
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div aria-hidden="true" class="modal fade" id="nodeinfo" role="dialog" tabindex="-1">
							<div class="modal-dialog modal-full">
								<div class="modal-content">
									<iframe class="iframe-seamless" title="Modal with iFrame" id="infoifram"></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>


function urlChange(id,is_mu) {
    var site = './node/'+id+'?ismu='+is_mu;
	if(id == 'guide')
	{
		var doc = document.getElementById('infoifram').contentWindow.document;
		doc.open();
		doc.write('<img src="https://www.zhaoj.in/wp-content/uploads/2016/07/1469595156fca44223cf8da9719e1d084439782b27.gif" style="width: 100%;height: 100%; border: none;"/>');
		doc.close();
	}
	else
	{
		document.getElementById('infoifram').src = site;
	}
	$("#nodeinfo").modal();
}
</script>

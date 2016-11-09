{include file='header.tpl'}






	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-lg-push-0 col-sm-12 col-sm-push-0">
						<h1 class="content-heading">欢迎来到{$config["appName"]}</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
						<section class="content-inner margin-top-no">
						
					
								
							<div class="col-lg-12 col-sm-12">
								<div class="card">
									<div class="card-main">
										<div class="card-inner">
											<p>不忘记自己最初的梦想，或许你就有实现梦想的一天，但真到那一天了，你还是你吗？</p>
										</div>
									</div>
								</div>
							</div>
						
						{if $user->isLogin}
							<div class="col-lg-12 col-sm-12">
								<div class="card card-brand">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">控制中心</p>
											<p>
												您可以点击按钮进入面板。
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn btn-flat waves-attach waves-light waves-effect" href="/user"><span class="icon">airline_seat_recline_normal</span>&nbsp;进入控制面板</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						{else}
							<div class="col-lg-12 col-sm-12">
								<div class="card card-brand">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">注册账号</p>
											<p>
												没有账号？请点击注册账号申请一个。
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn btn-flat waves-attach waves-light waves-effect" href="/auth/register"><span class="icon">pregnant_woman</span>&nbsp;注册账号</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="col-lg-12 col-sm-12">
								<div class="card card-brand-accent">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">登录账号</p>
											<p>
												有账号了？请点击登录账号。
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn btn-flat waves-attach waves-light waves-effect" href="/auth/login"><span class="icon">vpn_key</span>&nbsp;登录账号</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
								
						{/if}
							
							
							
						</section>

			
			
			
		</div>
	</main>


{include file='footer.tpl'}

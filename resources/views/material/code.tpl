



{include file='header.tpl'}






	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-lg-push-0 col-sm-12 col-sm-push-0">
						<h1 class="content-heading">{$config["appName"]}的注册码</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
				<section class="content-inner margin-top-no">
				
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>{$config["appName"]}的注册码不定时发放，请不要注册多个账号，一经发现删除所有账号，请珍惜账号，只要遵守本站规则即可免费使用，注册前请仔细阅读服务条款。</p>
							</div>
						</div>
					</div>
				
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner margin-bottom-no">
								<p class="card-heading"注册码</p>
								<div class="card-table">
									<div class="table-responsive">
										<table class="table">
											<thead>
											<tr>
												<th>###</th>
												<th>注册码 (点击注册码进入注册页面)</th>
												<th>状态</th>
											</tr>
											</thead>
											<tbody>
											{foreach $codes as $code}
											<tr>
												<td>{$code->id}</td>
												<td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
												<td>可用</td>
											</tr>
											{/foreach}
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					
					
					
							
			
			
		</div>
	</main>


{include file='footer.tpl'}

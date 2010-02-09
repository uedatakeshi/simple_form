<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>お問い合せフォーム</title>
	<link rel="stylesheet" type="text/css" media="screen" href="../css/form.css" />
</head>
<body>

<div id="container">
	<h1>お問い合せ</h1>
		<p>以下の内容で送信いたします。</p>
	<form action="form.php" method="post">
	<fieldset>
	{foreach from=$list key=k item=v}
		{if is_array($v)}
			{foreach from=$v key=k2 item=v2}
				<input type="hidden" name="{$k|escape}[{$k2|escape}]" value="{$v2|escape}" />
			{/foreach}
		{elseif $k != 'submit'}
			<input type="hidden" name="{$k|escape}" value="{$v|escape}" />
		{/if}
	{/foreach}
	<table>
	<tbody>
		<tr>
			<th>お名前</th>
			<td>{$list.name|escape}</td>
		</tr>
		<tr>
			<th>会社名</th>
			<td>{$list.company|escape}</td>
		</tr>
		<tr>
			<th>メールアドレス</th>
			<td>{$list.email|escape}</td>
		</tr>
		<tr>
			<th>電話番号</th>
			<td>{$list.tel|escape}</td>
		</tr>
		<tr>
			<th>お問い合せのきっかけ</th>
			<td>{foreach from=$list.clue key=k item=v}{$v|escape}<br />{/foreach}</td>
		</tr>
		<tr>
			<th>ご希望の連絡方法</th>
			<td>{$list.contact}</td>
		</tr>
		<tr>
			<th>お問い合せの種類</th>
			<td>{$list.type}</td>
		</tr>
		<tr>
			<th>お問い合せ内容(*)</th>
			<td>{$list.comment|escape|nl2br}</td>
		</tr>
	</tbody>
	</table>
	<div class="controls">
		<input id="back_button" type="submit" value="back" name="submit" />
		<input id="send_button" type="submit" value="send" name="submit" />
	</div>
	</fieldset>
	</form>
</div>
</body>
</html>

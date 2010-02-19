<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>お問い合せフォーム</title>
	<link rel="stylesheet" type="text/css" media="screen" href="../css/form.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="../js/form.js"></script>
</head>
<body>

<div id="container">
	<h1>お問い合せ</h1>
		<p>弊社へのお問い合せ、当サイトに対するご要望など、どうぞお気軽にお問い合せください。</p>
	<form action="form.php" method="post">
	<fieldset>
	<input type="hidden" name="mode" value="next" />
	<p>*印は必須項目です。</p>
		<div id="messages">
		{if $emes}
			<ul>
			{foreach from=$emes item=emes}
				<li>{$emes|escape}</li>
			{/foreach}
			</ul>
		{/if}
		</div>
	<table>
	<tbody>
		<tr>
			<th><label for="name">お名前(*)</label></th>
			<td><input id="name" type="text" name="name" value="{$list.name|escape}" /></td>
		</tr>
		<tr>
			<th><label for="company">会社名</label></th>
			<td><input id="company" type="text" name="company" value="{$list.company|escape}" /></td>
		</tr>
		<tr>
			<th><label for="email">メールアドレス(*)</label></th>
			<td><input id="email" type="text" name="email" value="{$list.email|escape}" /></td>
		</tr>
		<tr>
			<th><label for="tel">電話番号(*)</label></th>
			<td><input id="tel" type="text" name="tel" value="{$list.tel|escape}" /></td>
		</tr>
		<tr>
			<th>お問い合せのきっかけ(*)</th>
			<td><input class="checkbox" id="clue1" type="checkbox" name="clue[]" value="HPを見て" {foreach from=$list.clue item=clue}{if $clue == "HPを見て"}checked="checked"{/if}{/foreach} />
				<label for="clue1">HPを見て</label>
				<input class="checkbox" id="clue2" type="checkbox" name="clue[]" value="知人の紹介" {foreach from=$list.clue item=clue}{if $clue == "知人の紹介"}checked="checked"{/if}{/foreach} />
				<label for="clue2">知人の紹介</label>
				<input class="checkbox" id="clue3" type="checkbox" name="clue[]" value="パンフレットや広告を見て" {foreach from=$list.clue item=clue}{if $clue == "パンフレットや広告を見て"}checked="checked"{/if}{/foreach} />
				<label for="clue3">パンフレットや広告を見て</label>
				<input class="checkbox" id="clue4" type="checkbox" name="clue[]" value="セミナーやイベントで知って" {foreach from=$list.clue item=clue}{if $clue == "セミナーやイベントで知って"}checked="checked"{/if}{/foreach} />
				<label for="clue4">セミナーやイベントで知って</label>
				<input class="checkbox" id="clue5" type="checkbox" name="clue[]" value="利用者からの紹介" {foreach from=$list.clue item=clue}{if $clue == "利用者からの紹介"}checked="checked"{/if}{/foreach} />
				<label for="clue5">利用者からの紹介</label>
				<input class="checkbox" id="clue6" type="checkbox" name="clue[]" value="その他" {foreach from=$list.clue item=clue}{if $clue == "その他"}checked="checked"{/if}{/foreach} />
				<label for="clue6">その他</label>
			</td>
		</tr>
		<tr>
			<th>ご希望の連絡方法</th>
			<td>
				<input class="radio" id="contact1" type="radio" name="contact" value="お電話" {if $list.contact == "お電話"}checked="checked"{/if} /><label for="contact1">お電話</label>
				<input class="radio" id="contact2" type="radio" name="contact" value="E-mail" {if $list.contact == "E-mail"}checked="checked"{/if} /><label for="contact2">E-mail</label>
			</td>
		</tr>
		<tr>
			<th><label for="type">お問い合せの種類(*)</label></th>
			<td><select id="type" name="type">
			<option value="プログラムの設置について" {if $list.type == "プログラムの設置について"}selected="selected"{/if}>プログラムの設置について</option>
			<option value="プログラムの使い方について" {if $list.type == "プログラムの使い方について"}selected="selected"{/if}>プログラムの使い方について</option>
			<option value="その他全般" {if $list.type == "その他全般"}selected="selected"{/if}>その他全般</option>
			</select>
			</td>
		</tr>
		<tr>
			<th><label for="comment">お問い合せ内容(*)</label></th>
			<td><textarea id="comment" name="comment" rows="5" cols="20">{$list.comment|escape}</textarea></td>
		</tr>
	</tbody>
	</table>
	<div class="controls">
		<input type="reset" value="リセット" name="reset" />
		<input type="submit" value="次へ" name="submit" />
	</div>
	</fieldset>
	</form>
</div>
</body>
</html>

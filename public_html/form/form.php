<?php
/**
 * Simple Form Script Version: 1.0.0 
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * @copyright     Copyright 2010, Taiki, Inc. (http://www.twain.jp/)
 * @link          http://www.twain.jp/ 
 * @author        T-wain Network Systems <info at twain dot jp>
 * @author        Takeshi Ueda <ueda at twain dot jp> 
 */

require_once('./config.php');

if (isset($_POST['mode'])) {
	foreach($_POST as $k => $v) {
		if (!is_array($v)) {
			$v = trim(mb_convert_kana($v, "KVasn", "UTF-8"));
		}
		$list[$k] = $v;
	}

	if (!$list['name']) {
		$emes[] = '「お名前」を入力してください。 ';
	}
	if (!$list['email']) {
		$emes[] = '「メールアドレス」を入力してください。 ';
	} elseif (!is_email($list['email']))  {
		$emes[] = '「メールアドレス」を正しく入力してください。 ';
	}
	if (!$list['tel']) {
		$emes[] = '「電話番号」を入力してください。 ';
	}
	if (!isset($list['clue'])) {
		$emes[] = '「お問い合せのきっかけ」を選択してください。 ';
	}
	if (!isset($list['contact'])) {
		$emes[] = '「ご希望の連絡方法」を選択してください。 ';
	}
	if (!$list['comment']) {
		$emes[] = '「お問い合せ内容」を入力してください。 ';
	}

	$smarty->assign('list', $list);
	if (isset($emes)) {
		$smarty->assign('emes', $emes);
		$smarty->display('form/form.tpl');
		exit;
	}

	if ($list['mode'] == 'next') {
		$smarty->display('form/confirm.tpl');
		exit;

	} elseif ($list['mode'] == 'back') {

		$smarty->display('form/form.tpl');
		exit;

	} elseif ($list['mode'] == 'send') {

		$from = MAIL_FROM;
		$from_name = FROM_NAME;
		$to = MAIL_FROM;
		$subject = SUBJECT_2ME;
		$bcc = '';

		$message = $smarty->fetch('form/mail.tpl');
		send_mail($subject, $message, $from, $from_name, $to, $bcc);
		if ($list['email']) {
			$subject = SUBJECT_2U;
			send_mail($subject, $message, $from, $from_name, $list['email'], $bcc);
		}
		header('location: ./thanks.html');
		exit;
	} 
}

$smarty->display('form/form.tpl');
exit;

function send_mail($subject, $message, $from, $from_name, $to, $bcc) {

	$mail_prog = SEND_MAIL;

	if ($from_name) {
		$from_name = mb_convert_encoding($from_name, 'ISO-2022-JP', 'UTF-8');
		$from_name = base64_encode($from_name);
		$from_name = '=?ISO-2022-JP?B?' . $from_name . '?= <' . $from . '>';
	} else {
		$from_name = $from;
	}

	$subject = mb_convert_encoding($subject, 'JIS', 'UTF-8');
	$subject = '=?ISO-2022-JP?B?' . base64_encode($subject) . '?=';
	$message = mb_convert_encoding($message, 'JIS', 'UTF-8');

	if ($from) {
		$fp = popen("$mail_prog -t -f'$from'", 'w');

		fwrite($fp, "From: $from_name\n");
		fwrite($fp, "To: $to\n");
		fwrite($fp, "Bcc: $bcc\n");
		fwrite($fp, "Subject: $subject\n");
		fwrite($fp, "Mime-Version: 1.0\n");
		fwrite($fp, "Content-Type: text/plain; charset=ISO-2022-JP\n\n");
		fwrite($fp, "");
		fwrite($fp, "$message");
		pclose($fp);
	}

}

function is_email($email) {
	if (!preg_match('/^[A-Za-z0-9!#$%&\'*+-\/\=?^_`{|}~]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)+[A-Za-z]$/', $email)) {
		return false;
	} else {
		return true;
	}
}

?>

<?php
/**
 * Created by PhpStorm.
 * User: maxence
 * Date: 02/04/16
 * Time: 20:12
 */


/** @Todo use eZHTTPTool */
if( $_POST['sendSms'] )
{

	return json_encode(array(sendSms()));

}
else
{
	return json_encode(array(sendMail()));
}

function sendSms()
{
	$aResult = array('error' => false);
	/** @Todo use eZHTTPTool */
	if( !empty($_POST['senderEmail']) && !empty($_POST['senderMessage']) && !empty($_POST['senderSubject']) )
	{
		$message = "From: {$_POST['senderEmail']}\nSubject:{$_POST['senderSubject']}\n\rMessage:\n{$_POST['senderMessage']}" ;
		$message = utf8_encode($message);
		$data = array("user" => "put_your_own_username", "pass" => "put_your_own_pass","msg"=> $message);
		$data_string = json_encode($data);

		$ch = curl_init('https://smsapi.free-mobile.fr/sendmsg');
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
				'Content-Type: application/json;charset=\"utf-8\"',
				'Content-Length: ' . strlen($data_string))
		);


		if(curl_exec($ch) === false)
		{
			$aResult['error'] = 'Curl error: ' .curl_error($ch);
		}
		else
		{
			echo 'Operation completed without any errors';
			$isCopieSMS = ($_POST['senderCopy'] == 'true' && $_POST['sendSms'] == '1');
			if($isCopieSMS)
			{
				$aResult = sendMail();
			}

		}


		return($aResult);
	}
}

function sendMail()
{
	$ini = eZINI::instance('site.ini');
	$aResult = array('error' => false);


	if( !empty($_POST['senderEmail']) && !empty($_POST['senderMessage']) && !empty($_POST['senderSubject']) )
	{

		$oMail = new ezcMail();
		$oMail->addTo(new ezcMailAddress('maxence.drouhin@gmail.com'), 'Maxence Drouhin');
/*
		if($_POST['senderCopy'] == "true")
		{
			$oMail->addTo(new ezcMailAddress($_POST['senderEmail'] ));
		} */

		$oMail->subject = '['.$ini->variable('SiteSettings','SiteURL').'] '.$_POST['senderSubject'];

		$oMail->body = new ezcMailText( $_POST['senderMessage'].'
	                                    Message sent by: '.$_POST['senderEmail'] );

		$transport = new ezcMailMtaTransport();
		try{
			$transport->send( $oMail );
		}catch (Exception $e)
		{

			$aResult['error'] = true;
			$aResult['errorMessage'] = 'Sorry technical error'.$e->getMessage();
		}

	}
	else
	{
		$aResult['error'] = true;
		$aResult['errorMessage'] = 'Parameter missing|'.$_POST['senderEmail']."|".$_POST['senderMessage']."|".$_POST['senderSubject'];
	}
	return($aResult);
}
eZExecution::cleanExit();

?>

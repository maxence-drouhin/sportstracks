<?php
/**
 * Created by PhpStorm.
 * User: maxence
 * Date: 16/08/15
 * Time: 01:04
 */



class KmlBrowser {

private $aMarkers = array();
	const sBaseKmlFiles = 'var/log/kml';
	private $url = '';


	function kmlBrowser( )
	{


	}

	public function setUrl( $url )
	{
		$this->url = $url;
	}

	public function browse()
	{
		$url = self::createKmlUrl($this->url);
		$localFileUrl = self::getKmlFileSavedPath($this->url);

		//var_dump($url);

		$contents = self::readKmlInDB($url);

	//	var_dump($localFileUrl);
		if( !is_string($contents)) {
			echo 'hello';

		//	self::saveKml($url);
			$contents = self::saveKmlToDB( $url );

		}
	/*	else
		{
			$url = $localFileUrl;
		}*/

	//	$contents = self::readFile($url);

		if( $contents == false ) {
			eZLog::write($this->url);
			return $this->aMarkers;
		}

		$kmlFileXmlElement = new SimpleXMLElement($contents);
		$pastLineString=null;
		$color = (string)$this->getRandomHexaColor();

		foreach ( $kmlFileXmlElement->Document->Folder as $key => $folder )
		{

			foreach( $folder->Placemark->LineString as $lineString => $lineStringRow )
			{

				$sCleanedString = preg_replace('/((,+[-\-0-9\.]+ ))/', ',',trim((string)$lineStringRow->coordinates));
				if(is_null($sCleanedString))
					continue;

				$aCoordinatesRow = preg_split( '/(([,]))/',$sCleanedString );
				$aLatLong  = array();
				//var_dump($this->random_color());

				for($i=0; $i < (count($aCoordinatesRow) -1) ; $i = $i+2 )
				{
					$aLatLong[] = trim($aCoordinatesRow[$i + 1]) . ',' . trim($aCoordinatesRow[$i]);

				}

				$this->aMarkers[] = array((string)$folder->name,
					(string)$folder->Placemark->name,
					$color,
					$aLatLong,
				);


			}
		}
	}


	public function getMarkers()
	{
		return $this->aMarkers;
	}

	public static function createKmlUrl($url)
	{
		$ch = curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
		curl_setopt($ch, CURLOPT_VERBOSE, 1);
		curl_setopt($ch, CURLOPT_HEADER, 1);
		$output=curl_exec($ch);
		curl_close($ch);
		preg_match('#(mid)([^&])*#', $output, $res );
		return "https://mapsengine.google.com/map/kml?".$res[0]."&forcekml=1";/*'var/kml/'.$filename*/;
	}

	public static function saveKml( $url )
	{

		preg_match('#(mid)([^&])*#', $url, $res );
		$filePath = self::sBaseKmlFiles."/$res[0].txt";
		var_dump($filePath);

		if (file_exists($filePath ) )
			return false;

		$return = false;

		if ($stream = self::readFile($url))
		{
			$file = fopen(self::sBaseKmlFiles."/$res[0].txt", "w");

			$return = fwrite($file, $stream);
		fclose($file);
		}

		return $return;

	}

	public static function getKmlFileSavedPath( $url )
	{
		preg_match('#(mid)([^&])*#', $url, $res );
		$sFilePath = self::sBaseKmlFiles."/$res[0].txt";
		if (file_exists( $sFilePath ) )
			return $sFilePath;
		else
			return false;

	}

	public static function readKmlInDB( $url )
	{
		$return = false;

		$params = array('AttributeFilter' => array(''),
			'ClassFilterType' =>array('include'),
			'ClassFilterArray' => array('kml'),
			'AttributeFilter' => array('kml'=> $url ));

		$oKml =eZContentObjectTreeNode::subTreeByNodeID(2,$params);
		if($oKml instanceof eZContentObjectTreeNode )
		{
			$return = $oKml->attribute('content');
		}


		return $return;
	}

	public static function saveKmlToDB( $url )
	{
		$return = false;

		if ($stream = self::readFile($url))
		{
			$kmlClassId = eZContentClass::classIDByIdentifier('kml') ;
			if($kmlClassId != false ) {


				$oContentClassKml = eZContentClass::fetch($kmlClassId);
				$oContentClassKml->instantiate();
				$arttributes = $oContentClassKml->attribute('data_map');
			//	eZContentObjectAttribute::
				$definition = array();
				foreach($arttributes as $attributeName => $attribute )
				{
					//$definition[$attributeName]=$attribute::definition();
				}
			//	var_dump($definition);
				$aKmlClassAttributes = $oContentClassKml->attributes();
				$row['contentclass_identifier']= $kmlClassId;

				$oKml = eZContentObject::create( 'test' ,$kmlClassId, eZUser::currentUserID());
				$oKml->resetDataMap();
				$oKml->setAttribute('content', $stream);
				$oKml->setAttribute('name', $url);
			//	$oKml->setContentObjectAttributes($aKmlClassAttributes);
/*
				if( $oKml->store() == true )
				{
					$return = $stream;
				}*/

			}
		}
		return $return;


	}
	public static function readFile( $path  )
	{
		$file = fopen("$path", 'r');
		$stream = stream_get_contents($file);
		//var_dump($stream);
		if ($stream == false) {
			eZLog::write("$path");
		}
		fclose($file);
		return $stream;

	}

	public function getRandomHexaColor()
	{
		$r=mt_rand(0, 255);
		$g=mt_rand(0, 255);
		$b=mt_rand(0, 255);
		$number = $r*65536+$g*256+$b;
		$color = dechex($number);
		return '#'.$color;
	}





}

<?php
/**
 * Created by PhpStorm.
 * User: maxence
 * Date: 23/04/16
 * Time: 17:59
 */

use Dompdf\Dompdf;
use Dompdf\Options;


$sys = eZSys::instance();
$siteIni = eZINI::instance('site.ini');
$design = eZINI::instance('design.ini');
/** @Todo remove hardcoded nodeid */
$node = eZContentObjectTreeNode::fetch(61);
$siteAccessName = eZSiteAccess::current()['name'];

$pdfFullPath = $sys->siteDir().$siteIni->variable('FileSettings', 'VarDir').DIRECTORY_SEPARATOR.$siteIni->variable('FileSettings', 'CacheDir').
    DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.$node->attribute('name')."_$siteAccessName.pdf";

if (!file_exists($pdfFullPath)){ //file is not already cached

    $tpl = eZTemplate::factory();
    $tpl->setVariable('node',$node);


// instantiate and use the dompdf class
    $pdfOption = new Options(array('enable_html5_parser' => true));
    $pdfOption->setIsPhpEnabled(true);
    $dompdf = new Dompdf();
    $dompdf->setOptions($pdfOption);
    $dompdf->set_option("isPhpEnabled", true);
    $sCVHTML = $tpl->fetch('design:print/cv.tpl');
    $tpl->setVariable('content',$sCVHTML);

    $css_style = '';

    $aCssFiles = array_merge( $design->variable('StylesheetSettings','FrontendCSSFileList'), $design->variable('StylesheetSettings','PrintCSSFileList'));
    $packedFiles = ezjscPacker::packFiles($aCssFiles, 'stylesheets/', '_' . $media . '.css');


    foreach ($packedFiles  as $cssFilePath)
    {
        $css_style .= ' '.file_get_contents(trim($cssFilePath,'/'));
    }


    $tpl->setVariable('css_style',$css_style);
    $dompdf->setBasePath('http://local.sportstracks.net');
    $tpl->setVariable('urlLang',$siteAccessName);
    $pageHtml = $tpl->fetch('design:print/pagelayout.tpl');

    $dompdf->loadHtml($pageHtml);

// (Optional) Setup paper size and orientation
    $dompdf->setPaper('A4', 'portrait');
// Render HTML as PDF
    $dompdf->render();

    //save file to cache
    file_put_contents($pdfFullPath, $dompdf->output());
}



/*@Todo for pdf downloading should create class or use existing one... */

$pdfFilename = str_replace(array("\n", "'"), "", basename($node->attribute('name') ))."_$siteAccessName.pdf";
$encoding = mb_detect_encoding($pdfFilename);
$fallbackfilename = mb_convert_encoding($pdfFilename, "ISO-8859-1", $encoding);
$encodedfallbackfilename = rawurlencode($pdfFilename);
$encodedfilename = rawurlencode($pdfFilename);

header(
    "Content-Disposition: attachment; filename=" . $encodedfallbackfilename . "; filename*=UTF-8''$encodedfilename"
);

header("Content-Type: application/octet-stream");
header("Content-Type: application/download");
header("Content-Length: " . filesize($pdfFullPath));

echo file_get_contents($pdfFullPath);





eZExecution::cleanExit();
// Output generated PDF to Browser

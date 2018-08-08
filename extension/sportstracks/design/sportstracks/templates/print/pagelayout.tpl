{def $data = ezpagedata()}
<!DOCTYPE html>
<html>
<head>
    <title>{if $data.persistent_variable.page_title.0}{$data.persistent_variable.page_title.0}{else}www.sportstracks.net{/if}</title>
    <meta charset="UTF-8">

    <style>
        {$css_style}
        {literal}
        footer .page-number:after { content: counter(page); }
        {/literal}
    </style>
</head>


<body id="body">
<div class="main container theme-showcase" role="main">
    {$content}
   </div>
<footer>
    <div class="col-sm-12 footer">
        <p><a target="_blank" href="{concat('https://',ezini('SiteSettings','SiteURL'),'/', $urlLang,'/')}">{concat('https://',ezini('SiteSettings','SiteURL'),'/', $urlLang,'/')|ezurl('no','full')}</a></p>
        <p>&copy;{def $date=currentdate()|datetime(custom, '%Y')} {$date}</p>
        {* <span class="page-number">Page </span>*}
        <script type="text/php">
            {literal}
            if ( isset($pdf) ) {
                $x = 70;
                $y = 800;
                $text = "{PAGE_NUM} / {PAGE_COUNT}";
                $font = $fontMetrics->get_font("helvetica");
                $size = 8;
                $color = array(0,0,0);
                $word_space = 0.0;  //  default
                $char_space = 0.0;  //  default
                $angle = 0.0;   //  default
                $pdf->page_text($x, $y, $text, $font, $size, $color, $word_space, $char_space, $angle);
            }
            {/literal}
    </script>
    </div>
</footer>

</body>
</html>
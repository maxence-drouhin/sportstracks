
<!DOCTYPE html>
<html>
<head>
    <title>Title of the document</title>
    <meta charset="UTF-8">
    {ezscript_load(ezini('JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini'))}
    {ezcss_load(ezini('StylesheetSettings', 'FrontendCSSFileList', 'design.ini'))}

</head>

<body id="body">
<div class="main container theme-showcase" role="main">
    {def $node = fetch( 'content', 'node', hash( 'node_path', '/test-short'  ) ) }
    <div id="intro">
{$node.data_map.intro.content.output.output_text}
        </div>
        {include uri="design:contact.tpl"}
<footer>
        <div class="col-sm-12">
            <div id="tableOfContent">
               Previous sections:
                <ul >
                    <li><a href="#body" class="upper">top</a></li>

                </ul>
            </div>

        </div>

    </div>
    <div class="col-sm-12 footer">
        <p><a href="/sportstracks/maxence">{ezini('SiteSettings','SiteName')}</a></p>
        <p>&copy;{def $date=currentdate()|datetime(custom, '%Y')} {$date}</p>
    </div>
</div>
</footer>
</body>


</html>
{literal}
    <script>
        $(function()
        {
            $('#intro h4').each(function(index){
                $(this).attr('id','heading'+index);
                var i = index+1;
                console.log($(this).html());
                $("#tableOfContent ul").append( ' <li><a href="#'+$(this).attr('id')+'">'+i+'-'+$(this).html()+'</a>  </li>');
                $(this).wrap('<a href="#tableOfContent" class="nodecoration"><a>');
            });
            $("#tableOfContent ul").append('<li><a href="#contactForm" class="upper">Contact</a></li>');
        });

    </script>

{/literal}
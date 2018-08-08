{def $title = ezpagedata_append('page_title',$node.name)}
{cache-block expiry=0}
<div id="intro">
    {$node.data_map.intro.content.output.output_text}
</div>
{/cache-block}  

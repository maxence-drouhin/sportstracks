{def $title = ezpagedata_append('page_title',$node.name)}
{def $content_description = ezpagedata_append( 'content_description',$node.data_map.content_description.content)}
{def $keywords = ezpagedata_append( 'keywords',$node.data_map.keywords.content)}
{def $author_text = ezpagedata_append('author_text',$node.data_map.author_text.content)}
{def $jobresearch_message = ezpagedata_append('jobresearch_message',$node.data_map.jobresearch_message.content)}
<article>
    <div id="intro">
       {* <div id="avatar"></div>*}
       {* <image style="float:right;" width="100" height="auto" alt="maxence drouhin" src="{'maxence.png'|ezimage('no','full')}"></image>*}
        {$node.data_map.intro.content.output.output_text}
    </div>
    <a id="downloadPdf" href="{'/sportstracks/pdf'|ezurl('no','full')}" title="{'Donwload PDF version'|i18n('Download')}">{'Donwload PDF version'|i18n('Download')}
    <span aria-hidden="true" class="glyphicon"></span>
    </a>
    {*<video width="320" height="240" autoplay>
        <source src="http://local.sportstracks.net/var/storage/packages/para.ogg" type="video/ogg">
        Your browser does not support the video tag.
    </video>*}
</article>
{include uri="design:contact.tpl"}



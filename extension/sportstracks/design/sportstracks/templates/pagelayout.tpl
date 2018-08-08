{def $data = ezpagedata()}
<!DOCTYPE html>
<html>
<head>




    <title>{if $data.persistent_variable.page_title.0}{$data.persistent_variable.page_title.0}{else}www.sportstracks.net{/if}</title>
    <meta charset="UTF-8">
    <meta name="keywords" content="{$data.persistent_variable.keywords.0}">
    <meta name="description" content="{$data.persistent_variable.content_description.0}">
    <meta name="author" content="{$data.persistent_variable.author_text.0}">
    <link id="favicon" rel="icon" href="{'maxencedrouhin.png'|ezimage('no')}" type="image/gif" sizes="32x32">
<link href="/extension/sportstracks/design/sportstracks/stylesheets/video-js.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/extension/sportstracks/design/sportstracks/stylesheets/owl.carousel.css" />
    {def $langCode = $module_result.content_info.current_language|explode('-')}
    {*cache-block keys=$module_result.content_info.current_language*}
    {def $translations = language_switcher( $module_result.content_info.node_id )}
    {def $switcherHtmlContent = ''}
    {foreach $translations as $siteaccessName => $lang}
        {def $switchUrl = concat('/switchlanguage/to/',$siteaccessName,'/',$module_result.content_info.url_alias)|ezurl('no','full')}
        {if $module_result.content_info.current_language|ne($lang.locale)}
            <link rel="alternate" hreflang="{$lang.locale|extract(0,2)|downcase()}" href="{$switchUrl}" />
        {/if}
        {set-block variable=$tempswitcherHtml}
            <a class="{$lang.text|wash}" {* title="{'switch to'|i18n('switcher')}" *} href="{$switchUrl}" alt="{$lang.text|wash}" title="{$lang.text|wash}">
                {*<img src="{concat('flags/',$lang.text|wash,'.png')|ezimage('no')} " alt="{$lang.text|wash}">*}</a>
        {/set-block}
        {set switcherHtmlContent = concat($switcherHtmlContent,$tempswitcherHtml)
        {undef $switchUrl}
    {/foreach}
    {*/cache-block*}
{cache-block keys=$module_result.content_info.current_language}
    {def $locale = ezini('RegionalSettings', 'Locale', 'site.ini')}
    {def $ezLocale = fetch( 'content', 'locale' )}
    {cache-block}  
        <script type="text/javascript">
            analyticsVar = {literal} {
                locale:{/literal}'{$locale}'{literal},
                on:false
            }
            {/literal}

            {if ezini('SiteAccessSettings', 'SiteEnvironment', 'site.ini')|eq('prd')}
            analyticsVar.on=true;
            {/if}

        </script>

        {ezscript_load(ezini('JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini'))}
        {ezcss_load(ezini('StylesheetSettings', 'FrontendCSSFileList', 'design.ini'))}

</head>


<body id="body" class="animated" data-locale="{$ezLocale.http_locale_code}">
<div id="wrapper">
    {if $data.persistent_variable.jobresearch_message.0|ne('')}
    <div class="container inherit-color">
    <div class="job-message">
    <div><span>{$data.persistent_variable.jobresearch_message.0}</span></div>
    </div>
    </div>
    {/if}
<div class="main container theme-showcase" role="main">
    <main >
<div class="switcher">
{$switcherHtmlContent}
{undef $switcherHtmlContent}
</div>
    {$module_result.content}

</main>
<p><b><u>Extras:</u></b></p>
<section id="demos"  style="display:block; width:90%; margin:auto;">
		<div class="row">
			<div class="large-12 columns">
				<div class="owl-carousel">
					<div class="item">
						<video id="my-video1" class="video-js" controls preload="auto"
							width="100%" height="100%" poster="MY_VIDEO_POSTER.jpg"
							data-setup="">
							<source src="/var/storage/packages/downloads/jumpmaxmaroc2008.mp4" type='video/mp4'>
							<p class="vjs-no-js">
								To view this video please enable JavaScript, and consider
								upgrading to a web browser that <a
									href="http://videojs.com/html5-video-support/" target="_blank">supports
									HTML5 video</a>
							</p>
						</video>
					</div>

					<div class="item" >
						<video id="my-video2" class="video-js" controls preload="auto"
							width="100%" height="100%" poster="MY_VIDEO_POSTER.jpg"
							data-setup="">
							<source src="/var/storage/packages/downloads/xpara2008.mp4" type='video/mp4'>
							<p class="vjs-no-js">
								To view this video please enable JavaScript, and consider
								upgrading to a web browser that <a
									href="http://videojs.com/html5-video-support/" target="_blank">supports
									HTML5 video</a>
							</p>
						</video>
					</div>
					
						<div class="item">
						<video id="my-video3" class="video-js" controls preload="auto"
							width="100%" height="100%" poster="MY_VIDEO_POSTER.jpg"
							data-setup="">
							<source src="/var/storage/packages/downloads/jumpissensaac.mp4" type='video/mp4'>
							<p class="vjs-no-js">
								To view this video please enable JavaScript, and consider
								upgrading to a web browser that <a
									href="http://videojs.com/html5-video-support/" target="_blank">supports
									HTML5 video</a>
							</p>
						</video>
					</div>

				</div>
				</div>
	
			
			
			<script>
		
{literal}
            $(document).ready(function() {
              $('.owl-carousel').owlCarousel({
                loop: true,
              /*  margin: 10,*/
                items:3,
                nav:true,
               dots:true,
               /*center:true,*/
               autoHeight:true,
              /*  autoWidth:true,*/
                responsiveClass: true,
               responsive: {
                  500: {
                    items: 1,
                    dots: true
                  },
                  600: {
                    items: 2,
                    dots: false
                  },
                  1000: {
                    items: 3,
                    nav: false,
                    loop: false,
                    margin: 20
                  }
                }
              });
             
            var VidPlay = function(videoItem) { 
                        $(videoItem).click(function(){
                      	  if(videoItem.paused)
                      		  {
                           	 this.play(); 
                      		  }
                      	  else
                      		  {
                            	 this.pause(); 
                            	 play = true;
                      		  }
                      	
                        });
              };
          
            	  
              $(".owl-carousel .item video").each(function(index, value){
            	  
            	  var vidPlay = new VidPlay(value);
              });
           
            
            });
            
       
            {/literal}
          
          </script>
		</div>
		
	</section>
    <div class="col-sm-12 tabeOfContentBox">
        <div id="tableOfContent">
            <span>{'Previous sections'|i18n('tableOfContent')}:</span>
            <ul >
                <li><a href="#body" class="upper">{'top'|i18n('tableOfContent')}</a></li>

            </ul>
        </div>

    </div>
    </div>
    <footer>
        <div class="col-sm-12 footer">
            <p>
                <a href="{'/'|ezurl('no','full')}">{ezini('SiteSettings','SiteName')}</a>

                </p>

                {def $nodeMaxence=fetch( 'content', 'node', hash( 'node_id',  61) )}
                    <h1 id="siteTitle">
                <a href="{$nodeMaxence.url_alias|ezurl('no','full')}">
                        Maxence Drouhin

                </a>
                    </h1>


            <p>&copy;{def $date=currentdate()|datetime(custom, '%Y')} {$date}</p>

        </div>
    </footer>
    </div>
<!--DEBUG_REPORT-->
</body>
</html>

















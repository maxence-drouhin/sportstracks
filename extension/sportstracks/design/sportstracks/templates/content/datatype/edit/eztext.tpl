{default attribute_base='ContentObjectAttribute'
         html_class='full'}
{set-block variable=concat($attribute.contentclassattribute_id,'_',$attribute.contentclass_attribute_identifier)}
   bladddddd
{/set-block}
{$testo|attribute(show)}
    {concat($attribute.contentclassattribute_id,'_',$attribute.contentclass_attribute_identifier)}
    {$test}
<textarea id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="{eq( $html_class, 'half' )|choose( 'box', 'halfbox' )} ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_text_{$attribute.id}" cols="70" rows="{$attribute.contentclass_attribute.data_int1}">{$attribute.content|wash}</textarea>
{/default}

SportsTracks
======

**My website extension**

Use with eZPublish 4.7 in LAMP or MAMP environment.

In order to install this extension:
 
Install eZ 4.7 and copy it to the root directory of your installed eZ instance.

Enable the extension in your site.ini

Allow kernel override by setting the constant to true:

define( 'EZP_AUTOLOAD_ALLOW_KERNEL_OVERRIDE', true );

Regenerate autoloads by typing the following command:

php bin/php/ezpgenerateautoloads.php -o

Then create content article with object id 61 (Todo: this id should not be hardcoded in override.ini, use class identifier instead)

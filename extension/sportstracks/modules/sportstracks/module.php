<?php
//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: eZ Website Toolbar
// SOFTWARE RELEASE: 1.6.0
// COPYRIGHT NOTICE: Copyright (C) 1999-2012 eZ Systems AS
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of version 2.0  of the GNU General
//  Public License as published by the Free Software Foundation.
//
//  This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of version 2.0 of the GNU General
//  Public License along with this program; if not, write to the Free
//  Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//  MA 02110-1301, USA.
// ## END COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
//


$Module = array( 'name'            => 'sportstracks',
    'variable_params' => true );

$ViewList = array();

$ViewList['test'] = array(
                           'script' => 'sportstracks.php',

    'default_navigation_part' => 'ezcontentnavigationpart',
    'ui_context' => 'edit',
    'single_post_actions' => array( 'PreviewButton' => 'Preview',
        'TranslateButton' => 'Translate',
        'VersionsButton' => 'VersionEdit',
        'PublishButton' => 'Publish',
        'DiscardButton' => 'Discard',
        'BrowseNodeButton' => 'BrowseForNodes',
        'RemoveAssignmentButton' => 'RemoveAssignments',
        'EditLanguageButton' => 'EditLanguage',
        'FromLanguageButton' => 'FromLanguage',
        'TranslateLanguageButton' => 'TranslateLanguage',
        'BrowseObjectButton' => 'BrowseForObjects',
        'UploadFileRelationButton' => 'UploadFileRelation',
        'NewButton' => 'NewObject',
        'DeleteRelationButton' => 'DeleteRelation',
        'StoreButton' => 'Store',
        'StoreExitButton' => 'StoreExit',
        'MoveNodeID' => 'MoveNode',
        'RemoveNodeID' => 'DeleteNode',
        'ConfirmButton' => 'ConfirmAssignmentDelete',
        'SectionEditButton' => 'SectionEdit',
        'StateEditButton' => 'StateEdit',
    ),
    'post_action_parameters' => array( 'EditLanguage' => array( 'SelectedLanguage' => 'EditSelectedLanguage' ),
        'FromLanguage' => array( 'FromLanguage' => 'FromLanguage' ),
        'TranslateLanguage' => array( 'SelectedLanguage' => 'EditSelectedLanguage' ),
        'UploadFileRelation' => array( 'UploadRelationLocation' => 'UploadRelationLocationChoice' ),
        'SectionEdit' => array( 'RedirectRelativeURI' => 'RedirectRelativeURI' ) ),
    'post_actions' => array( 'BrowseActionName' ),
    'params' => array( 'ObjectID', 'EditVersion', 'EditLanguage', 'FromLanguage' )
    /* 'unordered_params' => array( 'language' => 'Language',
								  'offset' => 'Offset',
								  'year' => 'Year',
								  'month' => 'Month',
								  'day' => 'Day' ) */);

$ViewList['sendmail'] = array(
    'script' => 'sendmail.php',
);

$ViewList['pdf'] = array(
    'script' => 'pdf.php',
);
?>

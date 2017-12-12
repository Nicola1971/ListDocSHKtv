//<?php
/**
 * ListDocSHKtv
 *  
 * Addon Snippet for ListDoc dashboard widget to display Shopkeeper options, based on SHKwidget snippet
 *  
 * @category 	   snippet
 * @version 	   1
 * @license 	   http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal	   @properties 
 * @internal	   @modx_category Shop
[[ListDocSHKtv? &docid=`[+id+]` &tvname=`weight`]]
 */
$docid = isset($docid) ? $docid : $modx->documentIdentifier;
$format = isset($format) ? $format : 'label'; //select | label
$tvname = isset($tvname) ? $tvname : '';
$wraptag = isset($wraptag) ? $wraptag : false;
$tvout = $modx->getTemplateVarOutput(array($tvname),$docid,1);
$output = '';
switch($format){
  case "select":
	  $options = "";
	  $count = 0;
	  $value = !empty($tvout[$tvname]) ? explode("||",$tvout[$tvname]) : array();
	  if(count($value)>0){
      foreach($value as $val){
  	    list($item,$itemvalue) = explode("==",$val);
    	$options .= "\n\t".'<option value="'.$count.'__'.$itemvalue.'"'.$selected.'>'.$item.'</option>';
  	    $count++;
      }
  	  $output .= "\n".'<select name="'.$tvname.'__'.$docid.'">'.$options.'</select>'."\n";
	  }
  break;
  case "label":
	  $otag = $wraptag ? "<$wraptag>" : "";
	  $ctag = $wraptag ? "</$wraptag>" : "";
	  $value = !empty($tvout[$tvname]) ? explode("||",$tvout[$tvname]) : array();
	  $count = 0;
	  foreach($value as $val){
	    list($item,$itemvalue) = explode("==",$val);
	    $output .= "\n".$otag.'<div class="SHKtv" style="display:inline-block;background:#E4F0FA;border:1px solid #FFF;padding:0 4px";margin-right:3px;><label style="cursor:default" for="'.$tvname.$docid.$count.'">'.$item.'</label></div> '.$ctag;
	    $count++;
    }
  break;
}
return $output;
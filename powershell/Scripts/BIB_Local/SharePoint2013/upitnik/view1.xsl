<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ma="http://schemas.microsoft.com/office/2009/metadata/properties/metaAttributes" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dfs="http://schemas.microsoft.com/office/infopath/2003/dataFormSolution" xmlns:my="http://schemas.microsoft.com/office/infopath/2009/WSSList/cmeDataFields" xmlns:d="http://schemas.microsoft.com/office/infopath/2009/WSSList/dataFields" xmlns:pc="http://schemas.microsoft.com/office/infopath/2007/PartnerControls" xmlns:q="http://schemas.microsoft.com/office/infopath/2009/WSSList/queryFields" xmlns:dms="http://schemas.microsoft.com/office/2009/documentManagement/types" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xd="http://schemas.microsoft.com/office/infopath/2003" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:xdExtension="http://schemas.microsoft.com/office/infopath/2003/xslt/extension" xmlns:xdXDocument="http://schemas.microsoft.com/office/infopath/2003/xslt/xDocument" xmlns:xdSolution="http://schemas.microsoft.com/office/infopath/2003/xslt/solution" xmlns:xdFormatting="http://schemas.microsoft.com/office/infopath/2003/xslt/formatting" xmlns:xdImage="http://schemas.microsoft.com/office/infopath/2003/xslt/xImage" xmlns:xdUtil="http://schemas.microsoft.com/office/infopath/2003/xslt/Util" xmlns:xdMath="http://schemas.microsoft.com/office/infopath/2003/xslt/Math" xmlns:xdDate="http://schemas.microsoft.com/office/infopath/2003/xslt/Date" xmlns:sig="http://www.w3.org/2000/09/xmldsig#" xmlns:xdSignatureProperties="http://schemas.microsoft.com/office/infopath/2003/SignatureProperties" xmlns:ipApp="http://schemas.microsoft.com/office/infopath/2006/XPathExtension/ipApp" xmlns:xdEnvironment="http://schemas.microsoft.com/office/infopath/2006/xslt/environment" xmlns:xdUser="http://schemas.microsoft.com/office/infopath/2006/xslt/User" xmlns:xdServerInfo="http://schemas.microsoft.com/office/infopath/2009/xslt/ServerInfo">
	<xsl:output method="html" indent="no"/>
	<xsl:template match="dfs:myFields">
		<html dir="ltr" xmlns:xsf="http://schemas.microsoft.com/office/infopath/2003/solutionDefinition" xmlns:xsf2="http://schemas.microsoft.com/office/infopath/2006/solutionDefinition/extensions" xmlns:xsf3="http://schemas.microsoft.com/office/infopath/2009/solutionDefinition/extensions" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
			<head>
				<meta content="text/html" http-equiv="Content-Type"></meta>
				<style controlStyle="controlStyle">@media screen 			{ 			BODY{margin-left:21px;background-position:21px 0px;} 			} 		BODY{color:windowtext;background-color:window;layout-grid:none;} 		.xdListItem {display:inline-block;width:100%;vertical-align:text-top;} 		.xdListBox,.xdComboBox{margin:1px;} 		.xdInlinePicture{margin:1px; BEHAVIOR: url(#default#urn::xdPicture) } 		.xdLinkedPicture{margin:1px; BEHAVIOR: url(#default#urn::xdPicture) url(#default#urn::controls/Binder) } 		.xdHyperlinkBox{word-wrap:break-word; text-overflow:ellipsis;overflow-x:hidden; OVERFLOW-Y: hidden; WHITE-SPACE:nowrap; display:inline-block;margin:1px;padding:5px;border: 1pt solid #dcdcdc;color:windowtext;BEHAVIOR: url(#default#urn::controls/Binder) url(#default#DataBindingUI)} 		.xdSection{border:1pt solid transparent ;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;} 		.xdRepeatingSection{border:1pt solid transparent;margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;} 		.xdMultiSelectList{margin:1px;display:inline-block; border:1pt solid #dcdcdc; padding:1px 1px 1px 5px; text-indent:0; color:windowtext; background-color:window; overflow:auto; behavior: url(#default#DataBindingUI) url(#default#urn::controls/Binder) url(#default#MultiSelectHelper) url(#default#ScrollableRegion);} 		.xdMultiSelectListItem{display:block;white-space:nowrap}		.xdMultiSelectFillIn{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;overflow:hidden;text-align:left;}		.xdBehavior_Formatting {BEHAVIOR: url(#default#urn::controls/Binder) url(#default#Formatting);} 	 .xdBehavior_FormattingNoBUI{BEHAVIOR: url(#default#CalPopup) url(#default#urn::controls/Binder) url(#default#Formatting);} 	.xdExpressionBox{margin: 1px;padding:1px;word-wrap: break-word;text-overflow: ellipsis;overflow-x:hidden;}.xdBehavior_GhostedText,.xdBehavior_GhostedTextNoBUI{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#TextField) url(#default#GhostedText);}	.xdBehavior_GTFormatting{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#Formatting) url(#default#GhostedText);}	.xdBehavior_GTFormattingNoBUI{BEHAVIOR: url(#default#CalPopup) url(#default#urn::controls/Binder) url(#default#Formatting) url(#default#GhostedText);}	.xdBehavior_Boolean{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#BooleanHelper);}	.xdBehavior_Select{BEHAVIOR: url(#default#urn::controls/Binder) url(#default#SelectHelper);}	.xdBehavior_ComboBox{BEHAVIOR: url(#default#ComboBox)} 	.xdBehavior_ComboBoxTextField{BEHAVIOR: url(#default#ComboBoxTextField);} 	.xdRepeatingTable{BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none; BORDER-COLLAPSE: collapse; WORD-WRAP: break-word;}.xdScrollableRegion{BEHAVIOR: url(#default#ScrollableRegion);} 		.xdLayoutRegion{display:inline-block;} 		.xdMaster{BEHAVIOR: url(#default#MasterHelper);} 		.xdActiveX{margin:1px; BEHAVIOR: url(#default#ActiveX);} 		.xdFileAttachment{display:inline-block;margin:1px;BEHAVIOR:url(#default#urn::xdFileAttachment);} 		.xdSharePointFileAttachment{display:inline-block;margin:2px;BEHAVIOR:url(#default#xdSharePointFileAttachment);} 		.xdAttachItem{display:inline-block;width:100%%;height:25px;margin:1px;BEHAVIOR:url(#default#xdSharePointFileAttachItem);} 		.xdSignatureLine{display:inline-block;margin:1px;background-color:transparent;border:1pt solid transparent;BEHAVIOR:url(#default#SignatureLine);} 		.xdHyperlinkBoxClickable{behavior: url(#default#HyperlinkBox)} 		.xdHyperlinkBoxButtonClickable{border-width:1px;border-style:outset;behavior: url(#default#HyperlinkBoxButton)} 		.xdPictureButton{background-color: transparent; padding: 0px; behavior: url(#default#PictureButton);} 		.xdPageBreak{display: none;}BODY{margin-right:21px;} 		.xdTextBoxRTL{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow:hidden;text-align:right;word-wrap:normal;} 		.xdRichTextBoxRTL{display:inline-block;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow-x:hidden;word-wrap:break-word;text-overflow:ellipsis;text-align:right;font-weight:normal;font-style:normal;text-decoration:none;vertical-align:baseline;} 		.xdDTTextRTL{height:100%;width:100%;margin-left:22px;overflow:hidden;padding:0px;white-space:nowrap;} 		.xdDTButtonRTL{margin-right:-21px;height:17px;width:20px;behavior: url(#default#DTPicker);} 		.xdMultiSelectFillinRTL{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;overflow:hidden;text-align:right;}.xdTextBox{display:inline-block;white-space:nowrap;text-overflow:ellipsis;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow:hidden;text-align:left;word-wrap:normal;} 		.xdRichTextBox{display:inline-block;;padding:1px;margin:1px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow-x:hidden;word-wrap:break-word;text-overflow:ellipsis;text-align:left;font-weight:normal;font-style:normal;text-decoration:none;vertical-align:baseline;} 		.xdDTPicker{;display:inline;margin:1px;margin-bottom: 2px;border: 1pt solid #dcdcdc;color:windowtext;background-color:window;overflow:hidden;text-indent:0; layout-grid: none} 		.xdDTText{height:100%;width:100%;margin-right:22px;overflow:hidden;padding:0px;white-space:nowrap;} 		.xdDTButton{margin-left:-21px;height:17px;width:20px;behavior: url(#default#DTPicker);} 		.xdRepeatingTable TD {VERTICAL-ALIGN: top;}</style>
				<style tableEditor="TableStyleRulesID">TABLE.xdLayout TD {
	BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none
}
TABLE.msoUcTable TD {
	BORDER-TOP: 1pt solid; BORDER-RIGHT: 1pt solid; BORDER-BOTTOM: 1pt solid; BORDER-LEFT: 1pt solid
}
TABLE {
	BEHAVIOR: url (#default#urn::tables/NDTable)
}
</style>
				<style themeStyle="urn:office.microsoft.com:themeOffice">TABLE {
	BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-COLLAPSE: collapse; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none
}
TD {
	BORDER-TOP-COLOR: #d8d8d8; BORDER-LEFT-COLOR: #d8d8d8; BORDER-BOTTOM-COLOR: #d8d8d8; BORDER-RIGHT-COLOR: #d8d8d8
}
TH {
	BORDER-TOP-COLOR: #000000; BORDER-LEFT-COLOR: #000000; COLOR: black; BORDER-BOTTOM-COLOR: #000000; BORDER-RIGHT-COLOR: #000000; BACKGROUND-COLOR: #f2f2f2
}
.xdTableHeader {
	COLOR: black; BACKGROUND-COLOR: #f2f2f2
}
.light1 {
	BACKGROUND-COLOR: #ffffff
}
.dark1 {
	BACKGROUND-COLOR: #000000
}
.light2 {
	BACKGROUND-COLOR: #f6f6f6
}
.dark2 {
	BACKGROUND-COLOR: #182738
}
.accent1 {
	BACKGROUND-COLOR: #0072bc
}
.accent2 {
	BACKGROUND-COLOR: #ec008c
}
.accent3 {
	BACKGROUND-COLOR: #00adee
}
.accent4 {
	BACKGROUND-COLOR: #fd9f08
}
.accent5 {
	BACKGROUND-COLOR: #36b000
}
.accent6 {
	BACKGROUND-COLOR: #fae032
}
</style>
				<style tableStyle="Default">TR.xdTitleRow {
	MIN-HEIGHT: 58px
}
TD.xdTitleCell {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; PADDING-BOTTOM: 6px; PADDING-TOP: 18px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #ffffff
}
TR.xdTitleRowWithHeading {
	MIN-HEIGHT: 58px
}
TD.xdTitleCellWithHeading {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 18px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #ffffff
}
TR.xdTitleRowWithSubHeading {
	MIN-HEIGHT: 58px
}
TD.xdTitleCellWithSubHeading {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 18px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #ffffff
}
TR.xdTitleRowWithOffsetBody {
	MIN-HEIGHT: 58px
}
TD.xdTitleCellWithOffsetBody {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; PADDING-BOTTOM: 6px; PADDING-TOP: 18px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #ffffff
}
TR.xdTitleHeadingRow {
	MIN-HEIGHT: 38px
}
TD.xdTitleHeadingCell {
	BORDER-RIGHT: #d8d8d8 1pt solid; PADDING-BOTTOM: 12px; PADDING-TOP: 0px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #ffffff; valign: top
}
TR.xdTitleSubheadingRow {
	MIN-HEIGHT: 67px
}
TD.xdTitleSubheadingCell {
	BORDER-TOP: #243b56 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; PADDING-BOTTOM: 18px; PADDING-TOP: 8px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #ffffff
}
TD.xdVerticalFill {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid; BACKGROUND-COLOR: #6890be
}
TD.xdTableContentCellWithVerticalOffset {
	BORDER-RIGHT: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 0px; PADDING-TOP: 12px; PADDING-LEFT: 85px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 10px; BACKGROUND-COLOR: #ffffff
}
TR.xdTableContentRow {
	MIN-HEIGHT: 140px
}
TD.xdTableContentCell {
	BORDER-RIGHT: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #ffffff
}
TD.xdTableContentCellWithVerticalFill {
	BORDER-RIGHT: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 1px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 1px; BACKGROUND-COLOR: #ffffff
}
TD.xdTableStyleOneCol {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 22px
}
TR.xdContentRowOneCol {
	MIN-HEIGHT: 45px; valign: center
}
TR.xdHeadingRow {
	MIN-HEIGHT: 36px
}
TD.xdHeadingCell {
	BORDER-BOTTOM: #6890be 1.5pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 6px; PADDING-LEFT: 22px; PADDING-RIGHT: 22px
}
TR.xdSubheadingRow {
	MIN-HEIGHT: 27px
}
TD.xdSubheadingCell {
	BORDER-BOTTOM: #a5a5a5 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 22px
}
TR.xdHeadingRowEmphasis {
	MIN-HEIGHT: 36px
}
TD.xdHeadingCellEmphasis {
	BORDER-BOTTOM: #6890be 1.5pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 6px; PADDING-LEFT: 22px; PADDING-RIGHT: 22px
}
TR.xdSubheadingRowEmphasis {
	MIN-HEIGHT: 27px
}
TD.xdSubheadingCellEmphasis {
	BORDER-BOTTOM: #a5a5a5 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 22px
}
TR.xdTableLabelControlStackedRow {
	MIN-HEIGHT: 45px
}
TD.xdTableLabelControlStackedCellLabel {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 5px
}
TD.xdTableLabelControlStackedCellComponent {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; PADDING-RIGHT: 22px
}
TR.xdTableRow {
	MIN-HEIGHT: 30px
}
TD.xdTableCellLabel {
	PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 5px
}
TD.xdTableCellComponent {
	PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; PADDING-RIGHT: 22px
}
TD.xdTableMiddleCell {
	PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px
}
TR.xdTableEmphasisRow {
	MIN-HEIGHT: 30px
}
TD.xdTableEmphasisCellLabel {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 5px; BACKGROUND-COLOR: #f6f6f6
}
TD.xdTableEmphasisCellComponent {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #f6f6f6
}
TD.xdTableMiddleCellEmphasis {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; PADDING-RIGHT: 5px; BACKGROUND-COLOR: #f6f6f6
}
TR.xdTableOffsetRow {
	MIN-HEIGHT: 30px
}
TD.xdTableOffsetCellLabel {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; PADDING-RIGHT: 5px
}
TD.xdTableOffsetCellComponent {
	BORDER-TOP: #d8d8d8 1pt solid; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #f6f6f6
}
P {
	FONT-SIZE: 10pt; COLOR: #3f3f3f; MARGIN-TOP: 0px
}
H1 {
	MARGIN-BOTTOM: 0px; FONT-SIZE: 22pt; FONT-WEIGHT: normal; COLOR: #3f3f3f; MARGIN-TOP: 0px
}
H2 {
	MARGIN-BOTTOM: 0px; FONT-SIZE: 15pt; FONT-WEIGHT: normal; COLOR: #262626; MARGIN-TOP: 0px
}
H3 {
	MARGIN-BOTTOM: 0px; FONT-SIZE: 12pt; FONT-WEIGHT: bold; COLOR: #3f3f3f; MARGIN-TOP: 0px
}
H4 {
	MARGIN-BOTTOM: 0px; FONT-SIZE: 10pt; FONT-WEIGHT: normal; COLOR: #3f3f3f; MARGIN-TOP: 0px
}
H5 {
	MARGIN-BOTTOM: 0px; FONT-SIZE: 10pt; FONT-WEIGHT: bold; COLOR: #3f3f3f; MARGIN-TOP: 0px
}
H6 {
	MARGIN-BOTTOM: 0px; FONT-SIZE: 10pt; FONT-WEIGHT: normal; COLOR: #3f3f3f; MARGIN-TOP: 0px
}
BODY {
	COLOR: black
}
</style>
				<style languageStyle="languageStyle">BODY {
	FONT-SIZE: 10pt; FONT-FAMILY: Calibri
}
SELECT {
	FONT-SIZE: 10pt; FONT-FAMILY: Calibri
}
TABLE {
	FONT-SIZE: 10pt; FONT-FAMILY: Calibri; TEXT-TRANSFORM: none; FONT-WEIGHT: normal; COLOR: black; FONT-STYLE: normal
}
.optionalPlaceholder {
	FONT-SIZE: 9pt; TEXT-DECORATION: none; FONT-FAMILY: Calibri; FONT-WEIGHT: normal; COLOR: #333333; FONT-STYLE: normal; PADDING-LEFT: 20px; BEHAVIOR: url(#default#xOptional)
}
.langFont {
	FONT-SIZE: 10pt; FONT-FAMILY: Calibri; WIDTH: 150px
}
.defaultInDocUI {
	FONT-SIZE: 9pt; FONT-FAMILY: Calibri
}
.optionalPlaceholder {
	PADDING-RIGHT: 20px
}
</style>
			</head>
			<body style="DIRECTION: ltr">
				<div align="left">
					<table class="xdFormLayout" style="BORDER-TOP-STYLE: none; WORD-WRAP: break-word; WIDTH: 1068px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none">
						<colgroup>
							<col style="WIDTH: 852px"></col>
						</colgroup>
						<colgroup>
							<col style="WIDTH: 46px"></col>
							<col style="WIDTH: 4px"></col>
							<col style="WIDTH: 4px"></col>
							<col style="WIDTH: 39px"></col>
							<col style="WIDTH: 4px"></col>
							<col style="WIDTH: 32px"></col>
							<col style="WIDTH: 31px"></col>
							<col style="WIDTH: 52px"></col>
						</colgroup>
						<colgroup>
							<col style="WIDTH: 4px"></col>
						</colgroup>
						<tbody>
							<tr class="xdTableContentRow" style="MIN-HEIGHT: 4px">
								<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #ffffff 1pt solid; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: #ffffff 1pt solid" class="xdTableContentCell">
									<div>
										<font color="#1a5800" size="3">
											<strong>SinteZa upitnik za opservaciju_mali biznis</strong>
										</font>
									</div>
									<div> </div>
									<div align="center">
										<table class="xdFormLayout xdTableStyleTwoCol" style="BORDER-TOP-STYLE: none; WORD-WRAP: break-word; WIDTH: 851px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; BORDER-BOTTOM-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none">
											<colgroup>
												<col style="WIDTH: 157px"></col>
												<col style="WIDTH: 153px"></col>
												<col style="WIDTH: 78px"></col>
												<col style="WIDTH: 22px"></col>
												<col style="WIDTH: 30px"></col>
												<col style="WIDTH: 19px"></col>
												<col style="WIDTH: 4px"></col>
												<col style="WIDTH: 140px"></col>
												<col style="WIDTH: 246px"></col>
											</colgroup>
											<colgroup>
												<col style="WIDTH: 33px"></col>
											</colgroup>
											<colgroup>
												<col style="WIDTH: 4px"></col>
											</colgroup>
											<colgroup>
												<col style="WIDTH: 4px"></col>
											</colgroup>
											<tbody vAlign="top">
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 33px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 5px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">Period opservacije</span>
														</h4>
													</td>
													<td colSpan="8" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div>Mesec <select title="" class="xdComboBox xdBehavior_Select" style="WIDTH: 113px" size="1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Mesec" xd:CtrlId="CTRL256" xd:xctname="dropdown" xd:boundProp="value" value="" tabIndex="0">
																<xsl:attribute name="value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Mesec"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdXDocument:GetDOM')">
																		<xsl:variable name="val" select="dfs:dataFields/my:SharePointListItem_RW/my:Mesec"/>
																		<xsl:if test="not(xdXDocument:GetDOM(&quot;Choices Data Connection&quot;)/root/Mesec/SharePointListChoice_RW[.=$val] or $val='')">
																			<option selected="selected">
																				<xsl:attribute name="value">
																					<xsl:value-of select="$val"/>
																				</xsl:attribute>
																				<xsl:value-of select="$val"/>
																			</option>
																		</xsl:if>
																		<xsl:for-each select="xdXDocument:GetDOM(&quot;Choices Data Connection&quot;)/root/Mesec/SharePointListChoice_RW">
																			<option>
																				<xsl:attribute name="value">
																					<xsl:value-of select="."/>
																				</xsl:attribute>
																				<xsl:if test="$val=.">
																					<xsl:attribute name="selected">selected</xsl:attribute>
																				</xsl:if>
																				<xsl:value-of select="@DisplayName"/>
																			</option>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<option>
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Mesec"/>
																		</option>
																	</xsl:otherwise>
																</xsl:choose>
															</select>          Godina <select title="" class="xdComboBox xdBehavior_Select" style="WIDTH: 96px" size="1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Godina" xd:CtrlId="CTRL258" xd:xctname="dropdown" xd:boundProp="value" value="" tabIndex="0">
																<xsl:attribute name="value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Godina"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdXDocument:GetDOM')">
																		<xsl:variable name="val" select="dfs:dataFields/my:SharePointListItem_RW/my:Godina"/>
																		<xsl:if test="not(xdXDocument:GetDOM(&quot;Choices Data Connection&quot;)/root/Godina/SharePointListChoice_RW[.=$val] or $val='')">
																			<option selected="selected">
																				<xsl:attribute name="value">
																					<xsl:value-of select="$val"/>
																				</xsl:attribute>
																				<xsl:value-of select="$val"/>
																			</option>
																		</xsl:if>
																		<xsl:for-each select="xdXDocument:GetDOM(&quot;Choices Data Connection&quot;)/root/Godina/SharePointListChoice_RW">
																			<option>
																				<xsl:attribute name="value">
																					<xsl:value-of select="."/>
																				</xsl:attribute>
																				<xsl:if test="$val=.">
																					<xsl:attribute name="selected">selected</xsl:attribute>
																				</xsl:if>
																				<xsl:value-of select="@DisplayName"/>
																			</option>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<option>
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Godina"/>
																		</option>
																	</xsl:otherwise>
																</xsl:choose>
															</select>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-BOTTOM-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 29px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 5px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">Ekspozitura</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div> Šifra                               </div>
														<div><span title="" class="xdTextBox" hideFocus="1" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Ekspozitura" xd:CtrlId="CTRL254" xd:xctname="PlainText" style="HEIGHT: 23px; WIDTH: 54px">
																<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Ekspozitura"/>
															</span><input title="" class="langFont" style="HEIGHT: 24px; WIDTH: 59px; MARGIN: 1px" size="7" type="button" value="Pronadji" xd:CtrlId="CTRL277_4" xd:xctname="Button" tabIndex="0"/>
														</div>
													</td>
													<td colSpan="5" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div>RC</div>
														<div><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:field11" xd:CtrlId="CTRL255" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 23px; WIDTH: 127px; WHITE-SPACE: nowrap; BACKGROUND-COLOR: #f6f6f6">
																<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:field11"/>
															</span>
														</div>
													</td>
													<td colSpan="2" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div>Adresa<br/>
															<select title="" class="xdListBox xdBehavior_Select" style="WIDTH: 100%" size="3" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Adresa" xd:CtrlId="CTRL278" xd:xctname="ListBox" xd:boundProp="value" value="" tabIndex="0">
																<xsl:attribute name="value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Adresa"/>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="function-available('xdXDocument:GetDOM')">
																		<option/>
																		<xsl:variable name="val" select="dfs:dataFields/my:SharePointListItem_RW/my:Adresa"/>
																		<xsl:if test="not(xdXDocument:GetDOM(&quot;Branches&quot;)/dfs:myFields/dfs:dataFields/d:SharePointListItem_RW[d:Title = xdXDocument:get-DOM()/dfs:myFields/dfs:dataFields/my:SharePointListItem_RW/my:Ekspozitura][d:ADDRESS=$val] or $val='')">
																			<option selected="selected">
																				<xsl:attribute name="value">
																					<xsl:value-of select="$val"/>
																				</xsl:attribute>
																				<xsl:value-of select="$val"/>
																			</option>
																		</xsl:if>
																		<xsl:for-each select="xdXDocument:GetDOM(&quot;Branches&quot;)/dfs:myFields/dfs:dataFields/d:SharePointListItem_RW[d:Title = xdXDocument:get-DOM()/dfs:myFields/dfs:dataFields/my:SharePointListItem_RW/my:Ekspozitura]">
																			<option>
																				<xsl:attribute name="value">
																					<xsl:value-of select="d:ADDRESS"/>
																				</xsl:attribute>
																				<xsl:if test="$val=d:ADDRESS">
																					<xsl:attribute name="selected">selected</xsl:attribute>
																				</xsl:if>
																				<xsl:value-of select="d:ADDRESS"/>
																			</option>
																		</xsl:for-each>
																	</xsl:when>
																	<xsl:otherwise>
																		<option>
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Adresa"/>
																		</option>
																	</xsl:otherwise>
																</xsl:choose>
															</select>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-BOTTOM-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 33px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 5px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">Savetnik</span>
														</h4>
													</td>
													<td colSpan="8" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div>
															<object class="xdActiveX" hideFocus="1" style="HEIGHT: 22px; WIDTH: 288px" tabIndex="0" tabStop="true" xd:xctname="{{61e40d31-993d-4777-8fa0-19ca59b6d0bb}}" xd:CtrlId="CTRL249" xd:server="http://portal/sites/SFE/" xd:bindingType="xmlNode" xd:bindingProperty="Value" xd:boundProp="xd:inline" xd:AllowMultiple="false" xd:SharePointGroup="0" xd:SearchPeopleOnly="true" classid="clsid:61e40d31-993d-4777-8fa0-19ca59b6d0bb" contentEditable="false" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Savetnik">
																<xsl:if test="function-available('xdImage:getImageUrl')">
																	<xsl:attribute name="src"><xsl:value-of select="xdImage:getImageUrl(dfs:dataFields/my:SharePointListItem_RW/my:Savetnik)"/></xsl:attribute>
																</xsl:if>
																<param NAME="ButtonFont" VALUE="Calibri,10,0,400,0,0,0"/>
																<param NAME="ButtonText" VALUE=""/>
																<param NAME="DisplayNameXPath" VALUE="pc:DisplayName"/>
																<param NAME="ObjectIdXPath" VALUE="pc:AccountId"/>
																<param NAME="ObjectTypeXPath" VALUE="pc:AccountType"/>
																<param NAME="SiteUrlXPath" VALUE="/Context/@siteUrl"/>
																<param NAME="SiteUrlDataSource" VALUE="Context"/>
																<param NAME="NewNodeTemplate" VALUE="&lt;pc:Person xmlns:pc=&quot;http://schemas.microsoft.com/office/infopath/2007/PartnerControls&quot;&gt;&#xA;	&lt;pc:DisplayName&gt;&lt;/pc:DisplayName&gt;&#xA;	&lt;pc:AccountId&gt;&lt;/pc:AccountId&gt;&#xA;	&lt;pc:AccountType&gt;&lt;/pc:AccountType&gt;&#xA;&lt;/pc:Person&gt;"/>
																<param NAME="BackgroundColor" VALUE="2147483653"/>
																<param NAME="MaxLines" VALUE="4"/>
																<param NAME="Direction" VALUE="0"/>
															</object>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-BOTTOM-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 33px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 5px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">Kouč</span>
														</h4>
													</td>
													<td colSpan="8" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div>
															<object class="xdActiveX" hideFocus="1" style="HEIGHT: 22px; WIDTH: 288px" tabIndex="0" xd:SearchPeopleOnly="true" xd:SharePointGroup="0" xd:AllowMultiple="false" xd:boundProp="xd:inline" xd:bindingProperty="Value" xd:bindingType="xmlNode" xd:server="http://portal/sites/SFE/" xd:CtrlId="CTRL250" xd:xctname="{{61e40d31-993d-4777-8fa0-19ca59b6d0bb}}" tabStop="true" classid="clsid:61e40d31-993d-4777-8fa0-19ca59b6d0bb" contentEditable="false" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Kouc">
																<xsl:if test="function-available('xdImage:getImageUrl')">
																	<xsl:attribute name="src"><xsl:value-of select="xdImage:getImageUrl(dfs:dataFields/my:SharePointListItem_RW/my:Kouc)"/></xsl:attribute>
																</xsl:if>
																<param NAME="ButtonFont" VALUE="Calibri,10,0,400,0,0,0"/>
																<param NAME="ButtonText" VALUE=""/>
																<param NAME="DisplayNameXPath" VALUE="pc:DisplayName"/>
																<param NAME="ObjectIdXPath" VALUE="pc:AccountId"/>
																<param NAME="ObjectTypeXPath" VALUE="pc:AccountType"/>
																<param NAME="SiteUrlXPath" VALUE="/Context/@siteUrl"/>
																<param NAME="SiteUrlDataSource" VALUE="Context"/>
																<param NAME="NewNodeTemplate" VALUE="&lt;pc:Person xmlns:pc=&quot;http://schemas.microsoft.com/office/infopath/2007/PartnerControls&quot;&gt;&#xA;	&lt;pc:DisplayName&gt;&lt;/pc:DisplayName&gt;&#xA;	&lt;pc:AccountId&gt;&lt;/pc:AccountId&gt;&#xA;	&lt;pc:AccountType&gt;&lt;/pc:AccountType&gt;&#xA;&lt;/pc:Person&gt;"/>
																<param NAME="BackgroundColor" VALUE="2147483653"/>
																<param NAME="MaxLines" VALUE="4"/>
																<param NAME="Direction" VALUE="0"/>
															</object>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ; BORDER-BOTTOM-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 33px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 5px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">Opservator</span>
														</h4>
													</td>
													<td colSpan="8" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div>
															<object class="xdActiveX" hideFocus="1" style="HEIGHT: 22px; WIDTH: 288px" tabIndex="0" tabStop="true" xd:xctname="{{61e40d31-993d-4777-8fa0-19ca59b6d0bb}}" xd:CtrlId="CTRL251" xd:server="http://portal/sites/SFE/" xd:bindingType="xmlNode" xd:bindingProperty="Value" xd:boundProp="xd:inline" xd:AllowMultiple="false" xd:SharePointGroup="0" xd:SearchPeopleOnly="false" classid="clsid:61e40d31-993d-4777-8fa0-19ca59b6d0bb" contentEditable="false" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Opservator">
																<xsl:if test="function-available('xdImage:getImageUrl')">
																	<xsl:attribute name="src"><xsl:value-of select="xdImage:getImageUrl(dfs:dataFields/my:SharePointListItem_RW/my:Opservator)"/></xsl:attribute>
																</xsl:if>
																<param NAME="ButtonFont" VALUE="Calibri,10,0,400,0,0,0"/>
																<param NAME="ButtonText" VALUE=""/>
																<param NAME="DisplayNameXPath" VALUE="pc:DisplayName"/>
																<param NAME="ObjectIdXPath" VALUE="pc:AccountId"/>
																<param NAME="ObjectTypeXPath" VALUE="pc:AccountType"/>
																<param NAME="SiteUrlXPath" VALUE="/Context/@siteUrl"/>
																<param NAME="SiteUrlDataSource" VALUE="Context"/>
																<param NAME="NewNodeTemplate" VALUE="&lt;pc:Person xmlns:pc=&quot;http://schemas.microsoft.com/office/infopath/2007/PartnerControls&quot;&gt;&#xA;	&lt;pc:DisplayName&gt;&lt;/pc:DisplayName&gt;&#xA;	&lt;pc:AccountId&gt;&lt;/pc:AccountId&gt;&#xA;	&lt;pc:AccountType&gt;&lt;/pc:AccountType&gt;&#xA;&lt;/pc:Person&gt;"/>
																<param NAME="BackgroundColor" VALUE="2147483653"/>
																<param NAME="MaxLines" VALUE="4"/>
																<param NAME="Direction" VALUE="0"/>
															</object>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-BOTTOM-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 5px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">Segment menadžer</span>
														</h4>
													</td>
													<td colSpan="7" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #f2f2f2 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<object class="xdActiveX" hideFocus="1" style="HEIGHT: 22px; WIDTH: 288px" tabIndex="0" xd:SearchPeopleOnly="true" xd:SharePointGroup="0" xd:AllowMultiple="false" xd:boundProp="xd:inline" xd:bindingProperty="Value" xd:bindingType="xmlNode" xd:server="http://portal/sites/SFE/" xd:CtrlId="CTRL252" xd:xctname="{{61e40d31-993d-4777-8fa0-19ca59b6d0bb}}" tabStop="true" classid="clsid:61e40d31-993d-4777-8fa0-19ca59b6d0bb" contentEditable="false" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SegmentMenadzer">
															<xsl:if test="function-available('xdImage:getImageUrl')">
																<xsl:attribute name="src"><xsl:value-of select="xdImage:getImageUrl(dfs:dataFields/my:SharePointListItem_RW/my:SegmentMenadzer)"/></xsl:attribute>
															</xsl:if>
															<param NAME="ButtonFont" VALUE="Calibri,10,0,400,0,0,0"/>
															<param NAME="ButtonText" VALUE=""/>
															<param NAME="DisplayNameXPath" VALUE="pc:DisplayName"/>
															<param NAME="ObjectIdXPath" VALUE="pc:AccountId"/>
															<param NAME="ObjectTypeXPath" VALUE="pc:AccountType"/>
															<param NAME="SiteUrlXPath" VALUE="/Context/@siteUrl"/>
															<param NAME="SiteUrlDataSource" VALUE="Context"/>
															<param NAME="NewNodeTemplate" VALUE="&lt;pc:Person xmlns:pc=&quot;http://schemas.microsoft.com/office/infopath/2007/PartnerControls&quot;&gt;&#xA;	&lt;pc:DisplayName&gt;&lt;/pc:DisplayName&gt;&#xA;	&lt;pc:AccountId&gt;&lt;/pc:AccountId&gt;&#xA;	&lt;pc:AccountType&gt;&lt;/pc:AccountType&gt;&#xA;&lt;/pc:Person&gt;"/>
															<param NAME="BackgroundColor" VALUE="2147483653"/>
															<param NAME="MaxLines" VALUE="4"/>
															<param NAME="Direction" VALUE="0"/>
														</object>
													</td>
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #f2f2f2 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:Title" xd:CtrlId="CTRL10" xd:xctname="PlainText" xd:disableEditing="yes" style="BORDER-TOP: #f6f6f6 1pt solid; BORDER-RIGHT: #f6f6f6 1pt solid; WIDTH: 100%; WHITE-SPACE: nowrap; BORDER-BOTTOM: #f6f6f6 1pt solid; COLOR: #f6f6f6; BORDER-LEFT: #f6f6f6 1pt solid; BACKGROUND-COLOR: #f6f6f6">
																<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:Title"/>
															</span>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-BOTTOM-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #ffffff 1pt solid; PADDING-RIGHT: 5px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel"></span> </h4>
													</td>
													<td colSpan="7" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #ffffff 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 5px; BORDER-LEFT: #ffffff 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellComponent">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td colSpan="5" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#ffffff" size="3">
																	<strong>UKUPNA OCENA</strong>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="4" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#ffffff">
																	<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_ukupno" xd:CtrlId="CTRL203" xd:xctname="PlainText" xd:disableEditing="yes" style="FONT-SIZE: x-small; HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_ukupno"/>
																		</span>     Max bodova <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_ukupno" xd:CtrlId="CTRL204" xd:xctname="PlainText" xd:disableEditing="yes" style="FONT-SIZE: x-small; HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_ukupno"/>
																		</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" contentEditable="true" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ukupno" xd:CtrlId="CTRL205" xd:xctname="PlainText" xd:boundProp="xd:num" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="FONT-SIZE: x-small; HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ukupno"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ukupno,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ukupno"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span>%</strong>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 4px">
													<td colSpan="5" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #ffffff 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#ffffff">
																	<strong/>
																</font>
															</span> </h4>
													</td>
													<td colSpan="4" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #ffffff 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#ffffff">
																	<strong/>
																</font>
															</span> </h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 18px">
													<td colSpan="5" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#ffffff">
																	<strong>SAVETODAVNI RAZGOVOR</strong>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="4" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#ffffff">
																	<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_savetodavni_razgovor" xd:CtrlId="CTRL179" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_savetodavni_razgovor"/>
																		</span>    Max bodova <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_savetodavni_razgovor" xd:CtrlId="CTRL180" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_savetodavni_razgovor"/>
																		</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_savetodavni_razgovor" xd:CtrlId="CTRL181" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; FONT-WEIGHT: bold; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_savetodavni_razgovor"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_savetodavni_razgovor,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_savetodavni_razgovor"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span> %</strong>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 4px">
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#000000">
																	<strong>1. Prijem i pozdrav</strong>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<span class="xdlabel">
															<font color="#000000">
																<h4 align="right">
																	<strong>Bodovi</strong><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:field8" xd:CtrlId="CTRL65" xd:xctname="PlainText" xd:disableEditing="yes" style="FONT-SIZE: x-small; HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; FONT-WEIGHT: bold; COLOR: #000000; TEXT-ALIGN: right; BORDER-LEFT: #dcdcdc 1pt solid; BACKGROUND-COLOR: #ffffff">
																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:field8"/>
																	</span>     <strong>Max bodova </strong><span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_prijem_i_pozdrav" xd:CtrlId="CTRL155" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; FONT-WEIGHT: bold; TEXT-ALIGN: right; BACKGROUND-COLOR: #ffffff">
																		<xsl:attribute name="xd:num">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_prijem_i_pozdrav"/>
																		</xsl:attribute>
																		<xsl:choose>
																			<xsl:when test="function-available('xdFormatting:formatString')">
																				<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_prijem_i_pozdrav,&quot;number&quot;,&quot;numDigits:auto;negativeOrder:1;&quot;)"/>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_prijem_i_pozdrav"/>
																			</xsl:otherwise>
																		</xsl:choose>
																	</span>    <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prijem_i_pozdrav" xd:CtrlId="CTRL156" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; FONT-WEIGHT: bold; TEXT-ALIGN: right; BACKGROUND-COLOR: #ffffff">
																		<xsl:attribute name="xd:num">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prijem_i_pozdrav"/>
																		</xsl:attribute>
																		<xsl:choose>
																			<xsl:when test="function-available('xdFormatting:formatString')">
																				<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prijem_i_pozdrav,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																			</xsl:when>
																			<xsl:otherwise>
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prijem_i_pozdrav"/>
																			</xsl:otherwise>
																		</xsl:choose>
																	</span> <strong>%</strong>
																</h4>
															</font>
														</span>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 94px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Kako je savetnik pozdravio klijenta?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel"></span> </h4>
														<h4>
															<div>
																<div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0" xd:CtrlId="CTRL70" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Dobar dan, izvolite</div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0" xd:CtrlId="CTRL71" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SApozdrav0=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>
																		<span class="xdlabel">Nije bilo pozdrava</span>
																	</div>
																	<div>
																		<span class="xdlabel"></span> </div>
																</div>
															</div>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 79px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Savetnik  je ponudio klijentu da sedne?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel"></span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje" xd:CtrlId="CTRL35" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje" xd:CtrlId="CTRL36" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAsedenje=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 94px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>Savetnik  se predstavio imenom na početku razgovora?</strong>
																</span>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel"></span>
															</span> </h4>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:field7)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:field7" xd:CtrlId="CTRL38" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:field7"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:field7=&quot;1&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Da, N/A</div>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:field7)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:field7" xd:CtrlId="CTRL39" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:field7"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:field7=&quot;0&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Ne</div>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel"></span>
															</span> </h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 93px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Savetnik je dao klijentu svoj kontakt na vizit karti - papiru (može i na kraju razgovora; nikako na Ponudi)?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel"></span> </h4>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt" xd:CtrlId="CTRL41" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt=&quot;1&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Da</div>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt" xd:CtrlId="CTRL42" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt=&quot;0&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Ne</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 4px">
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>
																		<font color="#000000">2. Komunikacione veštine</font>
																	</strong>
																</span>
															</span>
														</h4>
													</td>
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<span class="xdlabel">
															<font color="#000000">
																<h4 align="right">
																	<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_komunikacione_vestine" xd:CtrlId="CTRL158" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_komunikacione_vestine"/>
																		</span>     Max bodova <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_komunikacione_vestine" xd:CtrlId="CTRL157" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_komunikacione_vestine"/>
																		</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_komunikacione_vestine" xd:CtrlId="CTRL159" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_komunikacione_vestine"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_komunikacione_vestine,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_komunikacione_vestine"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span> %</strong>
																</h4>
															</font>
														</span>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 137px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik je bio uključen u razgovor, slušao je klijenta, njegova pažnja je usmerena na klijenta <br/>(ne gleda sa strane, ne komunicira sa drugim kolegama, ne servisira i druge klijente)*</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje" xd:CtrlId="CTRL44" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje" xd:CtrlId="CTRL45" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAslusanje=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
																<div> </div>
																<div>
																	<em>
																		<font size="1">*dozvoljeno je da na kratko prekine razgovor da bi kratko odgovorio ili usmerio drugog klijenta (ne duže od 1 min)</font>
																	</em>
																</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 94px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik je bio otvoren za komunikaciju, pokazao je inicijativu i želju da  sve objasni klijentu?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa" xd:CtrlId="CTRL47" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa" xd:CtrlId="CTRL48" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAinicijativa=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 79px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik je bio učtiv tokom razgovora (pristojno sedi, persira klijentu)?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost" xd:CtrlId="CTRL51" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Da</div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost" xd:CtrlId="CTRL52" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAuctivost=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Ne</div>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 79px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik govori jasno i razgovetno?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAgovor)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAgovor" xd:CtrlId="CTRL54" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAgovor"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAgovor=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Da</div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAgovor)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAgovor" xd:CtrlId="CTRL55" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAgovor"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAgovor=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Ne</div>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 94px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik gleda u oči klijenta dok razgovara (održava kontakt očima), osim kad unosi podatke u kompjuter?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima" xd:CtrlId="CTRL57" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Da</div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima" xd:CtrlId="CTRL58" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAkontakt_ocima=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Ne</div>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 79px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik pokušava da održi dijalog tokom razgovora, uključuje klijenta u razgovor?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog" xd:CtrlId="CTRL60" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog" xd:CtrlId="CTRL61" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAdijalog=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 94px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik vlada informacijama, daje jasne informacije, ne priseća se, vlada sadržajem o kome priča?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000"></font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije" xd:CtrlId="CTRL63" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije" xd:CtrlId="CTRL64" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAinformacije=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>3. Ispitivanje potreba</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: middle; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Bodovi  <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_ispitivanje_potreba0" xd:CtrlId="CTRL161" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_ispitivanje_potreba0"/>
																		</span>    Max bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_ispitivanje_potreba" xd:CtrlId="CTRL162" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_ispitivanje_potreba"/>
																		</span>    <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ispitivanje_potreba" xd:CtrlId="CTRL163" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ispitivanje_potreba"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ispitivanje_potreba,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_ispitivanje_potreba"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span> %</strong>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 164px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>Da li savetnik kod ispitivanja potreba postavlja adekvatna finansijska pitanja?</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel"></span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba" xd:CtrlId="CTRL75" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba=&quot;1&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>Da</div>
																		<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba" xd:CtrlId="CTRL76" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SA_ispitivanje_potreba=&quot;0&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>Ne</div>
																		<div> </div>
																	</span>
																</font>
															</span>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel"></span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">Neka od pitanja: </span>
														</h4>
														<div>
															<font color="#3f3f3f"></font> </div>
														<div>
															<font color="#3f3f3f" size="2" face="Calibri">Delatnost; Kupci/dobavljači; Dužina saradnje; Šta klijent koristiti od proizvoda/usluga u Intesa banci/drugoj banci; Da li klijent ima druga zaduženja;</font>
														</div>
														<div>
															<font color="#3f3f3f" size="2" face="Calibri"></font> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 164px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>Da li savetnik koristi ostala pitanja za prepoznavanje potreba klijenta? </strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<strong/>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<div>
																			<strong><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala" xd:CtrlId="CTRL275" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																					<xsl:attribute name="xd:value">
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala"/>
																					</xsl:attribute>
																					<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala=&quot;1&quot;">
																						<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																					</xsl:if>
																				</input>
																			</strong>Da</div>
																		<div>
																			<strong><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala" xd:CtrlId="CTRL276" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																					<xsl:attribute name="xd:value">
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala"/>
																					</xsl:attribute>
																					<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAispitivanje_potreba_ostala=&quot;0&quot;">
																						<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																					</xsl:if>
																				</input>
																			</strong>Ne</div>
																		<div> </div>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<font color="#3f3f3f" size="2" face="Calibri">
																<u>Neka od pitanja:</u>
															</font>
														</h4>
														<div>
															<u>
																<font color="#3f3f3f"></font>
															</u> </div>
														<div>
															<font color="#3f3f3f" size="2" face="Calibri">Za koje namene su vam potrebna sredstva; Da li ima sezonalnosti u poslovanju; Visina mesečne rate koja bi odgovarala klijentu kao i rokovi otplate i sl.</font>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>4. Predstavljanje proizvoda</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #d8d8d8" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_predstavljanje_proizvoda" xd:CtrlId="CTRL164" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_predstavljanje_proizvoda"/>
																		</span>    Max bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_predstavljanje_proizvoda" xd:CtrlId="CTRL165" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_predstavljanje_proizvoda"/>
																		</span>    <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_predstavljanje_proizvoda" xd:CtrlId="CTRL166" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_predstavljanje_proizvoda"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_predstavljanje_proizvoda,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_predstavljanje_proizvoda"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span> %</strong>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>Da li je savetnik adekvatno predstavio i naglasio benefite proizvoda i usluga Banke? </strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<strong/>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja" xd:CtrlId="CTRL78" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja=&quot;1&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>Da</div>
																		<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja" xd:CtrlId="CTRL79" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAadekvatna_pitanja=&quot;0&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>Ne</div>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>Da li je savetnik predstavio troškove u vezi proizvoda?</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<strong/>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<div>
																			<strong><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova" xd:CtrlId="CTRL86" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																					<xsl:attribute name="xd:value">
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova"/>
																					</xsl:attribute>
																					<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova=&quot;1&quot;">
																						<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																					</xsl:if>
																				</input>
																			</strong>Da</div>
																		<div>
																			<strong><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova" xd:CtrlId="CTRL87" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																					<xsl:attribute name="xd:value">
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova"/>
																					</xsl:attribute>
																					<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SApredstavljanje_troskova=&quot;0&quot;">
																						<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																					</xsl:if>
																				</input>
																			</strong>Ne</div>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>Benefiti proizvoda, minimum 3 (ne ulazi u ocenu)</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel"></span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<span class="xdlabel">
															<h4><span title="" class="xdTextBox" hideFocus="1" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAbenefiti_proizvoda" xd:CtrlId="CTRL83" xd:xctname="PlainText" style="HEIGHT: 98px; WIDTH: 300px">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAbenefiti_proizvoda"/>
																</span>
															</h4>
														</span>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 27px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>5. Prodajne veštine</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<strong>Bodovi</strong><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_prodajne_vestine" xd:CtrlId="CTRL167" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_prodajne_vestine"/>
																					</span>    <strong>Max bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_prodajne_vestine" xd:CtrlId="CTRL168" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																							<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_prodajne_vestine"/>
																						</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prodajne_vestine" xd:CtrlId="CTRL169" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																							<xsl:attribute name="xd:num">
																								<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prodajne_vestine"/>
																							</xsl:attribute>
																							<xsl:choose>
																								<xsl:when test="function-available('xdFormatting:formatString')">
																									<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prodajne_vestine,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																								</xsl:when>
																								<xsl:otherwise>
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_prodajne_vestine"/>
																								</xsl:otherwise>
																							</xsl:choose>
																						</span> %</strong>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik je naglasio zašto smatra da je ovaj proizvod dobar za klijenta?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong/>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<div>
																						<strong><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu" xd:CtrlId="CTRL89" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																								<xsl:attribute name="xd:value">
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu"/>
																								</xsl:attribute>
																								<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu=&quot;1&quot;">
																									<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																								</xsl:if>
																							</input>
																						</strong>Da</div>
																					<div>
																						<strong><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu" xd:CtrlId="CTRL90" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																								<xsl:attribute name="xd:value">
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu"/>
																								</xsl:attribute>
																								<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAproizvod_dobar_klijentu=&quot;0&quot;">
																									<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																								</xsl:if>
																							</input>
																						</strong>Ne</div>
																					<div> </div>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong/>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik je na kraju rezimirao, pitao klijenta da li je bio jasan i podstakao klijenta da pita ukoliko nešto nije jasno?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong>
																	<font color="#000000"></font>
																</strong>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SArezime)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SArezime" xd:CtrlId="CTRL92" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SArezime"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SArezime=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SArezime)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SArezime" xd:CtrlId="CTRL93" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SArezime"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SArezime=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
																<div> </div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel">
																								<font color="#000000">
																									<strong>6. Inicijativnost i zatvaranje razgovora</strong>
																								</font>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel">
																								<font color="#000000">
																									<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_inicijativnost_i_zatvaran" xd:CtrlId="CTRL170" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap">
																											<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_inicijativnost_i_zatvaran"/>
																										</span>    Max bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_inicijativnost_i_zatvaran" xd:CtrlId="CTRL171" xd:xctname="PlainText" xd:disableEditing="yes" style="MARGIN-BOTTOM: -4px; HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; PADDING-BOTTOM: 0px; TEXT-ALIGN: right">
																											<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_inicijativnost_i_zatvaran"/>
																										</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_inicijativnost_i_zatvaran" xd:CtrlId="CTRL172" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																											<xsl:attribute name="xd:num">
																												<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_inicijativnost_i_zatvaran"/>
																											</xsl:attribute>
																											<xsl:choose>
																												<xsl:when test="function-available('xdFormatting:formatString')">
																													<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_inicijativnost_i_zatvaran,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																												</xsl:when>
																												<xsl:otherwise>
																													<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_inicijativnost_i_zatvaran"/>
																												</xsl:otherwise>
																											</xsl:choose>
																										</span> %</strong>
																								</font>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong>Da li je sastanak uspešno zatvoren? (realizovana prodaja ili zakazan budući sastanak ili dogovoren poziv ili zatvoren bez prodaje ali uz ispunjene kriterijume iz sledećeg pitanja)</strong>
																						</font>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong/>
																						</font>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren" xd:CtrlId="CTRL209" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																								<xsl:attribute name="xd:value">
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren"/>
																								</xsl:attribute>
																								<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren=&quot;1&quot;">
																									<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																								</xsl:if>
																							</input>Da</div>
																						<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren" xd:CtrlId="CTRL210" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																								<xsl:attribute name="xd:value">
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren"/>
																								</xsl:attribute>
																								<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAuspesno_zatvoren=&quot;0&quot;">
																									<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																								</xsl:if>
																							</input>Ne</div>
																						<div> </div>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong>Ukoliko sastanak nije uspešno zatvoren, da li je savetnik adekvatno ispitao klijenta i utvrdio razloge (npr. da li je savetnik pitao klijenta da li  ima ponudu druge banke, šta je to što mu ne odgovara u ponudi Intesa banke i šta je to što bi zadovoljilo njegove potrebe i sl.)</strong>
																						</font>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<strong/>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren" xd:CtrlId="CTRL211" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																								<xsl:attribute name="xd:value">
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren"/>
																								</xsl:attribute>
																								<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren=&quot;1&quot;">
																									<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																								</xsl:if>
																							</input>Da</div>
																						<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren" xd:CtrlId="CTRL212" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																								<xsl:attribute name="xd:value">
																									<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren"/>
																								</xsl:attribute>
																								<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAneuspesno_zatvoren=&quot;0&quot;">
																									<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																								</xsl:if>
																							</input>Ne</div>
																						<div> </div>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<strong>Savetnik je završio razgovor sa "Hvala" i "Doviđenja"?</strong>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<strong/>
																			</span>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAhvala)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAhvala" xd:CtrlId="CTRL213" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																						<xsl:attribute name="xd:value">
																							<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAhvala"/>
																						</xsl:attribute>
																						<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAhvala=&quot;1&quot;">
																							<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																						</xsl:if>
																					</input>Da</div>
																				<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAhvala)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAhvala" xd:CtrlId="CTRL214" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																						<xsl:attribute name="xd:value">
																							<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAhvala"/>
																						</xsl:attribute>
																						<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAhvala=&quot;0&quot;">
																							<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																						</xsl:if>
																					</input>Ne</div>
																				<div> </div>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 30px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<strong>
																						<span class="xdlabel">
																							<font color="#000000">
																								<span class="xdlabel">
																									<font color="#000000">
																										<span class="xdlabel">
																											<font color="#000000">
																												<span class="xdlabel">
																													<font color="#000000">
																														<span class="xdlabel">
																															<strong>
																																<font color="#000000">7. Follow-up</font>
																															</strong>
																														</span>
																													</font>
																												</span>
																											</font>
																										</span>
																									</font>
																								</span>
																							</font>
																						</span>
																					</strong>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<strong>
																						<span class="xdlabel">
																							<font color="#000000">
																								<span class="xdlabel">
																									<font color="#000000">
																										<span class="xdlabel">
																											<font color="#000000">
																												<span class="xdlabel">
																													<font color="#000000">
																														<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_follow_up" xd:CtrlId="CTRL173" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																																<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_follow_up"/>
																															</span>     Max bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_follow_up" xd:CtrlId="CTRL174" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																																<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_follow_up"/>
																															</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_follow_up" xd:CtrlId="CTRL175" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																																<xsl:attribute name="xd:num">
																																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_follow_up"/>
																																</xsl:attribute>
																																<xsl:choose>
																																	<xsl:when test="function-available('xdFormatting:formatString')">
																																		<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_follow_up,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																																	</xsl:when>
																																	<xsl:otherwise>
																																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_follow_up"/>
																																	</xsl:otherwise>
																																</xsl:choose>
																															</span> %</strong>
																													</font>
																												</span>
																											</font>
																										</span>
																									</font>
																								</span>
																							</font>
																						</span>
																					</strong>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Da li je savetnik zatražio od klijenta neki kontakt? </strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel"></span>
															</span> </h4>
														<h4>
															<div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt" xd:CtrlId="CTRL231" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
															</div>
															<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt" xd:CtrlId="CTRL232" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																	<xsl:attribute name="xd:value">
																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt"/>
																	</xsl:attribute>
																	<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAzatrazio_kontakt=&quot;0&quot;">
																		<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																	</xsl:if>
																</input>Ne</div>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Savetnik je rekao da će pozvati klijenta da vidi šta je odlučio osim u slučaju kada je zatvoren prodajni ciklus?</strong>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel"></span>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SArekao)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SArekao" xd:CtrlId="CTRL234" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SArekao"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SArekao=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Da</div>
																	<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SArekao)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SArekao" xd:CtrlId="CTRL235" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SArekao"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SArekao=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>Ne</div>
																</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 29px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>
																		<span class="xdlabel">
																			<font color="#000000">
																				<strong>8. Krosprodaja</strong>
																			</font>
																		</span>
																	</strong>
																</font>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #dddddd" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<strong>Bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_krosprodaja" xd:CtrlId="CTRL176" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_krosprodaja"/>
																		</span>     Max bodovi <span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_krosprodaja" xd:CtrlId="CTRL177" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_krosprodaja"/>
																		</span>     <span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_krosprodaja" xd:CtrlId="CTRL178" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_krosprodaja"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_krosprodaja,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_krosprodaja"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span> %</strong>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<div>
															<h4>
																<span class="xdlabel">
																	<font color="#000000">
																		<span class="xdlabel">
																			<font color="#000000">
																				<span class="xdlabel">
																					<font color="#000000">
																						<span class="xdlabel">
																							<font color="#000000">Krosprodaja – da li je  je službenik tokom razgovora preporučio NEKI DRUGI PROIZVOD?</font>
																						</span>
																					</font>
																				</span>
																			</font>
																		</span>
																	</font>
																</span>
															</h4>
															<h4>
																<span class="xdlabel">
																	<font color="#000000">
																		<span class="xdlabel">
																			<font color="#000000">
																				<span class="xdlabel">
																					<font color="#000000">
																						<span class="xdlabel"></span>
																					</font>
																				</span>
																			</font>
																		</span>
																	</font>
																</span> </h4>
															<h4>
																<span class="xdlabel">
																	<font color="#000000">
																		<span class="xdlabel">
																			<font color="#000000">
																				<span class="xdlabel">
																					<font color="#000000">
																						<span class="xdlabel">
																							<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja" xd:CtrlId="CTRL219" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																									<xsl:attribute name="xd:value">
																										<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja"/>
																									</xsl:attribute>
																									<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja=&quot;1&quot;">
																										<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																									</xsl:if>
																								</input>Da, N/A</div>
																							<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja" xd:CtrlId="CTRL220" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																									<xsl:attribute name="xd:value">
																										<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja"/>
																									</xsl:attribute>
																									<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAkros_prodaja=&quot;0&quot;">
																										<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																									</xsl:if>
																								</input>Ne</div>
																						</span>
																					</font>
																				</span>
																			</font>
																		</span>
																	</font>
																</span>
															</h4>
														</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel">
																								<font color="#000000">
																									<strong>Celokupni komentar sa osvrtom na prodajni still savetnika</strong>
																								</font>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel"></span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel"><span title="" class="xdTextBox" hideFocus="1" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAopsti_utisak" xd:CtrlId="CTRL221" xd:xctname="PlainText" xd:datafmt="&quot;string&quot;,&quot;plainMultiline&quot;" style="WORD-WRAP: break-word; HEIGHT: 111px; WIDTH: 100%; WHITE-SPACE: normal; OVERFLOW-X: auto; OVERFLOW-Y: auto">
																									<xsl:choose>
																										<xsl:when test="function-available('xdFormatting:formatString')">
																											<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SAopsti_utisak,&quot;string&quot;,&quot;plainMultiline&quot;)" disable-output-escaping="yes"/>
																										</xsl:when>
																										<xsl:otherwise>
																											<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAopsti_utisak" disable-output-escaping="yes"/>
																										</xsl:otherwise>
																									</xsl:choose>
																								</span>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 26px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>
																		<span class="xdlabel">
																			<strong>
																				<span class="xdlabel">
																					<strong>
																						<span class="xdlabel">
																							<span class="xdlabel">
																								<span class="xdlabel">
																									<span class="xdlabel">
																										<strong>
																											<font color="#ffffff">TELEFONSKI POZIV</font>
																										</strong>
																									</span>
																								</span>
																							</span>
																						</span>
																					</strong>
																				</span>
																			</strong>
																		</span>
																	</strong>
																</span>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel">
																								<font color="#000000">
																									<strong>
																										<span class="xdlabel">
																											<span class="xdlabel">
																												<span class="xdlabel">
																													<span class="xdlabel">
																														<strong>
																															<font color="#ffffff">Bodovi </font>
																														</strong><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_telefonski_poziv" xd:CtrlId="CTRL182" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																															<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_telefonski_poziv"/>
																														</span>
																														<font color="#ffffff">     <strong>Max bodovi </strong>
																														</font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_telefonski_poziv" xd:CtrlId="CTRL183" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; FONT-WEIGHT: bold; COLOR: #000000; TEXT-ALIGN: right">
																															<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_telefonski_poziv"/>
																														</span>
																														<font color="#ffffff">     </font><span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_telefonski_poziv" xd:CtrlId="CTRL184" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																															<xsl:attribute name="xd:num">
																																<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_telefonski_poziv"/>
																															</xsl:attribute>
																															<xsl:choose>
																																<xsl:when test="function-available('xdFormatting:formatString')">
																																	<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_telefonski_poziv,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																																</xsl:when>
																																<xsl:otherwise>
																																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_telefonski_poziv"/>
																																</xsl:otherwise>
																															</xsl:choose>
																														</span>
																														<font color="#ffffff"> <strong>%</strong>
																														</font>
																													</span>
																												</span>
																											</span>
																										</span>
																									</strong>
																								</font>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Da li savetnik sagledava relevantne informacije o klijentu u fazi pripreme za telefonski poziv  (analiza istorije komunikacije sa klijentom sa posebnim osvrtom na komentare kolega; analiza ponašanja klijenta u smislu da li transakcije pretežno obavlja u ekspozituri ili putem el.kanala i sl)?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel">
																								<font color="#000000">
																									<strong/>
																								</font>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<div>
																								<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije" xd:CtrlId="CTRL114" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																										<xsl:attribute name="xd:value">
																											<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije"/>
																										</xsl:attribute>
																										<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije=&quot;1&quot;">
																											<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																										</xsl:if>
																									</input>
																								</strong>Da</div>
																							<div>
																								<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije" xd:CtrlId="CTRL115" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																										<xsl:attribute name="xd:value">
																											<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije"/>
																										</xsl:attribute>
																										<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SArelev_informacije=&quot;0&quot;">
																											<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																										</xsl:if>
																									</input>
																								</strong>Ne</div>
																							<div> </div>
																						</font>
																					</span>
																				</font>
																			</span>
																		</font>
																	</span>
																</font>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Da li se savetnik predstavio i proverio interes klijenta za nastavak razgovora?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta" xd:CtrlId="CTRL117" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta" xd:CtrlId="CTRL118" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SA_interes_klijenta=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Da li je pojasnio svr</strong>
															</span>
															<span class="xdlabel">
																<strong>hu poziva?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<div>
															<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda" xd:CtrlId="CTRL120" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																	<xsl:attribute name="xd:value">
																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda"/>
																	</xsl:attribute>
																	<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda=&quot;1&quot;">
																		<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																	</xsl:if>
																</input>
															</strong>Da</div>
														<div>
															<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda" xd:CtrlId="CTRL121" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																	<xsl:attribute name="xd:value">
																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda"/>
																	</xsl:attribute>
																	<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAsvrha_proizvoda=&quot;0&quot;">
																		<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																	</xsl:if>
																</input>
															</strong>Ne</div>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Da li je savetnik dogovorio sastanak/sledeći poziv/ili je zabeležio negativan interes?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak" xd:CtrlId="CTRL123" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak" xd:CtrlId="CTRL124" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAdogovorio_sastanak=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 32px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>
																	<font color="#ffffff">PRIPREMA ZA SASTANAK</font>
																</strong>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<strong>
																	<span class="xdlabel">
																		<strong>
																			<font color="#ffffff">Bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_priprema_za_sastanak" xd:CtrlId="CTRL185" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_priprema_za_sastanak"/>
																			</span>
																			<font color="#ffffff">     Max bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_priprema_za_sastanak" xd:CtrlId="CTRL186" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_priprema_za_sastanak"/>
																			</span>
																			<font color="#ffffff">     </font><span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_priprema_za_sastanak" xd:CtrlId="CTRL187" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																				<xsl:attribute name="xd:num">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_priprema_za_sastanak"/>
																				</xsl:attribute>
																				<xsl:choose>
																					<xsl:when test="function-available('xdFormatting:formatString')">
																						<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_priprema_za_sastanak,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																					</xsl:when>
																					<xsl:otherwise>
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_priprema_za_sastanak"/>
																					</xsl:otherwise>
																				</xsl:choose>
																			</span>
																			<font color="#ffffff"> %</font>
																		</strong>
																	</span>
																</strong>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Da li savetnik sagledava relevantne informacije o klijentu u fazi pripreme za sastanak (analiza istorije komunikacije sa klijentom sa posebnim osvrtom na komentare kolega; analiza ponašanja klijenta u smislu da li transakcije pretežno obavlja u ekspozituri ili putem el.kanala i sl)?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div>
																	<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2" xd:CtrlId="CTRL126" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>
																	</strong>Da</div>
																<div>
																	<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2" xd:CtrlId="CTRL127" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SA_rel_informacije2=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>
																	</strong>Ne</div>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>Da li je savetnik unapred pripremio strukturu sastanka i listu pitanja za klijenta?</strong>
																</span>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong/>
																</span>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<div>
																		<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka" xd:CtrlId="CTRL129" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka=&quot;1&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>
																		</strong>Da</div>
																	<div>
																		<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka" xd:CtrlId="CTRL130" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAstruktura_sastanka=&quot;0&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>
																		</strong>Ne</div>
																	<div> </div>
																</span>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 22px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>
																	<span class="xdlabel">
																		<span class="xdlabel">
																			<strong>
																				<font color="#ffffff">POZNAVANJE KAMPANJA I AKTUELNIH DOGAĐAJA</font>
																			</strong>
																		</span>
																	</span>
																</strong>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<strong>
																	<span class="xdlabel">
																		<span class="xdlabel">
																			<strong>
																				<font color="#ffffff">Bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_poznavanje_kampanje" xd:CtrlId="CTRL188" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_poznavanje_kampanje"/>
																				</span>
																				<font color="#ffffff">     Max bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_poznavanje_kampanje" xd:CtrlId="CTRL189" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_poznavanje_kampanje"/>
																				</span>
																				<font color="#ffffff">     </font><span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_kampanje" xd:CtrlId="CTRL190" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																					<xsl:attribute name="xd:num">
																						<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_kampanje"/>
																					</xsl:attribute>
																					<xsl:choose>
																						<xsl:when test="function-available('xdFormatting:formatString')">
																							<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_kampanje,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																						</xsl:when>
																						<xsl:otherwise>
																							<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_kampanje"/>
																						</xsl:otherwise>
																					</xsl:choose>
																				</span>
																				<font color="#ffffff"> %</font>
																			</strong>
																		</span>
																	</span>
																</strong>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<strong>Savetnik zna koje su aktuelne kampanje kao i uslove iz njih?</strong>
															</span>
														</h4>
														<h4 align="left">
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje" xd:CtrlId="CTRL222" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje=&quot;1&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Da</div>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje" xd:CtrlId="CTRL223" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAnaveo_kampanje=&quot;0&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Ne</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Savetnik zna po kom osnovu su Događaji spušteni kroz CR-ISP aplikaciju i radi po njima?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<div>
															<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite" xd:CtrlId="CTRL224" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																	<xsl:attribute name="xd:value">
																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite"/>
																	</xsl:attribute>
																	<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite=&quot;1&quot;">
																		<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																	</xsl:if>
																</input>
															</strong>Da</div>
														<div>
															<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite" xd:CtrlId="CTRL225" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																	<xsl:attribute name="xd:value">
																		<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite"/>
																	</xsl:attribute>
																	<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAnabrojao_benefite=&quot;0&quot;">
																		<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																	</xsl:if>
																</input>
															</strong>Ne</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 29px">
													<td colSpan="4" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>
																	<font color="#ffffff">POZNAVANJE PROIZVODA</font>
																</strong>
															</span>
														</h4>
													</td>
													<td colSpan="5" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>
																		<font color="#ffffff">Bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_poznavanje_proizvoda" xd:CtrlId="CTRL239" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_poznavanje_proizvoda"/>
																		</span>
																		<font color="#ffffff">     Max bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_poznavanje_proizvoda" xd:CtrlId="CTRL240" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_poznavanje_proizvoda"/>
																		</span>
																		<font color="#ffffff">     </font><span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_proizvoda" xd:CtrlId="CTRL241" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_proizvoda"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_proizvoda,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_poznavanje_proizvoda"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span>
																		<font color="#ffffff"> %</font>
																	</strong>
																</span>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Savetnik zna adekvatno da predstavi i da naglasi benefite odabranog proizvoda (opeservator bira proizvod; benefiti i troškovi)?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel"></span>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja" xd:CtrlId="CTRL246" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja=&quot;1&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Da</div>
																<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja" xd:CtrlId="CTRL247" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																		<xsl:attribute name="xd:value">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja"/>
																		</xsl:attribute>
																		<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAadekv_predstavlja=&quot;0&quot;">
																			<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																		</xsl:if>
																	</input>Ne</div>
																<div> </div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Navedite za koji proizvod ste ga pitali i šta su pobrojani benefiti (ne ulazi u ocenjivanje)?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<span class="xdlabel">
															<span class="xdlabel"></span>
															<h4><span title="" class="xdTextBox" hideFocus="1" contentEditable="true" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAproizv_benefiti" xd:CtrlId="CTRL248" xd:xctname="PlainText" xd:datafmt="&quot;string&quot;,&quot;plainMultiline&quot;" style="WORD-WRAP: break-word; HEIGHT: 50px; WIDTH: 100%; WHITE-SPACE: normal">
																	<xsl:choose>
																		<xsl:when test="function-available('xdFormatting:formatString')">
																			<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SAproizv_benefiti,&quot;string&quot;,&quot;plainMultiline&quot;)" disable-output-escaping="yes"/>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAproizv_benefiti" disable-output-escaping="yes"/>
																		</xsl:otherwise>
																	</xsl:choose>
																</span>
															</h4>
															<div> </div>
														</span>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 23px">
													<td colSpan="3" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #1a5800 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="left">
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>
																		<font color="#ffffff">KORIŠĆENJE CR-ISP APLIKACIJE</font>
																	</strong>
																</span>
															</span>
														</h4>
													</td>
													<td colSpan="6" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #1a5800 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: #1a5800" class="xdTableOffsetCellLabel">
														<h4 align="right">
															<span class="xdlabel">
																<span class="xdlabel">
																	<strong>
																		<font color="#ffffff">Bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_crisp" xd:CtrlId="CTRL242" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_SUM_crisp"/>
																		</span>
																		<font color="#ffffff">     Max bodovi </font><span title="" class="xdTextBox" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_crisp" xd:CtrlId="CTRL243" xd:xctname="PlainText" xd:disableEditing="yes" style="HEIGHT: 20px; WIDTH: 25px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_MAX_crisp"/>
																		</span>
																		<font color="#ffffff">     </font><span title="" class="xdTextBox xdBehavior_Formatting" hideFocus="1" tabIndex="-1" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_crisp" xd:CtrlId="CTRL244" xd:xctname="PlainText" xd:boundProp="xd:num" xd:disableEditing="yes" xd:datafmt="&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;" style="HEIGHT: 20px; WIDTH: 45px; WHITE-SPACE: nowrap; COLOR: #000000; TEXT-ALIGN: right">
																			<xsl:attribute name="xd:num">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_crisp"/>
																			</xsl:attribute>
																			<xsl:choose>
																				<xsl:when test="function-available('xdFormatting:formatString')">
																					<xsl:value-of select="xdFormatting:formatString(dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_crisp,&quot;number&quot;,&quot;numDigits:2;negativeOrder:1;&quot;)"/>
																				</xsl:when>
																				<xsl:otherwise>
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SA_PCT_crisp"/>
																				</xsl:otherwise>
																			</xsl:choose>
																		</span>
																		<font color="#ffffff"> %</font>
																	</strong>
																</span>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-TOP-COLOR: ">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong>Da li savetnik koristi CR-ISP aplikaciju redovno?</strong>
																	</span>
																</span>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong/>
																	</span>
																</span>
															</span> </h4>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp" xd:CtrlId="CTRL226" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp=&quot;1&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Da</div>
														<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp" xd:CtrlId="CTRL227" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																<xsl:attribute name="xd:value">
																	<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp"/>
																</xsl:attribute>
																<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAredovnoCrisp=&quot;0&quot;">
																	<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																</xsl:if>
															</input>Ne</div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td>
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 92px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<strong>Da li savetnik prati spuštene Događaje i radi na njima?</strong>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<strong/>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<div>
																	<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost" xd:CtrlId="CTRL228" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost=&quot;1&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>
																	</strong>Da</div>
																<div>
																	<strong><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost" xd:CtrlId="CTRL229" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0" style="FONT-WEIGHT: bold">
																			<xsl:attribute name="xd:value">
																				<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost"/>
																			</xsl:attribute>
																			<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SAzatvara_mogucnost=&quot;0&quot;">
																				<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																			</xsl:if>
																		</input>
																	</strong>Ne</div>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid; BORDER-RIGHT-COLOR: ">
														<div> </div>
													</td>
													<td style="BORDER-BOTTOM: #ffffff 1pt solid">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 86px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong>Da li savetnik unosi sastanke po definisanim pravilima (redovno i pravilno)?</strong>
																	</span>
																</span>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<span class="xdlabel"></span>
																	</span>
																</span>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<div><input title="" class="xdBehavior_Boolean" type="radio" value="on" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0" xd:CtrlId="CTRL260" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="1">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0=&quot;1&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>Da</div>
																		<div><input title="" class="xdBehavior_Boolean" type="radio" value="" name="{generate-id(dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0)}" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0" xd:CtrlId="CTRL261" xd:xctname="OptionButton" xd:boundProp="xd:value" xd:onValue="0">
																				<xsl:attribute name="xd:value">
																					<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0"/>
																				</xsl:attribute>
																				<xsl:if test="dfs:dataFields/my:SharePointListItem_RW/my:SApravilno_unosi0=&quot;0&quot;">
																					<xsl:attribute name="CHECKED">CHECKED</xsl:attribute>
																				</xsl:if>
																			</input>Ne</div>
																	</span>
																</span>
															</span>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel"></span>
																</span>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 106px">
													<td colSpan="9" style="BORDER-TOP: #d8d8d8 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #ffffff 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong>
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong>
																								<span class="xdlabel">
																									<font color="#000000">
																										<strong>
																											<span class="xdlabel">
																												<font color="#000000">
																													<strong>
																														<span class="xdlabel">
																															<span class="xdlabel">
																																<strong>
																																	<font color="#000000">DODATNI KO</font>
																																</strong>
																															</span>
																														</span>
																													</strong>
																												</font>
																											</span>
																										</strong>
																									</font>
																								</span>
																							</strong>
																						</font>
																					</span>
																				</font>
																			</span>
																		</strong>
																	</span>
																</span>
															</span>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong>
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong>
																								<span class="xdlabel">
																									<font color="#000000">
																										<strong>
																											<span class="xdlabel">
																												<font color="#000000">
																													<strong>
																														<span class="xdlabel">
																															<span class="xdlabel">
																																<strong>
																																	<font color="#000000">MENTAR</font>
																																</strong>
																															</span>
																														</span>
																													</strong>
																												</font>
																											</span>
																										</strong>
																									</font>
																								</span>
																							</strong>
																						</font>
																					</span>
																				</font>
																			</span>
																		</strong>
																	</span>
																</span>
															</span>
														</h4>
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong>
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong>
																								<span class="xdlabel">
																									<font color="#000000">
																										<strong>
																											<span class="xdlabel">
																												<font color="#000000">
																													<strong>
																														<span class="xdlabel">
																															<span class="xdlabel"></span>
																														</span>
																													</strong>
																												</font>
																											</span>
																										</strong>
																									</font>
																								</span>
																							</strong>
																						</font>
																					</span>
																				</font>
																			</span>
																		</strong>
																	</span>
																</span>
															</span> </h4>
														<h4>
															<span class="xdlabel">
																<font color="#000000">
																	<span class="xdlabel">
																		<font color="#000000">
																			<strong>
																				<span class="xdlabel">
																					<font color="#000000">
																						<strong>
																							<span class="xdlabel">
																								<font color="#000000">
																									<strong>
																										<span class="xdlabel">
																											<span class="xdlabel"><span title="" class="xdTextBox" hideFocus="1" tabIndex="0" xd:binding="dfs:dataFields/my:SharePointListItem_RW/my:SAdodatni_koment2" xd:CtrlId="CTRL238" xd:xctname="PlainText" style="HEIGHT: 96px; WIDTH: 100%">
																													<xsl:value-of select="dfs:dataFields/my:SharePointListItem_RW/my:SAdodatni_koment2"/>
																												</span>
																											</span>
																										</span>
																									</strong>
																								</font>
																							</span>
																						</strong>
																					</font>
																				</span>
																			</strong>
																		</font>
																	</span>
																</font>
															</span>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong>
																			<span class="xdlabel">
																				<font color="#000000">
																					<span class="xdlabel">
																						<font color="#000000">
																							<strong>
																								<span class="xdlabel">
																									<font color="#000000">
																										<strong>
																											<span class="xdlabel">
																												<font color="#000000">
																													<strong>
																														<span class="xdlabel">
																															<span class="xdlabel">
																																<strong>
																																	<font color="#000000"></font>
																																</strong>
																															</span>
																														</span>
																													</strong>
																												</font>
																											</span>
																										</strong>
																									</font>
																								</span>
																							</strong>
																						</font>
																					</span>
																				</font>
																			</span>
																		</strong>
																	</span>
																</span>
															</span>
														</h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
												</tr>
												<tr class="xdTableOffsetRow" style="MIN-HEIGHT: 35px">
													<td colSpan="9" style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #d8d8d8 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #d8d8d8 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #d8d8d8 1pt solid; PADDING-RIGHT: 22px" class="xdTableOffsetCellLabel">
														<h4>
															<span class="xdlabel">
																<span class="xdlabel">
																	<span class="xdlabel">
																		<strong/>
																	</span>
																</span>
															</span> </h4>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #d8d8d8 1pt solid; BACKGROUND-COLOR: #ffffff">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
													<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
														<div> </div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<h4>
										<span class="xdlabel">
											<font color="#000000">
												<span class="xdlabel">
													<font color="#000000">
														<strong>
															<span class="xdlabel">
																<font color="#000000">
																	<strong>
																		<span class="xdlabel">
																			<font color="#000000">
																				<strong/>
																			</font>
																		</span>
																	</strong>
																</font>
															</span>
														</strong>
													</font>
												</span>
											</font>
										</span> </h4>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; VERTICAL-ALIGN: top; BORDER-BOTTOM: #ffffff 1pt solid; PADDING-BOTTOM: 4px; PADDING-TOP: 4px; PADDING-LEFT: 22px; BORDER-LEFT: #ffffff 1pt solid; PADDING-RIGHT: 22px; BACKGROUND-COLOR: transparent" class="xdTableOffsetCellLabel"></td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
									<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
										<div> </div>
									</td>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h4> </h4>
				<h4>
					<span class="xdlabel">
						<font color="#000000">
							<span class="xdlabel"></span>
						</font>
					</span> </h4>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
				<td style="BORDER-TOP: #ffffff 1pt solid; BORDER-RIGHT: #ffffff 1pt solid; BORDER-BOTTOM: #ffffff 1pt solid; BORDER-LEFT: #ffffff 1pt solid">
					<div> </div>
				</td>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

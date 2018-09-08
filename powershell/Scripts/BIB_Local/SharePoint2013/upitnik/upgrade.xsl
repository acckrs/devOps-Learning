<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:dfs="http://schemas.microsoft.com/office/infopath/2003/dataFormSolution" xmlns:d="http://schemas.microsoft.com/office/infopath/2009/WSSList/dataFields" xmlns:pc="http://schemas.microsoft.com/office/infopath/2007/PartnerControls" xmlns:ma="http://schemas.microsoft.com/office/2009/metadata/properties/metaAttributes" xmlns:q="http://schemas.microsoft.com/office/infopath/2009/WSSList/queryFields" xmlns:dms="http://schemas.microsoft.com/office/2009/documentManagement/types" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:my="http://schemas.microsoft.com/office/infopath/2009/WSSList/cmeDataFields" xmlns:xd="http://schemas.microsoft.com/office/infopath/2003" version="1.0">
	<xsl:output encoding="UTF-8" method="xml"/>
	<xsl:template match="/">
		<xsl:copy-of select="processing-instruction() | comment()"/>
		<xsl:choose>
			<xsl:when test="dfs:myFields">
				<xsl:apply-templates select="dfs:myFields" mode="_0"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="var">
					<xsl:element name="dfs:myFields"/>
				</xsl:variable>
				<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_0"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="q:SharePointListItem_RW" mode="_2">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:element name="q:ID">
				<xsl:choose>
					<xsl:when test="q:ID/text()[1]">
						<xsl:copy-of select="q:ID/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Title">
				<xsl:choose>
					<xsl:when test="q:Title/text()[1]">
						<xsl:copy-of select="q:Title/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Author">
				<xsl:choose>
					<xsl:when test="q:Author/text()[1]">
						<xsl:copy-of select="q:Author/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Editor">
				<xsl:choose>
					<xsl:when test="q:Editor/text()[1]">
						<xsl:copy-of select="q:Editor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Modified">
				<xsl:choose>
					<xsl:when test="q:Modified/text()[1]">
						<xsl:copy-of select="q:Modified/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Created">
				<xsl:choose>
					<xsl:when test="q:Created/text()[1]">
						<xsl:copy-of select="q:Created/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAsedenje">
				<xsl:choose>
					<xsl:when test="q:SAsedenje/text()[1]">
						<xsl:copy-of select="q:SAsedenje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:field7">
				<xsl:choose>
					<xsl:when test="q:field7/text()[1]">
						<xsl:copy-of select="q:field7/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAkontakt">
				<xsl:choose>
					<xsl:when test="q:SAkontakt/text()[1]">
						<xsl:copy-of select="q:SAkontakt/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAslusanje">
				<xsl:choose>
					<xsl:when test="q:SAslusanje/text()[1]">
						<xsl:copy-of select="q:SAslusanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAinicijativa">
				<xsl:choose>
					<xsl:when test="q:SAinicijativa/text()[1]">
						<xsl:copy-of select="q:SAinicijativa/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAuctivost">
				<xsl:choose>
					<xsl:when test="q:SAuctivost/text()[1]">
						<xsl:copy-of select="q:SAuctivost/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAgovor">
				<xsl:choose>
					<xsl:when test="q:SAgovor/text()[1]">
						<xsl:copy-of select="q:SAgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAkontakt_ocima">
				<xsl:choose>
					<xsl:when test="q:SAkontakt_ocima/text()[1]">
						<xsl:copy-of select="q:SAkontakt_ocima/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAdijalog">
				<xsl:choose>
					<xsl:when test="q:SAdijalog/text()[1]">
						<xsl:copy-of select="q:SAdijalog/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAinformacije">
				<xsl:choose>
					<xsl:when test="q:SAinformacije/text()[1]">
						<xsl:copy-of select="q:SAinformacije/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:field8">
				<xsl:choose>
					<xsl:when test="q:field8/text()[1]">
						<xsl:copy-of select="q:field8/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SApozdrav0">
				<xsl:choose>
					<xsl:when test="q:SApozdrav0/text()[1]">
						<xsl:copy-of select="q:SApozdrav0/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_komunikaciione_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_komunikaciione_vestine/text()[1]">
						<xsl:copy-of select="q:SA_SUM_komunikaciione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_ispitivanje_potreba">
				<xsl:choose>
					<xsl:when test="q:SA_ispitivanje_potreba/text()[1]">
						<xsl:copy-of select="q:SA_ispitivanje_potreba/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAadekvatna_pitanja">
				<xsl:choose>
					<xsl:when test="q:SAadekvatna_pitanja/text()[1]">
						<xsl:copy-of select="q:SAadekvatna_pitanja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SApredstavljanje_troskova">
				<xsl:choose>
					<xsl:when test="q:SApredstavljanje_troskova/text()[1]">
						<xsl:copy-of select="q:SApredstavljanje_troskova/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAproizvod_dobar_klijentu">
				<xsl:choose>
					<xsl:when test="q:SAproizvod_dobar_klijentu/text()[1]">
						<xsl:copy-of select="q:SAproizvod_dobar_klijentu/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SArezime">
				<xsl:choose>
					<xsl:when test="q:SArezime/text()[1]">
						<xsl:copy-of select="q:SArezime/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAuspesno_zatvoren">
				<xsl:choose>
					<xsl:when test="q:SAuspesno_zatvoren/text()[1]">
						<xsl:copy-of select="q:SAuspesno_zatvoren/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAneuspesno_zatvoren">
				<xsl:choose>
					<xsl:when test="q:SAneuspesno_zatvoren/text()[1]">
						<xsl:copy-of select="q:SAneuspesno_zatvoren/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAhvala">
				<xsl:choose>
					<xsl:when test="q:SAhvala/text()[1]">
						<xsl:copy-of select="q:SAhvala/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAzatrazio_kontakt">
				<xsl:choose>
					<xsl:when test="q:SAzatrazio_kontakt/text()[1]">
						<xsl:copy-of select="q:SAzatrazio_kontakt/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SArekao">
				<xsl:choose>
					<xsl:when test="q:SArekao/text()[1]">
						<xsl:copy-of select="q:SArekao/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAkros_prodaja">
				<xsl:choose>
					<xsl:when test="q:SAkros_prodaja/text()[1]">
						<xsl:copy-of select="q:SAkros_prodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SArelev_informacije">
				<xsl:choose>
					<xsl:when test="q:SArelev_informacije/text()[1]">
						<xsl:copy-of select="q:SArelev_informacije/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_interes_klijenta">
				<xsl:choose>
					<xsl:when test="q:SA_interes_klijenta/text()[1]">
						<xsl:copy-of select="q:SA_interes_klijenta/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAsvrha_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SAsvrha_proizvoda/text()[1]">
						<xsl:copy-of select="q:SAsvrha_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAdogovorio_sastanak">
				<xsl:choose>
					<xsl:when test="q:SAdogovorio_sastanak/text()[1]">
						<xsl:copy-of select="q:SAdogovorio_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_rel_informacije2">
				<xsl:choose>
					<xsl:when test="q:SA_rel_informacije2/text()[1]">
						<xsl:copy-of select="q:SA_rel_informacije2/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAstruktura_sastanka">
				<xsl:choose>
					<xsl:when test="q:SAstruktura_sastanka/text()[1]">
						<xsl:copy-of select="q:SAstruktura_sastanka/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAnaveo_kampanje">
				<xsl:choose>
					<xsl:when test="q:SAnaveo_kampanje/text()[1]">
						<xsl:copy-of select="q:SAnaveo_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAnabrojao_benefite">
				<xsl:choose>
					<xsl:when test="q:SAnabrojao_benefite/text()[1]">
						<xsl:copy-of select="q:SAnabrojao_benefite/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAadekv_predstavlja">
				<xsl:choose>
					<xsl:when test="q:SAadekv_predstavlja/text()[1]">
						<xsl:copy-of select="q:SAadekv_predstavlja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAredovnoCrisp">
				<xsl:choose>
					<xsl:when test="q:SAredovnoCrisp/text()[1]">
						<xsl:copy-of select="q:SAredovnoCrisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAzatvara_mogucnost">
				<xsl:choose>
					<xsl:when test="q:SAzatvara_mogucnost/text()[1]">
						<xsl:copy-of select="q:SAzatvara_mogucnost/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_prijem_i_pozdrav">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_prijem_i_pozdrav/text()[1]">
						<xsl:copy-of select="q:SA_MAX_prijem_i_pozdrav/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_prijem_i_pozdrav">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_prijem_i_pozdrav/text()[1]">
						<xsl:copy-of select="q:SA_PCT_prijem_i_pozdrav/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_komunikacione_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_komunikacione_vestine/text()[1]">
						<xsl:copy-of select="q:SA_MAX_komunikacione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_komunikacione_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_komunikacione_vestine/text()[1]">
						<xsl:copy-of select="q:SA_SUM_komunikacione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_komunikacione_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_komunikacione_vestine/text()[1]">
						<xsl:copy-of select="q:SA_PCT_komunikacione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_ispitivanje_potreba0">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_ispitivanje_potreba0/text()[1]">
						<xsl:copy-of select="q:SA_SUM_ispitivanje_potreba0/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_ispitivanje_potreba">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_ispitivanje_potreba/text()[1]">
						<xsl:copy-of select="q:SA_MAX_ispitivanje_potreba/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_ispitivanje_potreba">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_ispitivanje_potreba/text()[1]">
						<xsl:copy-of select="q:SA_PCT_ispitivanje_potreba/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_predstavljanje_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_predstavljanje_proizvoda/text()[1]">
						<xsl:copy-of select="q:SA_SUM_predstavljanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_predstavljanje_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_predstavljanje_proizvoda/text()[1]">
						<xsl:copy-of select="q:SA_MAX_predstavljanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_predstavljanje_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_predstavljanje_proizvoda/text()[1]">
						<xsl:copy-of select="q:SA_PCT_predstavljanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_prodajne_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_prodajne_vestine/text()[1]">
						<xsl:copy-of select="q:SA_SUM_prodajne_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_prodajne_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_prodajne_vestine/text()[1]">
						<xsl:copy-of select="q:SA_MAX_prodajne_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_prodajne_vestine">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_prodajne_vestine/text()[1]">
						<xsl:copy-of select="q:SA_PCT_prodajne_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_inicijativnost_i_zatvaran">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_inicijativnost_i_zatvaran/text()[1]">
						<xsl:copy-of select="q:SA_SUM_inicijativnost_i_zatvaran/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_inicijativnost_i_zatvaran">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_inicijativnost_i_zatvaran/text()[1]">
						<xsl:copy-of select="q:SA_MAX_inicijativnost_i_zatvaran/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_inicijativnost_i_zatvaran">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_inicijativnost_i_zatvaran/text()[1]">
						<xsl:copy-of select="q:SA_PCT_inicijativnost_i_zatvaran/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_follow_up">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_follow_up/text()[1]">
						<xsl:copy-of select="q:SA_SUM_follow_up/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_follow_up">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_follow_up/text()[1]">
						<xsl:copy-of select="q:SA_MAX_follow_up/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_follow_up">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_follow_up/text()[1]">
						<xsl:copy-of select="q:SA_PCT_follow_up/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_krosprodaja">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_krosprodaja/text()[1]">
						<xsl:copy-of select="q:SA_SUM_krosprodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_krosprodaja">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_krosprodaja/text()[1]">
						<xsl:copy-of select="q:SA_MAX_krosprodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_krosprodaja">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_krosprodaja/text()[1]">
						<xsl:copy-of select="q:SA_PCT_krosprodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_savetodavni_razgovor">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_savetodavni_razgovor/text()[1]">
						<xsl:copy-of select="q:SA_SUM_savetodavni_razgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_savetodavni_razgovor">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_savetodavni_razgovor/text()[1]">
						<xsl:copy-of select="q:SA_MAX_savetodavni_razgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_savetodavni_razgovor">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_savetodavni_razgovor/text()[1]">
						<xsl:copy-of select="q:SA_PCT_savetodavni_razgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_telefonski_poziv">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_telefonski_poziv/text()[1]">
						<xsl:copy-of select="q:SA_SUM_telefonski_poziv/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_telefonski_poziv">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_telefonski_poziv/text()[1]">
						<xsl:copy-of select="q:SA_MAX_telefonski_poziv/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_telefonski_poziv">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_telefonski_poziv/text()[1]">
						<xsl:copy-of select="q:SA_PCT_telefonski_poziv/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_priprema_za_sastanak">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_priprema_za_sastanak/text()[1]">
						<xsl:copy-of select="q:SA_SUM_priprema_za_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_priprema_za_sastanak">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_priprema_za_sastanak/text()[1]">
						<xsl:copy-of select="q:SA_MAX_priprema_za_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_priprema_za_sastanak">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_priprema_za_sastanak/text()[1]">
						<xsl:copy-of select="q:SA_PCT_priprema_za_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_poznavanje_kampanje">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_poznavanje_kampanje/text()[1]">
						<xsl:copy-of select="q:SA_SUM_poznavanje_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_poznavanje_kampanje">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_poznavanje_kampanje/text()[1]">
						<xsl:copy-of select="q:SA_MAX_poznavanje_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_poznavanje_kampanje">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_poznavanje_kampanje/text()[1]">
						<xsl:copy-of select="q:SA_PCT_poznavanje_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_poznavanje_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_poznavanje_proizvoda/text()[1]">
						<xsl:copy-of select="q:SA_SUM_poznavanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_poznavanje_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_poznavanje_proizvoda/text()[1]">
						<xsl:copy-of select="q:SA_MAX_poznavanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_poznavanje_proizvoda">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_poznavanje_proizvoda/text()[1]">
						<xsl:copy-of select="q:SA_PCT_poznavanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_crisp">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_crisp/text()[1]">
						<xsl:copy-of select="q:SA_SUM_crisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_crisp">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_crisp/text()[1]">
						<xsl:copy-of select="q:SA_MAX_crisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_crisp">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_crisp/text()[1]">
						<xsl:copy-of select="q:SA_PCT_crisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SApravilno_unosi0">
				<xsl:choose>
					<xsl:when test="q:SApravilno_unosi0/text()[1]">
						<xsl:copy-of select="q:SApravilno_unosi0/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_SUM_ukupno">
				<xsl:choose>
					<xsl:when test="q:SA_SUM_ukupno/text()[1]">
						<xsl:copy-of select="q:SA_SUM_ukupno/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_MAX_ukupno">
				<xsl:choose>
					<xsl:when test="q:SA_MAX_ukupno/text()[1]">
						<xsl:copy-of select="q:SA_MAX_ukupno/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SA_PCT_ukupno">
				<xsl:choose>
					<xsl:when test="q:SA_PCT_ukupno/text()[1]">
						<xsl:copy-of select="q:SA_PCT_ukupno/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Savetnik">
				<xsl:choose>
					<xsl:when test="q:Savetnik/text()[1]">
						<xsl:copy-of select="q:Savetnik/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Kouc">
				<xsl:choose>
					<xsl:when test="q:Kouc/text()[1]">
						<xsl:copy-of select="q:Kouc/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Opservator">
				<xsl:choose>
					<xsl:when test="q:Opservator/text()[1]">
						<xsl:copy-of select="q:Opservator/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SegmentMenadzer">
				<xsl:choose>
					<xsl:when test="q:SegmentMenadzer/text()[1]">
						<xsl:copy-of select="q:SegmentMenadzer/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Ekspozitura">
				<xsl:choose>
					<xsl:when test="q:Ekspozitura/text()[1]">
						<xsl:copy-of select="q:Ekspozitura/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:field11">
				<xsl:choose>
					<xsl:when test="q:field11/text()[1]">
						<xsl:copy-of select="q:field11/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Mesec">
				<xsl:choose>
					<xsl:when test="q:Mesec/text()[1]">
						<xsl:copy-of select="q:Mesec/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Godina">
				<xsl:choose>
					<xsl:when test="q:Godina/text()[1]">
						<xsl:copy-of select="q:Godina/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:Adresa">
				<xsl:choose>
					<xsl:when test="q:Adresa/text()[1]">
						<xsl:copy-of select="q:Adresa/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="q:SAispitivanje_potreba_ostala">
				<xsl:choose>
					<xsl:when test="q:SAispitivanje_potreba_ostala/text()[1]">
						<xsl:copy-of select="q:SAispitivanje_potreba_ostala/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="dfs:queryFields" mode="_1">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="q:SharePointListItem_RW">
					<xsl:apply-templates select="q:SharePointListItem_RW[1]" mode="_2"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="q:SharePointListItem_RW"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_2"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="pc:Person" mode="_6">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:element name="pc:DisplayName">
				<xsl:copy-of select="pc:DisplayName/text()[1]"/>
			</xsl:element>
			<xsl:element name="pc:AccountId">
				<xsl:copy-of select="pc:AccountId/text()[1]"/>
			</xsl:element>
			<xsl:element name="pc:AccountType">
				<xsl:copy-of select="pc:AccountType/text()[1]"/>
			</xsl:element>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:Author" mode="_5">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="pc:Person">
					<xsl:apply-templates select="pc:Person" mode="_6"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="pc:Person"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_6"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:Editor" mode="_7">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="pc:Person">
					<xsl:apply-templates select="pc:Person" mode="_6"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="pc:Person"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_6"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:Savetnik" mode="_8">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="pc:Person">
					<xsl:apply-templates select="pc:Person" mode="_6"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="pc:Person"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_6"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:Kouc" mode="_9">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="pc:Person">
					<xsl:apply-templates select="pc:Person" mode="_6"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="pc:Person"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_6"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:Opservator" mode="_10">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="pc:Person">
					<xsl:apply-templates select="pc:Person" mode="_6"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="pc:Person"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_6"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:SegmentMenadzer" mode="_11">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="pc:Person">
					<xsl:apply-templates select="pc:Person" mode="_6"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="pc:Person"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_6"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="my:SharePointListItem_RW" mode="_4">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:element name="my:ID">
				<xsl:choose>
					<xsl:when test="my:ID/text()[1]">
						<xsl:copy-of select="my:ID/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:Title">
				<xsl:copy-of select="my:Title/text()[1]"/>
			</xsl:element>
			<xsl:choose>
				<xsl:when test="my:Author">
					<xsl:apply-templates select="my:Author[1]" mode="_5"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:Author"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_5"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="my:Editor">
					<xsl:apply-templates select="my:Editor[1]" mode="_7"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:Editor"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_7"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:element name="my:Modified">
				<xsl:choose>
					<xsl:when test="my:Modified/text()[1]">
						<xsl:copy-of select="my:Modified/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:Created">
				<xsl:choose>
					<xsl:when test="my:Created/text()[1]">
						<xsl:copy-of select="my:Created/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAsedenje">
				<xsl:choose>
					<xsl:when test="my:SAsedenje/text()[1]">
						<xsl:copy-of select="my:SAsedenje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:field7">
				<xsl:choose>
					<xsl:when test="my:field7/text()[1]">
						<xsl:copy-of select="my:field7/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAkontakt">
				<xsl:choose>
					<xsl:when test="my:SAkontakt/text()[1]">
						<xsl:copy-of select="my:SAkontakt/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAslusanje">
				<xsl:choose>
					<xsl:when test="my:SAslusanje/text()[1]">
						<xsl:copy-of select="my:SAslusanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAinicijativa">
				<xsl:choose>
					<xsl:when test="my:SAinicijativa/text()[1]">
						<xsl:copy-of select="my:SAinicijativa/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAuctivost">
				<xsl:choose>
					<xsl:when test="my:SAuctivost/text()[1]">
						<xsl:copy-of select="my:SAuctivost/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAgovor">
				<xsl:choose>
					<xsl:when test="my:SAgovor/text()[1]">
						<xsl:copy-of select="my:SAgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAkontakt_ocima">
				<xsl:choose>
					<xsl:when test="my:SAkontakt_ocima/text()[1]">
						<xsl:copy-of select="my:SAkontakt_ocima/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAdijalog">
				<xsl:choose>
					<xsl:when test="my:SAdijalog/text()[1]">
						<xsl:copy-of select="my:SAdijalog/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAinformacije">
				<xsl:choose>
					<xsl:when test="my:SAinformacije/text()[1]">
						<xsl:copy-of select="my:SAinformacije/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:field8">
				<xsl:choose>
					<xsl:when test="my:field8/text()[1]">
						<xsl:copy-of select="my:field8/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SApozdrav0">
				<xsl:choose>
					<xsl:when test="my:SApozdrav0/text()[1]">
						<xsl:copy-of select="my:SApozdrav0/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_komunikaciione_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_komunikaciione_vestine/text()[1]">
						<xsl:copy-of select="my:SA_SUM_komunikaciione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_ispitivanje_potreba">
				<xsl:choose>
					<xsl:when test="my:SA_ispitivanje_potreba/text()[1]">
						<xsl:copy-of select="my:SA_ispitivanje_potreba/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAadekvatna_pitanja">
				<xsl:choose>
					<xsl:when test="my:SAadekvatna_pitanja/text()[1]">
						<xsl:copy-of select="my:SAadekvatna_pitanja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAbenefiti_proizvoda">
				<xsl:copy-of select="my:SAbenefiti_proizvoda/text()[1]"/>
			</xsl:element>
			<xsl:element name="my:SApredstavljanje_troskova">
				<xsl:choose>
					<xsl:when test="my:SApredstavljanje_troskova/text()[1]">
						<xsl:copy-of select="my:SApredstavljanje_troskova/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAproizvod_dobar_klijentu">
				<xsl:choose>
					<xsl:when test="my:SAproizvod_dobar_klijentu/text()[1]">
						<xsl:copy-of select="my:SAproizvod_dobar_klijentu/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SArezime">
				<xsl:choose>
					<xsl:when test="my:SArezime/text()[1]">
						<xsl:copy-of select="my:SArezime/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAuspesno_zatvoren">
				<xsl:choose>
					<xsl:when test="my:SAuspesno_zatvoren/text()[1]">
						<xsl:copy-of select="my:SAuspesno_zatvoren/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAneuspesno_zatvoren">
				<xsl:choose>
					<xsl:when test="my:SAneuspesno_zatvoren/text()[1]">
						<xsl:copy-of select="my:SAneuspesno_zatvoren/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAhvala">
				<xsl:choose>
					<xsl:when test="my:SAhvala/text()[1]">
						<xsl:copy-of select="my:SAhvala/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAzatrazio_kontakt">
				<xsl:choose>
					<xsl:when test="my:SAzatrazio_kontakt/text()[1]">
						<xsl:copy-of select="my:SAzatrazio_kontakt/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SArekao">
				<xsl:choose>
					<xsl:when test="my:SArekao/text()[1]">
						<xsl:copy-of select="my:SArekao/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAkros_prodaja">
				<xsl:choose>
					<xsl:when test="my:SAkros_prodaja/text()[1]">
						<xsl:copy-of select="my:SAkros_prodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAopsti_utisak">
				<xsl:copy-of select="my:SAopsti_utisak/text()[1]"/>
			</xsl:element>
			<xsl:element name="my:SArelev_informacije">
				<xsl:choose>
					<xsl:when test="my:SArelev_informacije/text()[1]">
						<xsl:copy-of select="my:SArelev_informacije/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_interes_klijenta">
				<xsl:choose>
					<xsl:when test="my:SA_interes_klijenta/text()[1]">
						<xsl:copy-of select="my:SA_interes_klijenta/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAsvrha_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SAsvrha_proizvoda/text()[1]">
						<xsl:copy-of select="my:SAsvrha_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAdogovorio_sastanak">
				<xsl:choose>
					<xsl:when test="my:SAdogovorio_sastanak/text()[1]">
						<xsl:copy-of select="my:SAdogovorio_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_rel_informacije2">
				<xsl:choose>
					<xsl:when test="my:SA_rel_informacije2/text()[1]">
						<xsl:copy-of select="my:SA_rel_informacije2/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAstruktura_sastanka">
				<xsl:choose>
					<xsl:when test="my:SAstruktura_sastanka/text()[1]">
						<xsl:copy-of select="my:SAstruktura_sastanka/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAnaveo_kampanje">
				<xsl:choose>
					<xsl:when test="my:SAnaveo_kampanje/text()[1]">
						<xsl:copy-of select="my:SAnaveo_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAnabrojao_benefite">
				<xsl:choose>
					<xsl:when test="my:SAnabrojao_benefite/text()[1]">
						<xsl:copy-of select="my:SAnabrojao_benefite/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAadekv_predstavlja">
				<xsl:choose>
					<xsl:when test="my:SAadekv_predstavlja/text()[1]">
						<xsl:copy-of select="my:SAadekv_predstavlja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAredovnoCrisp">
				<xsl:choose>
					<xsl:when test="my:SAredovnoCrisp/text()[1]">
						<xsl:copy-of select="my:SAredovnoCrisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAproizv_benefiti">
				<xsl:copy-of select="my:SAproizv_benefiti/text()[1]"/>
			</xsl:element>
			<xsl:element name="my:SAzatvara_mogucnost">
				<xsl:choose>
					<xsl:when test="my:SAzatvara_mogucnost/text()[1]">
						<xsl:copy-of select="my:SAzatvara_mogucnost/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SAdodatni_koment2">
				<xsl:copy-of select="my:SAdodatni_koment2/text()[1]"/>
			</xsl:element>
			<xsl:element name="my:SA_MAX_prijem_i_pozdrav">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_prijem_i_pozdrav/text()[1]">
						<xsl:copy-of select="my:SA_MAX_prijem_i_pozdrav/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>4</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_prijem_i_pozdrav">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_prijem_i_pozdrav/text()[1]">
						<xsl:copy-of select="my:SA_PCT_prijem_i_pozdrav/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_komunikacione_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_komunikacione_vestine/text()[1]">
						<xsl:copy-of select="my:SA_MAX_komunikacione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>7</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_komunikacione_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_komunikacione_vestine/text()[1]">
						<xsl:copy-of select="my:SA_SUM_komunikacione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_komunikacione_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_komunikacione_vestine/text()[1]">
						<xsl:copy-of select="my:SA_PCT_komunikacione_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_ispitivanje_potreba0">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_ispitivanje_potreba0/text()[1]">
						<xsl:copy-of select="my:SA_SUM_ispitivanje_potreba0/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_ispitivanje_potreba">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_ispitivanje_potreba/text()[1]">
						<xsl:copy-of select="my:SA_MAX_ispitivanje_potreba/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_ispitivanje_potreba">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_ispitivanje_potreba/text()[1]">
						<xsl:copy-of select="my:SA_PCT_ispitivanje_potreba/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_predstavljanje_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_predstavljanje_proizvoda/text()[1]">
						<xsl:copy-of select="my:SA_SUM_predstavljanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_predstavljanje_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_predstavljanje_proizvoda/text()[1]">
						<xsl:copy-of select="my:SA_MAX_predstavljanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_predstavljanje_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_predstavljanje_proizvoda/text()[1]">
						<xsl:copy-of select="my:SA_PCT_predstavljanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_prodajne_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_prodajne_vestine/text()[1]">
						<xsl:copy-of select="my:SA_SUM_prodajne_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_prodajne_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_prodajne_vestine/text()[1]">
						<xsl:copy-of select="my:SA_MAX_prodajne_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_prodajne_vestine">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_prodajne_vestine/text()[1]">
						<xsl:copy-of select="my:SA_PCT_prodajne_vestine/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_inicijativnost_i_zatvaran">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_inicijativnost_i_zatvaran/text()[1]">
						<xsl:copy-of select="my:SA_SUM_inicijativnost_i_zatvaran/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_inicijativnost_i_zatvaran">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_inicijativnost_i_zatvaran/text()[1]">
						<xsl:copy-of select="my:SA_MAX_inicijativnost_i_zatvaran/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>3</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_inicijativnost_i_zatvaran">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_inicijativnost_i_zatvaran/text()[1]">
						<xsl:copy-of select="my:SA_PCT_inicijativnost_i_zatvaran/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_follow_up">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_follow_up/text()[1]">
						<xsl:copy-of select="my:SA_SUM_follow_up/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_follow_up">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_follow_up/text()[1]">
						<xsl:copy-of select="my:SA_MAX_follow_up/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_follow_up">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_follow_up/text()[1]">
						<xsl:copy-of select="my:SA_PCT_follow_up/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_krosprodaja">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_krosprodaja/text()[1]">
						<xsl:copy-of select="my:SA_SUM_krosprodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_krosprodaja">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_krosprodaja/text()[1]">
						<xsl:copy-of select="my:SA_MAX_krosprodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>1</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_krosprodaja">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_krosprodaja/text()[1]">
						<xsl:copy-of select="my:SA_PCT_krosprodaja/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_savetodavni_razgovor">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_savetodavni_razgovor/text()[1]">
						<xsl:copy-of select="my:SA_SUM_savetodavni_razgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_savetodavni_razgovor">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_savetodavni_razgovor/text()[1]">
						<xsl:copy-of select="my:SA_MAX_savetodavni_razgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>23</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_savetodavni_razgovor">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_savetodavni_razgovor/text()[1]">
						<xsl:copy-of select="my:SA_PCT_savetodavni_razgovor/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_telefonski_poziv">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_telefonski_poziv/text()[1]">
						<xsl:copy-of select="my:SA_SUM_telefonski_poziv/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_telefonski_poziv">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_telefonski_poziv/text()[1]">
						<xsl:copy-of select="my:SA_MAX_telefonski_poziv/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>4</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_telefonski_poziv">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_telefonski_poziv/text()[1]">
						<xsl:copy-of select="my:SA_PCT_telefonski_poziv/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_priprema_za_sastanak">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_priprema_za_sastanak/text()[1]">
						<xsl:copy-of select="my:SA_SUM_priprema_za_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_priprema_za_sastanak">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_priprema_za_sastanak/text()[1]">
						<xsl:copy-of select="my:SA_MAX_priprema_za_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_priprema_za_sastanak">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_priprema_za_sastanak/text()[1]">
						<xsl:copy-of select="my:SA_PCT_priprema_za_sastanak/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_poznavanje_kampanje">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_poznavanje_kampanje/text()[1]">
						<xsl:copy-of select="my:SA_SUM_poznavanje_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_poznavanje_kampanje">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_poznavanje_kampanje/text()[1]">
						<xsl:copy-of select="my:SA_MAX_poznavanje_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_poznavanje_kampanje">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_poznavanje_kampanje/text()[1]">
						<xsl:copy-of select="my:SA_PCT_poznavanje_kampanje/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_poznavanje_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_poznavanje_proizvoda/text()[1]">
						<xsl:copy-of select="my:SA_SUM_poznavanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_poznavanje_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_poznavanje_proizvoda/text()[1]">
						<xsl:copy-of select="my:SA_MAX_poznavanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>1</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_poznavanje_proizvoda">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_poznavanje_proizvoda/text()[1]">
						<xsl:copy-of select="my:SA_PCT_poznavanje_proizvoda/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_crisp">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_crisp/text()[1]">
						<xsl:copy-of select="my:SA_SUM_crisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_crisp">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_crisp/text()[1]">
						<xsl:copy-of select="my:SA_MAX_crisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>3</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_crisp">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_crisp/text()[1]">
						<xsl:copy-of select="my:SA_PCT_crisp/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SApravilno_unosi0">
				<xsl:choose>
					<xsl:when test="my:SApravilno_unosi0/text()[1]">
						<xsl:copy-of select="my:SApravilno_unosi0/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_SUM_ukupno">
				<xsl:choose>
					<xsl:when test="my:SA_SUM_ukupno/text()[1]">
						<xsl:copy-of select="my:SA_SUM_ukupno/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_MAX_ukupno">
				<xsl:choose>
					<xsl:when test="my:SA_MAX_ukupno/text()[1]">
						<xsl:copy-of select="my:SA_MAX_ukupno/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:SA_PCT_ukupno">
				<xsl:choose>
					<xsl:when test="my:SA_PCT_ukupno/text()[1]">
						<xsl:copy-of select="my:SA_PCT_ukupno/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:choose>
				<xsl:when test="my:Savetnik">
					<xsl:apply-templates select="my:Savetnik[1]" mode="_8"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:Savetnik"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_8"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="my:Kouc">
					<xsl:apply-templates select="my:Kouc[1]" mode="_9"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:Kouc"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_9"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="my:Opservator">
					<xsl:apply-templates select="my:Opservator[1]" mode="_10"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:Opservator"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_10"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="my:SegmentMenadzer">
					<xsl:apply-templates select="my:SegmentMenadzer[1]" mode="_11"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:SegmentMenadzer"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_11"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:element name="my:Ekspozitura">
				<xsl:choose>
					<xsl:when test="my:Ekspozitura">
						<xsl:copy-of select="my:Ekspozitura/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>005</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:field11">
				<xsl:copy-of select="my:field11/text()[1]"/>
			</xsl:element>
			<xsl:element name="my:Mesec">
				<xsl:choose>
					<xsl:when test="my:Mesec">
						<xsl:copy-of select="my:Mesec/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>JAN</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:Godina">
				<xsl:choose>
					<xsl:when test="my:Godina">
						<xsl:copy-of select="my:Godina/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>2016</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
			<xsl:element name="my:Adresa">
				<xsl:copy-of select="my:Adresa/text()[1]"/>
			</xsl:element>
			<xsl:element name="my:SAispitivanje_potreba_ostala">
				<xsl:choose>
					<xsl:when test="my:SAispitivanje_potreba_ostala/text()[1]">
						<xsl:copy-of select="my:SAispitivanje_potreba_ostala/text()[1]"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="xsi:nil">true</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="dfs:dataFields" mode="_3">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="my:SharePointListItem_RW">
					<xsl:apply-templates select="my:SharePointListItem_RW[1]" mode="_4"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="my:SharePointListItem_RW"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_4"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="dfs:myFields" mode="_0">
		<xsl:copy>
			<xsl:copy-of select="@*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'urn:schemas-microsoft-com:xml-msdata' or namespace-uri() = 'urn:schemas-microsoft-com:xml-diffgram-v1']"/>
			<xsl:choose>
				<xsl:when test="dfs:queryFields">
					<xsl:apply-templates select="dfs:queryFields[1]" mode="_1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="dfs:queryFields"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_1"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="dfs:dataFields">
					<xsl:apply-templates select="dfs:dataFields[1]" mode="_3"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="var">
						<xsl:element name="dfs:dataFields"/>
					</xsl:variable>
					<xsl:apply-templates select="msxsl:node-set($var)/*" mode="_3"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:copy-of select="*[namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/adomapping' or namespace-uri() = 'http://schemas.microsoft.com/office/infopath/2003/changeTracking']"/>
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
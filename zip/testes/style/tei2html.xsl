<!DOCTYPE xsl:stylesheet [
<!ENTITY degrees "&#176;">
]>
<!-- 

	Stylesheet to convert TEI to HTML 

	Developed by Jeroen Hellingman <jeroen@bohol.ph>, to be used together with a CSS stylesheet. Please contact me if you have problems with this stylesheet, or have improvements or bug fixes to contribute.

	This stylesheet can be used with the saxon XSL processor.

	Embed this style sheet in the source document using the <?xml-stylesheet type="text/xsl" href="tei2html.xsl"?> processing instruction. This works with IE 6.0 or the latest Mozilla browsers.

	This file is hereby dedicated to the public domain.

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output 
		doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
		doctype-system="http://www.w3.org/TR/html4/loose.dtd"
		method="html" 
		encoding="UTF-8"/>

	<!--====================================================================-->

	<xsl:template match="/">
		<xsl:comment>
			This HTML file has been automatically generated from an XML source, using XSLT. If you find any mistakes, please edit the XML source.
		</xsl:comment>
		<html>
			<head>
				<title><xsl:value-of select="//docTitle"/></title>
				<link href="style/gutenberg.css" rel="stylesheet" type="text/css"/>
				<link href="style/arctic.css" rel="stylesheet" type="text/css"/>
			</head>
			<body>
				<xsl:if test="$strUnitsUsed = 'Both'">
					<xsl:if test="//measure">
						<!-- Overlib support -->
						<script type="text/javascript" language="javascript">
							var ol_fgcolor = "#FFFFD0";
							var ol_bgcolor = "#880000";
						</script>
						<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
						<script type="text/javascript" language="javascript" src="overlib.js"></script> 
					</xsl:if>
				</xsl:if>
				<xsl:if test="1">
					<p>The Project Gutenberg EBook of <i><xsl:value-of select="//titleStmt/title"/></i>, by <b><xsl:value-of select="//titleStmt/author"/></b>.</p>
					<p class="smallprint">This eBook is for the use of anyone anywhere at no cost and with almost no restrictions whatsoever.  You may copy it, give it away or re-use it under the terms of the Project Gutenberg License included with <a href="#license">this eBook</a> or online at <a href='http://www.gutenberg.net/'>www.gutenberg.net</a></p>
					<p class="smallprint">Title: <xsl:value-of select="//titleStmt/title"/></p>
					<p class="smallprint">Author: <xsl:value-of select="//titleStmt/author"/></p>
					<p class="smallprint">Release Date: <xsl:value-of select="//publicationStmt/date"/>
					<xsl:if test="//publicationStmt/idno">
						 [E-Book Number: <xsl:value-of select="//publicationStmt/idno"/>]
					</xsl:if></p>
					<p class="smallprint">Language: 
					<xsl:choose>
						<xsl:when test="/TEI.2/@lang = 'en'">English</xsl:when>
						<xsl:when test="/TEI.2/@lang = 'en-UK'">English (U.K.)</xsl:when>
						<xsl:when test="/TEI.2/@lang = 'en-US'">English (U.S.)</xsl:when>
						<xsl:when test="/TEI.2/@lang = 'de'">German</xsl:when>
						<xsl:when test="/TEI.2/@lang = 'nl'">Dutch</xsl:when>
						<xsl:when test="/TEI.2/@lang = 'nl-1900'">Dutch (old orthography)</xsl:when>
					</xsl:choose>.</p>
					<p class="smallprint">Character set encoding: UTF-8.</p>
					<hr/>
					<p/>
				</xsl:if>
				<xsl:apply-templates/>
				<xsl:if test="1">
					<p/>
					<hr/>
					<p id="smallprint">End of the Project Gutenberg EBook of <i><xsl:value-of select="//titleStmt/title"/></i>, by <b><xsl:value-of select="//titleStmt/author"/></b>.</p>

<p class="smallprint">This file should be named <xsl:value-of select="//publicationStmt/idno"/>-h.html or <xsl:value-of select="//publicationStmt/idno"/>-h.zip</p>

<p class="smallprint">This and all associated files of various formats will be found in:</p>

<p class="smallprint">http://www.gutenberg.net/#/#/#/#/<xsl:value-of select="//publicationStmt/idno"/>/</p>

<p class="smallprint">Produced by <xsl:value-of select="//titleStmt/respStmt/name"/>.</p>

<p class="smallprint">Updated editions will replace the previous one--the old editions will be renamed.</p>

<p class="smallprint">Creating the works from public domain print editions means that no one owns a United States copyright in these works, so the Foundation (and you!) can copy and distribute it in the United States without permission and without paying copyright royalties. Special rules, set forth in the General Terms of Use part of this license, apply to copying and distributing Project Gutenberg&#x2122; electronic works to protect the PROJECT GUTENBERG&#x2122; concept and trademark. Project Gutenberg is a registered trademark, and may not be used if you charge for the eBooks, unless you receive specific permission.  If you do not charge anything for copies of this eBook, complying with the rules is very easy. You may use this eBook for nearly any purpose such as creation of derivative works, reports, performances and research.  They may be modified and printed and given away--you may do practically ANYTHING with public domain eBooks. Redistribution is subject to the trademark license, especially commercial redistribution.</p>

<h2 id="license">THE FULL PROJECT GUTENBERG LICENSE</h2>

<p class="smallprint">PLEASE READ THIS BEFORE YOU DISTRIBUTE OR USE THIS WORK</p>

<p class="smallprint">To protect the Project Gutenberg&#x2122; mission of promoting the free distribution of electronic works, by using or distributing this work (or any other work associated in any way with the phrase "Project Gutenberg"), you agree to comply with all the terms of the Full Project Gutenberg&#x2122; License (available with this file or online at <a href='http://gutenberg.net/license'>http://gutenberg.net/license</a>).</p>

<h3 id="s1" class="smallprint">Section 1.  General Terms of Use and Redistributing Project Gutenberg&#x2122; Electronic Works</h3>

<p id="s1A" class="smallprint">1.A.  By reading or using any part of this Project Gutenberg&#x2122; electronic work, you indicate that you have read, understand, agree to and accept all the terms of this license and intellectual property (trademark/copyright) agreement.  If you do not agree to abide by all the terms of this agreement, you must cease using and return or destroy all copies of Project Gutenberg&#x2122; electronic works in your possession. If you paid a fee for obtaining a copy of or access to a Project Gutenberg&#x2122; electronic work and you do not agree to be bound by the terms of this agreement, you may obtain a refund from the person or entity to whom you paid the fee as set forth in paragraph <a href="#s1E8">1.E.8.</a></p>

<p id="s1B" class="smallprint">1.B.  "Project Gutenberg" is a registered trademark. It may only be used on or associated in any way with an electronic work by people who agree to be bound by the terms of this agreement.  There are a few things that you can do with most Project Gutenberg&#x2122; electronic works even without complying with the full terms of this agreement.  See paragraph <a href="#s1C">1.C</a> below.  There are a lot of things you can do with Project Gutenberg&#x2122; electronic works if you follow the terms of this agreement and help preserve free future access to Project Gutenberg&#x2122; electronic works.  See paragraph <a href="#s1E">1.E</a> below.</p>

<p id="s1C" class="smallprint">1.C.  The Project Gutenberg Literary Archive Foundation ("the Foundation" or PGLAF), owns a compilation copyright in the collection of Project Gutenberg&#x2122; electronic works.  Nearly all the individual works in the collection are in the public domain in the United States.  If an individual work is in the public domain in the United States and you are located in the United States, we do not claim a right to prevent you from copying, distributing, performing, displaying or creating derivative works based on the work as long as all references to Project Gutenberg are removed.  Of course, we hope that you will support the Project Gutenberg&#x2122; mission of promoting free access to electronic works by freely sharing Project Gutenberg&#x2122; works in compliance with the terms of this agreement for keeping the Project Gutenberg&#x2122; name associated with the work.  You can easily comply with the terms of this agreement by keeping this work in the same format with its attached full Project Gutenberg&#x2122; License when you share it without charge with others.</p>

<p id="s1D" class="smallprint">1.D.  The copyright laws of the place where you are located also govern what you can do with this work.  Copyright laws in most countries are in a constant state of change.  If you are outside the United States, check the laws of your country in addition to the terms of this agreement before downloading, copying, displaying, performing, distributing or creating derivative works based on this work or any other Project Gutenberg&#x2122; work.  The Foundation makes no representations concerning the copyright status of any work in any country outside the United States.</p>

<p id="s1E" class="smallprint">1.E.  Unless you have removed all references to Project Gutenberg:</p>

<p id="s1E1" class="smallprint">1.E.1.  The following sentence, with active links to, or other immediate access to, the full Project Gutenberg&#x2122; License must appear prominently whenever any copy of a Project Gutenberg&#x2122; work (any work on which the phrase "Project Gutenberg" appears, or with which the phrase "Project Gutenberg" is associated) is accessed, displayed, performed, viewed, copied or distributed:</p>

<blockquote> <p class="smallprint">This eBook is for the use of anyone anywhere at no cost and with almost no restrictions whatsoever.  You may copy it, give it away or re-use it under the terms of the Project Gutenberg License included with this eBook or online at <a href="http://www.gutenberg.net/">www.gutenberg.net</a>.</p> </blockquote>

<p id="s1E2" class="smallprint">1.E.2.  If an individual Project Gutenberg&#x2122; electronic work is derived from the public domain (does not contain a notice indicating that it is posted with permission of the copyright holder), the work can be copied and distributed to anyone in the United States without paying any fees or charges.  If you are redistributing or providing access to a work with the phrase "Project Gutenberg" associated with or appearing on the work, you must comply either with the requirements of paragraphs 1.E.1 through 1.E.7 or obtain permission for the use of the work and the Project Gutenberg&#x2122; trademark as set forth in paragraphs 1.E.8 or 1.E.9.</p>

<p id="s1E3" class="smallprint">1.E.3.  If an individual Project Gutenberg&#x2122; electronic work is posted with the permission of the copyright holder, your use and distribution must comply with both paragraphs 1.E.1 through 1.E.7 and any additional terms imposed by the copyright holder.  Additional terms will be linked to the Project Gutenberg&#x2122; License for all works posted with the permission of the copyright holder found at the beginning of this work.</p>

<p id="s1E4" class="smallprint">1.E.4.  Do not unlink or detach or remove the full Project Gutenberg&#x2122; License terms from this work, or any files containing a part of this work or any other work associated with Project Gutenberg&#x2122;.</p>

<p id="s1E5" class="smallprint">1.E.5.  Do not copy, display, perform, distribute or redistribute this electronic work, or any part of this electronic work, without prominently displaying the sentence set forth in paragraph <a href="#s1E1">1.E.1</a> with active links or immediate access to the full terms of the Project Gutenberg&#x2122; License.</p>

<p id="s1E6" class="smallprint">1.E.6.  You may convert to and distribute this work in any binary, compressed, marked up, nonproprietary or proprietary form, including any word processing or hypertext form.  However, if you provide access to or distribute copies of a Project Gutenberg&#x2122; work in a format other than "Plain Vanilla ASCII" or other format used in the official version posted on the official Project Gutenberg&#x2122; web site (www.gutenberg.net), you must, at no additional cost, fee or expense to the user, provide a copy, a means of exporting a copy, or a means of obtaining a copy upon request, of the work in its original "Plain Vanilla ASCII" or other form.  Any alternate format must include the full Project Gutenberg&#x2122; License as specified in paragraph <a href="#s1E1">1.E.1</a>.</p>

<p id="s1E7" class="smallprint">1.E.7.  Do not charge a fee for access to, viewing, displaying, performing, copying or distributing any Project Gutenberg&#x2122; works unless you comply with paragraph 1.E.8 or 1.E.9.</p>

<p id="s1E8" class="smallprint">1.E.8.  You may charge a reasonable fee for copies of or providing access to or distributing Project Gutenberg&#x2122; electronic works provided that</p>

<ul>
<li class="smallprint">You pay a royalty fee of 20% of the gross profits you derive from the use of Project Gutenberg&#x2122; works calculated using the method you already use to calculate your applicable taxes.  The fee is owed to the owner of the Project Gutenberg&#x2122; trademark, but he has agreed to donate royalties under this paragraph to the Project Gutenberg Literary Archive Foundation.  Royalty payments must be paid within 60 days following each date on which you prepare (or are legally required to prepare) your periodic tax returns.  Royalty payments should be clearly marked as such and sent to the Project Gutenberg Literary Archive Foundation at the address specified in Section 4, "Information about donations to the Project Gutenberg Literary Archive Foundation."</li>

<li class="smallprint">You provide a full refund of any money paid by a user who notifies you in writing (or by e-mail) within 30 days of receipt that s/he does not agree to the terms of the full Project Gutenberg&#x2122; License.  You must require such a user to return or destroy all copies of the works possessed in a physical medium and discontinue all use of and all access to other copies of Project Gutenberg&#x2122; works.</li>

<li class="smallprint">You provide, in accordance with paragraph <a href="#s1F3">1.F.3</a>, a full refund of any money paid for a work or a replacement copy, if a defect in the electronic work is discovered and reported to you within 90 days of receipt of the work.</li>

<li class="smallprint">You comply with all other terms of this agreement for free distribution of Project Gutenberg&#x2122; works.</li>
</ul>

<p id="s1E9" class="smallprint">1.E.9.  If you wish to charge a fee or distribute a Project Gutenberg&#x2122; electronic work or group of works on different terms than are set forth in this agreement, you must obtain permission in writing from both the Project Gutenberg Literary Archive Foundation and Michael Hart, the owner of the Project Gutenberg&#x2122; trademark.  Contact the Foundation as set forth in <a href="#s3">Section 3</a> below.</p>

<p id="s1F" class="smallprint">1.F.</p>

<p id="s1F1" class="smallprint">1.F.1.  Project Gutenberg volunteers and employees expend considerable effort to identify, do copyright research on, transcribe and proofread public domain works in creating the Project Gutenberg&#x2122; collection.  Despite these efforts, Project Gutenberg&#x2122; electronic works, and the medium on which they may be stored, may contain "Defects," such as, but not limited to, incomplete, inaccurate or corrupt data, transcription errors, a copyright or other intellectual property infringement, a defective or damaged disk or other medium, a computer virus, or computer codes that damage or cannot be read by your equipment.</p>

<p id="s1F2" class="smallprint">1.F.2.  LIMITED WARRANTY, DISCLAIMER OF DAMAGES - Except for the "Right of Replacement or Refund" described in paragraph <a href="#s1F3">1.F.3</a>, the Project Gutenberg Literary Archive Foundation, the owner of the Project Gutenberg&#x2122; trademark, and any other party distributing a Project Gutenberg&#x2122; electronic work under this agreement, disclaim all liability to you for damages, costs and expenses, including legal fees.  YOU AGREE THAT YOU HAVE NO REMEDIES FOR NEGLIGENCE, STRICT LIABILITY, BREACH OF WARRANTY OR BREACH OF CONTRACT EXCEPT THOSE PROVIDED IN PARAGRAPH F3.  YOU AGREE THAT THE FOUNDATION, THE TRADEMARK OWNER, AND ANY DISTRIBUTOR UNDER THIS AGREEMENT WILL NOT BE LIABLE TO YOU FOR ACTUAL, DIRECT, INDIRECT, CONSEQUENTIAL, PUNITIVE OR INCIDENTAL DAMAGES EVEN IF YOU GIVE NOTICE OF THE POSSIBILITY OF SUCH DAMAGE.</p>

<p id="s1F3" class="smallprint">1.F.3.  LIMITED RIGHT OF REPLACEMENT OR REFUND - If you discover a defect in this electronic work within 90 days of receiving it, you can receive a refund of the money (if any) you paid for it by sending a written explanation to the person you received the work from.  If you received the work on a physical medium, you must return the medium with your written explanation.  The person or entity that provided you with the defective work may elect to provide a replacement copy in lieu of a refund.  If you received the work electronically, the person or entity providing it to you may choose to give you a second opportunity to receive the work electronically in lieu of a refund.  If the second copy is also defective, you may demand a refund in writing without further opportunities to fix the problem.</p>

<p id="s1F4" class="smallprint">1.F.4. Except for the limited right of replacement or refund set forth in paragraph 1.F.3, this work is provided to you 'AS-IS," WITH NO OTHER WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTIBILITY OR FITNESS FOR ANY PURPOSE.</p>

<p id="s1F5" class="smallprint">1.F.5. Some states do not allow disclaimers of certain implied warranties or the exclusion or limitation of certain types of damages. If any disclaimer or limitation set forth in this agreement violates the law of the state applicable to this agreement, the agreement shall be interpreted to make the maximum disclaimer or limitation permitted by the applicable state law.  The invalidity or unenforceability of any provision of this agreement shall not void the remaining provisions.</p>

<p id="s1F6" class="smallprint">1.F.6. INDEMNITY - You agree to indemnify and hold the Foundation, the trademark owner, any agent or employee of the Foundation, anyone providing copies of Project Gutenberg&#x2122; electronic works in accordance with this agreement, and any volunteers associated with the production, promotion and distribution of Project Gutenberg&#x2122; electronic works, harmless from all liability, costs and expenses, including legal fees, that arise directly or indirectly from any of the following which you do or cause to occur: (<i>a</i>) distribution of this or any Project Gutenberg&#x2122; work, (<i>b</i>) alteration, modification, or additions or deletions to any Project Gutenberg&#x2122; work, and (<i>c</i>) any Defect you cause.</p>


<h3 id="s2">Section  2.  Information about the Mission of Project Gutenberg&#x2122;</h3>

<p class="smallprint">Project Gutenberg&#x2122; is synonymous with the free distribution of electronic works in formats readable by the widest variety of computers including obsolete, old, middle-aged and new computers.  It exists because of the efforts of hundreds of volunteers and donations from people in all walks of life.</p>

<p class="smallprint">Volunteers and financial support to provide volunteers with the assistance they need, is critical to reaching Project Gutenberg&#x2122;'s goals and ensuring that the Project Gutenberg&#x2122; collection will remain freely available for generations to come.  In 2001, the Project Gutenberg Literary Archive Foundation was created to provide a secure and permanent future for Project Gutenberg&#x2122; and future generations. To learn more about the Project Gutenberg Literary Archive Foundation and how your efforts and donations can help, see Sections 3 and 4 and the Foundation web page at <a href="http://www.pglaf.org/">http://www.pglaf.org</a>.</p>


<h3 id="s3">Section 3.  Information about the Project Gutenberg Literary Archive Foundation</h3>

<p class="smallprint">The Project Gutenberg Literary Archive Foundation is a non profit 501(c)(3) educational corporation organized under the laws of the state of Mississippi and granted tax exempt status by the Internal Revenue Service.  The Foundation's EIN or federal tax identification number is 64-6221541.  Its 501(c)(3) letter is posted at <a href="http://pglaf.org/fundraising">http://pglaf.org/fundraising</a>.  Contributions to the Project Gutenberg Literary Archive Foundation are tax deductible to the full extent permitted by U.S. federal laws and your state's laws.</p>

<p class="smallprint">The Foundation's principal office is located at 4557 Melan Dr. S. Fairbanks, AK, 99712., but its volunteers and employees are scattered throughout numerous locations.  Its business office is located at 809 North 1500 West, Salt Lake City, UT 84116, (801) 596-1887, email business@pglaf.org.  Email contact links and up to date contact information can be found at the Foundation's web site and official page at <a href="http://pglaf.org/">http://pglaf.org</a>.</p>

<p class="smallprint">For additional contact information:</p>

<blockquote>
<p class="smallprint">Dr. Gregory B. Newby
<br/>Chief Executive and Director
<br/><a href="mailto:gbnewby@pglaf.org">gbnewby@pglaf.org</a></p>
</blockquote>
	
<h3 id="s4">Section 4.  Information about Donations to the Project Gutenberg Literary Archive Foundation</h3>

<p class="smallprint">Project Gutenberg&#x2122; depends upon and cannot survive without wide spread public support and donations to carry out its mission of increasing the number of public domain and licensed works that can be freely distributed in machine readable form accessible by the widest array of equipment including outdated equipment.  Many small donations ($1 to $5,000) are particularly important to maintaining tax exempt status with the IRS.</p>

<p class="smallprint">The Foundation is committed to complying with the laws regulating charities and charitable donations in all 50 states of the United States.  Compliance requirements are not uniform and it takes a considerable effort, much paperwork and many fees to meet and keep up with these requirements.  We do not solicit donations in locations where we have not received written confirmation of compliance.  To SEND DONATIONS or determine the status of compliance for any particular state visit <a href="http://pglaf.org/">http://pglaf.org</a>.</p>

<p class="smallprint">While we cannot and do not solicit contributions from states where we have not met the solicitation requirements, we know of no prohibition against accepting unsolicited donations from donors in such states who approach us with offers to donate.</p>

<p class="smallprint">International donations are gratefully accepted, but we cannot make any statements concerning tax treatment of donations received from outside the United States.  U.S. laws alone swamp our small staff.</p>

<p class="smallprint">Please check the Project Gutenberg Web pages for current donation methods and addresses.  Donations are accepted in a number of other ways including including checks, online payments and credit card donations.  To donate, please visit: <a href="http://pglaf.org/donate">http://pglaf.org/donate</a>.</p>

<h3 id="s5">Section 5.  General Information About Project Gutenberg&#x2122; Electronic Works.</h3>

<p class="smallprint">Professor Michael S. Hart is the originator of the Project Gutenberg&#x2122; concept of a library of electronic works that could be freely shared with anyone.  For thirty years, he produced and distributed Project Gutenberg&#x2122; eBooks with only a loose network of volunteer support.</p>

<p class="smallprint">Project Gutenberg&#x2122; eBooks are often created from several printed editions, all of which are confirmed as Public Domain in the U.S. unless a copyright notice is included.  Thus, we do not necessarily keep eBooks in compliance with any particular paper edition.</p>

<p class="smallprint">Each eBook is in a subdirectory of the same number as the eBook's eBook number, often in several formats including plain vanilla ASCII, compressed (zipped), HTML and others.</p>

<p class="smallprint">Corrected EDITIONS of our eBooks replace the old file and take over the old filename and etext number.  The replaced older file is renamed. VERSIONS based on separate sources are treated as new eBooks receiving new filenames and etext numbers.</p>

<p class="smallprint">Most people start at our Web site which has the main PG search facility:</p>

<blockquote>
<p class="smallprint"><a href="http://www.gutenberg.net/">http://www.gutenberg.net</a></p>
</blockquote>

<p class="smallprint">This Web site includes information about Project Gutenberg&#x2122;, including how to make donations to the Project Gutenberg Literary Archive Foundation, how to help produce our new eBooks, and how to subscribe to our email newsletter to hear about new eBooks.</p>

<p class="smallprint">EBooks posted prior to November 2003, with eBook numbers BELOW #10000, are filed in directories based on their release date.  If you want to download any of these eBooks directly, rather than using the regular search system you may utilize the following addresses and just download by the etext year.</p>

<blockquote>
<p class="smallprint">http://www.ibiblio.org/gutenberg/etext06</p>

<p class="smallprint">(Or /etext 05, 04, 03, 02, 01, 00, 99,
98, 97, 96, 95, 94, 93, 92, 92, 91 or 90)</p>
</blockquote>

<p class="smallprint">EBooks posted since November 2003, with etext numbers OVER #10000, are filed in a different way.  The year of a release date is no longer part of the directory path.  The path is based on the etext number (which is identical to the filename).  The path to the file is made up of single digits corresponding to all but the last digit in the filename.  For example an eBook of filename 10234 would be found at:</p>

<blockquote>
<p class="smallprint">http://www.gutenberg.net/1/0/2/3/10234</p>
</blockquote>

<p class="smallprint">or filename 24689 would be found at:</p>

<blockquote>
<p class="smallprint">http://www.gutenberg.net/2/4/6/8/24689</p>
</blockquote>

<p class="smallprint">An alternative method of locating eBooks:</p>

<blockquote>
<p class="smallprint">http://www.gutenberg.net/GUTINDEX.ALL</p>
</blockquote>

				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<!--====================================================================-->
	<!-- TEI Header -->

	<!-- Suppress the header in the output -->

	<xsl:template match="teiHeader"/>	

	<!--====================================================================-->
	<!-- Title Page -->

	<xsl:template match="titlePage">	
		<xsl:apply-templates mode="titlePage"/>
	</xsl:template>

	<xsl:template match="docTitle" mode="titlePage">
		<h1 class="docTitle">
			<xsl:apply-templates mode="titlePage"/>
		</h1>
	</xsl:template>

	<xsl:template match="byline" mode="titlePage">
		<h2 class="byline">
			<xsl:apply-templates mode="titlePage"/>
		</h2>
	</xsl:template>

	<!--====================================================================-->
	<!-- Corrections -->

	<xsl:template match="corr">
		<xsl:apply-templates/>		
	</xsl:template>

	<!--====================================================================-->
	<!-- Cross References -->
	
	<!-- Only use generated ID's to avoid clashes of original with generated ID's. Note that the target id generated here should also be generated on the element being referenced. We cannot use the id() function here, since we do not use a DTD. -->

	<xsl:template match="ref[@target]">
		<xsl:variable name="target" select="./@target"/>
		<a href="#{generate-id(//*[@id=$target])}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<!--====================================================================-->
	<!-- Page Breaks -->

	<xsl:template match="pb">
		<span id="{generate-id()}" class="pageno">
			<xsl:if test="@n">
				<xsl:value-of select="$strPage"/><xsl:text> </xsl:text><xsl:value-of select="@n"/>
			</xsl:if>
		</span>
	</xsl:template>

	<!--====================================================================-->
	<!-- Table of Contents -->
	<!-- Take care only to generate ToC entries for divisions of the main text, not for those in quoted texts -->

	<xsl:template match="divGen[@type='toc']">
		<h1><xsl:value-of select="$strTableOfContents"/></h1>
		<ul>
			<xsl:apply-templates mode="gentoc" select="/TEI.2/text/front/div1"/>
			<xsl:choose>
				<xsl:when test="/TEI.2/text/body/div0">
					<xsl:apply-templates mode="gentoc" select="/TEI.2/text/body/div0"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates mode="gentoc" select="/TEI.2/text/body/div1"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates mode="gentoc" select="/TEI.2/text/back/div1"/>
		</ul>
	</xsl:template>

	<xsl:template match="div0" mode="gentoc">
		<xsl:if test="head">
			<li>
				<a href="#{generate-id()}">
				<xsl:choose>
					<xsl:when test="@type='part'">
						<xsl:value-of select="$strPart"/><xsl:text> </xsl:text><xsl:value-of select="./@n"/>:<xsl:text> </xsl:text>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="head" mode="tochead"/></a>
				<xsl:if test="div1">
					<ul>
						<xsl:apply-templates select="div1" mode="gentoc"/>
					</ul>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="div1" mode="gentoc">
		<xsl:if test="head">
			<li>
				<a href="#{generate-id()}">
				<xsl:choose>
					<xsl:when test="@type='chapter'">
						<xsl:value-of select="$strChapter"/><xsl:text> </xsl:text><xsl:value-of select="./@n"/>:<xsl:text> </xsl:text>
					</xsl:when>
					<xsl:when test="@type='appendix'">
						Appendix <xsl:value-of select="./@n"/>:<xsl:text> </xsl:text>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates select="head" mode="tochead"/></a>
				<xsl:if test="div2">
					<ul>
						<xsl:apply-templates select="div2" mode="gentoc"/>
					</ul>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="div2" mode="gentoc">
		<xsl:if test="head">
			<li>
				<a href="#{generate-id()}">
				<xsl:apply-templates select="head" mode="tochead"/></a>
				<xsl:if test="div3">
					<ul>
						<xsl:apply-templates select="div3" mode="gentoc"/>
					</ul>
				</xsl:if>
			</li>
		</xsl:if>
	</xsl:template>

	<xsl:template match="div3" mode="gentoc">
		<xsl:if test="head">
			<li>
				<a href="#{generate-id()}">
				<xsl:apply-templates select="head" mode="tochead"/></a>
			</li>
		</xsl:if>
	</xsl:template>

	<!-- Suppress notes in table of contents (avoid getting them twice) -->

	<xsl:template match="note" mode="tochead"/>

	<!-- Text styles in chapter headings -->

	<xsl:template match="hi" mode="tochead">
		<i>
			<xsl:apply-templates  mode="tochead"/>
		</i>
	</xsl:template>

	<xsl:template match="hi[@rend='italic']" mode="tochead">
		<i>
			<xsl:apply-templates  mode="tochead"/>
		</i>
	</xsl:template>

	<!--====================================================================-->
	<!-- Divisions and Headings -->

	<xsl:template match="div0">
		<xsl:apply-templates/>
		<xsl:if test=".//note and not(ancestor::q) and not(.//div1)">
			<!-- <h2><xsl:value-of select="$strNotes"/></h2> -->
			<p/><hr class="noteseparator"/>
			<xsl:apply-templates mode="footnotes" select=".//note"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="div0[@type='Part' or @type='Part' or @type='Book' or @type='Article']/head">
		<h2 id="{generate-id(parent::div0)}" class="abovehead"><xsl:value-of select="$strPart"/><xsl:text> </xsl:text><xsl:value-of select="../@n"/></h2>
		<h1><xsl:apply-templates/></h1>
	</xsl:template>

	<xsl:template match="div1">
		<xsl:if test="count(head) = 0">
			<a id="{generate-id()}"></a>
			<xsl:if test="@type='Chapter' or @type='chapter'">
				<h1><xsl:value-of select="$strChapter"/><xsl:text> </xsl:text><xsl:value-of select="@n"/></h1>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates/>
		<xsl:if test=".//note and not(ancestor::q)">
			<!-- <h2><xsl:value-of select="$strNotes"/></h2> -->
			<p/><hr class="noteseparator"/>
			<xsl:apply-templates mode="footnotes" select=".//note"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="div1[@type='Chapter' or @type='chapter']/head">
		<h2 id="{generate-id(parent::div1)}" class="abovehead"><xsl:value-of select="$strChapter"/><xsl:text> </xsl:text><xsl:value-of select="../@n"/></h2>
		<h1><xsl:apply-templates/></h1>
	</xsl:template>

	<xsl:template match="div1[@type='Appendix' or @type='appendix']/head">
		<h2 id="{generate-id(parent::div1)}" class="abovehead"><xsl:value-of select="$strAppendix"/><xsl:text> </xsl:text><xsl:value-of select="../@n"/></h2>
		<h1><xsl:apply-templates/></h1>
	</xsl:template>

	<xsl:template match="div1[@type != 'chapter' and @type != 'appendix']/head">
		<h1 id="{generate-id(parent::div1)}"><xsl:apply-templates/></h1>
	</xsl:template>

	<xsl:template match="div2/head">
		<h2 id="{generate-id(parent::div2)}"><xsl:apply-templates/></h2>
	</xsl:template>

	<xsl:template match="div3/head">
		<h3 id="{generate-id(parent::div3)}"><xsl:apply-templates/></h3>
	</xsl:template>

	<xsl:template match="div4/head">
		<h4 id="{generate-id(parent::div4)}"><xsl:apply-templates/></h4>
	</xsl:template>

	<xsl:template match="div5/head">
		<h5 id="{generate-id(parent::div5)}"><xsl:apply-templates/></h5>
	</xsl:template>

	<xsl:template match="head">
		<h5 id="{generate-id()}"><xsl:apply-templates/></h5>
	</xsl:template>

	<xsl:template match="byline">
		<p align="left" class="byline">
			<i><xsl:apply-templates/></i>
		</p>
	</xsl:template>

	<!--====================================================================-->
	<!-- Tables: TODO: check this for more complicated tables. -->

	<xsl:template match="table">
		<p>
			<xsl:apply-templates select="head"/>
			<table width="100%">
				<xsl:apply-templates select="row"/>
			</table>
		</p>
	</xsl:template>

	<xsl:template match="table/head">
		<h5 id="{generate-id()}"><xsl:apply-templates/></h5>
	</xsl:template>

	<xsl:template match="row">
		<tr valign="top">
			<xsl:apply-templates/>
		</tr>
	</xsl:template>

	<xsl:template match="cell">
		<td valign="top">
			<xsl:apply-templates/>
		</td>
	</xsl:template>

	<!--====================================================================-->
	<!-- Lists -->

	<xsl:template match="list">
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<xsl:template match="item">
		<li id="{generate-id()}">
			<xsl:apply-templates/>
		</li>
	</xsl:template>

	<!--====================================================================-->
	<!-- Figures -->

	<!-- Derive the file name from the unique id, and assume that the format is .jpg. This is a temporary solution. -->

	<xsl:template match="figure[@rend='inline']">
		<xsl:choose>
			<xsl:when test="@file">
				<xsl:variable name="file" select="@file"/>
				<img src="img/{$file}"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="file" select="@id"/>
				<img src="img/{$file}.png"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="figure[@rend='left']">
		<table align="left" style="margin:10px; margin-left:0px"><tr><td>
			<div id="{generate-id()}" class="divFigure">
				<xsl:if test="@n">
					<h3><xsl:value-of select="$strFigure"/><xsl:text> </xsl:text><xsl:value-of select="@n"/>.</h3>
				</xsl:if>
				<xsl:variable name="alt" select="head"/>
				<xsl:choose>
					<xsl:when test="@file">
						<xsl:variable name="file" select="@file"/>
						<p class="legend"><img src="img/{$file}" alt="{$alt}"/></p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="file" select="@id"/>
						<p class="legend"><img src="img/{$file}.jpg" alt="{$alt}"/></p>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates/>
			</div>
		</td></tr></table>
	</xsl:template>

	<xsl:template match="figure[@rend='right']">
		<table align="right" style="margin:10px; margin-right:0px"><tr><td>
			<div id="{generate-id()}" class="divFigure">
				<xsl:if test="@n">
					<h3><xsl:value-of select="$strFigure"/><xsl:text> </xsl:text><xsl:value-of select="@n"/>.</h3>
				</xsl:if>
				<xsl:variable name="alt" select="head"/>
				<xsl:choose>
					<xsl:when test="@file">
						<xsl:variable name="file" select="@file"/>
						<p class="legend"><img src="img/{$file}" alt="{$alt}"/></p>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="file" select="@id"/>
						<p class="legend"><img src="img/{$file}.jpg" alt="{$alt}"/></p>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:apply-templates/>
			</div>
		</td></tr></table>
	</xsl:template>

	<xsl:template match="figure">
		<div id="{generate-id()}" class="divFigure">
			<xsl:if test="@n">
				<h3><xsl:value-of select="$strFigure"/><xsl:text> </xsl:text><xsl:value-of select="@n"/>.</h3>
			</xsl:if>
			<xsl:variable name="alt" select="head"/>
			<xsl:choose>
				<xsl:when test="@file">
					<xsl:variable name="file" select="@file"/>
					<p class="legend"><img src="img/{$file}" alt="{$alt}"/></p>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="file" select="@id"/>
					<p class="legend"><img src="img/{$file}.jpg" alt="{$alt}"/></p>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<xsl:template match="figure/head">
		<p class="figureHead"><xsl:apply-templates/></p>
	</xsl:template>

	<!--====================================================================-->
	<!-- Arguments -->

	<xsl:template match="argument">
		<div class="blockquote">
			<xsl:apply-templates/>
		</div>
	</xsl:template>

	<!--====================================================================-->
	<!-- Blockquotes -->

	<xsl:template match="q[@rend='block']">
		<div class="blockquote">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<!--====================================================================-->
	<!-- Notes -->

	<!-- Marginal notes should go to the margin -->

	<!-- BUG: marginal notes are still counted as footnotes -->

	<xsl:template match="note[@place='margin']">
		<span class="leftnote">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!-- RESOLUTION: use separate script to rename them to side -->

	<xsl:template match="side">
		<span class="leftnote">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<!-- Move footnotes to the end of the div1 element they appear in (but not in quoted texts) -->

	<xsl:template match="note">
		<a id="{generate-id()}src" href="#{generate-id()}" class="noteref">
			<xsl:number level="any" from="div1[not(ancestor::q)]"/>
		</a>
	</xsl:template>

	<!-- Skip marginal notes in footnotes mode -->

	<xsl:template match="note[@place='margin']" mode="footnotes"/>

	<!-- Handle notes with paragraphs different from simple notes -->

	<xsl:template match="note[p]" mode="footnotes">
		<div class="notetext">
			<p class="notetext">
				<a id="{generate-id()}" href="#{generate-id()}src" class="noteref">
					<xsl:number level="any" from="div1[not(ancestor::q)]"/>
				</a>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="*[1]" mode="footfirst"/>
			</p>
			<xsl:apply-templates select="*[position() > 1]" mode="footnotes"/>
		</div>
	</xsl:template>

	<xsl:template match="note" mode="footnotes">
		<div class="notetext">
			<p class="notetext">
				<a id="{generate-id()}" href="#{generate-id()}src" class="noteref">
					<xsl:number level="any" from="div1[not(ancestor::q)]"/>
				</a>
				<xsl:text> </xsl:text>
				<xsl:apply-templates/>
			</p>
		</div>
	</xsl:template>

	<xsl:template match="*" mode="footfirst">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="p" mode="footnotes">
		<p id="{generate-id()}" class="notetext"><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="*" mode="footnotes">
		<xsl:apply-templates/>
	</xsl:template>

	<!--====================================================================-->
	<!-- Paragraphs -->

	<xsl:template match="p">
		<p id="{generate-id()}"><xsl:apply-templates/></p>
	</xsl:template>

	<!--====================================================================-->
	<!-- Line groups -->

	<xsl:template match="lg">
		<p class="poetry"><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="l">
		<br id="{generate-id()}"/>
		<xsl:if test="@n">
			<span class="lineno"><xsl:value-of select="@n"/></span>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="lb">
		<br id="{generate-id()}"/>
	</xsl:template>

	<!--====================================================================-->
	<!-- Text styles -->

	<xsl:template match="hi">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>

	<xsl:template match="hi[@rend='sup']">
		<sup>
			<xsl:apply-templates/>
		</sup>
	</xsl:template>

	<xsl:template match="hi[@rend='italic']">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>

	<xsl:template match="hi[@rend='bold']">
		<b>
			<xsl:apply-templates/>
		</b>
	</xsl:template>

	<xsl:template match="hi[@rend='smallcaps']">
		<span class="smallcaps">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<!--====================================================================-->
	<!-- Measurements with metric equivalent (own extention of TEI) -->

	<xsl:template match="measure">
		<xsl:choose>
			<xsl:when test="$strUnitsUsed = 'Both'">
				<xsl:variable name="reg" select="./@reg"/>
				<a href="javascript:void(0);" onmouseover="return overlib('{$reg}');" onmouseout="return nd();">
					<xsl:apply-templates/>
				</a> 
			</xsl:when>
			<xsl:when test="$strUnitsUsed = 'Metric'">
				<xsl:value-of select="./@reg"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>

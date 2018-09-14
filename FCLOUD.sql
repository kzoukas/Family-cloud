CREATE DATABASE  IF NOT EXISTS `fcloud` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fcloud`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: fcloud
-- ------------------------------------------------------
-- Server version	5.6.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `callendar_activities`
--

DROP TABLE IF EXISTS `callendar_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callendar_activities` (
  `activityID` int(11) NOT NULL,
  `activityName` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `startingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `reminder` varchar(45) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `weekly` int(11) DEFAULT NULL,
  `monthly` int(11) DEFAULT NULL,
  `hoursRemindBefore` int(11) DEFAULT NULL,
  `reputanceExpDate` date DEFAULT NULL,
  `reminderDate` date DEFAULT NULL,
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callendar_activities`
--

LOCK TABLES `callendar_activities` WRITE;
/*!40000 ALTER TABLE `callendar_activities` DISABLE KEYS */;
INSERT INTO `callendar_activities` VALUES (2,'cxbcvcx','cxvxv','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'[object NodeList]',0,0,0,0,'2015-07-08','0002-11-30'),(3,'cxbcvcx','cxvxv','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'[object NodeList]',0,0,0,0,'2015-07-08','0002-11-30'),(4,'awdawd','awdawd','2015-07-09 20:00:00','2015-07-12 20:00:00','dawdawd',1,'[object NodeList]',0,0,0,0,'2015-07-08','2015-07-10'),(5,'cxbcvcx','cxvxv','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'No reminder',0,0,0,0,'2015-07-08','0002-11-30'),(6,'cxbcvcx','cxvxv','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'No reminder',0,0,0,0,'2015-07-08','0002-11-30'),(7,'cxbcvcx','cxvxv','2015-07-10 08:30:00','2015-07-10 08:30:00','',1,'No reminder',0,0,0,0,'2015-07-08','0002-11-30');
/*!40000 ALTER TABLE `callendar_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_image`
--

DROP TABLE IF EXISTS `default_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_image` (
  `imageID` int(11) NOT NULL,
  `image` longblob,
  PRIMARY KEY (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_image`
--

LOCK TABLES `default_image` WRITE;
/*!40000 ALTER TABLE `default_image` DISABLE KEYS */;
INSERT INTO `default_image` VALUES (1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0È\0\0\0È\0\0\0­X®ž\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0¼\0\0¼º· »\0\0\0tEXtSoftware\0Adobe Fireworks CS3˜ÖF\0\0\0tEXtCreation Time\08/20/09)œ‡é\0\0tEXtXML:com.adobe.xmp\0<?xpacket begin=\"   \" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.1-c034 46.272976, Sat Jan 27 2007 22:11:41        \">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:xap=\"http://ns.adobe.com/xap/1.0/\">\n         <xap:CreatorTool>Adobe Fireworks CS3</xap:CreatorTool>\n         <xap:CreateDate>2009-08-20T16:47:01Z</xap:CreateDate>\n         <xap:ModifyDate>2009-08-21T18:43:52Z</xap:ModifyDate>\n      </rdf:Description>\n      <rdf:Description rdf:about=\"\"\n            xmlns:dc=\"http://purl.org/dc/elements/1.1/\">\n         <dc:format>image/png</dc:format>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                           vÑÑð\0\0œIDATxœí}˜EÇ¿UÕ=³	÷#ÇK 9E=7•Îxž(àêÁs÷†€zÊáËp( *\rÈ[àî &\n!od³yÛlBvóB8v5ïÛUuTUwõìì°›é™ž™ý} 2»›<3Õ½ýíßkW±ùóçkQ–\0\0Ž>úè¼çA\rÇš5kÀóžA42$‚¨\0	„ *@!ˆ\n@¢\00ÆòžA4$dA¢$‚¨\0	„ *@!ˆ\n@¢$‚¨\0	„ *@!ˆ\n@¢$‚¨\0	„ *@½XQ² QAT€B DH QAT€B DH QAT€ZM¢dA¢$‚¨\0	„ *@!ˆ\nyO€\0úúúðò¼ùXÕÙ…?:ìP\\üôß­ß°\'LšTçŽ\\H 9Ð××‡yóæcáâ¥XÚ±\n¯­Ûúûööå¸åæ¿\0tt,ÃÆ›ðèô§1eòD\\sõò˜òˆ…ÍŸ?_{ì±yÏ£¥yé¥—±jUV¯éFÇ²Nl}ó-pÆÁ8cp©v­¡¡¡µŽ¿6ÿ›ŸÕ†£ÆÅÁˆÃ=ÇsÎþóç{€-Jgg\'	$kzzzðÊü…XÝõ\Z–.]…×º7Z!ppï•sÆ¬@x:tâPZy\"1I†‚R\nJIŒ\ZUÄ©ï>	Ÿ¼ô8ár¿²¢³³“\\¬jéëëÃóÿýæÌ‡Žå«±k×0+\0Î8\nÅQFö{Î¸à`LÄ‚aÜZ`1$¢pÂÑVJIDý³ç.Â¿™IŽÆW¾|	%#H U²|ÅJt­Y‡‹—Cˆ\0a¡\rBVÂºRÂZ\r.+[ÆXÜÍà¾«å\r¥¥ˆ‚””’2‚Œ\"¬ZÝƒ/õ&œîøÒ>‹ýöÛ/ßÔä@ªdâ„ãñã{~ŽBaDBˆÀD#\'O(Ì}ïÅ!>)Q`à×J)ãbI™ˆCJÈ 2Š E?f<;ó^Y‚[¿~=Y“* ^¬*èèX†Ûx6nzÅ¢H`EÂE[ØrA¹ÄçÞÒÍ‹³ @lI\0h¥LÀ®’DÊJJHÙ(êG¾Õ·×|íë¸òs—à²Ï|ªîç§ ²—tt,Ãÿ|öô+Š£†EaA‚‹\0‚‹$9À¬õ0Y++†’$yµ¤\\®rºIˆ ŠÐíè x€~±÷=8]kÖáV›:&†	d/xì±\'ñ£ÿaX@¡Ð†°Ð–ÄZ!\\–*‰1b‹Á¬¼Ø£g1¼X½Ø4°ÒÐPÐJC)	!B(AŠ\\ëê	ð~ãæÍž»·|ã6\\÷µ/Q\\2H Ãdz,Ž\"Â¢G!,\"‹Æ½\nÂ8îp*€¥qS÷pïÈPª­Ç•	³–…ÐÜÆ&\\ƒi®”àÜÆ?6QÀ¬%cŒcöÜ…Ø¼å[¸ëŽÛj{’ZêÅ\ZÏ=ÿ?øÑ]!‹Ær„m(„‰	Ã\"‚ €@„ÂÆ\"L@0›Í‚ÎMZ7Nîj7 “Ÿ³ÒÿK½K@ˆ(˜ÏÌ\\ÂB\n…Qv˜¯Wvöà–o@†\n	dˆtt,Ãïx ‡a¡ˆ00î•!„KïúÅAî,ˆÿŽ¬ÌÚß/¥~“BA€ ,˜y†É<ÅQV0m˜=wþõûwÔòtµäb\ržžõ¸áŸ¾‹þ~Äž8DBX×&¹pË]ðÕâ¿‡q¿ÌÇ87NCë´ÅAj>É¼fÌš‹cŽ\Z‹.º0ƒyµ.dA†À?ßr;öô+#\n{\'\nEA<Áy\0&„»µŒ%^˜Èx¤ß×hÄ~>ç`B€‰°€ ,\ZA{â¾÷ÁéèéY_¯ÓØ”@Þ†Ûp\'6lzÃúônˆ0°.÷µ¬¥Py¤?Ï¹_œ10Î „0õ™0´ÇPˆcO¿Äwnÿ\ZŸÁæ†R—^ž‡³æ\"ŠCˆ¢`îÌÌfŠü;uý–~_«ÁRŸåre&L@pSÄ‚‚=3Vvvãñ_?Uû“Ù¤@*ðÐÏmÒ·î®ë²TA½bŽá’äá²eœÛºˆH`]®ÀÆP÷>ðúúúr˜oãC„ÇýVtv\'SX€à¶RÎ8¯sÌ1œØ$‰K´ÍtÅqIBx\"a»÷DøÅ#ÕøŒ6\'Ô‹5O<ý‚m)Ä–ÃÕ6’â[©åh”óÈàg¹´uÿ8¦¸(è `ÚTÂJFxñ7põ—.ÏwÚ\rY2t,[Žõ·Æîˆ°ò¤K·‘Åá¤nÂmJÄ•ÿ ,àÿz·áñ_?ã|Hf=ûbâ¯‹Á™\0gÂ4–\rÈqø»µ\"Œ›cá¦-?{¬!^zeIÍÎi³B…Â2,[¾ÖÜY½g;„;\\Á-M£YŸÄÝr=ÃŒspmEd…X¸heŽólLÈ‚”¡{ã#ŒÀ\0]@Î¸m2d¶£ÚÞ ›ã?0\rÍLØ=?ùhÇËóæç}ú\nH	Ë–­H™åÂmP”&4\ZÙrøøñˆ×øhû·¸MsàÕ%ËsœgãA)aÛöíÉ…ã²UM”¿,õeò<|bE„ØúÆ[ùM±¡¤q@n[Ë“ ¼ÙDQ­µ´ó8xãM*ú@J03ùE@ó¨¬†«)˜Õœx;cÐvÀ¹ šX	äb•Á<Ö%­XÓŠbpüxÄ­°bn„ƒÎF)qQÍY“X!É?hjXüjÚµÌñ™\'vîÚãÜ\Zr±Êk \\ky+`ÚâµÓ¾÷ÚÝ³9ïÉ5Ô‹UB\\!wM‡V¥‹Œ47&Ññq™cÖñ“‰t=8ÈÅ\Z­wáÄ±Õ mû#H	ïØw\0¸.ÕˆâC)aâ„ã½ïFŠH’õºÈ€¤¡ ½ƒ5Çš?[ç\nr\r¿î4sqá ”A+m®e÷^[‰”úYë%ë2 Õ~å’ôê#H&?ÎÒÍ\"Ñ\rðôSá JúbÑtáŒH()ƒ¶[\rhmCÝš÷V²o	¤Zk@éø­yõøª°^ä»Ž<4ß95ÔjR†Cz\'º^Û‚D­¦>ºÑ£Ûèzð ¤üNó…NÜ­–Æ%$Fl÷Àà‹5Z§íGë{X\n\ZÀAîŸï¤\Z² åÐåk ­yƒMgêqÖ“\0@¤,›·¾å™Û®[Í†xÇå’­y¨\n² eX·nÓˆ	TcIØãÝ¾}gnsiDÈ‚”ÐÓ³k{^G±mô€ú@²hCkP\ZcóÒºX>dAJX¸¸½dÏ†V\\°!%2`ë½øþïÎuF	¤„%í«âÕ>0Bž°K6û4É=9sí]h!”°å^³Xœ]åÃß­<÷ÂŒGzvwŽ_ÏöÄ6)$Öu¿žZ–“¥–üiAJ¶ŠfvÏõ–>æa@Az	;vîF±m·õ¸÷Q+…ç€9\"/uÍ\0ðÄÕ\"Ô‹Uó—VnOV€¥-ˆ[@Ž11öpº.@.Ö@¼‹…yBiÅkÅS¼dƒ=Þ}ö#Ž›ãÌ\ZH	.,Gœâyœ0ñ]yO¡a ”ðžS&ÚîêÄh­aŽM)¿ËÄ¯Òxß{NÊû×Ð0@JøÈŸj‚W\rø¡yÒ¦ÔìÁºN}­­j´ÖPZá ÇàÂóÿ<·Ù5\Z$Î:óttÀh­ROóðÁYs|\nZ)h%qù_Ÿ—ãü\ZH®øÌùÉE£•o>,Í&–´Àµ³ŽZC)	%%¤ŠðÁ÷Ÿˆ3?ôþ¼&Ù@Êpæ‡Þã9RI(­ µ‚Ò\ZJk¯­+©v(û¬‹T\nRIH%É§¿oþîo.¯ÁÙlnH ƒpåeBÉ*Š\0%¡•´nHîö0‡Š¿6óWÐÒŒ £~\\tþûð·_ýlÞ§¼!!Â„ãÁG?|Š±\"JB¹”OIÛ,Ä^¢\rÆ•ŒP,|çæ+qÙ_},×¹52$\nüõÔpàþû@Ú;®²{zk„FÉÀŒ•‡„”®¿æbwìÑ¹Í® T`Ì˜}qÃß|\nRö[K’Ä\"n}ëfñœ•‚R\nRE8îÇÉS&ÕêÔµÔ‹õ6L8þX\\}ùøñ3’o¹\0˜F3õgi›ÎU*‚”.ýÄ‡è÷>È‚sÏ9zß$(™êfÀÞ¦Ñœ˜9i“XPÖµŠ$Üœr2UË‡	dˆL<nœÉj)™:þpx±‡’P2Â¹ywÞ“j\ZH CäôÓNA$û!eiE’®4ÚIìa\\+#©\"œvê”¼OgÓ@\"cÆì‹S¦§}ËWØÛJb-È¸±bìØÃóžTÓ@ï=e”ŒbKÇAHãâÒÒ®¥äÌÓÿ$ï)5$apÁ¹gaT1„’æbÓZÇ{þAùÀa‚s“ÞÕÒXÉ\'[Û“Ôb@†É8ÉËf)4ê~ê.‰àš.•’Õbâ„ãòžZSA&}ì,HAê¤²>°‘±AF<7¥Þ}2‰c¸@†ÉcÇÄc4n–k‡oÀ8ÄÅ~€~âÄ£òžVÓAÙ>ué‡M&Ëõg5˜«•¸WvXëŒ¾7ï©5$½à=§ü	Æ=Ðd´l<+”üÛÛ“aZÚMZzüØƒ0fÌ˜¼O]ÓA½X{É…}?î¼÷)0%Á¸\0Ó¼aú³4lì¤‚~ÂÄ£è÷¼ÙK.8ïÃ8ð€}Í]ÚÁ[áóAÇ½XIë´S\'ç=­¦„RS/:ÓTÖc7«Ä‘¤wM{¾± ï}ÏÉyO­)!TÁç…ÑÅ\0J\'\rŒ\raEü–R˜4a|¾óibH UrÆ&CEJúA:ò,~x~3§\'¼«ö\'¢E!TÉ_|ü,»ú‰Œry\rMw‰Žu©$¦œDÂ½…R%GŒ=°¯W8Ljõ&~FÅ>^ë,Å{	$&M8ZK;LM$7K»ê¾‚Öï\ZwHÎ@ëBèdÀÁígŒ¸VPà¨MD0ÒLú¯F*Öu­	$\\¯“–\nšk[0Dýís\\AOÆÑã«ó$Zr±2@+›9BòšÏDjR„Ö=º-Ÿ¹´Ôj’	6(÷‚d\r]÷¦“D˜I ßo5É€mÛwÆõßxÔ3“–[îÇÎç˜£¬ÛZŠA2 kíú¤\rÔÝÉJÕB¬j²ï;F×y&­	$k9¯§L¼æDØg@`],bï!+SX¾Û~ún–åØžÓdZHlÞÚo9Þhtv­Ë{\nM\r¹XUÒ××‡Í[ßB¡8\Z\Zš™áS/\'+UO·JÕ\0V¯Y_§´&dAªdÞ+‹ìªïŒ¹}Ös‚y.c`Œãw¯t »§\'¯5=$*yæÙ9¶ÎÀ`N§\'‘œÚ±ŒLxüú‹‡Ÿ¬é9heH UÐÝÝƒßÍë\0cÜí‹¥¾v„YëÁ¬å`ÜìcÂ¹Àô\'_ÄÒ¥Ëê:ŸVR·~ûN³`\0ç\0ã)ÿ?—Ál¶€q0ÎÁ„\0®¹î›èëë«ù9i5H {É£¿zK–uÎ98÷,rò­ŒíbÌÎÉX!vìîÇç¯þ{É0¡^¬½ }iîøÉÃ\"„à8À|‘€åwNYâfq! DHJbm÷f\\qÕ¸ÿ\'·a¿ýöËg~MYaÒ¾´WíVìÜˆœàL˜ÀXÛø#·àÜæœ	3D`çY€E¼¶n3.ý«kÐÞÞQ—óÕì@†AûÒ\\õ•›cqA\\ÖÍÖ½ÊÛ\Z³8ÅkÜ« žk„El}óøâµ7á‘G§ç<×Æ‡2DfÌ|_¼öfìÜ-Eˆ°.BpÚ]o¹I0¯ÆLÒ€0€!„‡‹\nmØµGá›ß½W_{#Å% üÛ]¸ñ¦`÷‰ ,š ‚ÐXƒ0æê ùáÒÌ<eE\n‚\"ÂÐ6„…6Ì}¹g_pfÌ|6×y7*$\n´·/Å\'.½÷?ôd\"Œ° ‚‚õíœó8@Îçê™zˆ\0çIP°Ç`ÄaD2\n»÷(üÝ?}ŸþÜµho_š÷ô\nêÅ*C__î½ÿg¸ïÁÇ!‚aØfü÷ hÜ+Q@ Bw¸Š5ÐK:Œ»Å\0ÀZ@ƒ¡`z/Ûå^Û;Ö`êe×áÜ³OÃMÿx=eº@À#Ó¦ãîû¦aË}Â6{×-—*,\Z«ÀD`Š„6öÐ6µÛ8Mp0hhîêûÂÝ0VfXdŠž3Ÿ³ç~S/ù(®¼üÓ#Z(lþüùzòdZùû‘iÓñ“{Æ–­}àóÙCÔaâR…¸\0Çc4†k5Ú{˜Ê­Àbv½ e?dÔo_÷ Šö@F”4?=ª€©—œ‹+.ÿ4öaBY²d		äáG~…»ï{›·öÆ)Q˜´¨„l½C_žqa{¯\Z_ŽX$°köjiWƒ”FÒŠÂ‹”dÔ%#Œ=ò„2bâbŒ‡}Ûwî1¶+¨¶¨f­ˆù;—­2m%Œu4‰8·f“‰E‘‘I©Ué·Ö$J	e$¸^#N ííKñÓ‡Åoæ.ÄŽ{LÏY\r›åþ÷)aˆ8•§R›Hõ“”5Q‰P”Š<ëá„\rÊyç|W|v*Æ—ïAÕˆX S¦LÉ{.5£··3g=Ÿ=ü:×¬·iY×/\\-#NÙÆ©[S!gLÄi\\çRÍß¿æ„/ò`7ÜI\\¯h Uñ\\±øïT„óÏù .úø98ý§å|TÙòê«¯¶n«½})îp\ZfÏ]€í;vƒó\0a¡Í4z.•‹+¸MÛ¦,†kor«QŽä8ìÞŠš3­lêW	{“0Bà2€¡Ù#ÞZn2óù—ðô¬9øÓÉÇác|S?yq®Ç–%-eAz{û0í—ãÉ§ÿkÖ\'Ù&g-„(±A\"ˆÁ„á­ÆÐ*â(e€Ûomm×Vj Eñ„â¾w–çÐCÞ‰«®œŠžóì¿óÆ)¯¾újkä™³ðØÏböÜ…ž(D\"$–‚Þß¹ØÂ†W8kua”RI(n¯uå	!Î|yn˜ù;óºÏè\">uéy¸äâ1¾	ã”¦ÈºînÜ÷Ó_à©/\ZJ¸ÚD‡KË:×Šy5Œtà=r…QÊÐ„’Ä)JJHåÅ%V(RöCÛ{ÞÙ§ãs—ý%&Ÿtb¾7š.1÷sxèá\'°ºk½½Ø9ÂB›„s•bw)ˆƒòØJðtÐÍ¸mñ…á/º0qÇ¯‘<c¢97Š[é•P,€â\\P<‚à¤¡d!H)¡d?f>ÿž™5\'O9×\\õ™¦	è›Â‚,i_ŠŸ>8\r³ç,À¶»Jbß}Jÿœ•±Ü>;÷!€£Zµ(6Mlâ”´UqnWâŠyî˜’8ìpÕç?‰©Ÿ¼$ßƒ«@Ã»X?òËØZp.À„q•˜máŽã_\"ˆïp¬…ËF¹õ£HÃ¢T(qzØ	FÙL­,.öEÔÈBiHôööáÞûÂÏ§=mÓ³Â´EœŽ5±…ÉL¹–îD‰µHÚAœµ\0Z)]›É¶É¾(®ÏKk]bQd,ßšÈ¸–bâ•Ã}\'®º²±„ÒPY×ÝûÑ\Z7jçî¤^áÅ¢Äb¤â\nÛ•š´p“µ¨©]}½Ý­Jz­d$©ãÃi¡4„@z{ûðoÝŽ§gÎI	Â/Þ™‚ÞÀ¸\"]³H„A¢¨?eã­ìöt2ýŠ­I’ùŠ¿ŽŒvØ!à›·\\—k0Ÿ{ë{?¸¿˜ö4¶ïìGPh‹-„ß (ÝÎR”#Õ<HÂ¨7î\\§2_ŒC3hÅ•©Î+	Å”2¿k%\"ð8ã‹\0JFØòÆïñù/ß„“\'‡ï|ër«£ä².Ö’ö¥ø‡¯ß†Õ]ÀE`Äáa:æp.U…š…o-üUEFh–6_<¡ Š×F,šs@	0%Íª2\0”ÀmK‹ŒúÁ¹€”/íÂÙ|_¼übüíõ×ÖýpênAî¾ç§¸ýß€pÂˆ[Ì½Z/+•<WMw3Áü–Öq¿ÓÌ\n…kSCÑ*€äâxSE¸ì$ïÇ=<ŽÿýÍ<üË7n¨k±±®‹6\\Ã×ñ½;þË,P/\Zàxa„ à=¬$.i¡8\ZžTâ„\'I8:^L¢`”G™ë£0\ZaÑ^akÖ¾ŽË¿x#ž™1«ns¯›¹þ†[ðÌ¬ß\"Ú’GXã•AÂ¤Î¬+å5\ZA\0¬ùPM‹W½·ëkm7ÒÞŠŠ—ZòÈxÌ<vÀ˜ÀÎ]{pÝ·á÷¿ßV—®áºäž{Ä3ÏÎ…ÛÌ\n]:Ç.¼æ·ƒ¤âo—&–òm‰¦Æÿ]2¦5À8SÐš1(s=Hn„žÜ8ÑÏqó·î€š‹¤æY×Ý»ïûU¼\Z¡Y:\'qŸJ^£ö‘C*óÅx£h¦Ìõ Ìõ ¬k¯`=‰›¿}&M:¾¦1IÍcÝy?vìê7~f¼>¬Ipn\n}<.îÅ+x\"¿<iÔk˜ßµ]§‹³ØRp!Ì5†ñºÂ]Ò]Oß¹ýÇ¨%5HoožyîwA1u€\"(¦ž÷v™*WÇ «12ñƒyÎü@Þ-¤‘¬/ìD²¸½<úXÍæTSürúSveñB˜	ã†ÃxË€x?½|¶\r ÑXÃóñµÁÜ£a¼Æ°p«\\üäÞ_¢VÔT OÍœm+âpo0\0¶Á0Þ²,çÕÐi4Þˆ}lfƒv·R½[X#Ámtó}˜öèã¨5Hww7ºÖn‚f\rá?þj-ùˆ·Ã_ˆ;õœ-¸RÁÏQ“Ï¯™@žûï9é.\\Wãð[DHÄH¯VÏícAœäAˆ®µ±®»;óÏænY§\\wnÜ…Ëã:‰ƒ.iKbDÂ=—‹ó\0>4=Ók¨Q¤··«×nDX\rÆ³Š8\0­IÄÞa:êíŠõqlâ„âÅ¹‹3ÿÌšäÙç_ðÖ±MÚÒÖ7bè¸¾G¸º	Oow½yë[hoïÀI\'ÙgÖ$™¿¨ÃºSþ3á,®‚ÄÞ’ìEÏâìVò\0]€yó³µ\"5È¢WW§Ÿøs!q™tr»G­]Ñù…93ý¤Ì²®»¯oy+q­üí‘õVÙÀàZS¼Îo.°hÉêL?\'ódùòÎ$€‚€Ñ q­(@\'²ACÃ][®ÚÎlçïÜß¾Œœvj&Ÿ”¹yea‡÷Ì¸—6#‹È—íIê#îY¢y–dö)™[U«{Òf%r¯ˆŒˆ‰-)\"r.°pñÊÌ>\'s,jï´õfž³?×,î²!ˆêa0nCªoŒ£sÍ†Ì>&S«»»\'iH­<Pz—Èžd©§Ä‚plß±ÝÝ=™|B¦Ëþ,_atøƒiŠ?ˆì1N‰k·íñŒƒA`ùŠNŒ_ýZZ™Zå«ÖÆuT¼Á(þ j€‹?ÊX’å«Öfò™\ndáâ)×Š–å!êBªÉÐ\\w«:³éìÍ4Hß´ù-Àî¿áÔ­ã¥^\"{âë‹ù×Ç¦Íofòþ™ZM›ÿ¯Lj7ËO ˆ2¸$çbe•ÉÊÌ‚ÌýíËˆ—ì¡\0¨I °’€}]wÆ;²ª÷ÏL 6nöü@÷S—§¶_DÖ0\0Z{F$Y>hýúU$3kÃ¦-žhj®PHƒFM‡‹uýŽ\rÆ±bå\ZTKfY°xEºk—z¯ˆ:Â¼8Ä]}¿ß¶£ê÷ÍL Û¶íLR»©GI&D­añŸI÷ÇªÕÕ§z3Èª5l×.HDý)iŠeŒaÛ¶U¿m&Aúºî»Î•?\\vAgñ!1fÿP÷¼‘»13¬ìZ_õ{gÒ‹µaÃ&¯£²ä½¨’NÔ˜X,n‚Ã¶í;«¾¶3q±LŠ—{iÞAÄBµ Lß_R“«ŽL\\¬õ7{ßikó”5yä`µGÃl;\r­`®A0]õã·™dã¦­\0t¼y¼æZÙøƒQº—¨-\Z\0´¿7»‚v7ê*	\0`Á‚U½ÉŠ•]Pv£x©$ ¹ÙØTir³ˆú Íõ§Td^¥‚R\Z+W®D[qïíÀÿ½“m¡mB7\0\0\0\0IEND®B`‚');
/*!40000 ALTER TABLE `default_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_calendar`
--

DROP TABLE IF EXISTS `family_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_calendar` (
  `activityID` int(11) NOT NULL,
  `activityName` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `assignedTo` varchar(300) DEFAULT NULL,
  `startingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `reminder` varchar(45) DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `weekly` int(11) DEFAULT NULL,
  `monthly` int(11) DEFAULT NULL,
  `hoursRemindBefore` int(11) DEFAULT NULL,
  `reputanceExpDate` date DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `reminderDate` date DEFAULT NULL,
  PRIMARY KEY (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_calendar`
--

LOCK TABLES `family_calendar` WRITE;
/*!40000 ALTER TABLE `family_calendar` DISABLE KEYS */;
INSERT INTO `family_calendar` VALUES (2,'awdawd','awdawd','9,1','2015-07-09 20:00:00','2015-07-09 20:00:00','',1,'trigger_disable',0,0,0,0,'2015-07-08','1','0002-11-30'),(3,'pareeewsd','awdawd','9,1','2015-07-09 20:00:00','2015-07-12 20:00:00','',1,'[object NodeList]',0,0,0,0,'2015-07-08','1','0002-11-30'),(4,'edooooooooooooo','sadad','9,1','2015-07-15 08:30:00','2015-07-15 08:30:00','',9,'trigger_disable',0,0,0,0,'2015-07-08','1','0002-11-30'),(5,'sdfc','cacsac','9,1','2015-07-07 08:30:00','2015-07-07 08:30:00','',9,'No reminder',0,0,0,0,'2015-07-08','1','0002-11-30'),(6,'dasdd','asdasd','9,1','2015-07-07 08:30:00','2015-07-07 08:30:00','',9,'trigger_disable',0,0,0,0,'2015-07-08','1','0002-11-30'),(8,'ooooooooooooooooooo','zxczc','9,1','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'trigger_disable',0,0,0,0,'2015-07-08','1','0002-11-30'),(9,'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','zxczc','9,1','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'[object NodeList]',0,0,0,0,'2015-07-08','1','0002-11-30'),(10,'auto','czczxc','9,1','2015-07-10 08:30:00','2015-07-10 08:30:00','',9,'trigger_disable',0,0,0,0,'2015-07-08','1','0002-11-30');
/*!40000 ALTER TABLE `family_calendar` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fcloud`.`family_calendar_AFTER_INSERT` AFTER INSERT ON `family_calendar` FOR EACH ROW
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
 
    
    
  CREATE TEMPORARY TABLE temp1 (SELECT
  
  SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.assignedTo, ',', numbers.n), ',', -1) name
  
FROM
  numbers INNER JOIN family_calendar
  ON CHAR_LENGTH(NEW.assignedTo)
     -CHAR_LENGTH(REPLACE(NEW.assignedTo, ',', ''))>=numbers.n-1
 WHERE family_calendar.activityID=NEW.activityID
ORDER BY
  NEW.activityID, n);
  
  SELECT COUNT(*) FROM temp1 INTO n;
  SET i=0;
  
  WHILE i<n DO 
 
    INSERT INTO notifications(usernameA,usernameB,notification_type,date_created,referredID, isreadA, isreadB) 
    VALUES(NEW.userID, (SELECT name  FROM temp1 LIMIT i,1), 'family_calendar_insert',  NOW(), NEW.activityID,'N','N');
  
  SET i = i + 1;
  END WHILE;
 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fcloud`.`family_calendar_AFTER_UPDATE` AFTER UPDATE ON `family_calendar` FOR EACH ROW
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
 IF NEW.reminder!='trigger_disable' THEN
    
    
  CREATE TEMPORARY TABLE temp1 (SELECT
  
  SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.assignedTo, ',', numbers.n), ',', -1) name
  
FROM
  numbers INNER JOIN family_calendar
  ON CHAR_LENGTH(NEW.assignedTo)
     -CHAR_LENGTH(REPLACE(NEW.assignedTo, ',', ''))>=numbers.n-1
 WHERE family_calendar.activityID=NEW.activityID
ORDER BY
  NEW.activityID, n);
  
  SELECT COUNT(*) FROM temp1 INTO n;
  SET i=0;
  
  WHILE i<n DO 
 
 
    INSERT INTO notifications(usernameA,usernameB,notification_type,date_created,referredID, isreadA, isreadB) 
    VALUES(NEW.userID, (SELECT name  FROM temp1 LIMIT i,1), 'family_calendar_update',  NOW(), NEW.activityID,'N','N');
  
  SET i = i + 1;
  END WHILE;
 
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fcloud`.`family_calendar_BEFORE_DELETE` BEFORE DELETE ON `family_calendar` FOR EACH ROW
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
 
    
    
  CREATE TEMPORARY TABLE temp1 (SELECT
  
  SUBSTRING_INDEX(SUBSTRING_INDEX(OLD.assignedTo, ',', numbers.n), ',', -1) name
  
FROM
  numbers INNER JOIN family_calendar
  ON CHAR_LENGTH(OLD.assignedTo)
     -CHAR_LENGTH(REPLACE(OLD.assignedTo, ',', ''))>=numbers.n-1
 WHERE family_calendar.activityID=OLD.activityID
ORDER BY
  OLD.activityID, n);
  
  SELECT COUNT(*) FROM temp1 INTO n;
  SET i=0;
  
  WHILE i<n DO 

 
 INSERT INTO notifications(usernameA,usernameB,notification_type,date_created,referredID, isreadA, isreadB) 
    VALUES(OLD.userID, (SELECT name  FROM temp1 LIMIT i,1), 'family_calendar_delete', NOW(), OLD.activityID,'N','N');
    
  SET i = i + 1;
  END WHILE;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meals` (
  `mealID` int(11) NOT NULL,
  `mealName` varchar(45) DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `daily` int(11) DEFAULT NULL,
  `weekly` int(11) DEFAULT NULL,
  `monthly` int(11) DEFAULT NULL,
  `hoursRemindBefore` int(11) DEFAULT NULL,
  `reminder` varchar(45) DEFAULT NULL,
  `reputanceExpDate` date DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `reminderDate` date DEFAULT NULL,
  PRIMARY KEY (`mealID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'meal 1','kwst','',1,'2015-07-10 08:30:00',0,0,0,0,'No reminder','0002-11-30',1,'0002-11-30'),(2,'new','sad','',1,'2015-07-10 08:30:00',0,1,0,0,'[object NodeList]','0002-11-30',1,'0002-11-30');
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `senderID` int(11) DEFAULT NULL,
  `receiverID` int(11) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `image` longblob,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (2,1,9,'ela reee\r\n',''),(3,1,9,'awdawd',''),(4,9,1,'ante geia','');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notificationID` int(11) NOT NULL AUTO_INCREMENT,
  `usernameA` int(11) NOT NULL,
  `usernameB` varchar(45) DEFAULT NULL,
  `notification_type` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `referredID` int(11) NOT NULL,
  `isreadA` varchar(45) NOT NULL,
  `isreadB` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`notificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numbers` (
  `n` int(11) NOT NULL,
  PRIMARY KEY (`n`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
INSERT INTO `numbers` VALUES (1),(2),(3),(4),(5),(6);
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_list`
--

DROP TABLE IF EXISTS `shopping_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_list` (
  `productID` int(11) NOT NULL,
  `product` varchar(45) NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `addedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_list`
--

LOCK TABLES `shopping_list` WRITE;
/*!40000 ALTER TABLE `shopping_list` DISABLE KEYS */;
INSERT INTO `shopping_list` VALUES (2,'sdfsdf','1.0','nBought','1',1),(3,'sadsa','15.0','nBought','1',9),(4,'kwstaki','15.0','nBought','1',9);
/*!40000 ALTER TABLE `shopping_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `to_do_list`
--

DROP TABLE IF EXISTS `to_do_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `to_do_list` (
  `taskID` int(11) NOT NULL,
  `director` int(11) DEFAULT NULL,
  `task` varchar(45) NOT NULL,
  `assignedTo` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `completedDate` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`taskID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_do_list`
--

LOCK TABLES `to_do_list` WRITE;
/*!40000 ALTER TABLE `to_do_list` DISABLE KEYS */;
INSERT INTO `to_do_list` VALUES (1,9,'wqeqwe','10,9','9','2015-09-09','-','incompleted'),(2,1,'asd','9,1','1','2015-09-09','-','incompleted'),(3,1,'poutanaaa','9,1','1','2015-09-09','-','incompleted'),(4,1,'asdasd','1','1','2015-09-09','-','incompleted'),(5,1,'sadasd','9','1','2015-09-09','-','incompleted'),(6,1,'xzcx','9,1','9','2015-08-06','-','incompleted');
/*!40000 ALTER TABLE `to_do_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fcloud`.`to_do_list_AFTER_INSERT` AFTER INSERT ON `to_do_list` FOR EACH ROW
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
 
    
    
  CREATE TEMPORARY TABLE temp1 (SELECT
  
  SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.assignedTo, ',', numbers.n), ',', -1) name
  
FROM
  numbers INNER JOIN to_do_list
  ON CHAR_LENGTH(NEW.assignedTo)
     -CHAR_LENGTH(REPLACE(NEW.assignedTo, ',', ''))>=numbers.n-1
 WHERE to_do_list.taskID=NEW.taskID
ORDER BY
  NEW.taskID, n);
  
  SELECT COUNT(*) FROM temp1 INTO n;
  SET i=0;
  
  WHILE i<n DO 
 
    INSERT INTO notifications(usernameA,usernameB,notification_type,date_created,referredID, isreadA, isreadB) 
    VALUES(NEW.createdBy, (SELECT name  FROM temp1 LIMIT i,1), 'to_do_list_insert',  NOW(), NEW.taskID,'N','N');
  
  SET i = i + 1;
  END WHILE;
 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fcloud`.`to_do_list_AFTER_UPDATE` AFTER UPDATE ON `to_do_list` FOR EACH ROW

BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
 
    
    
  CREATE TEMPORARY TABLE temp1 (SELECT
  
  SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.assignedTo, ',', numbers.n), ',', -1) name
  
FROM
  numbers INNER JOIN to_do_list
  ON CHAR_LENGTH(NEW.assignedTo)
     -CHAR_LENGTH(REPLACE(NEW.assignedTo, ',', ''))>=numbers.n-1
 WHERE to_do_list.taskID=NEW.taskID
ORDER BY
  NEW.taskID, n);
  
  SELECT COUNT(*) FROM temp1 INTO n;
  SET i=0;
  
  WHILE i<n DO 
 
    INSERT INTO notifications(usernameA,usernameB,notification_type,date_created,referredID, isreadA, isreadB) 
    VALUES(NEW.createdBy, (SELECT name  FROM temp1 LIMIT i,1), 'to_do_list_update',  NOW(), NEW.taskID,'N','N');
  
  SET i = i + 1;
  END WHILE;
 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fcloud`.`to_do_list_BEFORE_DELETE` BEFORE DELETE ON `to_do_list` FOR EACH ROW
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
 
    
    
  CREATE TEMPORARY TABLE temp1 (SELECT
  
  SUBSTRING_INDEX(SUBSTRING_INDEX(OLD.assignedTo, ',', numbers.n), ',', -1) name
  
FROM
  numbers INNER JOIN to_do_list
  ON CHAR_LENGTH(OLD.assignedTo)
     -CHAR_LENGTH(REPLACE(OLD.assignedTo, ',', ''))>=numbers.n-1
 WHERE to_do_list.taskID=OLD.taskID
ORDER BY
  OLD.taskID, n);
  
  SELECT COUNT(*) FROM temp1 INTO n;
  SET i=0;
  
  WHILE i<n DO 
 
    INSERT INTO notifications(usernameA,usernameB,notification_type,date_created,referredID, isreadA, isreadB) 
    VALUES(OLD.createdBy, (SELECT name  FROM temp1 LIMIT i,1), 'to_do_list_update',  NOW(), OLD.taskID,'N','N');
  
  SET i = i + 1;
  END WHILE;
 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `birthDate` date NOT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `familyName` varchar(45) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `relation` varchar(45) DEFAULT NULL,
  `image` longblob,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('kwstaki','zoukas','zoukas1sb4ck@hotmail.com','kwstakis','1992-12-13','Female','zoukas',1,1,NULL,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0¥\0Ü\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ïñR)¨ñR)®„Ì¬X¤ SR)¢àN¦¤SPƒREÀ˜\Zx55 4\\V$œ\rF)Â€± 4ài‚œ(@isQÒæfŒÓ3FhìÐM34™ M&ša4\0âi„ÒL&€FÆ‚j64Â1¨˜Ó˜ÔLi\0Ö<Ó7PÆ£-ïEÀ¬­ÅJ­Y)¨§§ëS.¢žŸ­W+25TÔŠk-uôýjUÔSÓõ§ÊÅÌE4ðk5uô©WPOOÖŽVÈÑ¤³—POCR\rB?CG+dhN¨øý\rH·Ñú\ZVat^—5P^F}iâå\rcº,î¥ÝP¬ªj@séùÒÙ£u(B}?:_-½¿:W†æšM<ÆÞƒó¦#¨ýh¸XBi¤ÐÇ‘GzaaÄÓI¦ÓÖ˜n#þõMFM5®#þð¦ˆÿ\0¾)j=cQ±¤iãþð¨Úhÿ\0¼(ÔdóCLŸÞ™3÷‡ç@Š;tÈüêQ!õ¬ô~*eú×J0/,§Ö¥YO­QWçœT‹ ô#ñ¦å”úÔ¢SëTC¯bj@ãiˆ¼³Z•fjÏWµ2“ê?:VúÌjU˜ÕcïS#Òc4RoZ³+1Þ¬#Öl´j#Š°¤zÖZHëV¥@¬Ù¢4c¹¦´¤ÕU¸8¤kéšEIpã¹ªÏtþ¦šó!5^Ij‘sÝ7­B×-ëQ;Z¬ïÏZÑ²É¸>µœúÕF“­FÒÕX›–ÚsëQ™Î:ÕF—Þ˜e¢ÀZiÏ­Fg>µTËïQ™h°Ë-9õ¨Ìç=MViEDdç­!™ªüT«!ªÆ:ÔŠÕh‹—J•_5I[\"Éÿ\0]1\\¸ÜSÃ‘TÖOzHqÖ˜‹bCR,µLIOõ .^Y}êÊKÆ=k1^¥I3Þ¥¡¦kFà¸«	ìß˜¬Èä÷\\ŠPyíŽÕœ‹Eôi\0©²(ÿ\0R¿U5mÎ8ãƒŒdTû‘”í‘Aöê+&ÍR\Z.‡!âäô¦|ç÷|§üæ˜!1®ÿ\0hàäÓdÀ\\>vztÿ\0>”]Ìs>áÐóÏsPH0¤ÔRòäá…WyÀÜÃê{U\"Xù;Ãš®ÍïÞ˜e$ÞsïQ4„çß¦jÑ™óQ4i\'<œÔLügµP‰\ZAëQ—÷¨ZCøTM\'¯ë@‰Ùûf£,=Z€ËŸþµ1¤ë@³Teù¨ZQQ™y¤2ººÐŠ=	ªJç?*?Ö­rê•þñü©à\\Õ5zxZarà>ôðÇëTÕñÎx§‰\0ô¦+–Ãš7åUóÏj‘\\àÄÐ\"ØsÐœTªÇúúÕEcß¥LŠ	8^äŽ!¢ìrŒ\01‘ÏÒ­Åp ä¨çýUœˆ<žš·•#sí¡ÿ\0\Z†R¹£IQ£§ŽŸç×üö—O±·µ$‰.° y“³à{dý9ëùU0€ÉØóÓü3Óc{ŒŒ¾îr\0\'?—Ò±hÕJÆ¢	ò…çÛ¡ÿ\0ÔÆ¼–y°ÄÀwÚè?ÏëXòËsÃy,@ùŽã©ÇøÒ¥ÙVÎ¸ûì@×õ4¹\nç4S\r–@GO”`ÿ\0Z­&£~{PCu‚çòIÊÆÌî£ýà¦éø\nªÓE“yÇ(ëŠ¥K™jKëp\0müëÇåPK5£–O›¾b\n?0M@÷Å°U†·?‡ÿ\0^ª4«ŒíúU¨äL^-ÌpxêÂ“ÉÝ“ˆÊ9ÿ\0X2 þ•I¦í€M0Ë‘ÚªÂ¹3e[ýcèÈ?Â£}Ý7€}ÅDÓ{zŒÊ9ˆ¨Ü‘ƒŸâSøT\'Ìà|‘úb›‘ÙúS·Pã>ãü)\0ŒìÚ£2BÏÖ•¦qÆÐ}pj/?“Æ?*\0OµH¬F1úTaN9à1Úšfm2Päö§‡ôý*©CúŽ*®\"È~yðàœ•X0=1ùÓ³éÇª‰¹l=:z1ë¸œU1)‘úÔ«*“ÈúP.»Žþµe‘œäcóãük9$äÄÈÏõ«I.ÙbóaHÈÏ8ÏëÞ¥”™¤#-¸}ìÃüóVâ(Wr»·<Œnü;~?SU¡Á,T\'÷˜õ?O¦{ûæÜr.ï-6y`ã$Olãú~6h‹–þ[„$¡?{aè3ß¥YT;¤;ÎH\' ½òg©šW*…™ˆÁÎ8ç¨ëÆ8ìOnó§Û1òòCnç¨çñÁSžÐÑi–dXÒ<˜îFÞ>ø#×\'óý\rA4Øuo¼ }ßÈýqŽ•\\WffS™7q•9#ê¸ü3éUdd¹w@–F€:àã±ôü)&6eË\"Œž8p3úóTf\nqŽzÃüEYšêì¥d!I?7¸êyü3Ž¢³e¶ò¿ˆç+ßùVñ±Œ®I#(PGQÉçÚ«œqÈØ¦2¨†ry÷÷—çQ³(È	ÇJ¢.9Ÿ·\0Te¹ê3Š~ì‘ÏzŒ¶Ó’—ã<~4ÆaÐŸÊ¢.Ç¹¦Ç^iXw$fêÔÔeÈêGò¦™3íøÓ7zC¸âÇÐ~tÒþÔÆ|	úäÓ7³þ:›˜¢·ÓD|àœ}Üÿ\0.Õf;íÑîòÉúdUU$\nPzòN}ë‘I£¹Å3En\0U/¹sØŽ?:•dI?Nk*%EO”0³qùÓãìW’3•­Uh‡E3EÈA¸ƒŠã8ãÞ©o™(Ý·É#•J·2UëÚ­V2–±o§ÿ\0XÑ“œœþuÚc\\+£/°GéOG‰þì«øñüëUUJ„‡n÷aúÓÒfVS»8äÁ¡Õ•×÷yŒÿ\0sRy/åd`€pÄËóâ­MºrDé¨H¡TmSÐƒŽyõ=?ý~¦´lõY]TãýîÐFáêpsù¸ëX€î`<¼òŒs[VÚjŸÞÄ]ä\"±[vW\nÇ¯^G|JN ¹ûk»iâ%›2(U\0õäu7ÿ\0\\éDÖ¨‹*É°düÒG´‚»Úéó\\â¹9t™íâ—3>øÈÀä6ð1°/sÈç \nO ­ˆå¶‰îZK›´\0äÉ3t,¤ŽŒO#<tù¸Î.+¡ª›êl/˜Ê%MÒ(öW=>ð$u>ýøëTæbÑ¬`C0ÆW%Ž2=r1Ï§^})Œ\'‚ñ‹c¤1e\\Œ\r‡©U`rã<Ò9µà´?lWm8¹Ž2ÝP~½×ïpxZžR¹Ñ^âBI40Ü*)Ç˜Ÿ¼SŽ9ýqî;UˆæE,û¶¦?ÖWÐŽ¤r\rUžü¼ÐËçL¼%hH\0`ð>cÇÎ8Ç1T¤º™š9¤xp®Å8dç¯]ÇÔuãŽœVª,ÍÍ–xßi;Ãw\'Ÿ—§<Õ6•_=	É<`j•,Ó±Îr¯ÔÓwÄ( …ëÏ^½1þ¦–3¸æ|¡÷ÿ\0?Ò¢gõÈ¦³\'LñžqÎ*\"\r;zniŠäŒþç4Òøìß•DdèqëŠŒºŒŒ3ëýh“¨Ç×Ša#·ýšˆ¹ÈŠavÿ\0kóÍ!’³ŸV#×4Âç\'¨üj&—ñúS<ÑïHe €ŽNsØÒ”sŒ})àŒSY–0X¶|×š™êØa9¨¦ŽG\nå­,×aB„(Ãv5,R¤‰¸~8=\r5!XdO.ßßÈecŽO¯ãJø’6F<9©Vy~€Õ\\VÙ\Z #‚yÏçQDÖ[°&RÌyÂ÷ôëÍLPŽÕ[¬nÎ‹†nXúÓ¸“zÝ³¡ÏðžµaooaÈ2³\rÙÛ ïœÿ\0AT[%JœàŒqÅ5.IÄW »þ¹üè»‘µm¬º€—Kç/r½ý¶ž+rÇWÑäreTsn*Ëœõè@üñ×Ú¸øÖ$\"…Ôæ?wã<œG3\'‘©§Ë¦¢ù¨É*\0äpÊ¼çŽGp9¯oö5™;gË¶ó(Ë”`¹¯Ó¾+Æe¾7‚ž_”£÷o{ãÏçWm<I«ÂRâH„gåËdŸÇ“úÑ¯qr®Ç®Ë5¼6ò@D±È@1”·cä€WœH<÷=GlÛý\ZyLl‘Û¥¹F}ïº0­×iYBóŒëÀÆ/mñQŽ!öëk{˜Ó\0–?†Z×ƒâ†ñ\"$ð†ÀxIÈëÔÇéŽÔ)4L©&cêV	ipom ‚mýÛ:ËrFNâ:ryÇJÀºh¦Æ€dî]€nFN:zžç¸¯H‹UÑuüÄ¸!_/ní«Œûœž©¬ýWC±•÷YHRrÚÚâ-Ìÿ\0îÈcé[F·sžTCÏ6åY˜•Âîù¿ˆgqÿ\0Öàý*\"6®æQŒéÛŸNqÖº{Ûã©µ\n£x99äs×<ç5•si@V3Á$dõÉÁèxõüºVÊ¢f2¦ÑŽÄ8éž8ëL.?È«2XÈ£qC´¤žÇéU0ç &¯™Ùƒ>NI_ÄóM.PsP\\\\-ºn`G#€pk:ëP%1p{ô\"¢ucÍ!NR/Ü]°\0ù¸ùH(K‘#0Ú=¿úÕÏùÌ~lž:qÈ¤iqbX¸éX{sc¡µ.¡dŽ¤Uy55FË\'#<0¬‰dÞ>N¸ù»úÔ>hÈ¨öÒe{›2kW”\"Ó\'š¬ÌãæÈ^™ª[²6Žµ_$1Ís-N«šK¨–8e\rœgÚ®\rAc„DêIõ>•ˆ§g\'Ò”Í’ª°&mÇ¬2N	a$íÞ·axncDàcÒ¸…lþ5j™!9Œ‘‚­-‡s°ØàðùúÒ€ˆ}EdC¯F«ûô`ßìŒÔ£Ä¥‚í~N:\n«ŽèÐm£©ªÑCnì™.ç’zÖ&«­oŸm»á êjŠjsÌŒ¸ïšz“tuû}1FH=\rgéº¼W*¹ýæ1õ­=«CŽ€Ñ~ã\Z$\"ž%¨¨ÝÒ1óáGLÔ~lD€²©\' ÈÍØt?ÅƒMûEß	þŽÑ—!@l~]j”·1Ä2\\cØÕwÕ\"DÜOaNâ¹¤ó-¹óÝ“šžRévÎY;dÿ\0=+kjWî}3Plçþ=ÿ\0#EÄÙÛÃâk²…^Ùv1ÈÀlãÿ\0×K¿c<AXßj–ŠA¹~ŠIÈÇ¿¯¨®ME&\\É$‘’Ú§\"–MUñˆŽ0Ãš.M“:iÐiÏunªŠ…·\\ç·§ò®(j3½Ïší¹³ÎGçK%ì’†^B‘Èýªƒ§*{äcÒ‡6ÉäŠ%iÞyX³’3Üô˜	*\níþu6Ž{óƒÅ6O”g×Þ•¯¸Ñ#HÊù§éJ®X6xÇ=	ÍWÞ­Á>ôíÿ\0\'$îúcÿ\0×E„=¥?ÃÏP1šg˜	%°I=qLg>Ÿc‚vž)ØdË#´…°qS++à0çÚ£Wµ/ù{T8”+#gÖ¢üårOâŸæÇ•<¸+žõJà0¡Ey§ïàzÐ$Î3PHäásÆ*,.ÀÁÑÍ¸·~)±H§\0ô\'$äRØ˜wòôëQ‹hŠýâ[¾*\\\0“Ç¦iÈ\';f©6%‚1nâHÎYNAô©šâGpÅ¤cÔÕs\'šf<òj]ØËRÜ¶>v\'\'¹¨ÖBÜŽj»±eÁÁÏJ@¼ç¹æ‹hÒ»åpV“ç’•#O·=\r8àùP„3cËóíJ¥óËíN\\Ž}ºÐr1¸õéU`°‡$:{Pƒïòi$ŽôvA#´IôB3{œƒß5~Rvô=})à´à‚Äc·ô¨Â2¡`F=ºŠH1qÐþTÃ×Õ¿;¸;³ŒŠjäuÎ:õÆE1Ç¼íçLÉ^)çëÉêi“éM\0…#4ÜÒãµ`â˜‰ºn§Ä	8Ï½R{NsÇ^´…éÀëEÆ\n3Ž‚ •\0%½‡QN Åˆà\0;ÔàØ¢ŠOp@ÜƒLÉç=¨¢©lÁ¦³3íEÀDbçžÕ)\0¶qŒZ( 	\"PòÐHŒC…þJ(¤À•°NH….Üzòh¢¥Œ®Ä*@Í4üŠ3óu?J( ]AœoçÞ7ï\0ª;Ž:QE\02Ý.ÌpÜPØW\n9ÍSê\"7ÆBŽ=M1\'Ž”QT¶Q¤þ´˜Ïz(ª@ÿÙ'),('malakasds','alex','vicky92stan@gmail.com','kwstaki','1992-12-13','female','awdd',8,8,'','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0¥\0Ü\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0òë½ <?k°>dG’‹ÉZ‹MÔæ°;p$ˆýèÛ¥UÑµy¬fNAûÈz0ÿ\0\Zê?³,uä3XH°]ux›€M\\|ö#M;HÖ†meû4çþYž‡ðÿ\0\nËÕ<9s§Fe¸ZÒE<TÑéwvºœ6óÆñ»8\0ã¯=mxÚwžâËHˆàHÀ·ùúU5Ë¶ÂZœ¦“¡O¨“\"HÐ[ç\0ž¦¶[Á£¤wr‡9#Šêìl’RÆW\0V’[dî=ýG9®gstyUõ•î–ûnWÌˆô‘k2á‘˜kÛdÑ­¯!håŒ2‘†¯4ñW…BÔcÚ\\Ý»	ô4F:ŽSmYž‰àÍE¯ü)nå¾xWÈsþïôÅgx§V½Ð|Qi¨Y@…®­Ì.ŽHµ²}p@ª.J¶§¦¿\\	U}ÁÃ1]ÄËø§íµ\0Ÿ=µÒ}²ëÊªWKBcfÕÌë/é²È«ªÙOc&Ö(Þ¿všséúÅ±òåµÔíÈ»ucê\"¼±bYASùTidmî{)¥´¸^D±\\W$qKi#¾¦_$¯s¾ñƒ¼m§O©O,ú_ã…Œ‘–ôØyÉôäø…­/s»\"1Û*åŽÇ«_Å\ZŽ¹âK›\r>úT˜Û£uwçŒ·lñúÖGü!zÞÀâÓ*N7×\ZélÏ>Te{4wº?á¾€A©\"]BÜÇÌ>£½\\¼ðÚÉ¿Ð\'CÕ ÎHú…sžð]®±®ÞhÚ¬òZÎm¼ÛkˆNDn9ÁÏéÔV¦¥§x“áÎ§Û†ûWlEy1Ê=¿±çùÖðœeýhc(´S‰Œ““ëÁGãŸJ¹oqæ²®:Œ*Ý6Úo,þÓhËo©¢ä€püú×©^6”dKßÝÜÛŸºxfö¬+áã%t8NÚ3mÕU²æ¢•PA9õ®M|s1“æ±Aüßž+ª³¸‡R²ŠîÀ8û¬0GµqÂ‡.æ×<âîp5K†›.wžœÕy-Ä¬^\'8=Et:×†\'Ésh|ÕbX§ññ®a•â|Êãð5Ú¶3kªŒ‰•dùF{Õæu¨£’I\"&X· 8Ü:Ò4m°ùeOð“Ò©»·©RGÝ!=º\noCAR§4Tš¢ÏQõ«vÉk$#Í\n®§iç÷ªqó¦º9þ”¥d	Ù‹%×+Ö´,®¦·.Xl8.½PûÕ[FÄ‹Ÿºü}\rh¦,îVàÐ·Ë2ã·­%QÂV:=’>eÐítÁp±Å©Æ’( ¤àgwÇõ¬ÝBxîüw‘²Ë;è@ZÏ“A“&m6@çË?tÿ\0…V³¹km~Å®â0r®\\áyÎ~µ³”\\tÑœÖ’g¢)¦÷<Â¨ZøÛI–ÿ\0ìŒeŒnØ³2üŒ~¹â´nâß§Ë³hÎÓíí^{§ÙEs¥luÉÜÀúƒšæ©5vuP¤ê¾Tv>\"ñìZ5ä–VVé4ÈçfùTú`qzŸµ-nÉ¬ï„-	 ±€TCXÏe3Hç\r W#ž”é4Ù¢@^6\\ö\"«™w2i_Ã›Íž7´ç‰ó{’?Äf½ƒÇöŸhð>ª!\"íÿ\0uþ•áþI`ñ¦’Ì¼ÐƒŽ+èOÇ#ø7[\"0ìssþÁ«½õ!èxdvQ¦Ù g€‘ŸñùUŸ:âßâ!2ÏH‡Ì>£¡ü*KTSk	ƒsÚ¦”GLò¶ÄA’Ç¥vÔÁÑ«yÒÆÖ¢ýÖPmÔ`Ô­Á¸O,‚€§ã]\\\ZäM¤»=Â8Àvä“Ó¾?:ä´í~ÍµËxã9ˆÀ$ãü+¥žâÝ®”‘˜ŒHínµãV¦©Ë•jzPªê®w»#ð[j¾;‚H\"òÑ´L¤î%zxã§j÷	4èï`NÔ¡K›9I\r‰òà)éß>õâúŽt¯\r|AŽKäSdÐÚp¤˜‰ä¯Cõ¯lÒõ}#\\Š\rCL½6¤1+`g¦pAç¡®šKÝ9j?xñox>÷áÍâkz4’É£»÷9hôSì{ÀóŒùV©¨x“T’úíŒ—žŽƒ°Ò¾Ÿø£$MðûP¶*Ì²ya•é¼é^]aiaa`dEÛ÷ˆ‰¢­W ¥O›SÉ®ôùì‚®áÇµv^ÕVk±2âXÏ÷WÄ°&¡ÜÂÌD]1ÐúÖu…¼š^§oænùÑ]øäJ.ãœy}âáÕ“ÇoÆ¹ßAjö±#F¦òCò°ÜŸjØ˜Ú[A%ÕÅáh×¢÷\'°Ç­a\\Z^­ÇÛ/âhžàf5oáNÂ´VRå{œóŸ,nŒÃ\nÃU\0V4ò‘9hð¤qÇzè5T2rÌƒî’0OÖ¹áo3ž#oÄb©ë±ZµØñ2J6Ì\0=2KfQ•ù…J¶ül°¦¹X0MÞªi[¹ªjþèØ>éã½IÒœŽ®»—ò¦ž½)¤+Üžþ×ìwl¤b9ÐÖ…©v…\\\rØÚÃÞ§ŠÕtç†Ngˆí\'ù\ZÎÓ¼ËME­¦çÛ¥sÕW‡š;ðÓå©g³:Ï	Îe³{I	2Û±Qî1Åm_Y[\\Ûþö5p¬2\næ¹]\"Smâq8Qcñÿ\0,×a~÷6¶²M^s*pŠ:àç¥T%x¦cR<“q2¢Ð®-Õ›I¾žÜ»Êc¾&öÁé\\½ý•ö®÷ª…$rÊ‹1@IëòŽk¸ðßˆl¯-v,Ñ‰\\ó¬¾¸ÏZç>$Z<Wös˜š\"ª}ÁÏòaVˆ½¶+h3­¤¡˜7—!\n®ìgœW[¨ÜiïiÏºF=„dŸÄW!àËèÖi-î<}TbºÈn!Yd)w^ÞÝ±ïÅqT^û¹×OX™¾\Z³{ßÙÜ|Ê‹\"2©yëÎ½»V‚Y¼®†bìS×å5ó®½®\\ÚëÉ-Œ­	•×aä<s_HjW)wðþæX&%å´q~iH_æÕ×I>]NJ­shqzÂíIð´zßöÝÆ–VÙ$•œ†BÄ€:óØs^)¬k²Ý‰,â˜Ël‰6”2Ó#µzgÇÝjC«iÞ†cökX²F:o<úð?Zñ¢+^f•®ee¹5œÂÚé$eÞ™ù—=Ezu”ÞØFöªó,ƒ÷rïùqþÐë‘^WŠ¿e¬j:u¼öö·rÅËµÑX€}þµJ|Ú£XO”]qãmNT‰Ë¤gisüMÜþuÖü9ø™\'EÅ¬ÚÛln]]À“kÆG¯c‘Ž8è9®˜«JÊÄ7sê÷×¼9âÏ]êð]lÓãÖ`ë†±÷Jçïr1Ž¹ãºrƒba•äšPÊ‰ dŽæ²¾i­â-}ü;&¥5¥­ÒŠ Ü$’1‘Áã8-Íu¾9ð<†Òçû^KˆîehÄr¨Êq’xê?8¨«$kFJ.ÌÉñ-½½¶Žb·ÛóO=ëÃºž™oª‹ŸBÓ$ñ\"¡+Â(Ï*úDšÃGkm1†–gR»ý—<þ5‰´ûh-ò(\0|ˆ=±XÓŸ$—siÇœÑÓôÛ{ÄRßÃû½Éÿ\0sç6¯õ=‡ùïZZž‹ªê’:­üXÉ&ô#hö ZòRÒ` b=3Çå]5¯Œ.4½tí25…”y¤Ë³1ë´tQõÍsâ(b_kM¦öÕmçêa:1å±«áil™žk»hí‡I¥m¿¥rÚ­ö›i„’\\L¤ù’ãj§zË½¾¿Ôçßu<·ÌIü…XƒC¸•CLD)×¯å]0ö±IÖß–‡3(\ZIîz·D`qÖ­@¸VpÄSäÎp:íQM\\èQVÐ¢§#?…;Ï~ê	÷§I&ÓQy§Ò£DKHé.dm#WK•A(Ä€VÍî—o­[¤Ð¸ßŒ£Š‚æÞ=cK\rg#+ê¥fè×³éä°Fx•š÷úŠÆýÍ¹[Ø–ÓMÔíõh&œ‚!\'kŽõé–Ã6ãpã<\ZÆÓä²Õ£WŠE–<àô>ãµSñN±ý—¥måxîf8B!GSV•ˆ“¾ç-}o¦\\j\ZzÚCrVà˜än‰ê?XS]\\ÜÏ$3\0ö¨úäžM/n•HÍ–´û¥µ¸V‘XÇœ‡¨÷®ÔkÏ§¹Ž{må~y·mp=vãƒø×:Q€}ÍDé)j\\fâ‡NÂK—uÎÒxÏ¥[ÒõKÝúÞîÊwà‘eUÏÊJ°a‘ÐòS Ö–±ß‹|E/ŠüKu¬Ë”ÓíýÐmÁ0 c>™É¬@¤¶$œz) ŒÐ#µ‹á_ŠÞÚ{—ÓŒvñ@\'3\r®¿LóŒW9¯}?´ŸøAT5û5Ü–Ì\r™$2¾6ìÈ\\lî9Íx\\\0=±@	ŠFµ³¡ø†ç@ûAµ·´•¦\nÜÃæ\0zõ¨µM~ïS³‚Úá-ÂBªªcˆ+£\'©ãùÐ2	êshZý®±nAšÎU‘c âAÑ—=¸?–?x›UñN¢ouY÷°â8ÀÂD3ÑEdÚÃåÛ(ÇÌFI§”Ï_ÊB•~§Eá¯ÚYÆÖúƒª3àœ{qXÚî¯&·|eÁ[tùbÐzýMR0\'¥)Œ1Åf©¥.cNN¥b´Ð}¸ÅX)šaP½ºÕ‰Ä»¢J‘Þ4.÷ƒåb9v­{•>Kã?t×;ˆæGþë^oh¯¢j7.¼Š¯·šä­É4yÊ½Mu<ÆÏ¦O÷I Éâ™dœÑïðkqt™è$ŠÝzâº¥Z4ãïzXæÄ!î‚>yºÕ“¦F@1¹e#=qcVõË94íB)ðFGnj¸79 g88ã5œf¦¹ÖÌ‡dõ\'ÑïßL	·gêGðŸZžúöÖ-Qní&W`J‹ßÞ™fVKU8<Veú*K…ÇáPŸ3qgd¡ì’œYÕý”Ã/Úì¦kyñÊ8of\rs:ž©q«^}¦ãhl\0b·-57µ¶í±,¨Û*r±ô5ÌÈUäfQµKçŠ0©ã0ÅÎ”ÔgO®âóbœ´Ã×4å?­tCÒœdÒäbsÓ¥0/é:kêÚœVq:©ýç` ©â£Ô¬ŸM¿–ÒB¬Ñ¶	Sh³Ônì	û4ÍH$¯\\zuÅµÃéãQ•‰ó¦+¸õcŒ“@\\ œK¸ ƒ‘Ûµ:8ÞY’0Fç`£\'$ã­\\Õt×Ò5k:I¡šKwØÒBÛœà÷ëÂŠ«Þ—ÕÆiô\0Þ”Í»äAŽ¬=ª[H÷Ü©ôæ‚ ¯$@pvŽž•!¨ÔeÈÏ\"¬F›¤@s‚pqÍR=„:;7‘CDRpœf¡š†BŽ0Gë]}‚ƒdC\nºÈÈ½º9ãõÏjj<Õn71féŽqßÒ¶5¦aN«”ÜLÂ9ü*¼Ÿz­0â«8Ë~•ƒ5Î£ë^¡¢2\\øòA>[o…yâº}\ZöæßGQ˜ŒŒ§¡=«ž»åIžf:\\‰HãôëgŸSòátWÞB‡8}ëÖD”¯¸YaºpÁ‘ƒ¼WO¡øÂku·ìÒEÑdêËþ\"¸ñøz•£„Á«¼i}p¥°U2±ÜN9¹ÛDe¶\\õ<ô¨µ™µ]ÝA&FÚ‹è;WieáÛX­#KŸž\\rA Vô©{*JH©yhŒÏèsøScmKe7Î›yÅbCes¨Ü†hŠ&y$b½#KÔmÑt½mwA€b”ÿ\0±ô­(müfÁÞ8ŽŠ\\ŸåŠô#_˜Y¸ò_AÚ\'„,µ	Í4±7Ú\n?–w`p8â¼LtäW¸êž1µ:D¶ºdMÛ±_î…úW”[xv{›8O¯^sššÒåÖL)«ü&LIQHêUe¦GP3ùçò¨ÇJÑÕeb¶V¬r¶¶þZ‘ß.ÍŸü{ô¬ð*@P	§tâŽ”´\0\0s].£`òøG¾„fE¸äd1‘‚Ÿ¦?zæêæc—Cq–ó!˜ŒcksøÖŸA1t©ë––»YÕ¤‚p9?Ê™«cûjÿ\0œÿ\0¤IÐçøkø{˜¼Woªî’â9 Î3·r›Ûšç]\Z7enN+5?}ÃÑþe[¨þìö¦ô§¸ÍX€óVtüý ¯bµU<U½;›†9þJ\rhÿ\0\Z&@HUŽ€UfÁ$‚IñV‡ U´{ãÔ4l vn¬ÄóõJYY’1f=I§LaMÉ½($îˆ[¥Wç~MYqÅWeÏ,™\ra]›g¨®™.›rñ¶Jº.Aæ°!ˆË*D9ÞÁF=Î+Þ+ok*0¨Gà+*Š-ZG21šQg•Ýx7PÔ­$žeH$Qû¸%¾§µyýÄo3E*•u8 ö5ôL¼Œzšóßxqn¯`»…Oï$Xå\n3Œôj\"ÒV9’QVF\'ƒ´Ûµ	—Äyî}k®–xã`¹ÆjÄ‘ÙÚGc‹Y÷–‹<Û˜@Ç›lZè{|A\råÄˆ¾H”¤[sš¼º¼o†@ßQŠá|\'âs NñN¥í&9m½TúŠôí7\\Òõ`>Ës‡t0ü5äb§ŠÃÍò_”Þ\nh¥w§é–¶R\\]Šùbk“Óî`š;Ÿ³0ïo/#¸®·Ç6~w…nJ¹‰>¸95ÀøX‡óaäé]J²­EÎní2ÒJvD~(Ód±¹²˜©ò®mc‘N9çÖ±ƒ]?Š5+¹të.îÜfÌ\"˜\Z`mQýs^7ç¹„•‡E3$\r;q=kb?Î½ÀZuž¡à¿FÅMËG´©¢ì%X~9ü«ÎWqð–çg–ÍÎa¼·–ô#náü¿ZåÆó{âìÖ¿qQµõ:höžíXîe’Qo!”1Jì-Óê=kÊO\',y=MzV»ªépI¨ié~\nB—ÎæÇLqéÆkÍO^ôaãvê>¶þ¿J©iÊ&­\n¤ŸZc1,G&%¼ñŒœ×Q¬¥XƒÁb§±m—KïÁªjÄ±j£AÈ ¨>Y&l¾F u9«±à 5JÝ[Pó‚qëW6„sÓŽ*‘ëÂIê‡0Å0ŒšB{f›šldŒ:t÷ª­»hÔf­\\C$d,ˆÀ‘œÔT’M(H{1\0(ëš–Õ®e&køCN}OÄÖqc	ùì5ìwY\\ñ’+Îü%9ðžªW±hÅî\"ŽäÁ÷O±¯E¼9œV\\Ñœy¢î>´¹¤aÅu4²:ML—9§9&®Î\\°8Æk:VàT¶bÊ³µŸ!;ø«³0æ¨<›Xòj.4~]6ž’$ªnÉOþ½s×:§§Î7A*:œ†\0ñî¯l„…=úU¥_ï(?QZ©÷æÄwzƒ¯ì®¤Ùw\0ÎzÊ„ãóìjÍ‚[xwKÔ£‡bxælsž ŸÖ¢ñÆ’ÿ\0ðÄ¶Ë´(Ü‹ßÿ\0­^›¢èÐ¯†!Ón“r”NpwuÈ>¢³Ó„¹tRw*.Îç™ø‰­¤†¹dO•ŽPrQ€$z×<^DÏ˜’m8Ü‡ ý+´øam¢êQYäÜŒÈŒ~SN1Ç^Ÿþªâ*éFÑ\n²Rz\r9SûV„ºô>ƒ[’=¶sÌbŒž¤×é[™­/êshúõ­ôù’ÄÄ*gïÇëYÛ}ê[9Öòà‘[ò4¥$âö`{?ƒþ¥Þ“y©kq“uxŽU¹¸kÆ1ÏzûÜ©ÆÖ\0þuòÅæ%—‰î`(<»{ÖROBªÿ\0Ë\nEÆ.NÈ¿áo\n¦¹ö¥ÞVá1µXƒèkrëá~¾ˆsæ)ä2ž+¡Ñâ“N¾»¾Ó­¡’®˜ú“Œã§¦kÐˆhÂy-çY‡H%½ïõ®YUšwGB¥YŸ8k¾»Ðö5Î#h=«cëÑüg3êŽ÷¯\nª0‹,	Þq×ð&¼ûì“,ªŒÉÅtÒ“kS)ÒkT´;½\'C)átRgÐý{ý;Ö‰q¦)`uaØ.k½–xt(£I‰Vˆµóµ¸<qøúk†/0ªecÐŸ½øÖÃ¥^TÕŒ9c’¦H™Côb85p	ìkªÛºòe,û™TœŒZÓ]F‡Éx£vûÍåÅ6úãêŒ=¶©¦$n¬%Q€Ø<¯¥Ga ÐoÅå½³ÞÊ«·`$ž¤V…Í¬ÑÌÐ¹\0•Æœ{V…7\Z¼LcÁÀ‚s“Žµ‹§ªf­)>&ñ\\z­•œ1Dm§ŽåZh&\\0Áà©ú×§»–zX~\'ð•ž²¢@¡.î¸Ö¤{’ÑØT\0ŸSŠÊ•Q‡$6!»NÙ¯Z¡+Ôó7$c5NGíTOR¬äzUÆãÅZ•úš¤ÏósŠ’Ž¦Èµ^…ñž+\"8z&\'¥0+ê\Zr]jö·¤e¢àdWO‹È5”¤3VD¬vš¦îœüOÐõ[i5(mdšÓÈTÝÝ°‚IÈê:õ¯:häFÚÈÀúŠúbrÎ3ô¯6øªˆ·ºTê¿½e‘IJ‚ýIªRè+\\ó1k3”*s_GiÚ÷ƒt½3PŽE‚(b`‘9Rgÿ\0^¼ÚãÍÔ-RUGš¦Lúdf¾•‰ðÃiù\0À”œ›)¤´GÎºÇ„.ôÍrïN–O&B±ÚJžTúr1U[Ã—véæÌñ ^pMz·Ä{“Úêñ\'ÝTÌ=3ò“øä~5Áê\ZŠLÉÐFóïØT¹ÏšÆÔ©FgA®x÷QÕ¬ ³·wµ¶XQ)ÚÒ0\0‘Û=«“ÊÀœîOµX‚8ÄA¥ä“À=³I5ÃeB6–ÀÅQëB”iÇC¹ð«6Ò.ß0†SÛ=\ruw7ê’+<ŠÎÉ_áÙ‚3ŸZñý\"å­/T€o™sŒŽâ»MFð¶š|ƒu&W!$ˆ®ß«ÕÏRñÇ;Å³Æ\Z¬wú †Üc ¯së\\àŠwQ€qÐÓÂy’³•À=µL“*ª0äÖéYXí¡vÌ’Îíâ¸[kƒ&Æà.y·á[ž\\‘ÀÍ ü£Šæ¯%IÆáÃã¿äVùìƒÌÌï\nIŒžŒ89­#$–§Ž£Ë4ãÔÃ7¾(UI*Æ5p{úçë]ŽŸªËMÒÉ#…|öú×)£hFòöéÝ‹ýžÞIØ€Ž~µ¿¦!»†>Ü6XœäÕ)\'±ÂÕ´dWBGb«Êg*[’=³é[~Š;m^Ü*0vWäŸj¯=”QÚJÎÌÌA^1X¯©Í§ÝYÏ	c%»äåAä{ñš\ZÐG«ÌÜV{É÷¾*YfÜ¡”äjƒË„Ï|Ö+ÊãwâMQ™ñÍK#çðFv<Ð\"	[Ú«;ÜsN‘Î;Õ7”†êOÐT½F´7¢¼€òä³¶´íîœgžÙR+\n´Ù–`=óZ0\\&§=9¤˜Ò6EÂÆ…Ü€ëM´Õ¢žv‰øþî{ÖeÔÀÙ¹•ç+Î+3Ü÷;Ðä4B„Ë{v®âT~tÚTç˜È‘?ô5ÑÙj‘´1+·ÎFk?Æp-ÿ\0†æØ3$N˜Bj®5£<ÑÂ(b1Àâ¾°™šÆÙŸï4J[ë_=3îPs•$f½êÞå|¤Ã\0»p\0ô¤´*e°>ÔóÎmÏó¯OÝ°cÏ!¹õ¯eñ‘ÍáëøÝÔ¹ÍxÖï26Ÿ0«G^	-Y4“°‘œŒäSVO1ðóùÔlÙPHÉõ£±/=p?•3ºöv,oòÐ=jëjšŒöâ9®å6è›vgƒY¤ü¬¾œŠ%ªœnéN×\"V¹a.y\\T-&× zÔ(Ý\\{ÒE–˜œ’3Hj{$X ¤FWëÙE[IUd—î¼Q,€¨%¸ç’Üš4yv¼©Ó½Lö2ÄÚÈè¼$¯o¨Ü„\'-\rŽü÷ö®‹RÑ\"Óì.¯­÷+€dhc\\zV\'„þ*c!¡p1]´Ì€#eå!»ƒÚ”[<ÊŸÂÁ¨AsbÉ;ü¤`œõ› XË,7B+dr¸9õ•bÞŸìB÷Oa‘‡aõ^Õ¥àÍSì÷Wr¶aæ&Oq×ôªS—P”#k£¼šQ¸Uä(\n?•T–L\'^Õ·\nÜžqUf”ì<þ}ê\"Ã^N	ªr¸ÅM…ëÚ¨<ÁÀ8·J/ XY¤ÅgË)œSå˜ýj«0\'’?\Z\nH¦&•†\ZB~µ\'ö”öê€Ç@qEìaÔ.QAYXg“VT¸Œ‡fÜO°¢Š™!±-õ{¹.ïP .Þ*yõ²¥EÃ a‚¡Ï¨4QNÊä§¡ÌÙhÄQ°?:ìn<G}j‰*7,0ESZ—.„ZÆ¡wýš¥§$Ü£o\0\01é\\´M¶\"q’¤~#8ÅU£«	³Ù\0÷©ä¶Å\rÀs™T’1ÀäéEÑÓ?‰+#î·ó¥¸o–1éš(¦-Ñ­ˆ0=©ÈW-×<âŠ(d¯ŒÑŠa?ÞAÀÇZ‚ÍŠÞ±d‘Š(¨–ÅWøQÑxvåàÔætûÂ#üë¢{é¦uV9àÑEdy“ÜâuÒ$×fb>ð\\óì*µ¬ÆßZ´t¬€~ƒüè¢©¡ÚµÓ¹QUn.˜†à{ÑEfOS9îÛ8ÇëU&¹´mãi^ž†Š)¡•ä”†<j³LÀÑEZ\ZÜÿÙ'),('antwnis','zoukas','kwstas@hotmail.com','kwstaki','2015-09-09','male','zoukas',1,9,'','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0Ü\0¥\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ð\Z(¢Q@Q@Q@-¸ ¢–Š\0LRÑE\0%´˜ š)i(\0¢ƒE\0QE\0%Q@Q@Q@RÐ\0-´\0”RÒPš(¢€\n(¥ ÒÑI@¢ŠJ\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0\\RŠ)h\0 ÑE\0¢Š)\0RRÒSh¤¥ ¢Š((Å-%\0%Q@Q@Q@(”á@IŽih¤EPE¾†€Ò\n\\Q@AÝÄ##ê$fSi]ÙÎIÉ ÑE\'z`’–ŒPQF( ¢–’€\n)i(iE% QE€)h¢€\n(¤ bö¤=hÍ\0\n\'¥( õ Òš($ñLBRŠlî”1aÔHB<RwS‚QàY dU–´ePZX€=ÍÏéE!i)hÅ0–ŒQ@Rãš\0é¼;á+vEK|‰6îÜã\n	\n=Iù@úÓu¿Üi1È.íe¶•\\íVL:ã88?þªô¿ƒ²Çqa}í7$ „7),=úa_ø¶-mô‹1+)ºŽG;I-òú`Šçç|Ö:Õ8û;ž:Ò\r;½Vç(³@¢Z\0m¥—ozaZ1J.8÷ ,	K\"Æ½Iü½þ•¡‰\n´Q.i³†cëÿ\0ÖéU ]±¼˜äŠqùÿ\0OÖ¬ˆh\rˆþNêOÔÒ|‡‚¥Ø£’ÙÇ¥7h#ŒÒ¸‹¯4âÚŒ\0È>þ¿\Z*»]ÊT66ŒdO×4S¸T›EG¥#£&Ú6Ðu<“Ü·î£,={S­mþÑr±ÿ\0VúWH0€TÊ˜¾ÖSÂ³0»´[¨¥PAäÙIéÜ~&­|D×,üSmh–vrZI	‘œKŽK‘×Þ¹5‹®29üéÓÌòÊÌÄ¶îrFåK’7¹|îÜ§15¼6ÙP¯¡ì\ZÒË\ZÍ$€•<gßÿ\0­\\ëÄë)N¤1^sA\")Çµ/“ó2¯Ôäþ•rÇNûs2Æü(Ë€`uõö¤ÆŠvçéN\0ôÅ[Š8^&¸Úª®†ãðxç§QWfÒRÖÞÙî$ËÜ9Ú¨B)Á¦r©VéŽBÒ2„.ßÝð •?ìÌ?3õ?áVäÓ%XÖTÑ3·±éëLŠY¶Ÿ\\ô©æ4T›4t	­4ÝNï-Öê8¢|DÈdvR{eºûUV‹p<Ž5elÝWîƒ¹2=vŽsÿ\0ŽŸÖª1sÕJ£9BÌ~èÉ§}ð~SúVÇ‡¥Ò\"ÛW³»ž2U‚eB©$\ZêRðJÇÿ\0 MO‘ÆëÕ¿ëa)´ícÒÃàaRÎ_—ù£ÎÞ2!¿**íáW¹f·ŠEˆýÐÙcù€(«Rv9çB1“I˜^Ôã;Tárx¾‚ž!,¥€8ôÅis†Å<v4úÕ¿\'=‚ã½\'ÛGCŠ.ºTxyXŽûGá×ùÖ™ÉP¹äñU4Èÿ\0Ñ³2ìpO^úÕvA–ÙÝGZ´!ÑB«Ë:çÒ¬2Áö£æ–òsË ?LÕeVn9õ©žÝÖRÑNžâ‘˜Ç–J+dd‚OcX—±”¸dU!IËS[ÌÃìîOn+P*g\\¸V+Ðúf“E\"yeXQIf8\0w5¡Ë´öðŸ•€WïóÏáþ~•‘!e+¸´ïsS,L«†*»†T–ëÁ,h“N¶’âýH]ÎØØ¾¤žµtGKþÜñ½¶”7T²ÆÁ‚†©,AÁÆæÜÝ7U/•‡RŽ+J¤ŽŒ”?÷ÐJõ]Âºkév×RÑ#K.:±^@õ8\'üš–m\"kGÒì<1ÃñÂÂ[]®äsóÇ<å˜„`óGi¤H¡gHIT œŽ	ô®ÿ\0Ç·±©³€*¬O+2Æ¸@\n?\0q]Ï„®´[¿Ka#Ãí0IŒ³CR8ü«•É¹YÞœ)áý¬¢åv–<Ï:L‰,Ro.YÝb$e]Gã½+Ñôïh–6eVÊ\n|òönœÙ8Î8ïI§éú«%Ö¡%»v¥á’EÎÕBA*O#\'ü=kOZñ÷âµh-CK&Â ¶(±œŒg sžà`v…Ú»8ñô•:œ°NÆ6­©Yið“{<qÆÀáÉo\\(äõzó_ê6·Ú:GS†ã|LøÇ”FêNr Ôºî¤ºÄóÞ„\n£dq©6Ñ“ÏãŸÌT:‚Àt»|æmß§5p…‘È£tÚ{4o†$Ö´Ø¯#¸°´‰ÆQ.¤ub§p¨Ý}Îhª¿ð—x†ÍÏ“¬] u‚Û‡§Ï|ÑWc&™ÌD_€¬ç!y\'ùUµˆà+0Á¸«ÚíÛ´‚§ŒäÓ…ªHû‹0P\0?çüõ©¹j¨€žÝ9úÔbÝdC¸2ƒÈÆqWÒ	q´`(èÞµ ¶Ûd9ÆzýzZ.)ZD7N¡ÏŸëV‰Â:à‚H ÿ\0JEŠeŸg–Øp$õ=? ­]SE¼Ñ’%½…ãy•]P¯U9Ï=ˆã~qZ&MŠV V\'É´ù;1c’}i›‡§øÒ¿ÎÛcùØö4ÀŽB­o•\0sÒ¡m6Öäš62×qéR^1·eCƒÔØŠ}¥ÇÚmcš02FIèE\0ÊãÃöÌ~_1xÎCTSh‚”$»Ä[‡ï1Û¯?Ò´_S$£(ú³Ÿœzz×7}«KxJ‚V2r}XûÒi\r3ODG2\\¤e‹\nœnÉQÖ½Þð®—§Yi°È\nÚÂØðK:þ?xÇ¿ŠìêvËr„du;ÔÔW¢êº„sKs<¹hžC÷½	à!XÔÚÆôõgâ­Yo5wÙ t…5*Û\'æb?ñÑ^a¥iPxhy”\"´/œ±îXž™=lŠð«Ûˆ¤¹™Ã¸s!eÈ ûžGnÕè>\nÕ§šî×J–ÿ\0ÍŽc;c,X(a€2¸ãëYû+´zTq\\‘·5¬gêWK$SK+€Z!°z¶ñÇåšå¤¸*ÌÀŽF+¢×dµ¶´¹ŒÄÒK< wFÞ§?Lz×-Ø\\eâ3ƒÆ+HÂÆñ²ªµ5íÙe°¸*~îÓøÕ¹”¶œ¹Þr€‚G?P?AYq\"/)ôú×tmíÖÕahömé‚xëýkc\Z	Ôm.Ç~£tL™`S¿89¢¯_Ø¼sù@3ªò¥G¯ÿ\0ªŠY+;2Í­¾é\\€¦L`_›éž‡¥J\"xÝ!yÓioºFJÿ\0…=ù+™Ù\"ì\n÷?—éBÚÄ¬GÚ\0\nÿ\0õ }\req´\"UrPž7|£ë×moÙƒ6ÜÄü¿ãWUUƒ°v+ŒnÂŒþ4“D…ÎcFIÁ`KgÛŸÆ•í’æÊxŸi71m˜£Ž+Öõ(Ž³§ÅöÛxYTc…?ãïÖ¼ÖÑ#mJdº;ØutóÈç¥zÎ›2½–ÃÈút®Š)Zç=iKáLàî<hñù‘^MÎ6ìuüA‡~µ«¡øRÓK¸†é®\'M¬\ZP0®p?®jÖ³<1Ï\rÇ.ÁŽÀ+1ÿ\0Ðkc@Ø-ßn\0éƒ]1ZØÁN{\\òŠÐËý¸—>BF³®éjB»ƒÔ\\cñÍršÖÉšÝÈú÷ÿ\0>Õéÿ\0­ÒæxA ìY7\0	ùNÓþ?¥yÆö÷D+#cñÍ+)huE·³~÷JŽ{¿2V|\0\0úTÐiö6ã„ü_7ó¦[êPÏ\n‡uWÂÇšS2;„¼ûKBí.òKMjÖñ‰&Úæ9œp‡ }8{Ä^%£6¤GïN?ñßÒ³b>BIº%f?0ÝŸ”Ž¸ü3××ñ­+\n[É¤Å?Úwl›³!áÉ#Ö³i;\Z&ÑË‡F¹YGÌ\r´¯Lg¦xëÒ»†Z…½‡Œ,îo‰	%ç;Tpsë\\	W‚VG$}jôB_+z¡ÛëT„Þ–:êmBðÂ@Šy²¯+œ×>bÓÈÌ¦MÇ®#?üU/•…D[y8\\ýiŠå”{DÏ—<&ãðÝÍ[}i–1å]»1ƒo·ÿ\0f5œ‘ÊèvÃ#ô\nM8[\\Ž°ö~ëHjn;1òêF]­pò;c°\nøÑLû%ÑþöÑÆŠ	r¾¬èâ‚ivŒH±rÈ0:t#§óâ­4ªnd\'çbÇêsòþB¤Ìr$¸ÎÜ€2‘ïÈàŽÜÒ•!”IH	Ææ cŽ€tÆOb?•dQN9BH¹™—~NF01Œý=¹¢V•XÜ\'›Á,Íõãßé[^bA¬°qÝÏû#$žG~õT„’íÂE¶LFõùG|“Ÿ×=\0G/ö)Úv±ËdqÀì9\0ö\0ŸÃ§¢xuÌšI\r’vå\\$+\\Ç!Uàïû½Î	$zuük³ðì–¬Ü)Œpzçk¢‡S\ný{]¿ŒjP+¡fFÏ™º	Áüvæºv(ãžs‘ï\\6§uæjwŒŠ¦#ò·ÍŽqèEtÞ\Z¹e0e1@fÎ9Åk	s9#9FÊ,ç¼Mr%ÖçqdAì?úÿ\0Ê¹©4Ûic‘Øœç–ÏÔu®Ÿ\\œnÝ<Y¶•ê@Çùÿ\0ëÖEÄ2[M´®8È*Þ¾„õë–oÞgTºŠ¿a³Âù@ç`\\S&µ‚Ee*ÇœrCcééV¶ó\Z8˜Æž£vßÄjtQ‰¸DÜxlÂ¦åÔþuœâŸÞ@GÊÝx×šìšÙïƒ;Ê±$Ik¿¦XdçÓ€sôÃ¨#[½³|Ý±ß >Øã½$Ê=ª±b\0?Å…Ø:{óÞ“%èrÚõ›ÛÊ$t †òÜs×Ä*ÜÓµûk­KÒ.maòa23:\r¬ìÃŒžø8£[…îì·´E°FÎ|Ã}lW!0T`Ãpý*Ñ\'PK†ÄHç3mÇçPË,„âRß‹d~Ò³c¾RõmÞ½sK=â”Ú„^Ø DÛ‰=GÖœvŒ“ßÅAj\ZDÞ]B†û»€?—ã_PYü5ð‚î\ZDr1|3»qô&´¸¯­™6?nh¯¨×@Ð#Ž6“I²·.™)ö4899¡üóƒÖŠŽd_+<t\"4“NÈ0/2;vïþM\\dq#åI% *ÈØ8<ðxþuJ;H‡1Ì¡˜íbçiQÁÏæF:þzH¶• º³s´¶ô\0õÏ¹çÐVW,•ì†!`<ÙQ¶>ŽAž…UûŸƒ\Z8qÃ/™òœqÔóÿ\0Ö­hRX\"Hã¼IâEÚ¥	=†p9ú‘ŸæHË+Me`7Ë—S’	ÈŽ‡Œþ|ŠŒDpK%Š†=r„à©àãuwÐOlÖYŒ8 rb¹p\\D²«®;úAïíWRñÖ ¹}¤`‚\ruáÕÓ9±TVžØÜje\0`“8áTÇõþ~¼V¾†‘âù6ŽOÊqçYìk‰^n‡\0q×éþEÍ:x­àò€Êc\nHê¾9UîD5ƒZÅÃ\\4{n\rÆ>ƒ>ÕF&ŠöCŒˆÛ\0”Np?Ï·½h™vqÀ)\'roÚ½Èôõô¬›ØVEÂÊ»IéòåO¿ÿ\0«éXUMM£zM8!öŠÍ½¢…mòYœ($Œç©>œgëH¶H³«6>7’ËÆsÀªÊÒ*6…+ó.vçÓŽýsZ\"I58­íŒ¸9;:®ÜwÉëÛŠÎæ„èÜ4‘«,Xl€F@0 ú€N•‡pÑÇvÉçi2‚Þƒ×Üg8ê}1Z‰Ör›ZŒ’HL¨<r9ç§éU/ŒŠûšSgã€T{ð?#ôªL–†_cý\0ü°$‘‚g<¿çò®Z_Ü-ÉX¥S’\nŒäsÛðÍn‹çÕ5qåã@@UÇSýM^…Îí…¾aÆ;ÿ\0‘VÝ‘œ¢è7§¬HþñùÐžÔ	EüÌpyéÖ»5á`C\'SƒÏ¯\\céÙL¬LjYÜÇ=2;ãùRæ¹\\§+†®£rÒy\0DØpÏÆGcùW~ºï‹>Äb}`»Ámä’:“þx¬§@î¬#PsŒCpxÆx<úUÛÚ­”SibÀ=ò3‚3·œõÎg°¹u¸Ó>ªI’}jð<‡q1J@<ÎÐ}QäXX…tF$–V¹ö#<Q@Ú»yrªË/ŸÝ(ÁgžOóÖ#ÉäÆ¦rUÛiP0\\€:wÇOóÒ¯Ù/3÷›–1ýÒwàžõv\"¹‰&Q²aNÜíd“Ç¦k-KÐ¼c…ùW’p\0=ÁôíÆ9ªÍ*ÂÌ’Ë°¨€ÊÊyÏ@úý½„»d´1´FÅI\r´Ürrpw€qØ}i×–\r,pO¼€é•$\"«÷ãƒÿ\0ë \nqÉ¡IBÊÁœ·~n\'=;\nŸÉ•y,pžsQÞiSÛ[2¤hòí÷2ùÔžƒØ{tª–ÌßhH\"óŠ°&_”¨Q¨…kJ³§}©ITëbÕìó;˜Þ6&Ø0H)øgG§j—ÎcÛµ@^?ÏZ…Ùw¬›YáÆXmrG_óúTÂ\"’+TVà`†ÚCƒ× ýiÓ«É&ßQT§Í—AYK%‰HO4ç¦Gùÿ\0\n©qm<$´«¸²ä‚=spj‰I¼ân\"™åþúòÐäÿ\0Z×·Ž[×Û¶F‘0v…ÜÍŽ1’{ß éŠÎ¤ùåsHAB6¹ Â«[“¶0Ø”ã×“Ï^õ~ÚUù¾HUeÀÛ»åB9ÈÇ?CTÚßeÉŒ±P˜ÎSŸÄdŒû~x©÷’JË3l\n9áŽ;õ½ªnU‹>mÂË<F»“…;pèO\'‘ëíÒšb“»Æ\Z“¹€]Þ¼ž§×ùSa3Ç¿ÊÛœ\'+Œ68Î~§è*Fµ¸xK°}¬¤ùŒØœ\0[¹ÿ\0\"Ì0™j©è‘TÇÌ#\'üóVä2ÈžDq‰$H¸t ©=€f£µ1¤äLŠñòXƒéŒcþ¼TL·\nwÌˆÍ„l“»<’}sÏ½;S~ÉR)¨Áo,#¨ïõàóù¥Ñ…ˆÆœãt6zrÓÛÖ´M¢D²Ë;G…}›Yˆ\'~^½ù8\n‹P‘GoqÁóã_óÍ1@Øß,¥XIOlƒƒüêä¢/%f:¸mÇ{Œm9Æsìsêi Àš\"ÁÇúÀ‡\0Ž»sŒžz})có¸µT;¨m½Ç\' ëšK9C¸HÏL@ïÓëùQW&»+#Œ ’K,—øõç=h¦MŠ‘Z™Z{æˆä`B°±‚=òíV£‚7•–‘Æ‡oÊ/Žl“œcùÕIg2ÂÍs3yAîlð[n?œWEd‹-œŒÊ2¬1Ž:Tu+ ß²ÛEddò’@2ËÀüzæ± y-®ƒÄ…¥)¹\0€:cŽƒÓ½uWQ¤–3PD@=~Py®~êÞ+›èL«»rsÛ°¥}.4µ°’°ŽèÏ$lÒä°û0#±Îì\0Î1Ç4Ëy..¡’5ÓâI›sd·#Û®;÷Ç­K¤CöNhžI12H„6TŒgùÖÅ´kç•ÜRm_˜ž1ßÖ¨W2e´{[YfxÄ§*ìCy]IÀè;~ªWZœƒ`Û´àìP9Àëè8ãòÛ·ìBdDÎÁÕ”‡ãÿ\0d~µ…(HõQF¢$•&Iüž½:z\nC#†Ü<eÓslÆ@>øç§áéZ)g$d‘ndeˆ†>Yäzœç±ëžÕr¼0\\É	˜%Ú˜\0ñïž½{Ðè\ZS¼o;w’ÝÉœþ$šE,^kG¼ÛF\nÛÛÖ¤1BÓ¾Æ;ð1´ý}?Z˜’Þ©óïŸþ¹­ëH®,ŒÒnfmÍ‚rÓõ4%plÀ{)ÕÜ°l+*–ì¹é“Ð}*Shñ+1\0±e\nJ°\0 {~žÕ·-œ3[XÀÈ¢9Ê4€(É\'o9Ç{TzÄI–cAÿ\0-ØÏ\':tÀéÐSæeì^j=ÓÇ´nÝ™p$žyÁÏ=ªµk9g tQ—ŒàƒÀùÎq“ß~•å8‚T‚GSÀÿ\0*j(’Ån‹€\n¨ëþ?ç€4¶ÈÖ/\'$ÊJ¡r73ß Æ:žþÕB9¥·,‡qÜNX\0§ÔÓê:Õ¯9¢´@Ý¸€Oc“Ï¹úÿ\0:tP	¥\\Èà€HÁé‚@òúŠä“Ùyv1_ˆ°Ê•q»Æp88ÿ\0<ÕQ#Ì6>×2bƒã“ÇVö9è1ô…QFì»šC‚I<`ŸðýjØ¿›L·ÚãóŸËq°ãåÏ=ù¡y‹É“s1+[¹Œ®äRŒê3ÎW°ÎsÅÛ¨|†)dMãqÚÔUrÜ/cÿÙ');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wall_post`
--

DROP TABLE IF EXISTS `wall_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wall_post` (
  `postID` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `postImage` longblob,
  `director` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wall_post`
--

LOCK TABLES `wall_post` WRITE;
/*!40000 ALTER TABLE `wall_post` DISABLE KEYS */;
INSERT INTO `wall_post` VALUES (1,1,'awdawd','','1','2015-07-08 20:44:25'),(2,9,'huhu','','1','2015-07-08 20:44:30');
/*!40000 ALTER TABLE `wall_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'fcloud'
--

--
-- Dumping routines for database 'fcloud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-09 10:18:01

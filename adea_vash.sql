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
  PRIMARY KEY (`activityID`),
  KEY `CREATOR_idx` (`userID`),
  CONSTRAINT `PERCREATOR` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callendar_activities`
--

LOCK TABLES `callendar_activities` WRITE;
/*!40000 ALTER TABLE `callendar_activities` DISABLE KEYS */;
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
INSERT INTO `default_image` VALUES (1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0È\0\0\0È\0\0\0­X®\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0¼\0\0¼º· »\0\0\0tEXtSoftware\0Adobe Fireworks CS3˜ÖF\0\0\0tEXtCreation Time\08/20/09)œ‡é\0\0tEXtXML:com.adobe.xmp\0<?xpacket begin=\"   \" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.1-c034 46.272976, Sat Jan 27 2007 22:11:41        \">\n   <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n      <rdf:Description rdf:about=\"\"\n            xmlns:xap=\"http://ns.adobe.com/xap/1.0/\">\n         <xap:CreatorTool>Adobe Fireworks CS3</xap:CreatorTool>\n         <xap:CreateDate>2009-08-20T16:47:01Z</xap:CreateDate>\n         <xap:ModifyDate>2009-08-21T18:43:52Z</xap:ModifyDate>\n      </rdf:Description>\n      <rdf:Description rdf:about=\"\"\n            xmlns:dc=\"http://purl.org/dc/elements/1.1/\">\n         <dc:format>image/png</dc:format>\n      </rdf:Description>\n   </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                           vÑÑğ\0\0œIDATxœí}˜EÇ¿UÕ=³	÷#ÇK 9E=7•Îx(àêÁs÷†€zÊáËp( *\rÈ[àî &\n!od³yÛlBvóB8v5ïÛUuTUwõìì°›é™™ı} 2»›<3Õ½ıíßkW±ùóçkQ–\0\0>úè¼çA\rÇš5kÀóA42$‚¨\0	„ *@!ˆ\n@¢\00ÆòA4$dA¢$‚¨\0	„ *@!ˆ\n@¢$‚¨\0	„ *@!ˆ\n@¢$‚¨\0	„ *@½XQ² QAT€B DH QAT€B DH QAT€ZM¢dA¢$‚¨\0	„ *@!ˆ\nyO€\0úúúğò¼ùXÕÙ…?:ìP\\üôß­ß°\'LšTç\\H 9Ğ××‡yóæcáâ¥XÚ±\n¯­Ûúûööå¸åæ¿\0tt,ÃÆ›ğèô§1eòD\\sõò˜òˆ…ÍŸ?_{ì±yÏ£¥yé¥—±jUV¯éFÇ²Nl}ó-pÆÁ8cp©v­¡¡¡µ¿6ÿ›ŸÕ†£ÆÅÁˆÃ=ÇsÎşóç{€-Jgg\'	$kzzzğÊü…Xİõ\Z–.]…×º7Z!ppï•sÆ¬@x:tâPZy\"1I†‚R\nJIŒ\ZUÄ©ï>	Ÿ¼ô8ár¿²¢³³“\\¬jéëëÃóÿıæÌ‡å«±k×0+\0Î8\nÅQFö{Î¸à`LÄ‚aÜZ`1$¢pÂÑVJIDı³ç.Â¿™IÆW¾|	%#H U²|ÅJt­Y‡‹—Cˆ\0a¡\rBVÂºRÂZ\r.+[ÆXÜÍà¾«å\r¥¥ˆ‚””’2‚Œ\"¬Zİƒ/õ&œîøÒ>‹ıöÛ/ßÔä@ªdâ„ãñã{~BaDBˆÀD#\'O(Ì}ïÅ!>)Q`à×J)ãbI™ˆCJÈ 2Š E?f<;ó^Y‚[¿~=Y“* ^¬*èèX†Ûx6nzÅ¢H`EÂE[ØrA¹ÄçŞÒÍ‹³ @lI\0h¥LÀ®’DÊJJHÙ(êG¾Õ·×|íë¸òs—à²Ï|ªîç§ ²—tt,Ãÿ|öô+Š£†EaA‚‹\0‚‹$9À¬õ0Y++†’$yµ¤\\®rºIˆ ŠĞíè x€~±÷=8]kÖáV›:&†	d/xì±\'ñ£ÿaX@¡Ğ†°Ğ–ÄZ!\\–*‰1b‹Á¬¼Ø£g1¼X½Ø4°ÒĞPĞJC)	!B(AŠ\\ëê	ğ~ãæÍ»·|ã6\\÷µ/Q\\2H Ãdz,\"Â¢G!,\"‹Æ½\nÂ8îp*€¥qS÷pïÈPª­Ç•	³–…ĞÜÆ&\\ƒi®”àÜÆ?6QÀ¬%cŒcöÜ…Ø¼å[¸ëÛj{’ZêÅ\ZÏ=ÿ?øÑ]!‹Ær„m(„‰	Ã\"‚ €@„ÂÆ\"L@0›Í‚ÎMZ7Nîj7 “Ÿ³ÒÿK½K@ˆ(˜ÏÌ\\ÂB\n…Qv˜¯Wvöà–o@†\n	dˆtt,Ãïx ‡a¡ˆ00î•!„KïúÅAî,ˆÿ¬ÌÚß/¥~“BA€ ,˜y†É<ÅQV0m˜=wşõûwÔòtµäb\rõ¸áŸ¾‹ş~Ä8DBX×&¹pË]ğÕâ¿‡q¿ÌÇ87NCë´ÅAj>É¼fÌš‹c\Z‹.º0ƒyµ.dA†À?ßr;öô+#\n{\'\nEA<Áy\0&„»µŒ%^˜Èx¤ß×hÄ~>ç`B€‰°€ ,\ZA{â¾÷ÁéèéY_¯ÓØ”@Ş†Ûp\'6lzÃúônˆ0°.÷µ¬¥Py¤?Ï¹_œ10Î „0õ™0´ÇPˆcO¿Äwnÿ\ZŸÁæ†R—^‡³æ\"ŠCˆ¢`îÌÌfŠü;uı–~_«ÁRŸåre&L@pSÄ‚‚=3Vvvãñ_?Uû“Ù¤@*ğĞÏmÒ·î®ë²TA½bá’äá²eœÛºˆH`]®ÀÆP÷>ğúúúr˜oãC„ÇıVtv\'SX€à¶RÎ8¯sÌ1œØ$‰K´ÍtÅqIBx\"a»÷DøÅ#ÕøŒ6\'Ô‹5O<ı‚m)Ä–ÃÕ6’â[©åh”óÈàg¹´uÿ8¦¸(è `ÚTÂJFxñ7põ—.ÏwÚ\rY2t,[õ·Æîˆ°ò¤K·‘Åá¤nÂmJÄ•ÿ ,àÿz·áñ_?ã|Hf=ûbâ¯‹Á™\0gÂ4–\rÈqø»µ\"Œ›cá¦-?{¬!^zeIÍÎi³B…Â2,[¾ÖÜY½g;„;\\Á-M£YŸÄİr=ÃŒspmEd…X¸heólLÈ‚”¡{ã#ŒÀ\0]@Î¸m2d¶£ÚŞ ›ã?0\rÍLØ=?ùhÇËóæç}ú\nH	Ë–­H™åÂmP”&4\ZÙrøøñˆ×øhû·¸MsàÕ%ËsœgãA)aÛöíÉ…ã²UM”¿,õeò<|bE„ØúÆ[ùM±¡¤q@n[Ë“ ¼ÙDQ­µ´ó8xãM*ú@J03ùE@ó¨¬†«)˜Õœx;cĞvÀ¹ šX	äb•Á<Ö%­XÓŠbpüxÄ­°bn„ƒÎF)qQÍY“X!É?hjXüjÚµÌñ™\'vîÚãÜ\Zr±Êk \\ky+`ÚâµÓ¾÷Úİ³9ïÉ5Ô‹UB\\!wM‡V¥‹Œ47&Ññq™cÖñ“‰t=8ÈÅ\Z­wáÄ±Õ mû#H	ïØw\0¸.ÕˆâC)aâ„ã½ïFŠH’õºÈ€¤¡ ½ƒ5Çš?[ç\nr\r¿î4sqá ”A+m®e÷^[‰”úYë%ë2 Õ~å’ôê#H&?ÎÒÍ\"Ñ\rğôSá JúbÑtáŒH()ƒ¶[\rhmCİš÷V²o	¤Zk@éø­yõøª°^ä»<4ß95ÔjR†Cz\'º^Û‚D­¦>ºÑ£Ûèzğ ¤üNó…NÜ­–Æ%$Fl÷Àà‹5Z§íGë{X\n\ZÀAîŸï¤\Z² åĞåk ­yƒMgêqÖ“\0@¤,›·¾å™Û®[Í†xÇå’­y¨\n² eX·nÓˆ	TcIØãİ¾}gnsiDÈ‚”ĞÓ³k{^G±mô€ú@²hCkP\ZcóÒºX>dAJX¸¸½dÏ†V\\°!%2`ë½øşïÎuF	¤„%í«âÕ>0B°K6û4É=9sí]h!”°å^³Xœ]åÃß­<÷ÂŒGzvw_ÏöÄ6)$Öu¿Z–“¥–üiAJ¶ŠfvÏõ–>æa@Az	;vîF±m·õ¸÷Q+…ç€9\"/uÍ\0ğÄÕ\"Ô‹Uó—VnOV€¥-ˆ[@11öpº.@.Ö@¼‹…yBiÅkÅS¼dƒ=Ş}ö#›ãÌ\ZH	.,Gœâyœ0ñ]yO¡a ”ğS&ÚîêÄh­aM)¿ËÄ¯Òxß{NÊû×Ğ0@JøÈŸj‚W\rø¡yÒ¦ÔìÁºN}­­j´ÖPZá ÇàÂóÿ<·Ù5\Z$Î:óttÀh­ROóğÁYs|\nZ)h%qù_Ÿ—ãü\ZH®øÌùÉE£•o>,Í&–´Àµ³ZC)	%%¤ŠğÁ÷Ÿˆ3?ôş¼&Ù@Êpæ‡Şã9RI(­ µ‚Ò\ZJk¯­+©v(û¬‹T\nRIH%É§¿oşîo.¯ÁÙlnH ƒpåeBÉ*Š\0%¡•´nHîö0‡Š¿6óWĞÒŒ £~\\tşûğ·_ılŞ§¼!!Â„ãÁG?|Š±\"JB¹”OIÛ,Ä^¢\rÆ•ŒP,|çæ+qÙ_},×¹52$\nüõÔpàşû@Ú;®²{zk„FÉÀŒ•‡„”®¿æbwìÑ¹Í® T`Ì˜}qÃß|\nRö[K’Ä\"n}ëfñœ•‚R\nRE8îÇÉS&ÕêÔµÔ‹õ6L8şX\\}ùøñ3’o¹\0˜F3õgi›ÎU*‚”.ıÄ‡è÷>È‚sÏ9zß$(™êfÀŞ¦Ñœ˜9i“XPÖµŠ$Üœr2UË‡	dˆL<nœÉj)™:şpx±‡’P2Â¹ywŞ“j\ZH CäôÓNA$û!eiE’®4ÚIìa\\+#©\"œvê”¼OgÓ@\"cÆì‹S¦§}ËWØÛJb-È¸±bìØÃóTÓ@ï=e”ŒbKÇAHãâÒÒ®¥äÌÓÿ$ï)5$apÁ¹gaT1„’æbÓZÇ{şAùÀa‚s“ŞÕÒXÉ\'[Û“Ôb@†É8ÉËf)4ê~ê.‰àš.•’Õbâ„ãòZSA&}ì,HAê¤²>°‘±AF<7¥Ş}2‰c¸@†ÉcÇÄc4n–k‡oÀ8ÄÅ~€~âÄ£òVÓAÙ>ué‡M&Ëõg5˜«•¸WvXëŒ¾7ï©5$½à=§ü	Æ=Ğd´l<+”üÛÛ“aZÚMZzüØƒ0fÌ˜¼O]ÓA½X{É…}?î¼÷)0%Á¸\0Ó¼aú³4lì¤‚~ÂÄ£è÷¼ÙK.8ïÃ8ğ€}Í]ÚÁ[áóAÇ½XIë´S\'ç=­¦„RS/:ÓTÖc7«Ä‘¤wM{¾± ï}ÏÉyO­)!TÁç…ÑÅ\0J\'\rŒ\raEü–R˜4a|¾óibH UrÆ&CEJúA:ò,~x~3§\'¼«ö\'¢E!TÉ_|ü,»ú‰Œry\rMw‰u©$¦œDÂ½…R%GŒ=°¯W8Ljõ&~FÅ>^ë,Å{	$&M8ZK;LM$7K»ê¾‚Öï\ZwHÎ@ëBèdÀÁígŒ¸VPà¨MD0ÒLú¯F*Öu­	$\\¯“–\nšk[0Dıís\\AOÆÑã«ó$Zr±2@+›9BòšÏDjR„Ö=º-Ÿ¹´Ôj’	6(÷‚d\r]÷¦“D˜I ßo5É€mÛwÆõßxÔ3“–[îÇÎç˜£¬ÛZŠA2 kíú¤\rÔİÉJÕB¬j²ï;F×y&­	$k9¯§L¼æDØg@`],bï!+SX¾Û~ún–åØÓdZHlŞÚo9Şhtv­Ë{\nM\r¹XUÒ××‡Í[ßB¡8\Z\Zš™áS/\'+UO·JÕ\0V¯Y_§´&dAªdŞ+‹ìªïŒ¹}Ös‚y.c`Œãw¯t »§\'¯5=$*yæÙ9¶ÎÀ`N§\'‘œÚ±ŒLxüú‹‡Ÿ¬é9heH UĞİİƒßÍë\0cÜí‹¥¾v„YëÁ¬å`ÜìcÂ¹Àô\'_ÄÒ¥Ëê:ŸVR·~ûN³`\0ç\0ã)ÿ?—Ál¶€q0ÎÁ„\0®¹î›èëë«ù9i5H {É£¿zK–uÎ98÷,rò­ŒíbÌÎÉX!vìîÇç¯ş{É0¡^¬½ }iîøÉÃ\"„à8À|‘€åwNYâfq! DHJbm÷f\\qÕ¸ÿ\'·a¿ıöËg~MYaÒ¾´WíVìÜˆœàL˜ÀXÛø#·àÜæœ	3D`çY€E¼¶n3.ı«kĞŞŞQ—óÕì@†AûÒ\\õ•›cqA\\ÖÍÖ½ÊÛ\Z³8ÅkÜ« k„El}óøâµ7á‘G§ç<×Æ‡2DfÌ|_¼öfìÜ-Eˆ°.BpÚ]o¹I0¯ÆLÒ€0€!„‡‹\nmØµGá›ß½W_{#Å% üÛ]¸ñ¦`÷‰ ,š ‚ĞXƒ0æê ùáÒÌ<eE\n‚\"ÂĞ6„…6Ì}¹g_pfÌ|6×y7*$\n´·/Å\'.½÷?ôd\"Œ° ‚‚õíœó8@Îçê™zˆ\0çIP°Ç`ÄaD2\n»÷(üİ?}ŸşÜµho_š÷ô\nêÅ*C__î½ÿg¸ïÁÇ!‚aØfü÷ hÜ+Q@ Bw¸Š5ĞK:Œ»Å\0ÀZ@ƒ¡`z/Ûå^Û;Ö`êe×áÜ³OÃMÿx=eº@À#Ó¦ãîû¦aË}Â6{×-—*,\Z«ÀD`Š„6öĞ6µÛ8Mp0hhîêûÂİ0VfXdŠ3Ÿ³ç~S/ù(®¼üÓ#Z(lşüùzòdZùû‘iÓñ“{Æ–­}àóÙCÔaâR…¸\0Çc4†k5Ú{˜Ê­Àbv½ e?dÔo_÷ Šö@F”4?=ª€©—œ‹+.ÿ4öaBY²d		äáG~…»ï{›·öÆ)Q˜´¨„l½C_qa{¯\Z_X$°köjiWƒ”FÒŠÂ‹”dÔ%#Œ=ò„2bâbŒ‡}Ûwî1¶+¨¶¨f­ˆù;—­2m%Œu4‰8·f“‰E‘‘I©Ué·Ö$J	e$¸^#N ííKñÓ‡Åoæ.Ä{LÏY\r›åş÷)aˆ8•§R›Hõ“”5Q‰P”Š<ëá„\rÊyç|W|v*Æ—ïAÕˆX S¦LÉ{.5£··3g=Ÿ=ü:×¬·iY×/\\-#NÙÆ©[S!gLÄi\\çRÍß¿æ„/ò`7ÜI\\¯h Uñ\\±øïT„óÏù .úø98ı§å|TÙòê«¯¶n«½})îp\ZfÏ]€í;vƒó\0a¡Í4z.•‹+¸MÛ¦,†kor«Qä8ìŞŠš3­lêW	{“0Bà2€¡Ù#ŞZn2óù—ğô¬9øÓÉÇác|S?yq®Ç–%-eAz{û0í—ãÉ§ÿkÖ\'Ù&g-„(±A\"ˆÁ„á­ÆĞ*â(e€Ûomm×Vj Eñ„â¾w–çĞCŞ‰«®œŠóì¿óÆ)¯¾újkä™³ğØÏböÜ…(D\"$–‚Şß¹ØÂ†W8kua”RI(n¯uå	!Î|yn˜ù;óºÏè\">uéy¸äâ1¾	ã”¦ÈºînÜ÷Ó_à©/\ZJ¸ÚD‡KË:×Šy5Œtà=r…QÊĞ„’Ä)JJHåÅ%V(RöCÛ{ŞÙ§ãs—ı%&Ÿtb¾7š.1÷sxèá\'°ºk½½Ø9ÂB›„s•bw)ˆƒòØJğtĞÍ¸mñ…á/º0qÇ¯‘<c¢97Š[é•P,€â\\P<‚à¤¡d!H)¡d?f>ÿ™5\'O9×\\õ™¦	è›Â‚,i_ŠŸ>8\r³ç,À¶»Jbß}Jÿœ•±Ü>;÷!€£Zµ(6Mlâ”´UqnWâŠyî˜’8ìpÕç?‰©Ÿ¼$ßƒ«@Ã»X?òËØZp.À„q•˜máã_\"ˆïp¬…ËF¹õ£HÃ¢T(qzØ	FÙL­,.öEÔÈBiHôööáŞûÂÏ§=mÓ³Â´Eœ5±…ÉL¹–îD‰µHÚAœµ\0Z)]›É¶É¾(®ÏKk]bQd,ßšÈ¸–bâ•Ã}\'®º²±„ÒPY×İûÑ\Z7jçî¤^áÅ¢Äb¤â\nÛ•š´p“µ¨©]}½İ­Jz­d$©ãÃi¡4„@z{ûğoİ§gÎI	Â/Ş™‚ŞÀ¸\"]³H„A¢¨?eã­ìöt2ıŠ­I’ùŠ¿ŒvØ!à›·\\—k0Ÿ{ë{?¸¿˜ö4¶ïìGPh‹-„ß (İÎR”#Õ<HÂ¨7î\\§2_ŒC3hÅ•©Î+	Å”2¿k%\"ğ8ã‹\0JFØòÆïñù/ß„“\'‡ï|ër«£ä².Ö’ö¥ø‡¯ß†Õ]ÀE`Äáa:æp.U…š…o-üUEFh–6_<¡ Š×F,šs@	0%Íª2\0”ÀmK‹ŒúÁ¹€”/íÂÙ|_¼übüíõ×ÖıpênAî¾ç§¸ıß€pÂˆ[Ì½Z/+•<WMw3Áü–Öq¿ÓÌ\n…kSCÑ*€äâxSE¸ì$ïÇ=<ÿıÍ<üË7n¨k±±®‹6\\Ã×ñ½;şË,P/\Zàxa„ à=¬$.i¡8\ZTâ„\'I8:^L¢`”G™ë£0\ZaÑ^akÖ¾Ë¿x#™1«ns¯›¹ş†[ğÌ¬ß\"Ú’GXã•AÂ¤Î¬+å5\ZA\0¬ùPM‹W½·ëkm7ÒŞŠŠ—ZòÈxÌ<vÀ˜ÀÎ]{pİ·á÷¿ßV—®áºä{Ä3ÏÎ…ÛÌ\n]:Ç.¼æ·ƒ¤âo—&–òm‰¦Æÿ]2¦5À8SĞš1(s=Hn„Ü8ÑÏqó·î€š‹¤æY×İ»ïûU¼\Z¡Y:\'qŸJ^£ö‘C*óÅx£h¦Ìõ Ìõ ¬k¯`=‰›¿}&M:¾¦1IÍcİy?vìê7~f¼>¬Ipn\n}<.îÅ+x\"¿<iÔk˜ßµ]§‹³ØRp!Ì5†ñºÂ]Ò]Oß¹ıÇ¨%5HooyîwA1u€\"(¦÷v™*WÇ «12ñƒyÎü@Ş-¤‘¬/ìD²¸½<úXÍæTSürúSveñB˜	ã†ÃxË€x?½|¶\r ÑXÃóñµÁÜ£a¼Æ°p«\\üäŞ_¢VÔT OÍœm+âpo0\0¶Á0Ş²,çÕĞi4Şˆ}lfƒv·R½[X#Ámtó}˜öèã¨5Hww7ºÖn‚f\rá?şj-ùˆ·Ã_ˆ;õœ-¸RÁÏQ“Ï¯™@ûï9é.\\Wãğ[DHÄH¯VÏícAœäAˆ®µ±®»;óÏænY§\\wnÜ…Ëã:‰ƒ.iKbDÂ=—‹ó\0>4=Ók¨Q¤··«×nDX\rÆ³Š8\0­IÄŞa:êíŠõqlâ„âÅ¹‹3ÿÌšäÙç_ğÖ±MÚÒÖ7bè¸¾G¸º	Oow½yë[hoïÀI\'ÙgÖ$™¿¨ÃºSş3á,®‚ÄŞ’ìEÏâìVò\0]€yó³µ\"5È¢WW§Ÿøs!q™tr»G­]Ñù…93ı¤Ì²®»¯oy+q­üí‘õVÙÀàZS¼Îo.°hÉêL?\'ódùòÎ$€‚€Ñ q­(@\'²ACÃ][®ÚÎlçïÜß¾Œœvj&Ÿ”¹yea‡÷Ì¸—6#‹È—íIê#îY¢y–dö)™[U«{Òf%r¯ˆŒˆ‰-)\"r.°pñÊÌ>\'s,jï´õf³?×,î²!ˆêa0nCªoŒ£sÍ†Ì>&S«»»\'iH­<Pz—Èd©§Ä‚plß±İİ=™|B¦Ëş,_atøƒiŠ?ˆì1N‰k·íñŒƒA`ùŠNŒ_ıZZ™Zå«ÖÆuT¼Á(ş j€‹?ÊX’å«Öfò™\ndáâ)×Š–å!êBªÉĞ\\w«:³éìÍ4Hß´ù-Àî¿áÔ­ã¥^\"{âë‹ù×Ç¦Íofòş™ZM›ÿ¯Lj7ËO ˆ2¸$çbe•ÉÊÌ‚ÌıíËˆ—ì¡\0¨I °’€}]wÆ;²ª÷ÏL 6nöü@÷S—§¶_DÖ0\0Z{F$Y>hıúU$3kÃ¦-hj®PHƒFM‡‹uı\rÆ±bå\ZTKfY°xEºk—z¯ˆ:Â¼8Ä]}¿ß¶£ê÷ÍL Û¶íLR»©GI&D­añŸI÷ÇªÕÕ§z3Èª5l×.HDı)iŠeŒaÛ¶U¿m&Aúºî»Î•?\\vAgñ!1fÿP÷¼‘»13¬ìZ_õ{gÒ‹µaÃ&¯£²ä½¨’NÔ˜X,n‚Ã¶í;«¾¶3q±LŠ—{iŞAÄBµ Lß_R“«L\\¬õ7{ßikó”5yä`µGÃl;\r­`®A0]õã·™dã¦­\0t¼y¼æZÙøƒQº—¨-\Z\0´¿7»‚v7ê*	\0`Á‚U½ÉŠ•]Pv£x©$ ¹ÙØTir³ˆú Íõ§Td^¥‚R\Z+W®D[qïíÀÿ½“m¡mB7\0\0\0\0IEND®B`‚');
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
  PRIMARY KEY (`activityID`),
  KEY `CREATORFAM_idx` (`userID`),
  CONSTRAINT `CREATORFAM` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_calendar`
--

LOCK TABLES `family_calendar` WRITE;
/*!40000 ALTER TABLE `family_calendar` DISABLE KEYS */;
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
 
    IF OLD.reminder!='trigger_disable' THEN
	DROP TEMPORARY TABLE if exists temp1;
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
  END IF;
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
  PRIMARY KEY (`mealID`),
  KEY `MEALSCREATOR_idx` (`userID`),
  CONSTRAINT `MEALSCREATOR` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
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
  PRIMARY KEY (`messageID`),
  KEY `SENDER_idx` (`senderID`),
  KEY `RECEIVER_idx` (`receiverID`),
  CONSTRAINT `RECEIVER` FOREIGN KEY (`receiverID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SENDER` FOREIGN KEY (`senderID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
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
  PRIMARY KEY (`notificationID`),
  KEY `REFFEREDid_idx` (`referredID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`productID`),
  KEY `SHOPPINGCREATOR_idx` (`addedBy`),
  CONSTRAINT `SHOPPINGCREATOR` FOREIGN KEY (`addedBy`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_list`
--

LOCK TABLES `shopping_list` WRITE;
/*!40000 ALTER TABLE `shopping_list` DISABLE KEYS */;
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
  `createdBy` int(11) DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `completedDate` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`taskID`),
  KEY `CREATOR_idx` (`createdBy`),
  CONSTRAINT `CREATOR` FOREIGN KEY (`createdBy`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `to_do_list`
--

LOCK TABLES `to_do_list` WRITE;
/*!40000 ALTER TABLE `to_do_list` DISABLE KEYS */;
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
 
    
    drop temporary table if exists temp1;
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
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `familyName` varchar(45) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `relation` varchar(45) DEFAULT NULL,
  `image` longblob,
  PRIMARY KEY (`userID`),
  KEY `DIRECTOR_idx` (`director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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
  `createdBy` int(11) NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `postImage` longblob,
  `director` varchar(45) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`postID`),
  KEY `CREATEDBY_USERID_idx` (`createdBy`),
  CONSTRAINT `CREATEDBY_USERID` FOREIGN KEY (`createdBy`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wall_post`
--

LOCK TABLES `wall_post` WRITE;
/*!40000 ALTER TABLE `wall_post` DISABLE KEYS */;
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

-- Dump completed on 2015-07-14  4:21:59

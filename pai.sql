SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `pi1`
--
CREATE DATABASE `pi1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pi1`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `autorzy`
--

CREATE TABLE IF NOT EXISTS `autorzy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(100) NOT NULL,
  `nazwisko` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `autorzy`
--

INSERT INTO `autorzy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Charlaine', 'Harris'),
(2, 'Mario', 'Vargas Llosa'),
(3, 'Zygmunt', 'Miłoszewski'),
(4, 'Stanisław', 'Lem'),
(5, 'Umberto', 'Eco'),
(6, 'Paulo', 'Coelho'),
(7, 'Walter', 'Isaacson'),
(8, 'Haruki', 'Murakami'),
(9, 'Sławomir', 'Cenckiewicz'),
(10, 'Thierry', 'Jonquet');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `ksiazki`
--

CREATE TABLE IF NOT EXISTS `ksiazki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_autora` int(11) NOT NULL,
  `tytul` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `cena` float NOT NULL,
  `liczba_stron` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_autora` (`id_autora`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`id`, `id_autora`, `tytul`, `opis`, `cena`, `liczba_stron`) VALUES
(1, 1, 'Gorzej niż martwy', 'Już nie tylko perypetie miłosne, nie tylko sprawy żywych i martwych ale również huragan Katrina zagraża porządkowi świata Sookie Stackhouse, obdarzonej darem telepatii, sympatycznej kelnerki z małego miasteczka Bon Temps z Południa Stanów. Gorzej niż martwy, 8 powieść z serii Sookie Stackhouse (bez zbioru opowiadań Dotyk Martwych).\r\n\r\nSpołeczność nadnaturalnych z luizjańskiego Bon Temps przeżyła ostatnio wiele nieprzyjemnych zdarzeń: z jednej strony dały o sobie znać potężne siły natury, czyli niszczycielski huragan Katrina, z drugiej, aktu nienawiści dokonali ludzie, którzy podłożyli bomby w hotelu w Rhodes, gdzie odbywało się wampirze spotkanie na szczycie. Sookie Stackhouse jest bezpieczna, lecz poruszona, zaszokowana i zmęczona - z całych sił pragnie powrotu do normalności. Niestety, sytuacja stale się pogarsza. Zbyt wiele wampirów (w tym liczni przyjaciele Sookie) zginęło w Rhodes lub zmarło z powodu odniesionych tam ran. A po chłopaku telepatki, tygrysołaku Quinnie, słuch zaginął. Świat wokół zmienia się, nawet jeśli nie podoba się to wampirom czy zmiennokształtnym. W dodatku Sookie, Przyjaciółka Wilkołaczego Stada, telepatka połączona więzią krwi z przywódcą społeczności lokalnych nieumarłych, trafia w sam środek tych przemian. Grozi jej niebezpieczeństwo i śmierć oraz - nie po raz pierwszy - doświadcza zdrady ze strony kogoś, kogo pokochała. I chociaż w końcu opada bitewny kurz, a przedstawiciele różnych społeczności zawierają przymierza, świat Sookie nigdy nie będzie już taki jak przed Katriną. Charlaine Harris jest fenomenem literackim w Stanach Zjednoczonych. Jako jedyna autorka wprowadziła jednocześnie 7 tytułów serii na listę bestsellerów New York Times. Serial Czysta Krew był dwukrotnie nominowany do Złotych Globów a reżyserii podjął się laureat Oscara Alan Ball. Sookie Stackhouse gra laureatka Oscara Anna Paquin, która za rolę Sookie otrzymała Złoty Glob.', 29.24, 446),
(2, 2, 'Marzenie celta', 'Co by się stało, gdyby Roger Casement nie spotkał nigdy Josepha Conrada?\r\n\r\nMoże nie trafiłby do więzienia, może jego własna podróż do jądra ciemności nie byłaby taka tragiczna? Słynny twórca raportu z czarnego Kongo, który uświadomił światu barbarzyństwo uprawiane przez białego człowieka w Afryce, znalazł się w niełasce. Dlaczego? Odpowiedzi jest kilka, ale ta najprawdziwsza kryje w sobie niechlubną tajemnicę. Bohater powieści podczas śledztwa w Afryce odkrywa nie tylko bestialskie okrucieństwo ludzi, którzy w imię moralnej przewagi katują i mordują swoich podwładnych, "swoją własność". Za tymi karygodnymi czynami kryje się coś znacznie więcej, przerażająca prawda, która będzie go już zawsze prześladować - pod powierzchnią kultury i cywilizacji ukrywa się potwór, potwór, który zagraża i jemu samemu. Kiedy sam w sobie odkryje ciemne strony homoseksualizmu, z którym długo przyjdzie mu walczyć, zmieni się cały jego świat. Oskarżony o zdradę i osadzony w więzieniu, zaczyna opowiadać swoją historię. Mówi o dzieciństwie spędzonym w Irlandii, o matce, która potajemnie go ochrzciła, o ojcu, który oszalał z rozpaczy po jej śmierci. O idealizmie, z jakim wyruszył na wyprawę do Afryki. O pięknych czarnych tragarzach, których fotografował, i o swoim seksualnym wyzwoleniu w Brazylii. To właśnie jego dzienniki z wypraw z bulwersującymi homoseksualnymi zapiskami przyczynią się do podjęcia ostatecznej decyzji rządu o karze śmierci dla Rogera Casementa. Listu w jego obronie nie podpisze nawet jego przyjaciel Joseph Conrad. Kim był Roger Casement? Bohaterem czy zdrajcą? Idealistą czy realistą? Osobą moralną czy niemoralną?', 37.79, 472),
(3, 3, 'Ziarno prawdy', 'Jest lodowata wiosna roku 2009. Prokurator Teodor Szacki nie pracuje już w Warszawie, pożegnał się z przeszłością i karierą, by zamieszkać w sielankowym Sandomierzu. Gdzie miał zacząć nowe wspaniałe życie, a został samotnym i budzącym nieufność obcym.\r\n\r\nTuż po Wielkanocy pod murami starej synagogi zostają znalezione zwłoki powszechnie lubianej działaczki społecznej o nieskazitelnej reputacji. W nieprzyjaznej rzeczywistości Szacki dostaje śledztwo tylko dlatego, że jako jedyny nie jest powiązany z denatką. Szybko dowiaduje się, że małe miasto może mieć wielkie tajemnice. Powracają dawne winy i zbrodnie, w XXI wieku odżywają antysemickie przesądy i legenda o krwi; histeria i psychoza skutecznie ryglują wszystkie drzwi i usta.\r\n\r\nWśród zagadek i kłamstw prokurator próbuje odnaleźć ziarno prawdy. ', 33.29, 448),
(4, 4, 'Listy 1956-1978', 'Dwaj wielcy pisarze. Dwie odmienne osobowości, dwa różne temperamenty. Wydawać by się mogło, że Stanisława Lema ze Sławomirem Mrożkiem niewiele łączyło. Okazuje się jednak, że pisarze przez wiele lat byli przyjaciółmi i pisali do siebie arcyciekawe listy. Nie tylko o literaturze, nie tylko o wielkiej polityce, ale i o czymś tak przyziemnym jak? samochody, których byli wielkimi miłośnikami. Mnóstwo w tej korespondencji ironii, słownych gier i żartów.M Opublikowanie listów Stanisława Lema i Sławomira Mrożka to wydarzenie kulturalne najwyższej rangi. Książka, wzbogacona o liczne fotografie, rzuca nowe światło na twórczość pisarzy i czasy, w których przyszło im żyć. Sławomir Mrożek (ur.1930), dramatopisarz, prozaik, satyryk. Prawdopodobnie najczęściej grywany w kraju i za granicą polski dramaturg współczesny. Jeden z najbardziej poczytnych polskich prozaików. Jego twórczość przekładana była na kilkanaście języków. Stanisław Lem (1921-2006), najwybitniejszy polski pisarz fantastyczny, futurolog, filozof i satyryk. Jego książki zostały przetłumaczone na 41 języków i osiągnęły łączny nakład ponad 30 mln egzemplarzy', 49.94, 624),
(5, 5, 'Cmentarz w Pradze', 'Na tę powieść Umberta Eco czekaliśmy od dawna! Wciągająca, zabawna, poruszająca.\r\n\r\nCmentarz w Pradze to powieść kryminalno-szpiegowska, której akcja rozgrywa się w XIX wieku. Jej bohaterem jest Simone Simonini, cyniczny fałszerz świadczący usługi wywiadom wielu krajów. Obsesyjny antysemita. Nienawidzi również jezuitów, masonów i.. kobiet. Eco opisuje jego historię odwołując się do najlepszych wzorów XIXwiecznej powieści przygodowej - mamy więc wartką akcję (fałszerstwa, spiski i zamachy), ciekawą intrygę o zaskakującym rozwiązaniu, a wszystko opowiedziane barwnym, potoczystym językiem.\r\n\r\nCmentarz w Pradze to książka dla każdego!\r\n\r\nPowieść rozpala wyobraźnię, wciągając jednocześnie czytelnika w korowód postaci i wydarzeń, smakowitych, często pikantnych szczegółów.\r\n"Corriere della sera"\r\n\r\nEco twierdzi, że chciał opisać historię XIX wieku, lecz miejscami wydaje się, że pisze o ludziach nam współczesnych, którzy codziennie pojawiają się na ekranach naszych telewizorów.\r\n"Corriere dell''arte"', 32.84, 602),
(6, 6, 'Alef', 'Buntuję się. Decyduję. Zmieniam. Odnajduję siebie. Idę. Działam. Budzę się. Doświadczam. Podnoszę się. Marzę. Zwyciężam. Odkrywam. Wymagam. Myślę. Wierzę. Krzepnę. Rozwijam się. Pytam. Jestem.\r\n\r\nNiektóre książki są do czytania. Alef napędza do życia.', 31.04, 240),
(7, 7, 'Steve Jobs', 'Ekskluzywna biografia Steve''A Jobsa pióra autora bestsellerowych biografii Benjamina Franklina i Alberta Einsteina\r\n\r\nOpierając się na ponad czterdziestu wywiadach z Jobsem, przeprowadzonych na przestrzeni dwóch lat - a także na wywiadach z ponad setką członków rodziny, przyjaciół, przeciwników, konkurentów i kolegów Jobsa - Walter Isaacson napisał wciągającą opowieść o pełnym wzlotów i upadków życiu oraz płomiennej osobowości twórczego przedsiębiorcy, którego perfekcjonizm i nadludzka energia zrewo-lucjonizowały sześć branż: komputery osobiste, filmy animowane, muzykę, telefony, tablety i DTP.\r\n\r\nW czasach, kiedy Ameryka szuka sposobów, by utrzymać swoją innowacyjną przebojowość, kiedy społeczeństwa na całym świecie usiłują budować gospodarki ery cyfrowej, Jobs pozostaje największą ikoną wynalazczości i wyobraźni. Wychodząc z przeświadczenia, że najlepszym sposobem stworzenia czegoś wartościowego w XXI w. jest zespolenie kreatywności z technologią, założył firmę, w której nieskrępowana niczym wyobraźnia połączyła się z zadziwiającymi osiągnięciami nowoczesnej techniki.\r\n\r\nChoć Jobs współpracował przy powstawaniu tej książki, nie domagał się kontroli nad tym, co zostanie w niej ujęte, ani nawet prawa do przeczytania jej przed wydaniem. Niczego nie zatajał. Zachęcał ludzi, których znał, by wypowiadali się szczerze, i sam opowiadał otwarcie, czasami wręcz okrutnie, o ludziach, z którymi pracował i konkurował. Wypowiedzi jego przyjaciół, wrogów i kolegów sprawiają, że w nie-upiększonej postaci poznajemy jego pasje, perfekcjonizm, obsesje, artyzm, przewrotność i kompulsywną żądzę kontroli - wszystko to, co ukształtowało podejście Jobsa do biznesu oraz innowacyjności produktu.\r\n\r\nGnany przez swoje demony, Jobs potrafił doprowadzać otoczenie do furii i rozpaczy. Ale jego osobowość i jakość jego produktów były ze sobą powiązane, tak samo jak komputery i oprogramowanie Apple, w jeden zintegrowany system. Niezwykle przemawiająca do wy-obraźni historia Jobsa ukazuje, jak ważna w życiu jest pomysłowość, siła charakteru, talenty przywódcze i wierność swoim wartościom.\r\n', 45.89, 500),
(8, 8, '1Q84 - tom 3', 'W trzecim tomie tej fantastycznej powieści Murakamiego poznajemy dalsze losy Aomame i Tengo rozgrywające się w niezwykłym świecie roku 1Q84. Ona ukrywa się przed zemstą członków sekty za zamordowanie Lidera, a on czuwa przy łóżku nieprzytomnego ojca w mieście kotów. Czy mściciele trafią na ślad Aomame? Czy Tengo rozwiąże zagadkę powietrznej poczwarki? Czy Tengo i Aomame wreszcie się spotkają? Czy wydostaną się ze świata Little People i dwóch księżyców, czy też na zawsze pozostaną w zaskakującej rzeczywistości powieści wewnątrz powieści stworzonej przez Tengo, jasnowidzącą piękność, Fukaeri? Autor w kolejnym tomie "1Q84" odpowiada na te pytania, a do dwóch przeplatających się wątków dołącza trzeci...', 37.79, 512),
(9, 9, 'Długie ramię Moskwy', 'Książka opisuje genezę wywiadu wojskowego w komunistycznej Polsce oraz rolę Sowietów w jego działalności. Autor przedstawia kierunki jego działania, politykę personalną i struktury.\r\n\r\nJest upalny 22 lipca 2006 r. Kolejna rocznica ogłoszenia manifestu PKWN w Moskwie, który dał formalny początek państwowości Polski Ludowej. Decyzją władz RP zostaję przewodniczącym Komisji ds. Likwidacji Wojskowych Służb Informacyjnych. Gdy kilka dni później z pierwszej ręki zapoznaję się z mentalnością wysokich oficerów tej służby, postanawiam ustalić i zrozumieć, jak to się stało... Jak to się stało, że w Warszawie, w gmachu przy al. Niepodległości, przez tyle lat funkcjonował jeden z najważniejszych instrumentów podległości naszego kraju.\r\nJak to się stało, że dopiero w siedemnastym roku budowania demokratycznej Polski rozmontowano tę postsowiecką redutę zlokalizowaną w najdalej na wschód położonym kraju zachodniej części Europy. I jak to się stało, że do realizacji tego zadania polskie państwo wyznaczyło doktora nauk historycznych.\r\nUkończenie przedkładanej Czytelnikowi książki traktuję jako wypełnienie - po pięciu latach - zobowiązania, którego podjąłem się w 2006 r., ponieważ jako badacz i historyk aż za dobrze wiem, iż ludzką pamięcią, naszymi zaszłościami nie można w dowolny sposób zarządzać. Nie można arbitralnie stwierdzić, że czegoś nie będziemy pamiętać, że jakiś fragment przeszłości jest nieistotny. Wreszcie, że pozbywanie się niepotrzebnego balastu wymaga wytrwałości.\r\nZ wprowadzenia Sławomira Cenckiewicza', 40.94, 536),
(10, 10, 'Tarantula', 'Książka posłużyła jako scenariusz do filmu "Skóra, w której żyję" Pedro Almodóvara.\r\n\r\nKim jest piękna Ewa, z którą wzięty chirurg plastyczny, Richard Lafargue, pokazuje się na przyjęciach? Dlaczego Ewa czasem tak subtelnie się uśmiecha, a on wtedy z trudem ukrywa wściekłość i ból? Czemu są razem, skoro jest między nimi tyle wrogości? Jaka tajemnica mogła połączyć ze sobą tych dwoje? Dlaczego piękny tekst piosenki "The Man I Love" stał się dla nich sposobem na wyrażanie nienawiści w najczystszej postaci? To książka, w której rozpacz przenika się z perwersją. To historia kata i jego ofiary. Tylko dla dorosłych.\r\n\r\n\r\nMożna zobaczyć ekranizację powieści w reżyserii Pedro Almodóvara zatytułowaną "Skóra, w której żyję". W rolach głównych występują Antonio Banderas, Marisa Paredes i Elena Anaya.\r\n\r\nNieduża to książeczka, ale dzieje się w niej więcej, niż w opasłych powieściach. I niczego nie da się przewidzieć, tak misterna jest intryga. Absolutne zaskoczenie, dla którego warto sięgnąć po tę powieść z gatunku literatury noir.\r\n"Angora"\r\n\r\nPomysłowa, elegancka, a zarazem przerażająca powieść.\r\n"The Washington Post Book World"\r\n\r\nThierry Jonquet - urodzony w 1954 roku w Paryżu przedstawiciel nurtu francuskiej literatury noir. Głównym źródłem jego inspiracji są artykuły z codziennych gazet, czyli jak mówi sam autor, "barbarzyństwo świata, w którym żyjemy". Za swoje powieści kryminalne i książki dla dzieci otrzymał wiele literackich nagród.', 20.69, 144);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`id_autora`) REFERENCES `autorzy` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

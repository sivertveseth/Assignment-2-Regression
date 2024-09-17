## Innhold

Under følger oppgåveteksten som finnes [her](https://dhammarstrom.github.io/quant-methods-workshops/assignment-2.html).

### Del 1: Laktat terskler
Denne delen skal inneholde minimum 2 laktat terskler (f.eks treningsintensitet på 2 og 4 mmol L^-1^), og sammenligne reliabiliteten  (tpical error som prosentdel av gjennomsnittet) mellom dei to tersklene.
Om man ønsker å utvide dette videre, kan man implementere andre laktat terskler metoder (beskrevet i [Tanner and Gore 2012](https://books.google.no/books?id=0OPIiMks58MC); [Newell et al. 2007](https://www.tandfonline.com/doi/abs/10.1080/02640410601128922); 
[Machado, Nakamura, and Moraes 2012](https://www.tandfonline.com/doi/abs/10.1080/02640414.2012.702424), samt i kursnotatene)

Her kan man bruke data fra arbeidskrav 1 (reliabilitets-prosjektet) eller bruke data fra `exsidata` pakken. 

### Del 2: Forutsi størrelser opå DNA fragmenter eller stigningene i en qPCR-kalibreringskurve
Under arbeidet vårt i molekylærelaben med å utehente og analysere DNA og RNA, trengte vi å bestemme størrelsen på dei resulterende PCR amplifiserte DNA-fragmentene eller Ct-verdiene i qPCR-reaksjoner.
I denne delen kan man enten analysere DNA fragmentene eller qPCR resultatene.

En veiledning for korleis analysere DNA fragmentene finnes [her](https://trainome.github.io/protocols/sw_pcr_size_determination.html). I denne delen skal man vise korleis man kom frem til dei predikerte størrelsene ved å inkludere koden (code chunk).

Hellningen på en kalibreringskurven kan gi informasjon om effektiviteten av qPCR-reaksjoner. Bruk innsamlet data til å beregne reaksjonseffektiviteten.

### Del 3: Tolkning av en regresjonsmodell
Ved å bruke `hypertrofi`-datasettet, skal man formulere eit spørsmål som omhandler ein lineær sammenheng mellom to variabler i datasettet. Disse variablene bestemmer man selv, og kan være relatert til f.eks muskelstyrke og størrelse, to molekylære markører. 
Inkluder ein regresjonstabell fra analysen i rapporten, og tolk komponentene i enkel tekst (f.eks for en enhetsforskjell i den uavhengige variabelen, vil den avhengige variabelen endre seg med y-enheter). 

Tolkningen bør også inkludere en beskrivelse og forklaring av standardfeilen, t-verdien og p-verdien. For mer hjelp om korleis man tolker tabellen se (Frigessi and Aalen 2018), (Campbell, Walters, and Machin 2020) og (Spiegelhalter 2019, kap 5).

Man burde rette spesiell oppmerksomhet til p-verdien. Korleis definerer og tolker man p-verdien i regresjonstabellen vår? Kva betyr den?

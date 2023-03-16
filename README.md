<H1 style="text-align: center;">Application météo</H1>

<img style="text-align: center;" src="https://cdn.iconscout.com/icon/free/png-256/weather-191-461610.png?f=webp&w=256"  alt=""/>

<H2>Présentation du projet</H2>
<br/>
<p>Le projet est une application météo qui permet de consulter les conditions météorologiques actuel et jusqu'à 5 jours après d'une ville française grâce à une API météo.</p>
<br/>
<H2>Présentation des fonctionnalités</H2>
<br/>
<p>En arrivant sur l'application il y'a dans un premier temps une nav bar qui permet d'accèder à la page de détails de celle-ci, ainsi qu'à un bouton permettant de changer le thème de l'application.</p>
<p>Elle est également constitué de plusieurs page qui sont accessible grâce à une barre de navigation se situant en bas de la page :</p>
<br/>
<p>- une page d'acceuil</p>
<ul>
  <li>Elle permet d'afficher les conditions météorologiques actuelles ainsi que jusqu'à 5 jours après grâce à plusieurs card : <br/> 
    <ul>
        <li>La première card montre la température actuels dans cette ville ainsi que le temps qu'il y fait. l'icon quant à elle change selon la météo qu'il fait en ce moment.
        </li>
        <li>la seconde card montre la température ainsi que le temps qu'il va faire toutes les heures pendant les prochaines 24 heures avec également une icone qui change selon le temps.
        </li>
        <li>la troisième card montre les différentes informations utile que nous pouvons avoir comme à quel vitesse souffle le vent par exemple.
        </li>
        <li>la quatrième et dernière card quant à elle nous montre le temps moyen qu'il va faire durant les 5 prochain jours.
        </li>
    </ul>
  Toutes les données météorologiques sont chargés au lancement de l'applications avec comme ville celle où l'utilisateur se trouve actuellement.
  </li>
</ul>
<p>- une page de favoris</p>
<ul>
  <li>Elle permet d'afficher toutes les villes que l'utilisateur à mis en favoris. <br/> Dans celle-ci se trouve également un bouton menant vers la page d'ajout d'une ville. <br/><br/> Toutes les villes ajoutés en favoris sont stockées dans la mémoire de l'application, afin qu'à chaque redémarrage celle-ci ne soit pas perdu.
  </li>
</ul>
<p>- une page d'ajout d'une ville</p>
<ul>
    <li>Barre de recherche qui va appeller une api afin de cherhcer une suggestions de villes française selon notre recherche
    </li>
    <li>Affichage de la liste des villes suggérés par l'api sous forme de card avec le nom de la ville, ainsi que le département. Lorsque l'on clique sur une ville qui nous interresse nous sommes automatiquement redirigé vers la page des favoris et celle-ci et automatiquement ajouté comme ville favorite.
    </li>
</ul>
<p>- une page de carte</p>
<ul>
    <li>
        Elle va permettre d'afficher la carte du monde, mais va surtout permettre de situer l'utilisateur dans la ville ou il se trouve et également de lister grâce à des point toutes les villes passer en favoris
    </li>
</ul>
<br/>
<H2>Version des différents langages ou framework :</H2>
<p>
    <ul>
        <li>Flutter version 3.3.4</li>
        <li>Dart version 2.18.2</li>
        <li>DevTools version 2.15.0</li>
    </ul>
</p>
<br/>
<H2>Packages utilisé avec leurs versions</H2>
<p>
    <ul>
        <li>cupertino_icons version 1.0.2</li>
        <li>riverpod version 2.1.1</li>
        <li>flutter_riverpod version 2.1.1</li>
        <li>fluttericon version 2.0.0</li>
        <li>adaptive_theme version 3.1.1</li>
        <li>flutter_map version 3.1.0</li>
        <li>latlong2 version 0.8.1</li>
        <li>http version 0.13.5</li>
        <li>geolocator version 9.0.2</li>
        <li>shared_preferences version 2.0.15</li>
    </ul>
</p>
<br/>
<H2>API utilisée</H2>
<p>Pour la réalisations de cette application j'ai choisis d'utilisé l'api "prevision-meteo" qui va me permettre de récupérer les différentes données météorologiques. <br/><br/> J'ai également utilisé l'api du gouvernement me permettant de récupérer toutes les villes françaises pour les stockées en favoris par la suite.
<br/><br/>
Lien des api :
<ul>
    <li><a href="https://prevision-meteo.ch/">prevision-meteo</a></li>
    <li><a href="https://api.gouv.fr/">api du gouvernement</a></li>
</ul>
</p>
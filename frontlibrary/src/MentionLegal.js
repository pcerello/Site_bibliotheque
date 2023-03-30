import React from "react";
import {Link} from "react-router-dom"

function MentionLegal() {
  return (
    <div className="App">
        <div className="w-full absolute my-40 bg-white flex flex-col items-center">
            <div className="w-[90%] md:w-[80%] py-8 text-left"> 
                <h1 className="text-2xl border-b-4 w-fit">
                    Conditions d'utilisations
                </h1>
                <div>
                    <p className="text-gray-500 my-8">
                    Conformément aux dispositions de l'article 6 III-1 de la loi n° 2004-575 du 21 
                    juin 2004 pour la confiance dans l'économie numérique, cette page reprend les 
                    mentions légales et conditions générales d'utilisation du site. Le présent site a 
                    fait l'objet d'une déclaration à la Commission Nationale de l'Informatique et 
                    des Libertés - CNIL, en application de la loi n° 2004-801 du 6 août 2004 relative 
                    à la protection des personnes physiques à l'égard du traitement des données à 
                    caractère personnel modifiant la loi n°78-17 du 6 janvier 1978 relative à 
                    l'informatique, aux fichiers et aux libertés, modifiée, et est hébergé sur les 
                    serveurs du département informatique de l'iut de Bordeaux. Les mentions légales 
                    pouvant être modifiées à tout moment et sans préavis, nous vous engageons à les 
                    consulter régulièrement. Dernière mise à jour : juillet 2015. 
                    </p>
                    <h2 className="text-lg">
                    Editeur du site
                    </h2>
                    <p className="text-gray-500 mb-8 mt-2">
                    Le présent site est la propriété du département informatique de l'iut de Bordeaux . 
                    Siège social : 15, rue Naudet CS 10207 33175 Gradignan Cedex France. Le directeur 
                    de la publication du site web est Nicholas Journet, en qualité de Responsable Communication. 
                    </p>
                    <h2 className="text-lg">
                    Création développement
                    </h2>
                    <p className="text-gray-500 mb-8 mt-2">
                    Contacter l'équipe 2 s'occupant du projet pour toute demande d'information relative à la création de ce site. 
                    </p>
                    <h2 className="text-lg">Données personnelles</h2>
                    <p className="text-gray-500 mb-8 mt-2">
                    Ce site ne stocke aucune donnée personnelle. 
                    </p>
                    <h2 className="text-lg">
                    Responsabilités
                    </h2>
                    <p className="text-gray-500 mb-8 mt-2">
                    Dans le cadre de son accès au site, il est expressément 
                    rappelé à l'utilisateur qu'Internet, n'est pas un réseau sécurisé. L'utilisateur reconnaît 
                    donc être informé que l'intégrité, l'authentification et la confidentialité des informations 
                    et données de toute nature qu'il souhaite échanger sur le réseau Internet ne peuvent être 
                    garanties sur ce réseau. L'utilisateur ne doit donc pas transmettre via le réseau Internet 
                    des messages dont il souhaiterait voir la confidentialité garantie. La responsabilité du 
                    département informatique ne saurait être engagée pour tous les inconvénients ou dommages 
                    inhérents à l'utilisation du réseau Internet, notamment une rupture de service, une intrusion 
                    extérieure ou la présence de virus informatiques. Dans ces conditions, il appartient à 
                    l'utilisateur de prendre toutes les mesures appropriées de façon à protéger ses propres 
                    données et/ou logiciels notamment de la contamination par d'éventuels virus circulant sur 
                    le réseau Internet ou de l'intrusion d'un tiers dans le système de son terminal à quelque 
                    fin que ce soit et de vérifier que les fichiers transmis ne contiennent aucun virus informatique. 
                    L'utilisateur s'interdit toute utilisation frauduleuse, abusive ou excessive du site.
                    </p>
                </div>
            </div>
            <Link to={"/"} className="text-center min-w-[10vw] p-3 bg-color text-white m-4 mb-16" aria-label="Accueil">
                Accueil
            </Link>
        </div>
    </div>
  );
}
export default MentionLegal;
import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { Link } from "react-router-dom";

/**
 * This function represents the component that displays the footer of the application.
 * @returns JS Element
 */
function MyFooter() {
  return (
    <footer className="bg-gray-200 flex flex-col space-y-16 px-16 pt-8 pb-4 text-left inset-x-0 bottom-0">
      <div className="flex flex-row justify-between grey flex-wrap">
        <div className="flex flex-col">
          <h1 className="text-color pb-4">IUT - Bibliothèque</h1>
          <a
            className="flex flex-col"
            target="_blank"
            href="https://www.google.fr/maps/search/D%C3%A9partement+informatique+IUT+de+Bordeaux,+15,+rue+Naudet,+CS+10207+33175+Gradignan+Cedex,+France/@44.7911271,-0.6112299,18z/data=!3m1!4b1"
          >
            <p>15 rue de Naudet - CS 10207</p>
            <p>33 175 Gradignan Cedex</p>
          </a>
          <a href="tel:+33556845757">Tél. +33 (0)5 56 84 57 57</a>
          <a href="fax:+33556845821">Fax. 05 56 84 58 21</a>
        </div>
        <div className="flex flex-col">
          <h1 className="text-color pb-4">Liens</h1>
          <a href="https://www.iut.u-bordeaux.fr/general/" target="_blank">
            IUT de Bordeaux
          </a>
          <a
            href="https://www.iut.u-bordeaux.fr/general/bibliotheques-universitaires/"
            target="_blank"
          >
            Bibliothèque de l'université de Bordeaux
          </a>
          <a href="mailto:bibliotheque@iut.u-bordeaux.fr">Nous contacter</a>
        </div>
        <div>
          <div className="flex space-x-4">
            <a
              className="bg-blue"
              href="https://www.facebook.com/iutdebordeaux"
              target="_blank"
            >
              <FontAwesomeIcon icon="fa-brands fa-facebook" />
            </a>
            <a
              className="bg-brown"
              href="https://www.instagram.com/iutdebordeaux/"
              target="_blank"
            >
              <FontAwesomeIcon icon="fa-brands fa-instagram" />
            </a>
            <a
              className="bg-blue"
              href="https://twitter.com/IUT_de_Bordeaux"
              target="_blank"
            >
              <FontAwesomeIcon icon="fa-brands fa-twitter" />
            </a>
            <a
              className="bg-brown"
              href="https://www.linkedin.com/school/iut-de-bordeaux"
              target="_blank"
            >
              <FontAwesomeIcon icon="fa-brands fa-linkedin-in" />
            </a>
            <a
              className="bg-blue"
              href="https://www.youtube.com/channel/UCaWP9UzIsK3H9NKx9AruRdA"
              target="_blank"
            >
              <FontAwesomeIcon icon="fa-brands fa-youtube" />
            </a>
          </div>
          <Link
            to={"/mentionLegales"}
            className="focus:bg-yellow-200"
            target="_blank"
          >
            Conditions générales d'utilisation
          </Link>{" "}
        </div>
      </div>
      <div className="flex flex-row justify-between grey">
        <p>Copyright 2023 IUT - Bibliothèque. Tous droits réservés.</p>
        <p>Réalisé par le groupe 2</p>
      </div>
    </footer>
  );
}

export default MyFooter;

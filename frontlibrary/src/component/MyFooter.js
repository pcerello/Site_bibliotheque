import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class MyFooter extends React.Component {
  render() {
    return (
      <footer className="bg-sky-500">
        <div>
          <div>
            <h1>IUT - Bibliothèque</h1>
            <p>15 rue de Naudet - CS 10207</p>
            <p>33 175 Gradignan Cedex</p>
            <p>Tél. +33 (0)5 56 84 57 57</p>
          </div>
          <div>
            <h1>Liens</h1>
            <p>IUT de Bordeaux</p>
            <p>Bibliothèque de l'université de Bordeaux</p>
            <p>Nous contacter</p>
          </div>
          <div>
            <FontAwesomeIcon icon="fa-brands fa-facebook" />
            <FontAwesomeIcon icon="fa-brands fa-instagram" />
            <FontAwesomeIcon icon="fa-brands fa-twitter" />
            <FontAwesomeIcon icon="fa-brands fa-linkedin" />
            <FontAwesomeIcon icon="fa-brands fa-youtube" />
            <p>Conditions générales d'utilisation</p>
          </div>
        </div>
        <div>
          <p>Copyright 2020 IUT - Bibliothèque. Tous droits réservés.</p>
          <p>Réalisé par GVECEMML</p>
        </div>
      </footer>
    );
  }
}

export default MyFooter;

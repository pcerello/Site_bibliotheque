import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class MyFooter extends React.Component {
  render() {
    return (
      <footer className="bg-gray-200 flex flex-col space-y-16 px-16 pt-8 pb-4 text-left fixed inset-x-0 bottom-0">
        <div className="flex flex-row justify-between grey flex-wrap">
          <div>
            <h1 className="text-color pb-4">IUT - Bibliothèque</h1>
            <p>15 rue de Naudet - CS 10207</p>
            <p>33 175 Gradignan Cedex</p>
            <p>Tél. +33 (0)5 56 84 57 57</p>
          </div>
          <div >
            <h1 className="text-color pb-4">Liens</h1>
            <p>IUT de Bordeaux</p>
            <p>Bibliothèque de l'université de Bordeaux</p>
            <p>Nous contacter</p>
          </div>
          <div>
            <div className="flex space-x-4">
              <a className="bg-blue" href="https://www.facebook.com/iutdebordeaux" target="_blank">
                <FontAwesomeIcon icon="fa-brands fa-facebook" />
              </a>
              <a className="bg-brown" href="https://www.instagram.com/iutdebordeaux/" target="_blank">
                <FontAwesomeIcon icon="fa-brands fa-instagram" />
              </a>
              <a className="bg-blue" href="https://twitter.com/IUT_de_Bordeaux" target="_blank">
                <FontAwesomeIcon icon="fa-brands fa-twitter" />
              </a>
              <a className="bg-brown" href="https://www.linkedin.com/school/iut-de-bordeaux" target="_blank">
                <FontAwesomeIcon icon="fa-brands fa-linkedin-in" />
              </a>
              <a className="bg-blue" href="https://www.youtube.com/channel/UCaWP9UzIsK3H9NKx9AruRdA" target="_blank">
                <FontAwesomeIcon icon="fa-brands fa-youtube" />
              </a>
            </div>
            <p>Conditions générales d'utilisation</p>
          </div>
        </div>
        <div className="flex flex-row justify-between grey">
          <p>Copyright 2020 IUT - Bibliothèque. Tous droits réservés.</p>
          <p>Réalisé par le groupe 2</p>
        </div>
      </footer>
    );
  }
}

export default MyFooter;

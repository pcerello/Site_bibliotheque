import React from "react";
import { Link } from "react-router-dom";

function MyMenu() {
  return (
    <>
      <div className="pt-14"></div>
      <header className="flex w-full justify-center pt-4 pb-4 fixed top-0 bg-white">
        <div className="flex flex-row justify-between w-5/6 content-center">
          <a href="/" className="text-blue">
            IUT - Bibliothèque
          </a>
          <div className="flex space-x-4 bar-button">
            <Link to="/">Accueil</Link>
            <Link to="/amis">Amis</Link>
            <Link to="/connexion">Connexion</Link>
            <Link to="/">Déconnexion</Link>
          </div>
        </div>
      </header>
    </>
  );
}
export default MyMenu;

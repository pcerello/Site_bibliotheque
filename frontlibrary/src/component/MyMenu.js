import React from "react";
import { Link } from "react-router-dom";

class MyMenu extends React.Component {
  render() {
    return (
      <header className="flex w-full justify-center pt-4 pb-4">
        <div className="flex flex-row justify-between w-5/6 content-center">
          <a href="/" className="text-blue">
            IUT - Bibliothèque
          </a>
          <div className="flex space-x-4 bar-button">
            <Link to="/">
              Accueil
            </Link>
            <Link to="/amis">
              Amis
            </Link>
            <Link to="/connexion">
                Connexion
            </Link>
            <Link to="/">
              Déconnexion
            </Link>
            
          </div>
        </div>
      </header>
    );
  }
}
export default MyMenu;

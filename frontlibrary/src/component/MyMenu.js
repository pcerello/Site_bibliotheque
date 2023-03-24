import React from "react";

class MyMenu extends React.Component {
  render() {
    return (
      <header className="flex w-full justify-center pt-4 pb-4">
        <div className="flex flex-row justify-between w-5/6 content-center">
          <a href="/" className="text-blue" >IUT - Bibliothèque</a>
          <div className="flex space-x-4 bar-button">
            <button type="button">
              <p>Accueil</p>
            </button>
            <button type="button"> 
              <p>Amis</p>
            </button>
            <button type="button">
              <p>Connexion</p>
            </button>
            <button type="button">
              <p>Déconnexion</p>
            </button>
          </div>
        </div>
      </header>
    );
  }
}
export default MyMenu;

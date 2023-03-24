import React from "react";
/*import { Link } from "react-router-dom";*/

class MyMenu extends React.Component {
  render() {
    return (
      <header>
        <div>
          <h1>IUT - Bibliothèque</h1>
          <button>
            <p>Accueil</p>
          </button>
          <button>
            <p>Amis</p>
          </button>
          <button>
            {/*<Link to="/C">Connexion</Link>*/}
          </button>
          <button>
            <p>Déconnexion</p>
          </button>
        </div>
      </header>
    );
  }
}
export default MyMenu;

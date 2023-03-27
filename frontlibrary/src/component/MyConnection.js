import React from "react";

class MyConnection extends React.Component {
  render() {
    return (
      <div className="flex flex-col items-center">
        <h1>Connexion</h1>
        <form className="bg-gray-200 flex flex-col">
          <input type="text" placeholder="Nom" />
          <input type="text" placeholder="Mot de passe" />
          <button type="submit">Se connecter</button>
        </form>
      </div>
    );
  }
}
export default MyConnection;

import React from "react";

class MyConnection extends React.Component {
  render() {
    return (
      <div>
        <h1>Connexion</h1>
        <form>
          <input type="text" placeholder="Nom" />
          <input type="text" placeholder="Mot de passe" />
          <button type="submit">Se connecter</button>
        </form>
      </div>
    );
  }
}
export default MyConnection;

import React from "react";

class MyConnection extends React.Component {
  render() {
    return (
      <div className="flex flex-col items-center pt-16 h-[65vh]">
        <form className=" flex flex-col space-y-4 p-16">
          <h1>Connexion</h1>
          <input className="border-2 rounded-sm p-1" type="text" placeholder="Nom" />
          <input className="border-2 rounded-sm p-1" type="text" placeholder="Mot de passe" />
          <button className="bg-color text-white py-2" type="submit">Se connecter</button>
        </form>
      </div>
    );
  }
}
export default MyConnection;

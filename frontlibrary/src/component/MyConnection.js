import React from "react";

function MyConnection() {
  return (
    <div className="flex flex-col items-center pt-16 min-h-[52vh] bg-white mt-40">
      <form className=" flex flex-col space-y-4">
        <h1 className="text-2xl">Connexion</h1>
        <input
          className="border-2 rounded-sm p-1"
          type="text"
          placeholder="Nom"
        />
        <input
          className="border-2 rounded-sm p-1"
          type="text"
          placeholder="Mot de passe"
        />
        <button className="bg-color text-white py-2" type="submit">
          Se connecter
        </button>
      </form>
    </div>
  );
}
export default MyConnection;

import React from "react";
import { Link, useLocation } from "react-router-dom";

function MyMenu() {
  const location = useLocation();
  const routes = {
    "/": "Accueil",
    "/amis": "Amis",
    "/connexion": "Connexion",
    "/deconnexion": "Déconnexion",
  };

  const renderMenuItems = () => {
    return Object.entries(routes).map(([route, label]) => {
      const isActive = location.pathname === route;
      const className = isActive ? "border-b-4 border-[#009999]" : "";

      return (
        <Link to={route} key={route} className={`p-4 ${className}`}>
          {label}
        </Link>
      );
    });
  };

  return (
    <>
      <div className="pt-14"></div>
      <header className="flex w-full justify-center pt-4 pb-4 fixed top-0 bg-white">
        <div className="flex flex-row justify-between w-5/6 content-center">
          <Link to="/" className="text-blue">
            IUT - Bibliothèque
          </Link>
          <div className="flex space-x-4 bar-button">{renderMenuItems()}</div>
        </div>
      </header>
    </>
  );
}

export default MyMenu;

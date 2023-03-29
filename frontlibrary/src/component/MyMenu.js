import React from "react";
import { Link, useLocation } from "react-router-dom";
import logoIUT from "./logoIUT_Info.png";

function MyMenu() {
  const location = useLocation();
  const userId = localStorage.getItem("userId");
  var connect;
  if (!userId) {
    connect = false;
  } else {
    connect = true;
  }
  const routes = {
    "/": "Accueil",
    ...(connect && { "/amis": "Amis" }),
    ...(connect && { "/profil": "Profil" }),
    [connect ? "/deconnexion" : "/connexion"]: connect
      ? "Déconnexion"
      : "Connexion",
  };

  const renderMenuItems = () => {
    return Object.entries(routes).map(([route, label]) => {
      const isActive = location.pathname === route;
      const className = isActive ? "border-b-8 border-[#009999]" : "";

      return (
        <Link to={route} key={route} className={`p-4 ${className}`} arial-label={label} >
          {label}
        </Link>
      );
    });
  };

  return (
    <>
      <div className="pt-14"></div>
      <header className="flex w-full justify-center fixed top-0 bg-white shadow z-50">
        <div className="flex flex-row justify-between items-center w-5/6 content-center">
          <Link to={"/"}  className="text-blue flex flex-row items-center" aria-label="IUT - Bibliothèque">
            <img src={logoIUT} alt="logo iut info" className="max-h-[4vh] mr-2"/>
            IUT - Bibliothèque
          </Link>
          <div className="flex space-x-4 bar-button">{renderMenuItems()}</div>
        </div>
      </header>
    </>
  );
}

export default MyMenu;

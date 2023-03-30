import React from "react";
import { Link, useLocation } from "react-router-dom";
import logoIUT from "./logoIUT_Info.png";
import { slide as Menu } from "react-burger-menu";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

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
        <Link
          to={route}
          key={route}
          className={`p-4 ${className}`}
          arial-label={label}
        >
          {label}
        </Link>
      );
    });
  };

  return (
    <>
      <div className="pt-14"></div>
      <header className="flex w-full justify-center fixed top-0 bg-white shadow z-30">
        <div className="flex flex-row justify-between items-center w-5/6 content-center">
          <Link to={"/"} className="p-4 text-blue flex flex-row items-center" aria-label="IUT - Bibliothèque">
            <img
              src={logoIUT}
              alt="logo iut info"
              className="max-h-[4vh] mr-2"
            />
            IUT - Bibliothèque
          </Link>
          <div className="hidden md:flex space-x-4 bar-button">
            {renderMenuItems()}
          </div>
          <div className="md:hidden">
          <Menu
            styles={{ bmMenu: { background: "#fff", opacity: 0.9 } }}
            customBurgerIcon={
              <div className="p-4">
                <FontAwesomeIcon icon="fa-solid fa-bars" />
              </div>
            }
            right
            width={"100%"}>
            {renderMenuItems()}
          </Menu>
        </div>
        </div>
      </header>
    </>
  );
}

export default MyMenu;

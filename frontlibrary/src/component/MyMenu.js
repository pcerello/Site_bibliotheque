import React from "react";
import { Link, useLocation } from "react-router-dom";
import logoIUT from "./logoIUT_Info.png";
import { slide as Menu } from "react-burger-menu";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

/**
 * This function represents the menu component.
 * It displays the menu items.
 * @returns JS Element
 */
function MyMenu() {
  const location = useLocation(); // Get the current location
  const userId = localStorage.getItem("userId"); // Get the user id from the local storage
  var connect; // Variable to know if the user is connected or not
  if (!userId) {
    connect = false;
  } else {
    connect = true;
  }
  // List of routes and labels
  const routes = {
    "/": "Accueil",
    ...(connect && { "/amis": "Amis" }), // If the user is connected, the menu item is "Amis", else it is not displayed
    ...(connect && { "/profil": "Profil" }), // If the user is connected, the menu item is "Profil", else it is not displayed
    [connect ? "/deconnexion" : "/connexion"]: connect // If the user is connected, the menu item is "Déconnexion", else it is "Connexion"
      ? "Déconnexion"
      : "Connexion",
  };

  // Function to render the menu items
  const renderMenuItems = () => {
    return Object.entries(routes).map(([route, label]) => {
      const isActive = location.pathname === route; // Check if the current location is the same as the route
      const className = isActive ? "border-b-8 border-[#009999]" : ""; // If the current location is the same as the route, the menu item is highlighted

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
          <Link
            to={"/"}
            className="p-4 text-blue flex flex-row items-center"
            aria-label="IUT - Bibliothèque"
          >
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
              width={"100%"}
            >
              {renderMenuItems()}
            </Menu>
          </div>
        </div>
      </header>
    </>
  );
}

export default MyMenu;

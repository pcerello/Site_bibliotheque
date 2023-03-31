import React from "react";
import Layout from "./component/Layout";
import { Link } from "react-router-dom";

/**
 * This function represents the logout page of the user.
 * It removes the user id and token from the local storage.
 * It displays a message confirming the logout and a link to return to the homepage.
 * The MyLogoutPage component is wrapped inside the Layout component.
 * @returns JS Element
 */
function MyLogoutPage() {
  localStorage.removeItem("userId");
  localStorage.removeItem("token");
  return (
    <div className="h-full">
      <Layout>
        <div className="flex flex-col items-center h-[66vh]">
          <h1 className="mt-[20vh] text-2xl">Vous êtes bien déconnectés...</h1>
          <Link to={"/"} className="bg-color text-white p-4 mt-8">
            Retour à l'accueil
          </Link>
        </div>
      </Layout>
    </div>
  );
}
export default MyLogoutPage;

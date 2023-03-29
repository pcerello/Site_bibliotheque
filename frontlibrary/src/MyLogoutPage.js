import React from "react";
import Layout from "./component/Layout";
import { Link } from "react-router-dom";

function MyLogoutPage() {
  return (
    <div>
      <Layout>
        <h1>Vous êtes bien déconnectés.</h1>
        <Link to={"/"} className="text-blue">
          Retour à l'accueil
        </Link>
      </Layout>
    </div>
  );
}
export default MyLogoutPage;

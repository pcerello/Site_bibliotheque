import "./App.css";
import MyConnection from "./component/MyConnection";
import Layout from "./component/Layout";

/**
 * This function represents the connection page of the user.
 * It displays the connection form by calling the MyConnection component.
 * The MyConnection component is wrapped inside the Layout component.
 * @returns JS Element
 */
function ConnectionPage() {
  return (
    <div className="App">
      <Layout>
        <MyConnection />
      </Layout>
    </div>
  );
}
export default ConnectionPage;

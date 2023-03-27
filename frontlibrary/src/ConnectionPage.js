import "./App.css";
import MyConnection from "./component/MyConnection";
import Layout from "./component/Layout";

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

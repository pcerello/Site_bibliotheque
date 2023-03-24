import "./App.css";
import MyFooter from "./component/MyFooter";
import MyMenu from "./component/MyMenu";
import MyConnection from "./component/MyConnection";

function ConnectionPage() {
  return (
    <div className="App">
      <MyMenu />
      <MyConnection />
      <MyFooter />
    </div>
  );
}
export default ConnectionPage;
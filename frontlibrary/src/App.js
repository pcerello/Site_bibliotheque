import "./App.css";
import MyComponent from "./component/MyComponent.js";
import MyFooter from "./component/MyFooter.js";
import MyMenu from "./component/MyMenu.js";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import MyConnection from "./component/MyConnection";
import MyHomePage from "./component/MyHomePage";

library.add(fas, far, fab);

function App() {
  return (
    <div className="App">
      <MyMenu />
      <SearchEngine />
      {/*<MyConnection />*/}
      <MyHomePage type="read" />
      <MyHomePage type="new" />
      {/*<MyComponent />*/}
      <MyFooter />
    </div>
  );
}

export default App;

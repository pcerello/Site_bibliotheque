import "./App.css";
import MyFooter from "./component/MyFooter.js";
import MyMenu from "./component/MyMenu.js";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import MyHomePage from "./component/MyHomePage";

library.add(fas, far, fab);

function App() {
  return (
    <div className="App">
      <MyMenu />
      <SearchEngine />
      <MyHomePage readerId={1} />
      <MyFooter />
    </div>
  );
}

export default App;

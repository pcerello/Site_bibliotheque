import "./App.css";
import MyComponent from "./component/MyComponent.js";
import MyFooter from "./component/MyFooter.js";
import MyMenu from "./component/MyMenu.js";
import SearchEngine from "./component/SearchEngine";

function App() {
  return (
    <div className="App">
      <MyMenu />
      <SearchEngine />
      {/*<MyComponent />*/}
      <MyFooter />
    </div>
  );
}

export default App;

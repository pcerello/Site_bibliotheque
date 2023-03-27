import MyMenu from "./MyMenu";
import MyFooter from "./MyFooter";

function Layout({ children }) {
  return (
    <div>
      <MyMenu />
      {children}
      <MyFooter />
    </div>
  );
}
export default Layout;

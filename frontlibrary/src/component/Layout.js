import MyMenu from "./MyMenu";
import MyFooter from "./MyFooter";

function Layout({ children }) {
  return (
    <>
      <MyMenu />
      {children}
      <MyFooter />
    </>
  );
}
export default Layout;

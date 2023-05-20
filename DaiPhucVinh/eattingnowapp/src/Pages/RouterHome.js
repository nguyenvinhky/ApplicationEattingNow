import React from "react";
import { Route, Routes } from "react-router-dom";
import {
  CategoryPage,
  CreateContainer,
  Header,
  HomePage,
  MainContainer,
  Order,
  OTPAuthen,
} from "../components";

const RouterHome = () => {
  return (
    <div className="w-screen h-auto flex flex-col bg-orange-50">
      <Header />
      <main className="mt-14 md:mt-24 px-4 md:px-16 py-4 w-full">
        <Routes>
          <Route path="/*" element={<HomePage />} />
          <Route path="/restaurant" element={<MainContainer />} />
          <Route path="/restaurant/:id" element={<MainContainer />} />
          <Route path="/createItem" element={<CreateContainer />} />
          <Route path="/categorypage/:id" element={<CategoryPage />} />
          <Route path="/orderdetail" element={<Order />} />
        </Routes>
      </main>
    </div>
  );
};

export default RouterHome;
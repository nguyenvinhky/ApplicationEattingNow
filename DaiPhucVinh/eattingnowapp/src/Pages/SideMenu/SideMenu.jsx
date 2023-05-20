import React from "react";
import { IoFastFood } from "react-icons/io5";
import { AiFillHome, AiFillSetting } from "react-icons/ai";
import { BiRestaurant, BiLogOut, BiShoppingBag } from "react-icons/bi";
import { GiFruitBowl } from "react-icons/gi";
import { useNavigate } from "react-router-dom";
import { useStateValue } from "../../context/StateProvider";
import { actionType } from "../../context/reducer";
import Swal from "sweetalert2";
import { DangerIntentDialog } from "../../components";

const SideMenu = () => {
  const history = useNavigate();
  const [{ linked, user }, dispatch] = useStateValue();
  const handleHome = () => {
    dispatch({
      type: actionType.SET_LINKED,
      linked: !linked,
    });
    history("/");
  };

  const handleLogout = () => {
    Swal.fire({
      title: "Đăng xuất ?",
      text: "Bạn có chắc muốn đăng xuất ?",
      icon: "question",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Xác nhận !",
    }).then((result) => {
      if (result.isConfirmed) {
        dispatch({
          type: actionType.SET_USER,
          user: null,
        });
        localStorage.setItem("user", JSON.stringify(null));
        history("/auth");
      }
    });
  };
  return (
    <div className="bg-orange-100 relative h-[100%] basis-20 p-4">
      {/* Logo Div */}
      <div
        onClick={handleHome}
        className="logo mt-4 gap-2 text-orange-900 font-bold flex items-center justify-center m-auto cursor-pointer"
      >
        <IoFastFood className="text-[20px]" />
        <h1 className="text-[20px] align-center justify-center font-black">
          EattingNow.
        </h1>
      </div>

      <div className="flex items-center justify-center text-[white] flex-col mt-[3rem]">
        <img
          src={user.Image}
          alt=""
          className="h-[80px] w-80[px] border-orange-400 border-[4px] object-cover rounded-full shadow-xl"
        />
        <span className="opacity-70 mt-2 text-orange-900 font-bold">
          Welcome,{" "}
        </span>
        <h3 className="font-bold text-orange-900">{user.StoreName}</h3>
      </div>

      {/* Simple menu */}
      <div className="m-auto grid justify-center mt-4">
        <li
          onClick={() => {
            history("/statistical");
          }}
          className="flex pt-3 pb-3 opacity-70 gap-2 hover:opacity-100 items-center cursor-pointer"
        >
          <AiFillHome className="text-orange-900 font-bold" />
          <span className="text-orange-900 font-bold">Thống kê</span>
        </li>
        <li
          onClick={() => {
            history("/groupfoods/");
          }}
          className="flex pt-3 pb-3 opacity-70 gap-2 hover:opacity-100 items-center cursor-pointer"
        >
          <BiRestaurant className="text-orange-900 font-bold" />
          <span className="text-orange-900 font-bold">Nhóm món ăn</span>
        </li>
        <li
          onClick={() => {
            history("/foodlists/");
          }}
          className="flex pt-3 pb-3 opacity-70 gap-2 hover:opacity-100 items-center cursor-pointer"
        >
          <GiFruitBowl className="text-orange-900 font-bold" />
          <span className="text-orange-900 font-bold">Món ăn</span>
        </li>
        <li
          onClick={() => {
            history("/orders");
          }}
          className="flex pt-3 pb-3 opacity-70 gap-2 hover:opacity-100 items-center cursor-pointer"
        >
          <BiShoppingBag className="text-orange-900 font-bold" />
          <span className="text-orange-900 font-bold">Đơn hàng</span>
        </li>
        <li
          onClick={() => {
            history("/settings");
          }}
          className="flex pt-3 pb-3 opacity-70 gap-2 hover:opacity-100 items-center cursor-pointer"
        >
          <AiFillSetting className="text-orange-900 font-bold" />
          <span className="text-orange-900 font-bold">Cài đặt</span>
        </li>
        <li
          onClick={handleLogout}
          className="flex pt-3 pb-3 opacity-70 gap-2 hover:opacity-100 items-center cursor-pointer"
        >
          <BiLogOut className="text-orange-900 font-bold" />
          <span className="text-orange-900 font-bold">Đăng xuất</span>
        </li>
      </div>
    </div>
  );
};

export default SideMenu;

import * as React from "react";
import { Div } from "react-native-magnus";

export default function PhoenixPageBody({ children, bg }) {
  return (
    <Div flex={1} bg={"#fff7ed" || "body"} p={24}>
      {children}
    </Div>
  );
}

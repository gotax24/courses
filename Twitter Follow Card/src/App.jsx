import "./App.css";
import { TwitterFollowCard } from "./TwitterFollowCard.jsx";

const users = [
  {
    userName: "EJBR_",
    name: "Ernesto Bracho R",
    isFollowing: true,
  },
  {
    userName: "YaldrianiA",
    name: "Yalsuh",
    isFollowing: false,
  },
  {
    userName: "RosannaRagno",
    name: "Rosa anna ",
    isFollowing: true,
  },
  {
    userName: "YameliRincon",
    name: "Yamelita",
    isFollowing: false,
  },
];

export function App() {
  return (
    <section className="app">
      {users.map(({ userName, name, isFollowing }) => (
        <TwitterFollowCard
          key={userName}
          userName={userName}
          initialIsFollowin={isFollowing}
        >
          {name}
        </TwitterFollowCard>
      ))}
    </section>
  );
}

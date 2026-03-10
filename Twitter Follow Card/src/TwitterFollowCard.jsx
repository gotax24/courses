import PropTypes from "prop-types";
import { useState } from "react";

export function TwitterFollowCard({ children, userName, initialIsFollowin }) {
  const [isFollowing, setIsFollowing] = useState(initialIsFollowin);
  const text = isFollowing ? "Siguiendo" : "seguir";
  
  const buttonClassName = isFollowing
    ? "tw-followCard-button is-following"
    : "tw-followCard-button";

  const handleClick = () => {
    setIsFollowing(!isFollowing);
  };

  return (
    <article className="tw-followCard">
      <header className="tw-followCard-header">
        <img
          className="tw-followCard-avatar"
          alt="El avatar de Ernesto"
          src={`https://unavatar.io/x/${userName}`}
        />
        <div className="tw-followCard-info">
          <h1>
            <strong>{children}</strong>
            <span className="tw-followCard-infoUserName">@{userName}</span>
          </h1>
        </div>
      </header>

      <aside>
        <button className={buttonClassName} onClick={handleClick}>
          <span className="tw-followCard-text"> {text} </span>
          <span className="tw-followCard-stopFollow ">Dejar de seguir</span>
        </button>
      </aside>
    </article>
  );
}

TwitterFollowCard.propTypes = {
  children: PropTypes.string.isRequired,
  userName: PropTypes.string.isRequired,
  initialIsFollowin: PropTypes.bool.isRequired,
};
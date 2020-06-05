import { CREATE_PROFILE, RECEIVE_USER_PROFILES, DELETE_PROFILE } from "../actions/profile_actions";

const profilesReducer = (oldState = {}, action) => {
    Object.freeze(oldState);

    switch (action.type) {
        case CREATE_PROFILE:
            return Object.assign({}, oldState, action.profileData);
        case RECEIVE_USER_PROFILES:
            return action.profiles;
        case DELETE_PROFILE:
            let nextState = Object.assign({}, oldState);
            delete nextState[action.profileId];
            return nextState;
        default:
            return oldState;
    }
}

export default profilesReducer;
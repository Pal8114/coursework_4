import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
import Int = "mo:base/Int";
import Nat "mo:base/Nat";

module {
    
    public type Message = {
        content: Text;
        time: Time.Time;
    };

    public type Microblog = actor {
        follow: shared(Principal) -> async();
        follows: shared query() -> async [Principal];
        post: shared(Text) -> async();
        posts: shared query(Time.Time) -> async [Message];
        timeline: shared(Time.Time) -> async [Message];
    }

}
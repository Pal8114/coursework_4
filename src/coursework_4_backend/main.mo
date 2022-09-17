import Array "mo:base/Iter";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import List "mo:base/List";
import Microblog "./microblog";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Time "mo:base/Time";

actor {
  stable var get_principal = "bsm6x-7l3bz-cy7vb-lm7f5-ei5vi-2edut-h4m5o-bicgu-54cea-kozeu-jqe";
  stable var followed : List.List<Principal> = List.nil(); 
  stable var messages : List.List<Microblog.Message> = List.nil(); 
  
  public shared func follow(id: Principal) : async () {
    if (null == List.find(followed, func(e : Principal) : Bool { e == id })) {
      followed := List.push(id, followed);
    }
  };

  public shared query func follows() : async [Principal] {
    List.toArray(followed)
  };

  public shared (msg) func post(text: Text) : async () {
    let caller = Principal.toText(msg.caller);
    assert(Text.equal(caller, get_principal));
    messages := List.push(
      {
        content = text; 
        time = Time.now()
      }, messages);
  };
  
  public shared query func posts(time: Time.Time) : async [Microblog.Message] {
    var filter : List.List<Microblog.Message> = List.nil(); 
    for (message in Iter.fromList(messages)) {
      if (message.time > time) {
        filter := List.push(message, filter);
      }
    };
    List.toArray(filter);
  };

  public shared func timeline(time: Time.Time) : async [Microblog.Message] {
    var all : List.List<Microblog.Message> = List.nil(); 
    for (id in Iter.fromList(followed)) {
      let canister : Microblog.Microblog = actor(Principal.toText(id));
      let msgs = await canister.posts(time);
      for (message in Iter.fromArray(msgs)) {
        if (message.time > time) {
          all := List.push(message, all);
        }
      };
    };
    List.toArray(all);
  };

  // public shared func test() : async () {
  //   let t : Int = Time.now();
  //   Debug.print(Int.toText(t));
  // };

};
